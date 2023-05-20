<?php

namespace Vanier\Api\Controllers;


use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\Exception\HttpBadRequestException;
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

        if ((is_array($data)) && (!empty($data) )) {
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
        else{
            throw new HttpBadRequestException($request, "Body data cannot be empty");
        }
    }


    //update team
    public function teamUpdate(Request $request, Response $response)
    {
        $data = $request->getParsedBody();

        if ((is_array($data)) && (!empty($data) )) {
            foreach ($data as $team) {
                $validate = $this->validator->validateTeamsInsert($team);
                if ($validate == "valid") {

                    $team_exists = $this->team_model->getTeamById($team['team_id']);
                    if ($team_exists) {

                        $team_id = $team["team_id"];
                        unset($team["team_id"]);
                        $this->team_model->updateTeam($team, $team_id);

                        $res_message = ['Data has been updated sucessfully!'];
                        return $this->prepareOkResponse($response, $res_message);
                    }

                } else {
                    return $this->notFoundResponse($response, $validate);
                }
                $res_message = '[Team id not found]';
                return $this->notFoundResponse($response, $res_message);
            }

        }
        else{
            throw new HttpBadRequestException($request, "Body data cannot be empty");
        }
    }
}