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

        if(isset($filters["name"])){
            $sql .= " AND name like :name";
            $filters_value[":name"] = $filters["name"] . "%";
        }

        if(isset($filters["type"])){
            $sql .= " AND type like :type";
            $filters_value[":type"] = $filters["type"] . "%";
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