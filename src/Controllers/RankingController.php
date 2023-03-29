<?php
namespace Vanier\Api\Controllers;

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;


use Vanier\Api\Models\BaseModel;
use Vanier\Api\Models\RankingModel;

class RankingController extends BaseModel
{


    private $sports_model = null;
    private $validator = null;

    /**
     * Summary of __construct
     */
    public function __construct()
    {
        $this->sports_model = new RankingModel();
    }



    public function getAllRankings(Request $request, Response $response)
    {

        $filtes = $request->getQueryParams();
        $data = $this->sports_model->getAll($filtes);

        $json_data = json_encode($data);

        $response->getBody()->write($json_data);

        return $response->withStatus(201)->withHeader("Content-Type", "application/json");
    }


    public function rankingDelete(Request $request, Response $response, array $uri_args)
    {
        $ranking_model = new RankingModel();
        $ranking_id = $uri_args['ranking_id'];



        $ranking_model->getLeaguebyRankings($ranking_id);

        $res_message = ['Data has been deleted sucessfully!'];
        $json_data = json_encode($res_message);
        $response->getBody()->write($json_data);

        return $response->withStatus(200)->withHeader("Content-Type", "application/json");
    }
}
?>