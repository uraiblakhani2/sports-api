<?php

namespace Vanier\Api\Models;

class TeamModel extends BaseModel
{


    private $table_name = "team";


    public function __construct()
    {
        parent::__construct();
    }

    //Route: POST /team
    
    public function getAll(array $filters = [])
    {
        //return "not found";
        $filters_value = [];

        $sql = "SELECT * FROM team WHERE 1";

        if(isset($filters["team_name"])){
            $sql .= " AND team_name like :team_name";
            $filters_value[":team_name"] = $filters["team_name"] . "%";
        }

        if(isset($filters["manager_name"])){
            $sql .= " AND manager_name like :manager_name";
            $filters_value[":manager_name"] = $filters["manager_name"] . "%";
        }

        if(isset($filters["ceo_name"])){
            $sql .= " AND ceo_name like :ceo_name";
            $filters_value[":ceo_name"] = $filters["ceo_name"] . "%";
        }

        if(isset($filters["team_sponsor"])){
            $sql .= " AND team_sponsor like :team_sponsor";
            $filters_value[":team_sponsor"] = $filters["team_sponsor"] . "%";
        }

        if(isset($filters["team_court_name"])){
            $sql .= " AND team_court_name like :team_court_name";
            $filters_value[":team_court_name"] = $filters["team_court_name"] . "%";
        }

        if(isset($filters["team_color"])){
            $sql .= " AND team_color like :team_color";
            $filters_value[":team_color"] = $filters["team_color"] . "%";
        }
        if(isset($filters["team_coach"])){
            $sql .= " AND team_coach like :team_coach";
            $filters_value[":team_team_oach"] = $filters["team_coach"] . "%";
        }

        return $this->run($sql)->fetchAll();
    }

    /*
    filters to return: 
        coach
    */
}
