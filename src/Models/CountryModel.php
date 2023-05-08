<?php

namespace Vanier\Api\Models;

class CountryModel extends BaseModel
{

    private $table_name = "country";


    public function __construct()
    {
        parent::__construct();
    }

    //Route: POST /matches_bet
    public function getAll(array $filters = [])
    {
        //return "not found";
        $filters_value = [];

        $sql = "SELECT * FROM country WHERE 1";

        if (isset($filters["country_name"])) {
            $sql .= " AND country_name like :country_name";
            $filters_value[":country_name"] = $filters["country_name"] . "%";
        }

        if (isset($filters["capital_name"])) {
            $sql .= " AND capital_name like :capital_name";
            $filters_value[":capital_name"] = $filters["capital_name"] . "%";
        }

        if (isset($filters["continent_name"])) {
            $sql .= " AND continent_name like :continent_name";
            $filters_value[":continent_name"] = $filters["continent_name"] . "%";
        }

        if (isset($filters["language"])) {
            $sql .= " AND lanugage like :language";
            $filters_value[":language"] = $filters["language"] . "%";
        }


        if (isset($filters["currency_name"])) {
            $sql .= " AND currency_name like :currency_name";
            $filters_value[":currency_name"] = $filters["currency_name"] . "%";
        }


        if ((isset($filters['page']) && isset($filters['page_size']))) {
            $this->setPaginationOptions($filters["page"], $filters["page_size"]);
            return $this->Paginate($sql, $filters_value);
        }

        return $this->run($sql, $filters_value)->fetchAll();


    }

    //CREATING A NEW country
    public function createCountry(array $country)
    {
        //pick some of the contained elements and use them in the insert statement
        $this->insert($this->table_name, $country);
    }




    public function updateCountry(array $country, int $country_id)
    {
        $this->update($this->table_name, $country, ["country_id" => $country_id]);
    }



    public function getCountryByName(string $country_name)
    {
        $country_name = $country_name . "%";
        $sql = "SELECT * FROM country WHERE country_name LIKE :name ";
        return $this->run($sql, [":name" => $country_name])->fetch();
    }


    public function getCountryById(int $country_id)
    {

        $sql = "SELECT * FROM COUNTRY WHERE country_id = :country_id";

        return $this->run($sql, [":country_id" => $country_id])->fetch();
    }

}