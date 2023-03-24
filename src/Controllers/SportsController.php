<?php

namespace Vanier\Api\Controllers;


use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Vanier\Api\Models\SportsModel;
use Vanier\Api\Controllers\BaseController;
use Slim\Exception\HttpNotFoundException;



class SportsController extends BaseController
{


    private $sports_model = null;
    private $validator = null;

    /**
     * Summary of __construct
     */
    public function __construct()
    {
        $this->sports_model = new SportsModel();
    }



    public function getAllSports(Request $request, Response $response)
    {

        $filtes = $request->getQueryParams();
        $data = $this->sports_model->getAll($filtes);

        $json_data = json_encode($data);

        $response->getBody()->write($json_data);

        return $response->withStatus(201)->withHeader("Content-Type", "application/json");
    }

}