<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Brands extends CI_Controller
{
	public $viewFolder = "";
	public function __construct()
	{
		parent::__construct();
		$this->viewFolder = "v_brands";
		$this->load->model("Brands_Model");
	}

	public function index()
	{
		$items = $this->Brands_Model->getAll();
		//print_r($items);
		//die();
		$viewData = new stdClass();
		$viewData->items = $items;
		$viewData->subViewFolder = "list";
		$viewData->viewFolder = $this->viewFolder;
		$this->load->view("{$viewData->viewFolder}/{$viewData->subViewFolder}/index", $viewData);
	}

	public function new_form()
	{
		$viewData = new stdClass();
		$viewData->subViewFolder = "add";
		$viewData->viewFolder = $this->viewFolder;
		$this->load->view("{$viewData->viewFolder}/{$viewData->subViewFolder}/index", $viewData);
	}
	
	public function save()
	{
		/* Sınıfın Yüklenmesi */
		$this->load->library("form_validation");
		/* Kuralların Yazılması */
		$this->form_validation->set_rules("title", "Ürün kategori adı", "required|trim");
		/* Mesajların Oluşturulması  */
		$this->form_validation->set_message(
			array("required" => "<b>{field}</b> alanı doldurulmalıdır."));

		/* Çalıştırılması */
		$validate = $this->form_validation->run();

		if ($validate) {
			//echo "Validasyon başarılı, kayıt devam eder.";
			$data = array("title" => $this->input->post("title"));

			$insert = $this->Brands_Model->add($data);

			if ($insert) {
				redirect(base_url("Brands"));
			} else {
				echo "Kayıt Ekleme Sırasında Bir Hata Oluştu.";
			}
			
		} else {
			//echo "Validasyon başarısız, kayıt ekleme işlemine geri döner.";
			$viewData = new stdClass();
			$viewData->viewFolder = $this->viewFolder;
			$viewData->subViewFolder = "add";
			$viewData->formError = true;
			$this->load->view("{$viewData->viewFolder}/{$viewData->subViewFolder}/index", $viewData);
		}
	}

	// Sil butonuna tıklayınca olacak işlemin fonksiyonu
	public function delete($id)
	{
		$data = array("id" => $id);
		$this->Brands_Model->delete($data);

		//alert sistemi yapılcak.
		redirect(base_url("Brands"));
	}

	// update işleminin fonksiyonu
	public function update($id)
	{
		$this->load->library("form_validation");
		$this->form_validation->set_rules("title", "Ürün kategori adı", "required|trim");
		$this->form_validation->set_message(
			array(
				"required" => "<b>{field}</b> alanı doldurulmalıdır."
			));

		$validate = $this->form_validation->run();

		if ($validate) {
			$data = array("title" => $this->input->post("title"));

			$update = $this->Brands_Model->update(
				array("id" => $id),	$data);

			if ($update) {
				redirect(base_url("Brands"));}
				
			else {echo "Hata Oluştu!";}

		} else {
			$item = $this->Brands_Model->get(array("id" => $id));

			$viewData = new stdClass();
			$viewData->item = $item;
			$viewData->viewFolder = $this->viewFolder;
			$viewData->subViewFolder = "update";
			$viewData->formError = true;
			$this->load->view("{$viewData->viewFolder}/{$viewData->subViewFolder}/index", $viewData);
		}
	}

	// update formunun fonsiyonu
	public function update_form($id)
	{
		$item = $this->Brands_Model->get(array("id" => $id));

		$viewData = new stdClass();
		$viewData->item = $item;
		$viewData->subViewFolder = "update";
		$viewData->viewFolder = $this->viewFolder;
		$this->load->view("{$viewData->viewFolder}/{$viewData->subViewFolder}/index", $viewData);
	}
	

}
