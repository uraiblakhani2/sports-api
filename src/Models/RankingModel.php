<?php

namespace Vanier\Api\Models;
use Vanier\Api\Models\BaseModel;


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

        $sql = "SELECT * FROM ranking WHERE 1";

        if(isset($filters["games_won"])){
            $sql .= " AND games_won = :games_won";
            $filters_value[":games_won"] = $filters["games_won"] . "%";
        }

        if(isset($filters["games_lost"])){
            $sql .= " AND games_lost like :games_lost";
            $filters_value[":games_lost"] = $filters["games_lost"] . "%";
        }

        if ((isset($filters['page']) &&  isset($filters['page_size']))) {
            $this->setPaginationOptions($filters["page"], $filters["page_size"]);
            return $this->Paginate($sql, $filters_value);
        }

        return $this->run($sql, $filters_value)->fetchAll();
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