
<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Branches extends CI_Controller {

	public function index()
	{
		$this->load->model("Branches_Model");
		$items = $this->Branches_Model->getAll();

                // print_r($items);

                $viewData = new stdClass();
                $viewData->items = $items;
		$this->load->view('v_branches/index', $viewData);
	}
}