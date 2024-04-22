<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <p><!-- Main content -->
  <section class="content">
    <div class="container-fluid">
      <div class="row">
        <div class="col-md-6">
          <div class="card">
            <div class="card-header">
              <h3 class="card-title">Form Laporan</h3>
            </div>
            <div class="card-body">
              <form action="<?= base_url('laporan/print_laporan') ?>" method="POST" target="_blank">
                <div class="form-group">
                  <label> Tanggal Awal</label>
                  <input type="date" name="tgl_awal" id="tgl_awal" value="<?= date('Y-m-d') ?>" class="form-control">
                </div>
                <div class="form-group">
                  <label> Tanggal Akhir</label>
                  <input type="date" name="tgl_akhir" id="tgl_akhir" value="<?= date('Y-m-d') ?>" class="form-control">
                </div>
                <button type="submit" class="btn btn-primary btn-sm"><i class="fas fa-print"></i> PRINT </button>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</div>