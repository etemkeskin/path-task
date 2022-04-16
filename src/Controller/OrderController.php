<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use App\Repository\OrderRepository;
use App\Repository\ProductRepository;
use App\Repository\OrderDetailRepository;
use Symfony\Component\HttpFoundation\JsonResponse;
use App\Entity\Order;
use App\Entity\OrderDetail;
use App\Entity\User;
use Doctrine\Persistence\ManagerRegistry;
use App\Sevices\JWTHandler;


class OrderController extends AbstractController
{

    
    /**
     * @Route("/api/orders", name="get_all_orders", methods={"GET"})
     * @param OrderRepository $orderRepository
     */
    public function getAll(OrderRepository $orderRepository,
                ManagerRegistry $doctrine, Request $request): JsonResponse
    {
        $token = $request->headers->get('Authorization');
        $jwt_handler = new JWTHandler($token);
        $email = $jwt_handler->getEmail();
        $user = $doctrine->getRepository(User::class)->findOneBy(['email' => $email]);

        $orders = $orderRepository->findBy(['user' => $user->getId()]);
        $data = [];
        
        foreach ($orders as $order) {
            $temp['id'] = $order->getId();
            $temp['orderCode'] = $order->getOrderCode();
            $temp['address'] = $order->getAddress();
            $temp['shippingDate'] = $order->getShippingDate();
            $data[] = $temp;
        }

        return new JsonResponse($data, Response::HTTP_OK);
    }

    /**
     * @Route("/api/orders/{id}", name="get_order", methods={"GET"})
     * @param OrderRepository $orderRepository
     */
    public function getOrder($id, OrderDetailRepository $orderDetailRepository, 
                ProductRepository $productRepository,OrderRepository $orderRepository,
                ManagerRegistry $doctrine, Request $request): JsonResponse
    {
        $token = $request->headers->get('Authorization');
        $jwt_handler = new JWTHandler($token);
        $email = $jwt_handler->getEmail();
        $user = $doctrine->getRepository(User::class)->findOneBy(['email' => $email]);
        $order_details = $orderDetailRepository->findBy(['order' => $id]);
        
        $data = [];
        foreach ($order_details as $od) {
            $temp['id'] = $od->getId();
            $temp['quantity'] = $od->getQuantity();
            $temp['price'] = $od->getPrice();
            $product = $productRepository->findOneBy(['id' => $od->getProduct()->getId()]);
            $order = $orderRepository->findOneBy(['id' => $od->getOrder()->getId()]);
            $temp['product'] = $product->getName();
            $temp['orderCode'] = $order->getOrderCode();
            $data[] = $temp;
        }

        return new JsonResponse($data, Response::HTTP_OK);
    }

    /**
     * @Route("/api/orders", name="create_order", methods={"POST"})
     * @param OrderRepository $orderRepository
     */
    public function createOrder(OrderDetailRepository $orderDetailRepository, 
                ProductRepository $productRepository,OrderRepository $orderRepository,
                ManagerRegistry $doctrine, Request $request): JsonResponse
    {
        $token = $request->headers->get('Authorization');
        $jwt_handler = new JWTHandler($token);
        $email = $jwt_handler->getEmail();
        $user = $doctrine->getRepository(User::class)->findOneBy(['email' => $email]);
        $orders = json_decode($request->getContent(), true);

        $newOrder = new Order();

        $newOrder
        ->setOrderCode($orders['orderCode'])
        ->setAddress($orders['address'])
        ->setShippingDate(new \DateTime($orders['shippingDate']))
        ->setUser($user);
        $orderRepository->add($newOrder);


        $order = $orderRepository->findOneBy(['orderCode' => $orders['orderCode']]);
        
        foreach ($orders['items']  as $od) {
            $newOrderDetail = new OrderDetail();
            $newOrderDetail->setQuantity($od['quantity']);
            $product = $productRepository->findOneBy(['id' => $od['productId']]);
            $newOrderDetail->setProduct( $product );
            $newOrderDetail->setOrder($order);
            $newOrderDetail->setPrice($product->getPrice());
            $orderDetailRepository->add($newOrderDetail);
        }

        $data['message'] = 'products created';
        return new JsonResponse($data, Response::HTTP_OK);
    }

    /**
     * @Route("/api/orders", name="update_order", methods={"PUT"})
     * @param OrderRepository $orderRepository
     */
    public function updateOrder(OrderDetailRepository $orderDetailRepository, 
                ProductRepository $productRepository,OrderRepository $orderRepository,
                ManagerRegistry $doctrine, Request $request): JsonResponse
    {
        $token = $request->headers->get('Authorization');
        $jwt_handler = new JWTHandler($token);
        $email = $jwt_handler->getEmail();
        $user = $doctrine->getRepository(User::class)->findOneBy(['email' => $email]);
        $orders = json_decode($request->getContent(), true);

        $order_code = $orders['orderCode'];

        $entityManager = $doctrine->getManager();
        $order = $entityManager->getRepository(Order::class)->findOneBy(['orderCode' => $orders['orderCode']]);

        if (!$order) {
            $data['error']  = 'There is not order with this order code';
            return new JsonResponse($data, 400);
        }

        $shipping_time = $order->getShippingDate()->getTimestamp(); 


        $today_time = new \DateTime("now");
        $today_time = $today_time->getTimestamp();
        if ($shipping_time < $today_time){
            $data['error']  = 'You can not change products due to shipping date';
            return new JsonResponse($data, 400);
        }

        $order->setAddress($orders['address']);
        $order->setShippingDate(new \DateTime($orders['shippingDate']));
        $entityManager->flush();

        $order_details = $orderDetailRepository->findBy(['order' => $order->getId()]);

        foreach ($order_details as $od) {
            $orderDetailRepository->remove($od);
        }

        
        foreach ($orders['items']  as $od) {
            $newOrderDetail = new OrderDetail();
            $newOrderDetail->setQuantity($od['quantity']);
            $product = $productRepository->findOneBy(['id' => $od['productId']]);
            $newOrderDetail->setProduct( $product );
            $newOrderDetail->setOrder($order);
            $newOrderDetail->setPrice($product->getPrice());
            $orderDetailRepository->add($newOrderDetail);
        }

        $data['message'] = 'products updated';
        return new JsonResponse($data, Response::HTTP_OK);
    }


}
