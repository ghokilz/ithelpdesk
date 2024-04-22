<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <div class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1 class="m-0">Beranda</h1>
        </div><!-- /.col -->
      </div><!-- /.row -->
      <div class="alert alert-success">Selamat Datang, Salam <B>One Heart</B> <?= $this->session->username; ?></div>
      </div><!-- /.container-fluid -->
    </div>
    
    <!-- ================================================== -->
    <!-- =======================Main======================= -->
    <!-- ================================================== -->
    <!-- /.content-header -->
    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <!-- Small boxes (Stat box) -->
        <div class="row">
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-warning">
              <div class="inner">
                <h3><?= $tiket_wait ?></h3>
                <p>Menunggu Respon</p>
              </div>
              <div class="icon">
                <i class="ion-android-alarm-clock"></i>
              </div>
              <a href="<?= base_url('tiket')?>" class="small-box-footer"> Selengkapnya <i class="fas fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-success">
              <div class="inner">
                <h3><?= $tiket_proses ?><sup style="font-size: 20px"></sup></h3>
                <p>Proses Pengerjaan</p>
              </div>
            <div class="icon">
              <i class="ion-clipboard"></i>
            </div>
              <a href="<?= base_url('tiket')?>" class="small-box-footer"> Selengkapnya <i class="fas fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-info">
              <div class="inner">
                <h3><?= $tiket_close ?></h3>
                <p>Tiket Sukses</p>
              </div>
              <div class="icon">
                <i class="ion-email"></i>
              </div>
              <a href="<?= base_url('tiket')?>" class="small-box-footer"> Selengkapnya <i class="fas fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-danger">
              <div class="inner">
                <h3><?= $user ?></h3>
                <p>Karyawan</p>
              </div>
              <div class="icon">
                <i class="ion-ios-people"></i>
              </div>
              <a href="<?= base_url('karyawan')?>" class="small-box-footer"> Selengkapnya <i class="fas fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
        </div>
        <!-- /.row -->
        <!-- Main row -->

      </section><!-- /.content -->
  </div>