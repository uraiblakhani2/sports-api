<?php

namespace Vanier\Api\Models;
use Vanier\Api\Models\BaseModel;
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

        if ((isset($filters['page']) &&  isset($filters['page_size']))) {
            $this->setPaginationOptions($filters["page"], $filters["page_size"]);
            return $this->Paginate($sql, $filters_value);
        }

        return $this->run($sql, $filters_value)->fetchAll();
    }

    //CREATING A NEW SPORT
    public function createSport(array $sport)
    {
        //pick some of the contained elements and use them in the insert statement
        $this->insert($this->table_name, $sport);
    }


    public function updateSport(array $sport, int $sport_id)
    {
        $this->update($this->table_name, $sport, ["sport_id" => $sport_id]);
    }

    public function getSportById(int $sport_id)
    {
        $sql = "SELECT * FROM sport WHERE sport_id =:sport_id ";
        return $this->run($sql,[":sport_id" =>$sport_id])->fetchAll();
    }

    public function getSportByName(String $sport_name)
    {
        $sport_name = $sport_name . "%";
        $sql = "SELECT * FROM sport WHERE sport_name LIKE :name ";
        return $this->run($sql, [":name" => $sport_name])->fetch();
    }

}


?>