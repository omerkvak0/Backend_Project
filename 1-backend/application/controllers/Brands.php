<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Brands extends CI_Controller
{

	public function index()
	{
		$this->load->model("Brands_Model");
		$items = $this->Brands_Model->getAll();
		$viewData = new stdClass();
		$viewData->items = $items;
		$this->load->view('v_brands/index', $viewData);
	}
}
