
<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Users extends CI_Controller {

	public function index()
	{
		$this->load->model("Users_Model");
		$items = $this->Users_Model->getAll();

                // print_r($items);

                $viewData = new stdClass();
                $viewData->items = $items;
		$this->load->view('v_users/index', $viewData);
	}
}