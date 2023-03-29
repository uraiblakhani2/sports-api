<?php

namespace Vanier\Api\Controllers;

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Vanier\Api\Controllers\BaseController;
use Vanier\Api\Models\PlayerModel;

class PlayerController extends BaseController
{


    private $sports_model = null;
    private $validator = null;

    /**
     * Summary of __construct
     */
    public function __construct()
    {
        $this->sports_model = new PlayerModel();
    }



    public function getAllPlayers(Request $request, Response $response)
    {

        $filtes = $request->getQueryParams();
        $data = $this->sports_model->getAll($filtes);

        $json_data = json_encode($data);

        $response->getBody()->write($json_data);

        return $response->withStatus(201)->withHeader("Content-Type", "application/json");
    }


    public function playerDelete(Request $request, Response $response, array $uri_args)
    {
        $player_model = new PlayerModel();
        $player_id = $uri_args['player_id'];



        $player_model->deletePlayerByID($player_id);

        $res_message = ['Data has been deleted sucessfully!'];
        $json_data = json_encode($res_message);
        $response->getBody()->write($json_data);

        return $response->withStatus(200)->withHeader("Content-Type", "application/json");
    }

}