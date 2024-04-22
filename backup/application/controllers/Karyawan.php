<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class Karyawan extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        cek_login();
    }
    public function index()
    {
        $this->load->model('M_karyawan');
        $data["karyawan"] = $this->M_karyawan->get_karyawan();
        $this->template->load('back/template', 'back/karyawan/data_karyawan', $data);
    }


    function tambah_karyawan()
    {
        $data["jabatan"] = $this->M_jabatan->get_jabatan();
        $data["divisi"] = $this->M_divisi->get_divisi();
        $this->template->load('back/template', 'back/karyawan/form_karyawan', $data);
    }
    function save_karyawan()
    {
        $this->form_validation->set_rules('username', 'Username', 'trim|is_unique[user.username]|required');
        $this->form_validation->set_rules('nama', 'Nama', 'trim|required');
        $this->form_validation->set_rules('email', 'Email', 'valid_email|is_unique[user.email]|required');
        $this->form_validation->set_rules('password', 'Password', 'trim|min_length[5]|required');
        $this->form_validation->set_rules('confirm_password', 'Confirm Password', 'trim|matches[password]|required');
        $this->form_validation->set_message('required', '{field} harus di isi');
        $this->form_validation->set_message('valid_email', '{field} Email harus valid');

        $this->form_validation->set_error_delimiters('<div class="alert alert-danger">', '</div>');

        
        if ($this->form_validation->run() == TRUE ) {
            $data = array(
                'username'      => $this->input->post('username'),
                'nama'          => $this->input->post('nama'),
                'email'         => $this->input->post('email'),
                'jabatan_id'    => $this->input->post('jabatan_id'),
                'divisi_id'     => $this->input->post('divisi_id'),
                'password'      => password_hash($this->input->post('password'), PASSWORD_BCRYPT),
                'status_user'   => 1,
                'level_user'    => 2
            );

            $this->M_karyawan->insert($data);
            $this->session->set_flashdata('message', '<div class="alert alert-info">Data Berhasil di simpan</div>');
            redirect('karyawan', 'refresh');

        } else {
            $this->tambah_karyawan();
            // $this->load->view('karyawan/form_karyawan');
        }
    }
    function edit_karyawan($id)
    {
        $data['user'] = $this->M_karyawan->get_id_user($id);
            if($data['user'])
            {
                $data["jabatan"]    = $this->M_jabatan->get_jabatan();
                $data["divisi"]     = $this->M_divisi->get_divisi();
                $this->template->load('back/template', 'back/karyawan/edit_karyawan', $data);
            } else {
                $this->session->set_flashdata('message', '<div class="alert alert-danger">Data tidak ditemukan</div>');
                redirect('karyawan', 'refresh');
            }
    }

    function update_karyawan()
    {
        $this->form_validation->set_rules('username', 'Username', 'trim|required');
        $this->form_validation->set_message('required', '{field} harus di isi');
        $this->form_validation->set_message('valid_email', '{field} Email harus valid');

        $this->form_validation->set_error_delimiters('<div class="alert alert-danger">', '</div>');

        
        if ($this->form_validation->run() == TRUE ) {
            $data = array(
                'username'      => $this->input->post('username'),
                'nama'          => $this->input->post('nama'),
                'email'         => $this->input->post('email'),
                'jabatan_id'    => $this->input->post('jabatan_id'),
                'divisi_id'     => $this->input->post('divisi_id'),
                'status_user'   => $this->input->post('status_user'),
                'level_user'    => $this->input->post('level_user'),
                'password'      => password_hash($this->input->post('password'), PASSWORD_BCRYPT)
            );

            $this->M_karyawan->update($this->input->post('id_user'), $data);
            $this->session->set_flashdata('message', '<div class="alert alert-info">Data Berhasil di update</div>');
            redirect('karyawan', 'refresh');

        } else {
            $this->tambah_karyawan();
        }
    }
    function delete_karyawan($id)
    {
        $delete = $this->M_karyawan->get_id_user($id);
        if($delete){
            $this->M_karyawan->delete($id);
            $this->session->set_flashdata('message', '<div class="alert alert-danger">Data berhasil dihapus</div>');
            redirect('karyawan', 'refresh');
        } else {
            $this->session->set_flashdata('message', '<div class="alert alert-danger">Data tidak ditemukan</div>');
            redirect('karyawan', 'refresh');
        }
    }
    function profile($id)
    {
        $data['karyawan']   = $this->M_karyawan->get_id_karyawan($id);
        
        if($data['karyawan'])
        {
            $data['title'] = 'Profile User';
            $data['jabatan']    = $this->M_jabatan->get_jabatan();
            $data['divisi']     = $this->M_divisi->get_divisi();
            $this->template->load('back/template', 'back/profile', $data);
        } else {
            redirect('dashboard', 'refresh');
        }
    }
    function update_profile()
    {
        $this->form_validation->set_rules('username', 'Username', 'trim|required');
        $this->form_validation->set_message('required', '{field} harus di isi');
        $this->form_validation->set_error_delimiters('<div class="alert alert-danger">', '</div>');
        
        if ($this->form_validation->run() == TRUE ) {
            $data = array(
                'username'      => $this->input->post('username'),
                'nama'          => $this->input->post('nama'),
                'email'         => $this->input->post('email'),
            );

            $this->M_karyawan->update($this->input->post('id_user'), $data);
            $this->session->set_flashdata('message', '<div class="alert alert-info">Data Berhasil di update</div>');
            redirect('karyawan/profile/' . $this->session->id_user);

        } else {
            $this->tambah_karyawan();
        }
    }
}

/* End of file Controllername.php */
