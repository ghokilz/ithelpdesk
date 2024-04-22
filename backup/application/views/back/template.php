<?php
  $this->load->view('template/meta'); ?>
  <div class="wrapper">
    <?php $this->load->view('template/sidebar'); ?>
    <?php $this->load->view('template/header'); ?>
    <script src="<?= base_url() ?>assets/back/plugins/jquery/jquery.min.js"></script>

    
    <?php echo $contents; ?>
    <?php $this->load->view('template/footer'); ?>
  </div>
<?php $this->load->view('template/script'); ?>