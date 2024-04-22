<?php
defined('BASEPATH') or exit ('No direct script access allowed');

class Dealer extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        cek_login();
    }
    public function index()
    {
        $this->load->model('M_dealer');
        $data['dealer'] = $this->M_dealer->get_dealer();
        $this->template->load('back/template','back/dealer/dealer', $data);
    }
    function save_dealer()
    {
        $this->form_validation->set_rules('dealer', 'dealer', 'trim|required');
        $this->form_validation->set_message('required', '{field} harus di isi');
        $this->form_validation->set_error_delimiters('<div class="alert alert-danger">', '</div>');
        
        if ($this->form_validation->run() == TRUE) {
            $data = [
                'dealer' => $this->input->post('dealer'),
                'alamat' => $this->input->post('alamat'),
                'dealer_code'   => $this->input->post('dealer_code'),
                'jenis' => $this->input->post('jenis')
            ];
            $this->M_dealer->insert($data);
            $this->session->set_flashdata('message', '<div class="alert alert-info">Data Berhasil di simpan</div>');
            redirect('dealer', 'refresh');
        } else {
            $this->index();
        }
    }
    function edit_dealer($id)
    {
        $data['dlr'] = $this->M_dealer->get_id_dealer($id);
        if($data['dlr'])
        {
            $data['dealer'] = $this->M_dealer->get_dealer();
            $this->template->load('back/template','back/dealer/edit_dealer', $data);
        } else {
            $this->session->set_flashdata('message', '<div class="alert alert-danger">Data tidak ditemukan</div>');
            redirect('dealer', 'refresh');
        }
    }
    function update_dealer()
    {
        $data = [
            'dealer'=> $this->input->post('dealer'),
            'alamat'=> $this->input->post('alamat'),
            'dealer_code'   => $this->input->post('dealer_code'),
            'jenis' => $this->input->post('jenis')
        ];

        $this->M_dealer->update($this->input->post('id_dealer'), $data);
        $this->session->set_flashdata('message', '<div class="alert alert-success">Data berhasil disimpan</div>');
            redirect('dealer', 'refresh');
    }
    function delete_dealer($id)
    {
        $delete = $this->M_dealer->get_id_dealer($id);
        if($delete){
            $this->M_dealer->delete($id);
            $this->session->set_flashdata('hapus', '<div class="alert alert-danger">Data berhasil dihapus</div>');
            redirect('dealer', 'refresh');
        } else {
            $this->session->set_flashdata('hapus', '<div class="alert alert-danger">Data tidak ditemukan</div>');
            redirect('dealer', 'refresh');
        }
    }
}
