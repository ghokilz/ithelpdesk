
<div class="wrapper">
  <div class="content-wrapper">
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <div class="callout callout-info">
              <h5></i> No Tiket : <?= $tiket->no_tiket; ?></h5>
            </div>
            <div class="invoice p-3 mb-3">
              <div class="row">
                <div class="col-12">
                  <h4>
                    <i class="fas fa-ticket-alt"></i> MS Kemakmuran Helpdesk
                    <small class="float-right">Date: <?= $tiket->tgl_daftar; ?></small>
                  </h4>
                </div>
                <!-- /.col -->
              </div>
              <!-- info row -->
              <div class="row invoice-info">
                <div class="col-sm-4 invoice-col">
                  From
                  <address>
                    <strong><?= $tiket->username; ?></strong><br>
                    Divisi  : <?= $tiket->divisi; ?>        <br>
                    Jabatan : <?= $tiket->jabatan; ?>      <br>
                    Email   : <?= $tiket->email; ?>      <br>
                  </address>
                </div>
                <!-- /.col -->
                <div class="col-sm-4 invoice-col">
                  <b>STATUS TIKET </b> :
                    <?php if ($tiket->status_tiket == '0')
                      {
                          echo '<span class="badge badge-warning"> Menunggu Confirm admin </span>';
                      } else if ($tiket->status_tiket == '1'){
                          echo '<span class="badge badge-info"> -== Sedang di Respond ==- </span>';
                      } else if ($tiket->status_tiket == '2'){
                          echo '<span class="badge badge-success"> -== Proses by Admin ==- </span>';
                      }else {
                          echo '<span class="badge badge-danger"> -== Solved ==- </span>';
                      }
                    ?>
                  <br>
                  <br>
                  <br>
                  <b>NO. TIKET : <?= $tiket->no_tiket ?></b>
                  <br>
                    <b>Selesai : </b> 
                  <?php
                  
                      if($tiket->status_tiket == '3')
                      {
                        echo $tiket->waktu_tanggapan;
                      } else {
                        echo "- -";
                      }
                  ?>
                      
                </div>
              </div>
              <div class="row">
                <div class="col-6">
                  <label for="">Keluhan User / Karyawan</label>
                  <input type="text" value="<?= $tiket->judul_tiket?>" class="form-control" disabled>
                  <label for="">Keterangan Lengkap</label>
                  <textarea rows="6" class="form-control" disabled><?= $tiket->deskripsi?></textarea>
                </div>
                <div class="col-6">
                  <label for="">Tanggapan Dept IT</label>
                  <textarea rows="10" class="form-control" disabled> <?= $tiket->tanggapan?> </textarea>
                </div>
              </div>

              <div class="row">
                <div class="col-6">
                  <p class="lead">Foto Komplain / Keluhan : </p>
                    <img src="<?= base_url('assets/images/tiket/'. $tiket->gambar_tiket); ?>"width="250px">
                </div>
                <div class="col-6">
                  <p class="lead">Foto Tanggapan</p>
                    <img src="<?= base_url('assets/images/tiket/tanggapan/'. $tiket->gambar_tanggapan); ?>"width="250px">
                </div> 
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
</div>