
<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Settings extends CI_Controller {

	public function index()
	{
		$this->load->model("Settings_Model");
		$items = $this->Settings_Model->getAll();

                // print_r($items);

                $viewData = new stdClass();
                $viewData->items = $items;
		$this->load->view('v_settings/index', $viewData);
	}
}