<?php

namespace Vanier\Api\Controllers;

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Vanier\Api\Controllers\BaseController;
use Vanier\Api\Exceptions\HttpNotFoundException;
use Vanier\Api\helpers\ValidationHelper;
use Vanier\Api\Models\CountryModel;
use Vanier\Api\Models\PlayerModel;
use Vanier\Api\Models\SportModel;
use Vanier\Api\Models\TeamModel;
use Vanier\Api\Models\WSLoggingModel;

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
        $validation = $this->validator->validatePlayers($filters);
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
        $country_model = new CountryModel();
        $team_model = new TeamModel();

        $data = $request->getParsedBody();

        if (is_array($data)) {
            foreach ($data as $key => $player) {
                $validate = $this->validator->validatePlayersInsert($player);
                if ($validate == "valid") {
                    $country_info = $country_model->getCountryById($player["country_id"]);
                    $team_info = $team_model->getTeamById($player["team_id"]);
                    if (isset($country_info["country_id"]) && isset($team_info["team_id"])) {
                        $this->player_model->createPlayer($player);
                        $res_message = ['Player has been created sucessfully'];
                        return $this->prepareOkResponse($response, $res_message);
                    } else {
                        $res_message = '[country_id or team_id not found]';
                        return $this->notFoundResponse($response, $res_message, 404);

                    }

                }
            }
            return $this->notFoundResponse($response, $validate, 422);

        }
    }





    public function playerUpdate(Request $request, Response $response)
    {
        $data = $request->getParsedBody();

        if (is_array($data)) {
            foreach ($data as $player) {
                    $validate = $this->validator->validatePlayersInsert($player);
                    if($validate == "valid"){

                        $player_exists = $this->player_model->getPlayerById($player['player_id']);
                        if ($player_exists) {
                            $player_id = $player["player_id"];
                            unset($player["player_id"]);
                            $this->player_model->updatePlayer($player, $player_id);

                            $res_message = ['Data has been updated sucessfully!'];
                            return $this->prepareOkResponse($response, $res_message);
                        }

                    }
                    else{
                        return $this->notFoundResponse($response, $validate);
                    }
                    $res_message = '[Player id not found]';
                    return $this->notFoundResponse($response, $res_message);
                    }

            }
        }

}