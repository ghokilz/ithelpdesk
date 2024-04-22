<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class Tiket extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        cek_login();
    }
    function index()
    {
        $this->load->model('M_tiket');
        $data['tiket'] = $this->M_tiket->get_tiket();
        $data['no_tiket'] = $this->M_tiket->no_tiket();
        $data['tiket_user'] = $this->M_tiket->tiket_user();
        $this->template->load('back/template', 'back/tiket/tiket', $data);
    }

    function save_tiket()
    {
        $this->form_validation->set_rules('judul_tiket', 'Judul Tiket', 'trim|required');
        $this->form_validation->set_rules('deskripsi', 'Deskripsi Tiket', 'trim|required');

        $this->form_validation->set_message('required',  '{field} Harus di isi');
        $this->form_validation->set_error_delimiters('<div> class = "alert alert-danger"', '</div>');

        if ($this->form_validation->run() == FALSE)
        {
            $this->index();
        } else {
            if ($_FILES['gambar_tiket']['error'] <> 4)
            {
                $config['upload_path']      = 'assets/images/tiket/';
                $config['allowed_types']    = 'gif|jpg|png|jpeg';
                $config['max_size']         = '2048';
                $nama_file                  = $this->input->post('no_tiket') . date('YmdHis');
                $config['file_name']        = $nama_file;

                $this->load->library('upload', $config);

                if ( ! $this->upload->do_upload('gambar_tiket'))
                {
                    $error = array('error' => $this->upload->display_errors());
                    $this->session->set_flashdata('message', '<div class="alert alert-danger">' . $error['error'] . '</div>');
                    $this->index();
                } else {
                    $gambar_tiket = $this->upload->data();

                    $data = array (
                        'no_tiket'      => $this->input->post('no_tiket'),
                        'judul_tiket'   => $this->input->post('judul_tiket'),
                        'deskripsi'     => $this->input->post('deskripsi'),
                        'status_tiket'  => 0,
                        'user_id'       => $this->session->userdata('id_user'),
                        'gambar_tiket'  => $this->upload->data('file_name'),
                        'tgl_daftar'    => date('Y-m-d')
                    );
                    // var_dump($data);

                    $this->M_tiket->insert($data);
                    $this->session->set_flashdata('message', '<div class="alert alert-info">Data Berhasil di simpan</div>');
                    $this->sendemail($_POST);
                    redirect('tiket', 'refresh');
                }
            } else {
                $data = array (
                    'no_tiket'      => $this->input->post('no_tiket'),
                    'judul_tiket'   => $this->input->post('judul_tiket'),
                    'deskripsi'     => $this->input->post('deskripsi'),
                    'status_tiket'  => 0,
                    'user_id'       => $this->session->userdata('id_user'),
                    // 'gambar_tiket'  => $this->upload->data('file_name'),
                    'tgl_daftar'    => date('Y-m-d'),
                );
                $this->M_tiket->insert($data);
                $this->session->set_flashdata('message', '<div class="alert alert-info">Data Berhasil di simpan</div>');
                $this->sendemail($_POST);
                redirect('tiket', 'refresh');
            }
        }
    }

    function save_tiket_waiting ()
    {
        $this->form_validation->set_rules('status_tiket', 'Status Tiket', 'trim|required');

        $this->form_validation->set_message('required',  '{field} Harus di isi');
        $this->form_validation->set_error_delimiters('<div> class = "alert alert-danger"', '</div>');

        if ($this->form_validation->run() == FALSE)
        {
            $this->index();
        } else {
            $data = array(
                'status_tiket' => $this->input->post('status_tiket'),
            );
            $this->M_tiket->update($this->input->post('id_tiket'), $data);
            $this->session->set_flashdata('message', '<div class="alert alert-info">Data Berhasil di Update</div>');
            redirect('tiket', 'refresh');
        }
    }

    function save_tanggapan()
    {
        $this->form_validation->set_rules('tanggapan', 'Tanggapan Tiket', 'trim|required');

        $this->form_validation->set_message('required',  '{field} Harus di isi');
        $this->form_validation->set_error_delimiters('<div> class = "alert alert-danger"', '</div>');

        if ($this->form_validation->run() == FALSE)
        {
            $this->index();
        } else {
            if ($_FILES['gambar_tanggapan']['error'] <> 4)
            {
                $config['upload_path']      = 'assets/images/tiket/tanggapan/';
                $config['allowed_types']    = 'gif|jpg|png|jpeg';
                $config['max_size']         = '2048';
                $nama_file                  = $this->input->post('tiket_id') . date('YmdHis');
                $config['file_name']        = $nama_file;

                $this->load->library('upload', $config);

                if ( ! $this->upload->do_upload('gambar_tanggapan'))
                {
                    $error = array('error' => $this->upload->display_errors());
                    $this->session->set_flashdata('message', '<div class="alert alert-danger">' . $error['error'] . '</div>');
                    $this->index();
                } else {
                    if ($this->input->post('id_tiket'))
                    {
                        $data = array(
                        'status_tiket' => 2,
                        );
                        $this->M_tiket->update($this->input->post('id_tiket'), $data);
                    }
                    $gambar_tanggapan = $this->upload->data();
                    $data = array (
                        //ini yang di rubah ke "id_tiket" dari awal "tiket_id"
                        'tiket_id' => $this->input->post('id_tiket'), 
                        'tanggapan' => $this->input->post('tanggapan'),
                        'gambar_tanggapan' => $this->upload->data('file_name'),
                        'waktu_tanggapan' => date('Y-m-d'),
                    );
                    // var_dump($data);

                    $this->M_tiket->insert_tanggapan($data);
                    $this->session->set_flashdata('message', '<div class="alert alert-info">Data Berhasil di simpan</div>');
                    redirect('tiket', 'refresh');
                }
            } else {
                if ($this->input->post('id_tiket'))
                    {
                        $data = array(
                        'status_tiket' => 2,
                        );

                        $this->M_tiket->update($this->input->post('id_tiket'), $data);
                    }
                $data = array (
                    'tiket_id'          => $this->input->post('id_tiket'),
                    'tanggapan'         => $this->input->post('tanggapan'),
                    'waktu_tanggapan'   => date('Y-m-d'),
                );
                $this->M_tiket->insert_tanggapan($data);
                $this->session->set_flashdata('message', '<div class="alert alert-info">Data Berhasil di simpan</div>');
                redirect('tiket', 'refresh');
            }
        }
    }

    function save_close_tiket ()
    {
        $this->form_validation->set_rules('status_tiket', 'Status Tiket', 'trim|required');

        $this->form_validation->set_message('required',  '{field} Harus di isi');
        $this->form_validation->set_error_delimiters('<div> class = "alert alert-danger"', '</div>');

        if ($this->form_validation->run() == FALSE)
        {
            $this->index();
        } else {
            $data = array(
                'status_tiket' => $this->input->post('status_tiket'),
            );
            $this->M_tiket->update($this->input->post('id_tiket'), $data);
            $this->session->set_flashdata('message', '<div class="alert alert-info">Tiket Berhasil di Close / Tutup</div>');
            redirect('tiket', 'refresh');
        }
    }

    function detail_tiket($no_tiket)
    {
        $data['tiket'] = $this->M_tiket->get_no_tiket($no_tiket);
        if ($data['tiket'])
        {
            $data['title'] = 'Detail Tiket' . $data['tiket']->no_tiket;
            $this->template->load('back/template', 'back/tiket/detail_tiket', $data);
        } else {
            $this->session->set_flashdata('message', '<div class = "alert alert-danger"> Data tiket tidak ada ...! </div>');
            redirect('tiket', 'refresh');
        }
    }

    function delete_tiket($id)
    {
        $delete = $this->M_tiket->get_id_tiket($id);
        if($delete)
        {
            $this->M_tiket->delete($id);
            $this->session->set_flashdata('message', '<div class="alert alert-info">Data Berhasil di hapus</div>');
            redirect('tiket', 'refresh');
        } else {
            $this->session->set_flashdata('message', '<div class="alert alert-danger">Data tidak ditemukan</div>');
            redirect('tiket', 'refresh');
        }
    }
    
    private function sendemail()
        {
            $this->load->library("email");
            $to = "msk.rifqirohmatullah@gmail.com,irwan@kemakmuran.com";
            $config = Array(
                'protocol'  => 'smtp',
                'smtp_host' => 'mail.kemakmuran.com',
                'smtp_port' => '587',
                'smtp_user' => 'noreply@kemakmuran.com',
                'smtp_pass' => 'Honda@12345',
                'mailtype'  => 'html',
                'charset'   => 'utf-8',
                'newline'   => '\r\n'
            );
            $this->email->initialize($config);
            $this->email->from('noreply@kemakmuran.com', '-=No Reply=-');
            $this->email->to($to);
            // $this->email->to('msk.rifqirohmatullah@gmail.com');
            // $this->email->attach('https://images.pexels.com/photos/169573/pexels-photo-169573.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940');
            $this->email->subject("Income Tiket");
            $this->email->message("Ada tiket masuk, gas lur");
            $this->email->send();
        }
    
}