<?php
defined('BASEPATH') or exit ('No direct script access allowed');

class Divisi extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        cek_login();
    }
    
    public function index()
    {
        cek_login();
        $this->load->model('M_divisi');
        $data['divisi'] = $this->M_divisi->get_divisi();
        $this->template->load('back/template','back/divisi/divisi', $data);
    }
    function save_divisi()
    {
        $this->form_validation->set_rules('divisi', 'divisi', 'trim|required');
        $this->form_validation->set_message('required', '{field} harus di isi');
        $this->form_validation->set_error_delimiters('<div class="alert alert-danger">', '</div>');

        
        if ($this->form_validation->run() == TRUE) {
            $data = [
                'divisi' => $this->input->post('divisi')
            ];

            $this->M_divisi->insert($data);
            $this->session->set_flashdata('message', '<div class="alert alert-info">Data Berhasil di simpan</div>');
            redirect('divisi', 'refresh');
        } else {
            $this->index();
        }
        
    }

    function edit_divisi($id)
    {
        $data['jbt'] = $this->M_divisi->get_id_divisi($id);
        if($data['jbt'])
        {
            $data['divisi'] = $this->M_divisi->get_divisi();
            $this->template->load('back/template','back/divisi/edit_divisi', $data);
        } else {
            $this->session->set_flashdata('message', '<div class="alert alert-danger">Data tidak ditemukan</div>');
            redirect('divisi', 'refresh');
        }
    }

    function update_divisi()
    {
        $data = [
            'divisi'=> $this->input->post('divisi')
        ];

        $this->M_divisi->update($this->input->post('id_divisi'), $data);
        $this->session->set_flashdata('message', '<div class="alert alert-success">Data berhasil disimpan</div>');
            redirect('divisi', 'refresh');
    }
    function delete_divisi($id)
    {
        $delete = $this->M_divisi->get_id_divisi($id);
        if($delete){
            $this->M_divisi->delete($id);
            $this->session->set_flashdata('hapus', '<div class="alert alert-danger">Data berhasil dihapus</div>');
            redirect('divisi', 'refresh');
        } else {
            $this->session->set_flashdata('hapus', '<div class="alert alert-danger">Data tidak ditemukan</div>');
            redirect('divisi', 'refresh');
        }
    }
}
