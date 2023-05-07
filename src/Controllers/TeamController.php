<?php

namespace Vanier\Api\Controllers;


use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Vanier\Api\Controllers\BaseController;
use Slim\Exception\HttpNotFoundException;
use Vanier\Api\helpers\ValidationHelper;
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
        $validation = $this->validator->validateTeamsFilters($filters);
        if ($validation == "valid") {
            $data = $this->team_model->getAll($filters);
            return $this->prepareOkResponse($response, $data);
        } else {
            return $this->notFoundResponse($response, $validation, 400);
        }
    }


    //create 1 or more team
    public function teamCreator(Request $request, Response $response)
    {
        $data = $request->getParsedBody();

        if (is_array($data)) {
            foreach ($data as $key => $team) {

                $data = $this->team_model->createTeam($team);


                $res_message = ['team created'];

                $json_data = json_encode($team);

                $response->getBody()->write($json_data);
            }
        }
        return $response->withStatus(201)->withHeader("Content-Type", "application/json");
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