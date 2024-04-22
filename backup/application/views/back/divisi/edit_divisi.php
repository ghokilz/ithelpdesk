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
              <h3 class="card-title">Edit Departemen</h3>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
            <?= $this->session->flashdata('message'); ?>
            <?= validation_errors() ?>
              <form action="<?= base_url('divisi/update_divisi') ?>" method="POST">
                <div class="form-group">
                  <label> Edit Departemen</label>
                  <input type="hidden" name="id_divisi" value="<?= $jbt->id_divisi ?>" class="form-control">
                  <input type="text" name="divisi" value="<?= $jbt->divisi ?>" class="form-control">
                </div>
                <button type="submit" class="btn btn-primary btn-sm"> Simpan </button>
              </form>
            </div>
          </div><!-- /.card -->
        </div>

          <div class="col-md-6">
            <?php $this->load->view('back/divisi/data_divisi') ?>
          </div>
        
      </div>
    </div><!-- /.container-fluid -->
  </section><!-- /.content -->
</div>