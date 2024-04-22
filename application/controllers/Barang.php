<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class Barang extends CI_Controller
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
        $data['pinjam_barang'] = $this->M_barang->get_pinjam_barang();
        $data['kembali_barang'] = $this->M_barang->get_kembali_barang();
        $data['tambah_barang'] = $this->M_barang->get_barang();
        $data['no_barang'] = $this->M_barang->no_barang();
        $data['barang_user'] = $this->M_barang->barang_user();
        $this->template->load('back/template', 'back/barang/barang', $data);
    }

    function save_barang()
    {
        $this->form_validation->set_rules('judul_barang', 'Judul Barang', 'trim|required');
        $this->form_validation->set_rules('deskripsi', 'Deskripsi Barang', 'trim|required');

        $this->form_validation->set_message('required',  '{field} Harus di isi');
        $this->form_validation->set_error_delimiters('<div> class = "alert alert-danger"', '</div>');

        if ($this->form_validation->run() == TRUE)
        {
            $this->index();
        } else {
                $data = array (
                    'no_barang'         => $this->input->post('no_barang'),
                    'kode_barang'       => $this->input->post('kode_barang'),
                    'nama_barang'       => $this->input->post('nama_barang'),
                    'merk'              => $this->input->post('merk'),
                    'no_seri'           => $this->input->post('no_seri'),
                    'kondisi_barang'    => $this->input->post('kondisi_barang'),
                    // 'unit'              => $this->input->post('unit'),
                    'tgl_daftar'        => date('Y-m-d'),
                    'storage'           => $this->input->post('storage'),
                    'user_id'           => $this->session->userdata('id_user'),
                    'status_barang'     => 0,
                );
                // var_dump($data);

                $this->M_barang->insert($data);
                $this->session->set_flashdata('message', '<div class="alert alert-info">Data Berhasil di simpan</div>');
                redirect('barang', 'refresh');
            // }
        }
    }

    function update_barang()
    {
        $data = [
                        'id_barang'         => $this->input->post('id_barang'),
                        'no_barang'         => $this->input->post('no_barang'),
                        'kode_barang'       => $this->input->post('kode_barang'),
                        'nama_barang'       => $this->input->post('nama_barang'),
                        'merk'              => $this->input->post('merk'),
                        'no_seri'           => $this->input->post('no_seri'),
                        'kondisi_barang'    => $this->input->post('kondisi_barang'),
                        'unit'              => $this->input->post('unit'),
                        'storage'           => $this->input->post('storage'),
                        'tgl_daftar'        => date('Y-m-d H:i:s'),
                        'storage'           => $this->input->post('storage'),
                        'user_id'           => $this->session->userdata('id_user'),
        ];
        // var_dump($data);

        $this->M_barang->update($this->input->post('id_barang'), $data);
        $this->session->set_flashdata('message', '<div class="alert alert-success">Data berhasil disimpan</div>');
            redirect('barang', 'refresh');
    }

    function pinjam_barang($no_barang)
    {
        $data['barang'] = $this->M_barang->get_no_barang($no_barang);
        if ($data['barang'])
        {
            $data["pinjam_barang"]  = $this->M_barang->get_pinjam_barang();
            $data['title']          = 'Pinjam Barang' . $data['barang']->no_barang;
            $this->template->load('back/template', 'back/barang/pinjam_barang', $data);
        } else {
            $this->session->set_flashdata('message', '<div class = "alert alert-danger"> Data barang tidak ada ...! </div>');
            redirect('barang', 'refresh');
        }
    }

    function add_pinjam_barang()
    {
        $data = [
                        'id_barang'         => $this->input->post('id_barang'),
                        'no_barang'         => $this->input->post('no_barang'),
                        'tgl_pinjam'        => date('Y-m-d H:i:s'),
                        'nama_peminjam'     => $this->input->post('nama_peminjam'),
                        'user_id'           => $this->session->userdata('id_user'),
                        'tujuan_pinjaman'   => $this->input->post('tujuan_pinjaman'),
                        'status_barang'     => 1,
        ];
        // var_dump($data);

        $this->M_barang->update($this->input->post('id_barang'), $data);
        $this->session->set_flashdata('message', '<div class="alert alert-success">Data berhasil disimpan, untuk dipinjam...</div>');
        redirect('barang', 'refresh');
    }

    function kembali_barang($no_barang)
    {
        $data['barang'] = $this->M_barang->get_no_barang($no_barang);
        if ($data['barang'])
        {
            $data["pinjam_barang"]  = $this->M_barang->get_pinjam_barang();
            $data['title']          = 'Pinjam Barang' . $data['barang']->no_barang;
            $this->template->load('back/template', 'back/barang/kembali_barang', $data);
        } else {
            $this->session->set_flashdata('message', '<div class = "alert alert-danger"> Data barang tidak ada ...! </div>');
            redirect('barang', 'refresh');
        }
    }
    
    function pengembalian_barang()
    {
        $data = [
                        // 'id_barang'         => $this->input->post('id_barang'),
                        // 'no_barang'         => $this->input->post('no_barang'),
                        'tgl_kembali'        => date('Y-m-d H:i:s'),
                        'user_id'           => $this->session->userdata('id_user'),
                        'status_barang'     => 0,
        ];
        // var_dump($data);

        $this->M_barang->update($this->input->post('id_barang'), $data);
        $this->session->set_flashdata('message', '<div class="alert alert-success">Data berhasil disimpan dan di kembalikan...</div>');
        redirect('barang', 'refresh');
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
            $this->session->set_flashdata('message', '<div class="alert alert-info">Data Berhasil di Update </div>');
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

     function tambah_barang()
    {
        $this->template->load('back/template', 'back/barang/tambah_barang');
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