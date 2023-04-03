<?php

namespace Vanier\Api\Controllers;


use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Vanier\Api\Controllers\BaseController;
use Slim\Exception\HttpNotFoundException;
use Vanier\Api\Models\TeamModel;

class TeamController extends BaseController
{


    private $sports_model = null;
    private $validator = null;

    /**
     * Summary of __construct
     */
    public function __construct()
    {
        $this->sports_model = new TeamModel();
    }



    public function getAllTeams(Request $request, Response $response)
    {

        $filters = $request->getQueryParams();
        $data = $this->sports_model->getAll($filters);

        $json_data = json_encode($data);

        $response->getBody()->write($json_data);

        return $response->withStatus(201)->withHeader("Content-Type", "application/json");
    }

}