<?php

namespace App\Sevices;

use App\Repository\UserRepository;
use Doctrine\Persistence\ManagerRegistry;
use App\Entity\User;

class JWTHandler
{
    private $token;

    public function __construct($token)
    {       
        $this->token = $token;
      
    }

    public function getEmail(){
        $tokenParts = explode(".", $this->token);  
        $tokenHeader = base64_decode($tokenParts[0]);
        $tokenPayload = base64_decode($tokenParts[1]);
        $jwtHeader = json_decode($tokenHeader);
        $jwtPayload = json_decode($tokenPayload);
        $email = $jwtPayload->email;
        return $email;
    }
}