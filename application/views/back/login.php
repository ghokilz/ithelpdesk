<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="<?php echo base_url(); ?>assets/back/dist/img/logodashboard.png" rel="shortcut icon" type="image/gif">
  <title>MSK Helpdesk | Login</title>
  
  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="<?= base_url()?>assets/back/plugins/fontawesome-free/css/all.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="<?= base_url()?>assets/back/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="<?= base_url()?>assets/back/dist/css/adminlte.min.css">
</head>
<body class="hold-transition login-page" >

<div class="login-box">
  <!-- /.login-logo -->
  <div class="card card-outline card-primary">
    <div class="card-header text-center">
      <div class="image">
        <img src="<?= base_url()?>assets/back/dist/img/logobanner.png" width="170" height="50" alt="Logo Banner Login">
      </div>
      <a href="<?= base_url()?>login" class="h1"><b>MSK </b>Help Desk</a>
    </div>
    <div class="card-body">
      <p class="login-box-msg">Masuk terlebih dahulu....</p>

        <?= $this->session->flashdata('message') ?>
      <form class="user" action="<?= base_url('auth/proses_login'); ?>" method="post">
      
        <div class="input-group mb-3">
          <input type="username" name="username" class="form-control" placeholder="username">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-envelope"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="password" name="password" class="form-control" placeholder="Password">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-8">
          <p class="mb-1">
            <a href="https://wa.me/6287865469724">Klik disini untuk hub ADMIN</a>
          </p>
          </div>
          <!-- /.col -->
          <div class="col-4">
            <button type="submit" class="btn btn-primary btn-block">Masuk</button>
          </div>
          <!-- /.col -->
        </div>
      </form>
    </div>
    <!-- /.card-body -->
  </div>
  <!-- /.card -->
</div>
<!-- /.login-box -->

<!-- jQuery -->
<script src="<?= base_url()?>assets/back/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="<?= base_url()?>assets/back/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="<?= base_url()?>assets/back/dist/js/adminlte.min.js"></script>
</body>
</html>
