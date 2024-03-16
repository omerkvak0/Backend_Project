
<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Product_Categories extends CI_Controller {

	public function index()
	{
		$this->load->model("Product_Categories_Model");
		$items = $this->Product_Categories_Model->getAll();

                // print_r($items);

                $viewData = new stdClass();
                $viewData->items = $items;
		$this->load->view('v_product_categories/index', $viewData);
	}
}