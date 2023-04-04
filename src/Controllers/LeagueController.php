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
}
