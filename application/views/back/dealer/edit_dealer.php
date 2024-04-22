<?php if (is_it()) { ?>
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
              <h3 class="card-title">Edit Dealer</h3>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
            <?= $this->session->flashdata('message'); ?>
            <?= validation_errors() ?>
              <form action="<?= base_url('dealer/update_dealer') ?>" method="POST">
                <div class="form-group">
                  <label> Edit Dealer</label>
                  <input type="hidden" name="id_dealer" value="<?= $dlr->id_dealer ?>" class="form-control">
                  <input type="text" name="dealer" value="<?= $dlr->dealer ?>" class="form-control">
                </div>
                <div class="form-group">
                  <label>Dealer Code</label>
                  <input type="text" name="dealer_code" value="<?= $dlr->dealer_code ?>" class="form-control">
                </div>
                <div class="form-group">
                  <label> Alamat Dealer</label>
                  <input type="text" name="alamat" value="<?= $dlr->alamat ?>" class="form-control">
                </div>
                <div class="form-group">
                    <label> Jenis Dealer</label>
                    <select name="jenis" class="form-control">
                        <option value="">-==== Pilih Jenis Dealer =====-</option>
                        <option value="wing"        <?= $dlr->jenis == 'wing' ? 'selected'        : 'wing'?>>Wing</option>
                        <option value="regular"     <?= $dlr->jenis == 'regular' ? 'selected'     : 'regular'?>>Regular</option>
                        <option value="ahass"       <?= $dlr->jenis == 'ahass' ? 'selected'       : 'ahass'?>>AHASS</option>
                        <option value="main_dealer" <?= $dlr->jenis == 'main_dealer' ? 'selected' : 'main_dealer'?>>Main Dealer</option>
                    </select>
                </div>

                <button type="submit" class="btn btn-primary btn-sm"> Simpan </button>
              </form>
            </div>
          </div><!-- /.card -->
        </div>

          <div class="col-md-6">
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