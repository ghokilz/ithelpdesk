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
              <h3 class="card-title">Edit Jabatan</h3>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
            <?= $this->session->flashdata('message'); ?>
            <?= validation_errors() ?>
              <form action="<?= base_url('jabatan/update_jabatan') ?>" method="POST">
                <div class="form-group">
                  <label> Edit Jabatan</label>
                  <input type="hidden" name="id_jabatan" value="<?= $jbt->id_jabatan ?>" class="form-control">
                  <input type="text" name="jabatan" value="<?= $jbt->jabatan ?>" class="form-control">
                </div>
                <button type="submit" class="btn btn-primary btn-sm"> Simpan </button>
              </form>
            </div>
          </div><!-- /.card -->
        </div>

          <div class="col-md-6">
            <?php $this->load->view('back/jabatan/data_jabatan') ?>
          </div>
        
      </div>
    </div><!-- /.container-fluid -->
  </section><!-- /.content -->
</div>