<?php

namespace Vanier\Api\Models;

class MatchModel extends BaseModel
{


    private $table_name = "match";


    public function __construct()
    {
        parent::__construct();
    }

    //Route: POST /matches

    public function getAll(array $filters = [])
    {
        //return "not found";
        $filters_value = [];

        $sql = "SELECT * FROM match WHERE 1";

        if(isset($filters["home_score"])){
            $sql .= " AND home_score like :home_score";
            $filters_value[":home_score"] = $filters["home_score"] . "%";
        }

        if(isset($filters["away_score"])){
            $sql .= " AND away_score like :away_score";
            $filters_value[":away_score"] = $filters["away_score"] . "%";
        }

        if(isset($filters["match_date"])){
            $sql .= " AND match_date like :match_date";
            $filters_value[":match_date"] = $filters["match_date"] . "%";
        }

        if(isset($filters["stadium_name"])){
            $sql .= " AND stadium_name like :stadium_name";
            $filters_value[":stadium_name"] = $filters["stadium_name"] . "%";
        }

        return $this->run($sql)->fetchAll();
    }

}
