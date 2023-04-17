<?php

namespace Vanier\Api\Controllers;

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Vanier\Api\Controllers\BaseController;
use Vanier\Api\helpers\ValidationHelper;
use Vanier\Api\Models\PlayerModel;

class PlayerController extends BaseController
{


    private $player_model = null;
    private $validator = null;

    /**
     * Summary of __construct
     */
    public function __construct()
    {
        $this->player_model = new PlayerModel();
        $this->validator = new ValidationHelper();
    }



    public function getAllPlayers(Request $request, Response $response)
    {

        $filters = $request->getQueryParams();
        $validation = $this->validator->validatePlayersFilters($filters);
        if ($validation == "valid") {
            $data = $this->player_model->getAll($filters);
            return $this->prepareOkResponse($response, $data);
        } else {
            return $this->notFoundResponse($response, $validation, 400);
        }
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


    //create 1 or more player
    public function playerCreator(Request $request, Response $response)
    {
        $data = $request->getParsedBody();

        if (is_array($data)) {
            foreach ($data as $key => $player) {

                $data = $this->player_model->createPlayer($player);


                $res_message = ['Player created'];

                $json_data = json_encode($player);

                $response->getBody()->write($json_data);
            }
        }
        return $response->withStatus(201)->withHeader("Content-Type", "application/json");
    }
    

}