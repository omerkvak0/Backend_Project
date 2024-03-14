<?php
class Product_Categories_Model extends CI_Model
{

    public function __construct(){
        parent::__construct();
    }

    /* Tabloya veri ekleyen fonksiyon */
    public function save($data = array()){
        return $this->db->insert("product_categories", $data);
    }

    /* Tablodaki tüm kayıtları çeken fonksiyon */
    public function getAll($order = "id ASC"){
        return $this->db->order_by($order)->get("product_categories")->result();
    }
    // order_by($order) = Veritabanı sorgusuna bir "ORDER BY" ifadesi ekler. 
    // $order parametresi, sıralama düzenini belirler.

}

?>