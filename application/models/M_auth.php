<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class M_auth extends CI_Model
{
    public $id = 'id_user';
    
    public function insert($data)
    {
        $this->db->insert('user', $data);
    }

    public function get_username($id)
    {
        $this->db->where('username', $id);
        return $this->db->get('user')->row();
    }
   public function calendar()
    {
        $this->load->library('calendar');
        echo $this->calendar->generate();
    }
}

/* End of file ModelName.php */
