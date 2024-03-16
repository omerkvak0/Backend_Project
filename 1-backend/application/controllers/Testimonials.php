
<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Testimonials extends CI_Controller {

	public function index()
	{
		$this->load->model("Testimonials_Model");
		$items = $this->Testimonials_Model->getAll();

                // print_r($items);

                $viewData = new stdClass();
                $viewData->items = $items;
		$this->load->view('v_testimonials/index', $viewData);
	}
}