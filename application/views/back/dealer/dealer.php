<?php if (is_it()) { ?>
<div class="content-wrapper">
    <section class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <h1>DEALER</h1>
          </div>
        </div>
    </section>
<!-- Content Wrapper. Contains page content -->
  <p><!-- Main content -->
  <section class="content">
    <div class="container-fluid">
      <div class="row">
        <div class="col-md-4">
          <div class="card">
            <div class="card-header">
              <h3 class="card-title">Form Dealer</h3>
            </div><!-- /.card-header -->
            <div class="card-body">
              <?= $this->session->flashdata('message'); ?>
              <?= validation_errors() ?>
              <form action="<?= base_url('dealer/save_dealer') ?>" method="POST">
                <div class="form-group">
                  <label> Tambah Dealer</label>
                  <input type="text" name="dealer" class="form-control">
                </div>
                <div class="form-group">
                  <label> Dealer Code</label>
                  <input type="text" name="dealer_code" class="form-control">
                </div>
                <div class="form-group">
                  <label> Alamat Dealer</label>
                  <input type="text" name="alamat" class="form-control">
                </div>
                <div class="form-group">
                    <label> Jenis Dealer</label>
                    <div class="input-group mb-3">
                        <select name="jenis" class="form-control">
                            <option value="">-==== Pilih Jenis Dealer =====-</option>
                            <option value="wing">Wing</option>
                            <option value="regular">Regular</option>
                            <option value="ahass">AHASS</option>
                            <option value="main_dealer">Main Dealer</option>
                        </select>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary btn-sm"> Tambah </button>
                <button type="reset" class="btn btn-danger btn-sm"> Reset </button>
              </form>
            </div><!-- /.card body -->
          </div><!-- /.card -->
        </div>
        <div class="col-md-8">
          <?php $this->load->view('back/dealer/data_dealer') ?>
        </div>
      </div>
    </div><!-- /.container-fluid -->
  </section><!-- /.content -->
</div>

<?php }else {?>

<div class="content-wrapper">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Tidak bisa akses <a class="text-danger">selain ADMIN</a>...!!!</h1>
                </div>
            <div class="col-sm-6">

            </div>
        </div>
    </section>
</div>
<?php } ?>