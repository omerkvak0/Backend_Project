
<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Services extends CI_Controller {

	public function index()
	{
		$this->load->model("Services_Model");
		$items = $this->Services_Model->getAll();

                // print_r($items);

                $viewData = new stdClass();
                $viewData->items = $items;
		$this->load->view('v_services/index', $viewData);
	}
}