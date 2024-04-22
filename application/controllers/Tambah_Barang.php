<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class Tambah_Barang extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        cek_login();
    }
    function index()
    {
        $this->load->model('M_barang');
        $data['barang'] = $this->M_barang->get_barang();
        $data['tambah_barang'] = $this->M_barang->get_barang();
        $data['no_barang'] = $this->M_barang->no_barang();
        $data['barang_user'] = $this->M_barang->barang_user();
        $this->template->load('back/template', 'back/barang/tambah_barang', $data);
    }

    function save_barang()
    {
        $this->form_validation->set_rules('judul_barang', 'Judul Barang', 'trim|required');
        $this->form_validation->set_rules('deskripsi', 'Deskripsi Barang', 'trim|required');

        $this->form_validation->set_message('required',  '{field} Harus di isi');
        $this->form_validation->set_error_delimiters('<div> class = "alert alert-danger"', '</div>');

        if ($this->form_validation->run() == FALSE)
        {
            $this->index();
        } else {
            if ($_FILES['gambar_barang']['error'] <> 4)
            {
                $config['upload_path']      = 'assets/images/barang/';
                $config['allowed_types']    = 'gif|jpg|png|jpeg';
                $config['max_size']         = '2048';
                $nama_file                  = $this->input->post('no_barang') . date('YmdHis');
                $config['file_name']        = $nama_file;

                $this->load->library('upload', $config);

                if ( ! $this->upload->do_upload('gambar_barang'))
                {
                    $error = array('error' => $this->upload->display_errors());
                    $this->session->set_flashdata('message', '<div class="alert alert-danger">' . $error['error'] . '</div>');
                    $this->index();
                } else {
                    $gambar_barang = $this->upload->data();

                    $data = array (
                        'no_barang'      => $this->input->post('no_barang'),
                        'judul_barang'   => $this->input->post('judul_barang'),
                        'deskripsi'     => $this->input->post('deskripsi'),
                        'status_barang'  => 0,
                        'user_id'       => $this->session->userdata('id_user'),
                        'gambar_barang'  => $this->upload->data('file_name'),
                        'tgl_daftar'    => date('Y-m-d')
                    );
                    // var_dump($data);

                    $this->M_barang->insert($data);
                    $this->session->set_flashdata('message', '<div class="alert alert-info">Data Berhasil di simpan</div>');
                    $this->sendemail($_POST);
                    redirect('barang', 'refresh');
                }
            } else {
                $data = array (
                    'no_barang'      => $this->input->post('no_barang'),
                    'judul_barang'   => $this->input->post('judul_barang'),
                    'deskripsi'     => $this->input->post('deskripsi'),
                    'status_barang'  => 0,
                    'user_id'       => $this->session->userdata('id_user'),
                    // 'gambar_barang'  => $this->upload->data('file_name'),
                    'tgl_daftar'    => date('Y-m-d'),
                );
                $this->M_barang->insert($data);
                $this->session->set_flashdata('message', '<div class="alert alert-info">Data Berhasil di simpan</div>');
                $this->sendemail($_POST);
                redirect('barang', 'refresh');
            }
        }
    }

    function save_barang_waiting ()
    {
        $this->form_validation->set_rules('status_barang', 'Status Barang', 'trim|required');

        $this->form_validation->set_message('required',  '{field} Harus di isi');
        $this->form_validation->set_error_delimiters('<div> class = "alert alert-danger"', '</div>');

        if ($this->form_validation->run() == FALSE)
        {
            $this->index();
        } else {
            $data = array(
                'status_barang' => $this->input->post('status_barang'),
            );
            $this->M_barang->update($this->input->post('id_barang'), $data);
            $this->session->set_flashdata('message', '<div class="alert alert-info">Data Berhasil di Update</div>');
            redirect('barang', 'refresh');
        }
    }

    function save_tanggapan()
    {
        $this->form_validation->set_rules('tanggapan', 'Tanggapan Barang', 'trim|required');
        $this->form_validation->set_message('required',  '{field} Harus di isi');
        $this->form_validation->set_error_delimiters('<div> class = "alert alert-danger"', '</div>');

        if ($this->form_validation->run() == FALSE)
        {
            $this->index();
        } else {
            if ($_FILES['gambar_tanggapan']['error'] <> 4)
            {
                $config['upload_path']      = 'assets/images/barang/tanggapan/';
                $config['allowed_types']    = 'gif|jpg|png|jpeg';
                $config['max_size']         = '2048';
                $nama_file                  = $this->input->post('barang_id') . date('YmdHis');
                $config['file_name']        = $nama_file;

                $this->load->library('upload', $config);

                if ( ! $this->upload->do_upload('gambar_tanggapan'))
                {
                    $error = array('error' => $this->upload->display_errors());
                    $this->session->set_flashdata('message', '<div class="alert alert-danger">' . $error['error'] . '</div>');
                    $this->index();
                } else {
                    if ($this->input->post('id_barang'))
                    {
                        $data = array(
                        'status_barang' => 2,
                        );
                        $this->M_barang->update($this->input->post('id_barang'), $data);
                    }
                    $gambar_tanggapan = $this->upload->data();
                    $data = array (
                        //ini yang di rubah ke "id_barang" dari awal "barang_id"
                        'barang_id' => $this->input->post('id_barang'), 
                        'tanggapan' => $this->input->post('tanggapan'),
                        'gambar_tanggapan' => $this->upload->data('file_name'),
                        'waktu_tanggapan' => date('Y-m-d'),
                    );
                    // var_dump($data);

                    $this->M_barang->insert_tanggapan($data);
                    $this->session->set_flashdata('message', '<div class="alert alert-info">Data Berhasil di simpan</div>');
                    redirect('barang', 'refresh');
                }
            } else {
                if ($this->input->post('id_barang'))
                    {
                        $data = array(
                        'status_barang' => 2,
                        );

                        $this->M_barang->update($this->input->post('id_barang'), $data);
                    }
                $data = array (
                    'barang_id'          => $this->input->post('id_barang'),
                    'tanggapan'         => $this->input->post('tanggapan'),
                    'waktu_tanggapan'    => date('Y-m-d'),
                );
                $this->M_barang->insert_tanggapan($data);
                $this->session->set_flashdata('message', '<div class="alert alert-info">Data Berhasil di simpan</div>');
                redirect('barang', 'refresh');
            }
        }
    }

    function save_close_barang ()
    {
        $this->form_validation->set_rules('status_barang', 'Status Barang', 'trim|required');

        $this->form_validation->set_message('required',  '{field} Harus di isi');
        $this->form_validation->set_error_delimiters('<div> class = "alert alert-danger"', '</div>');

        if ($this->form_validation->run() == FALSE)
        {
            $this->index();
        } else {
            $data = array(
                'status_barang' => $this->input->post('status_barang'),
            );
            $this->M_barang->update($this->input->post('id_barang'), $data);
            $this->session->set_flashdata('message', '<div class="alert alert-info">Barang Berhasil di Close / Tutup</div>');
            redirect('barang', 'refresh');
        }
    }

    function detail_barang($no_barang)
    {
        $data['barang'] = $this->M_barang->get_no_barang($no_barang);
        if ($data['barang'])
        {
            $data['title'] = 'Detail Barang' . $data['barang']->no_barang;
            $this->template->load('back/template', 'back/barang/detail_barang', $data);
        } else {
            $this->session->set_flashdata('message', '<div class = "alert alert-danger"> Data barang tidak ada ...! </div>');
            redirect('barang', 'refresh');
        }
    }
    function delete_barang($id)
    {
        $delete = $this->M_barang->get_id_barang($id);
        if($delete)
        {
            $this->M_barang->delete($id);
            $this->session->set_flashdata('message', '<div class="alert alert-info">Data Berhasil di hapus</div>');
            redirect('barang', 'refresh');
        } else {
            $this->session->set_flashdata('message', '<div class="alert alert-danger">Data tidak ditemukan</div>');
            redirect('barang', 'refresh');
        }
    }
}