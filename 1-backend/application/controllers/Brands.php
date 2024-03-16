
<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Brands extends CI_Controller {

	public function index()
	{
		$this->load->model("Brands_Model");
		$items = $this->Brands_Model->getAll();

                // print_r($items);

                $viewData = new stdClass();
                $viewData->items = $items;
		$this->load->view('v_brands/index', $viewData);
	}
}