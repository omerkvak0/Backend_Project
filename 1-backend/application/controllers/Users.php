<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Users extends CI_Controller
{
	public $viewFolder = "";
	public function __construct()
	{
		parent::__construct();
		$this->viewFolder = "v_users";
		$this->load->model("Users_Model");
	}

	public function index()
	{
		$items = $this->Users_Model->getAll();
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
		$this->form_validation->set_rules("email", "Kullanıcı adı", "required|trim|valid_email|is_unique[users.email]");
		$this->form_validation->set_rules("name", "İsim", "required|trim");
		$this->form_validation->set_rules("surname", "Soyisim", "required|trim");
		$this->form_validation->set_rules("password", "Şifre", "required|trim");
		$this->form_validation->set_rules("re-password", "Şifre Tekrarı", "required|trim|matches[password]");

		/* Mesajların Oluşturulması  */
		$this->form_validation->set_message(
			array(
				"required" => "<b>{field}</b> alanı doldurulmalıdır.",
				"valid_email" => "<b>{field}</b> geçerli bir e-posta değildir.",
				"is_unique" => "<b>{field}</b> daha önceden sistemde kayıtlıdır.",
				"matches" => "Şifreler birbiriyle uyuşmuyor."
			)
		);

		/* Çalıştırılması */
		$validate = $this->form_validation->run();

		if ($validate) {
			//echo "Validasyon başarılı, kayıt devam eder.";

			$data = array(
				"email"		=> $this->input->post("email"),
				"name" 		=> $this->input->post("name"),
				"surname" 	=> $this->input->post("surname"),
				"password"  => md5($this->input->post("password")),
				"is_active" => 1
			);

			$insert = $this->Users_Model->add($data);

			if ($insert) {
				redirect(base_url("Users"));
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

	public function update_form($id)
	{

		$item = $this->Users_Model->get(
			array(
				"id" => $id
			)
		);

		$viewData = new stdClass();
		$viewData->item = $item;
		$viewData->subViewFolder = "update";
		$viewData->viewFolder = $this->viewFolder;
		$this->load->view("{$viewData->viewFolder}/{$viewData->subViewFolder}/index", $viewData);
	}

	public function update($id)
	{
		/* Sınıfın Yüklenmesi */
		$this->load->library("form_validation");

		/* Kuralların Yazılması */
		$this->form_validation->set_rules("title", "Ürün kategori adı", "required|trim");

		/* Mesajların Oluşturulması  */
		$this->form_validation->set_message(
			array(
				"required" => "<b>{field}</b> alanı doldurulmalıdır."
			)
		);

		/* Çalıştırılması */
		$validate = $this->form_validation->run();

		if ($validate) {
			//echo "Validasyon başarılı, kayıt güncelleme işlemi devam eder.";

			$data = array(
				"title" => $this->input->post("title")
			);

			$update = $this->Users_Model->update(
				array(
					"id" => $id
				),
				$data
			);

			if ($update) {
				redirect(base_url("Users"));
			} else {
				echo "Başarısız...";
			}
		} else {
			$item = $this->Users_Model->get(
				array(
					"id" => $id
				)
			);

			$viewData = new stdClass();
			$viewData->item = $item;
			$viewData->subViewFolder = "update";
			$viewData->viewFolder = $this->viewFolder;
			$viewData->formError = true;
			$this->load->view("{$viewData->viewFolder}/{$viewData->subViewFolder}/index", $viewData);
		}
	}

	public function delete($id)
	{
		$data = array(
			"id" => $id
		);
		$this->Users_Model->delete($data);

		//TODO alert sistemi entegre edilecek.
		redirect(base_url("Users"));
	}
}
