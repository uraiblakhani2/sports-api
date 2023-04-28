<?php

namespace Vanier\Api\Controllers;

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Vanier\Api\Controllers\BaseController;
use Vanier\Api\helpers\ValidationHelper;
use Vanier\Api\Models\LeagueModel;

class leagueController extends BaseController
{

    private $league_model = null;
    private $validator = null;

    /**
     * Summary of __construct
     */
    public function __construct()
    {
        $this->league_model = new LeagueModel();
        $this->validator = new ValidationHelper();
    }


    public function getAllLeagues(Request $request, Response $response)
    {

        $filters = $request->getQueryParams();
        $validation = $this->validator->validateLeaguesFilters($filters);
        if ($validation == "valid") {
            $data = $this->league_model->getAll($filters);
            return $this->prepareOkResponse($response, $data);
        } else {
            return $this->notFoundResponse($response, $validation, 400);
        }
    }

    //create 1 or more league
    public function leaguecreator(Request $request, Response $response)
    {
        $data = $request->getParsedBody();

        if (is_array($data)) {
            foreach ($data as $key => $league) {

                $data = $this->league_model->createLeague($league);


                $res_message = ['league created'];

                $json_data = json_encode($league);

                $response->getBody()->write($json_data);
            }
        }
        return $response->withStatus(201)->withHeader("Content-Type", "application/json");
    }
    
}
