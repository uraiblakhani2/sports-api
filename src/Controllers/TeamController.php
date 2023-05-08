<?php

namespace Vanier\Api\Controllers;


use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Vanier\Api\Controllers\BaseController;
use Slim\Exception\HttpNotFoundException;
use Vanier\Api\helpers\ValidationHelper;
use Vanier\Api\Models\CountryModel;
use Vanier\Api\Models\TeamModel;

class TeamController extends BaseController
{


    private $team_model = null;
    private $validator = null;

    /**
     * Summary of __construct
     */
    public function __construct()
    {
        $this->team_model = new TeamModel();
        $this->validator = new ValidationHelper();
    }



    public function getAllTeams(Request $request, Response $response)
    {

        $filters = $request->getQueryParams();
        $validation = $this->validator->validateTeams($filters);
        if ($validation == "valid") {
            $data = $this->team_model->getAll($filters);
            return $this->prepareOkResponse($response, $data);
        } else {
            return $this->notFoundResponse($response, $validation, 400);
        }
    }


    public function teamCreator(Request $request, Response $response)
    {
        $country_model = new CountryModel();

        $data = $request->getParsedBody();

        if (is_array($data)) {
            foreach ($data as $key => $team) {
                $validate = $this->validator->validateTeamsInsert($team);
                if ($validate == "valid") {
                    $country_info = $country_model->getCountryById($team["country_id"]);
                    if (isset($country_info["country_id"])) {
                        $this->team_model->createTeam($team);
                        $res_message = ['Team has been created sucessfully'];
                        return $this->prepareOkResponse($response, $res_message);
                    } else {
                        $res_message = '[country_id not found]';
                        return $this->notFoundResponse($response, $res_message, 404);

                    }

                }
            }
            return $this->notFoundResponse($response, $validate, 422);

        }
    }


    //update team
    public function teamUpdate(Request $request, Response $response)
    {
        $data = $request->getParsedBody();

        if (is_array($data)) {
            foreach ($data as $key => $team) {

                $data = $this->team_model->updateTeam($team);
                $res_message = ['player updated'];

                $json_data = json_encode($team);

                $response->getBody()->write($json_data);
            }
        }
        return $response->withStatus(201)->withHeader("Content-Type", "application/json");
    }
}