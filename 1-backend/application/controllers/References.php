
<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class References extends CI_Controller {

	public function index()
	{
		$this->load->model("References_Model");
		$items = $this->References_Model->getAll();

                // print_r($items);

                $viewData = new stdClass();
                $viewData->items = $items;
		$this->load->view('v_references/index', $viewData);
	}
}