<?php

namespace Vanier\Api\Models;

class RankingModel extends BaseModel
{


    private $table_name = "ranking";


    public function __construct()
    {
        parent::__construct();
    }

    //Route: POST /actors
    
    public function getAll(array $filters = [])
    {
        //return "not found";
        $filters_value = [];

        $sql = "SELECT * FROM ranking";

        return $this->run($sql)->fetchAll();
    }

    // public function getLeaguebyId(int $sport_id)
    // {
    //     $sql = " SELECT * FROM league WHERE film_id =:film_id ";
    //     $smt= $this->run($sql,[":film_id" =>$sport_id])->fetchAll();
    //     return $smt->rowCount();
    // }

    // public function DeleteRankingByLeague(Type $var = null)
    // {
    //     # code...
    // }

}