<?php

namespace Vanier\Api\Controllers;


use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Vanier\Api\Models\SportModel;
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
        $this->sports_model = new SportModel();
    }



    public function getAllSports(Request $request, Response $response)
    {

        $filtes = $request->getQueryParams();
        $data = $this->sports_model->getAll($filtes);

        $json_data = json_encode($data);

        $response->getBody()->write($json_data);

        return $response->withStatus(201)->withHeader("Content-Type", "application/json");
    }

    //create 1 or more sport
    public function sportCreator(Request $request, Response $response)
    {
        $data = $request->getParsedBody();

        if (is_array($data)) {
            foreach ($data as $key => $sport) {

                $data = $this->sports_model->createSport($sport);


                $res_message = ['Sport created'];

                $json_data = json_encode($sport);

                $response->getBody()->write($json_data);
            }
        }
        return $response->withStatus(201)->withHeader("Content-Type", "application/json");
    }

    // cjkkdahd

    //update sport
    public function sportUpdate(Request $request, Response $response)
    {
        $data = $request->getParsedBody();

        if (is_array($data)) {
            foreach ($data as $key => $sport) {

                $data = $this->sports_model->updateSport($sport);
                $res_message = ['Sports updated'];

                $json_data = json_encode($sport);

                $response->getBody()->write($json_data);
            }
        }
        return $response->withStatus(201)->withHeader("Content-Type", "application/json");
    }

    //delete sport






}