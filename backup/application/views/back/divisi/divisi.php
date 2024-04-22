<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <p>
  <!-- Main content -->
  <section class="content">
    <div class="container-fluid">
      <div class="row">
        <div class="col-md-6">
          <div class="card">
            <div class="card-header">
              <h3 class="card-title">Form Departemen</h3>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
              <?= $this->session->flashdata('message'); ?>
              <?= validation_errors() ?>
              <form action="<?= base_url('divisi/save_divisi') ?>" method="POST">
                <div class="form-group">
                  <label> Tambah Departemen</label>
                  <input type="text" name="divisi" class="form-control">
                </div>
                <button type="submit" class="btn btn-primary btn-sm"> Tambah </button>
                <button type="reset" class="btn btn-danger btn-sm"> Reset </button>
              </form>
            </div><!-- /.card body -->
          </div><!-- /.card -->
        </div>
        <div class="col-md-6">
          <?php $this->load->view('back/divisi/data_divisi') ?>
        </div>
      </div>
    </div><!-- /.container-fluid -->
  </section><!-- /.content -->
</div>