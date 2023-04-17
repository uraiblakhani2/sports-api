<?php

namespace Vanier\Api\Models;

class LeagueModel extends BaseModel
{

    private $table_name = "league";


    public function __construct()
    {
        parent::__construct();
    }

    //Route: POST /matches_bet

    public function getAll(array $filters = [])
    {
        //return "not found";
        $filters_value = [];

        $sql = "SELECT * FROM league WHERE 1";


        if(isset($filters["start_date"])){
            $sql .= " AND start_date = :start_date";
            $filters_value[":start_date"] = $filters["start_date"] . "%";
        }

        if(isset($filters["end_date"])){
            $sql .= " AND end_date = :end_date";
            $filters_value[":end_date"] = $filters["end_date"] . "%";
        }

        if(isset($filters["nbOfTeams"])){
            $sql .= " AND nbOfTeams like :nbOfTeams";
            $filters_value[":nbOfTeams"] = $filters["nbOfTeams"] . "%";
        }

        if(isset($filters["organization"])){
            $sql .= " AND organization like :organization";
            $filters_value[":organization"] = $filters["organization"] . "%";
        }

        if(isset($filters["league_name"])){
            $sql .= " AND league_name like :league_name";
            $filters_value[":league_name"] = $filters["league_name"] . "%";
        }

        if ((isset($filters['page']) &&  isset($filters['page_size']))) {
            $this->setPaginationOptions($filters["page"], $filters["page_size"]);
            return $this->Paginate($sql, $filters_value);
        }

        return $this->run($sql, $filters_value)->fetchAll();
    }

    //CREATING A NEW League
    public function createLeague(array $League)
    {
        //pick some of the contained elements and use them in the insert statement
        $this->insert($this->table_name, $League);
    }
}
