<?php

namespace Vanier\Api\Models;

class SportModel extends BaseModel
{


    private $table_name = "sport";


    public function __construct()
    {
        parent::__construct();
    }

    //Route: POST /sports

    public function getAll(array $filters = [])
    {
        //return "not found";
        $filters_value = [];

        $sql = "SELECT * FROM sport WHERE 1";

        if(isset($filters["sport_name"])){
            $sql .= " AND sport_name like :sport_name";
            $filters_value[":sport_name"] = $filters["sport_name"] . "%";
        }

        if(isset($filters["sport_type"])){
            $sql .= " AND sport_type like :sport_type";
            $filters_value[":sport_type"] = $filters["sport_type"] . "%";
        }

        return $this->run($sql)->fetchAll();
    }

    //CREATING A NEW SPORT
    public function createSport(array $sport)
    {
        //pick some of the contained elements and use them in the insert statement
        $this->insert($this->table_name, $sport);
    }


    public function updateSport(array $sport)
    {
        //pick some of the contained elements and use them in the insert statement
        $this->update($this->table_name, $sport, ["sport_id"=>1]);
    }

    public function getSportById(int $sport_id)
    {
        $sql = "SELECT * FROM sport WHERE sport_id =:sport_id ";
        return $this->run($sql,[":sport_id" =>$sport_id])->fetchAll();
    }
}

?>