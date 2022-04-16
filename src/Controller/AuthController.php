<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;
use Symfony\Component\HttpFoundation\JsonResponse;
use App\Entity\User;

class AuthController extends AbstractController
{

    /**
     * @Route("/register", name="register", methods={"POST"})
     */
    public function register(Request $request, UserPasswordEncoderInterface $encoder)
    {

        $data = [
            'status' => '201',
            'error' => ''
           ];

        $em = $this->getDoctrine()->getManager();
        $payload = json_decode($request->getContent(), true);
        $email= $request->get('email');
        $password = $request->get('password');

        echo $request->get('password');

        if (empty($email)){
            $data['error'] = 'email can not be empty';
            return new JsonResponse($data, 400);
        }


        $user = new User($email);
        $user->setPassword($encoder->encodePassword($user, $password));
        $user->setEmail($email);
        $user->setRoles(['ROLE_USER']);
        $em->persist($user);
        $em->flush();
        $data = [
            'status' => '201'
           ];

        return new JsonResponse($data, 400);
    }
    
}
