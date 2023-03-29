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

    public function getLeaguebyRankings(int $league_id)
    {
        $sql = " SELECT * FROM league JOIN ranking WHERE league.league_id=: ranking.league_id ";
        $smt= $this->run($sql,[":league_id" =>$league_id])->fetchAll();
        return $smt->rowCount();
    }

    public function DeleteRankingByLeague(int $ranking_id)
    {
        $sql = " DELETE FROM $this->table_name WHERE ranking_id = :ranking_id";
        $smt = $this->run($sql, [":ranking_id" => $ranking_id])->fetchAll();
    }

}