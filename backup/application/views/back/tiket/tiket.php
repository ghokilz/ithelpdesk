<?php if (is_it()) { ?>
<div class="content-wrapper">
    <p>
    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">Data Tiket</h3>
                            <a href="<?= base_url('tiket/add_tiket') ?>" class="btn btn-primary btn-sm float-right" data-toggle="modal" data-target="#form_tiket"> Tambah Tiket </a>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                            <?= $this->session->flashdata('message'); ?>
                            <table class="table table-bordered" >
                                <thead>
                                    <tr>
                                        <th style="width: 10px">NO</th>
                                        <th>No Tiket</th>
                                        <th>Status Tiket</th>
                                        <th>Judul tiket</th>
                                        <th>Konfirmasi</th>
                                        <th style="width: 300px">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php 
                                    $no = 1;
                                    foreach ($tiket as $row) { ?>
                                        <tr>
                                            <td><?= $no++ ?></td>
                                            <td><?= $row->no_tiket ?></td>
                                            <td>
                                                <?php if ($row->status_tiket == '0')
                                                    {
                                                        echo '<span class="badge badge-warning"> Menunggu Respond </span>';
                                                    } else if ($row->status_tiket == '1'){
                                                        echo '<span class="badge badge-info"> -== Sedang di Respond ==- </span>';
                                                    } else if ($row->status_tiket == '2'){
                                                        echo '<span class="badge badge-success"> -== Proses by Admin ==- </span>';
                                                    }else {
                                                        echo '<span class="badge badge-danger"> -== Solved ==- </span>';
                                                    }
                                                ?>
                                            </td>
                                            <td><?= $row->judul_tiket ?></td>
                                            <td>
                                                <?php
                                                if ($row->status_tiket == '0')
                                                {
                                                    echo '<a href="javascript:void(0);" data-toggle="modal" data-target="#modal-tiket" id="select_tiket"
                                                            data-id_tiket="'. $row->id_tiket . '"
                                                            data-status_tiket="'. $row->status_tiket . '"
                                                            class="btn btn-success">
                                                        
                                                            Confirm
                                                            
                                                         </a>';
                                                } else if ($row->status_tiket == '1') {
                                                    echo '<a href="javascript:void(0);" data-toggle="modal" data-target="#modal-reply" id="reply-message"
                                                            data-tiket_id="' . $row->id_tiket . '"
                                                            data-id_tiket_id="' . $row->id_tiket . '"
                                                            data-judul_tiket="' . $row->judul_tiket . '"
                                                            data-deskripsi="' . $row->deskripsi . '"
                                                            class="btn btn-warning">
                                                        
                                                            Balas Pesan
                                                            
                                                         </a>';
                                                } else if ($row->status_tiket == '2') {
                                                    echo '<a href="javascript:void(0);" data-toggle="modal" data-target="#modalclosetiket" id="ctiket"
                                                            data-closetiket="' . $row->id_tiket . '"
                                                            data-closestatus="' . $row->status_tiket . '"
                                                            class="btn btn-primary">
                                                        
                                                            Close
                                                            
                                                         </a>';
                                                }
                                                ?>
                                            </td>
                                            <td>
                                                <a class="btn btn-primary btn-sm" href="<?= base_url('tiket/detail_tiket/'. $row->no_tiket) ?>">
                                                    <i class="fas fa-eye"></i>
                                                        Lihat
                                                </a>
                                                <a class="btn btn-danger btn-sm" onclick="return confirm('Yakin ingin dihapus?');" href="<?= base_url('tiket/delete_tiket/'. $row->id_tiket) ?>" >
                                                    <i class="fas fa-trash"></i>
                                                        Hapus
                                                </a>
                                            </td>
                                        </tr>
                                    <?php } ?>
                                </tbody>    
                            </table>
                        </div>
                    </div><!-- /.card -->
                </div>
            </div>
        </div>
        
        <!-- ================================== form tambah tiket ======================================= -->
        <div class="modal fade" id="form_tiket">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Form Tambah Tiket</h5>
                        <button class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="<?= base_url('tiket/save_tiket') ?>" method="POST" enctype="multipart/form-data">
                            <div class="form-group">
                                <label> Keluhan</label>
                                <input type="hidden" name="no_tiket" value="<?= $no_tiket ?>" class="form-control">
                                <input type="text" name="judul_tiket" class="form-control">
                            </div>
                            <div class="form-group">
                                <label> Keterangan</label>
                                <textarea name="deskripsi" class="form-control"></textarea>
                                <br>
                            <div class="form-group">
                                <label> Gambar</label>
                                <input type="file" name="gambar_tiket">
                            </div>
                            <button type="submit" class="btn btn-primary btn-sm"> Save </button>
                            <button type="reset" class="btn btn-danger btn-sm"> Reset </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        
        
    </section>
</div>

<!-- ================================== modal tiket (Confirm to balas pesan)======================================= -->

<div class="modal fade" id="modal-tiket">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Yakin confirm tiket ini? </h5>
                <button class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="<?= base_url('tiket/save_tiket_waiting') ?>" method="POST" enctype="multipart/form-data">
                    <div class="form-group">
                        <input type="hidden" name="id_tiket"      id="id_tiket" class="form-control">
                        <input type="hidden" name="status_tiket"  id="status_tiket" value="1" class="form-control">
                    </div>
                        <button type="submit" class="btn btn-primary btn-sm"> Save </button>
                        <button type="reset" class="btn btn-danger btn-sm"> Reset </button>
                </form>
            </div>
        </div>
    </div>
</div>


<!-- ================================== modal reply / form tanggapan tiket ( balas pesan - )======================================= -->

<div class="modal fade" id="modal-reply">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Form Tanggapan Team IT </h5>
                <button class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button> 
            </div>
            <div class="modal-body">
                <form action="<?= base_url('tiket/save_tanggapan') ?>" method="POST" enctype="multipart/form-data">
                    <input type="hidden"    name="id_tiket" id="id_tiket_id"  class="form-control">
                    <input type="hidden"    name="tiket_id" id="tiket_id"     class="form-control">  
                    <!-- Tidak tampil tiket_id  -->


                    <div class="form-group">
                        <label for="keluhan">Keluhan / Judul Tiket</label>
                        <input type="text" id="judul_tiket" class="form-control" readonly>
                    </div>
                    <div class="form-group">
                        <label for="deskripsi">Deskripsi</label>
                        <textarea id="deskripsi" class="form-control" readonly></textarea>
                    </div>
                    <div class="form-group">
                        <label for="tanggapan">Tanggapan</label>
                        <textarea name="tanggapan" class="form-control"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="tanggapan">Gambar Tanggapan</label>
                        <input type="file" name="gambar_tanggapan" class="form-control">
                    </div>

                    <button type="submit" class="btn btn-primary btn-sm"> Balas Pesan</button>
                    <button type="reset" class="btn btn-danger btn-sm"> Reset </button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- ================================== modal close tiket ======================================= -->

<div class="modal fade" id="modalclosetiket">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Yakin mau close tiket ini? </h5>
                <button class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="<?= base_url('tiket/save_close_tiket') ?>" method="POST" enctype="multipart/form-data">
                    <div class="form-group">
                        <input type="hidden" name="id_tiket" id="closetiket" class="form-control">
                        <input type="hidden" name="status_tiket" value="3" class="form-control">
                    </div>
                        <button type="submit" class="btn btn-primary btn-sm"> Close Tiket </button>
                        <!-- <button type="reset" class="btn btn-danger btn-sm"> Reset </button> -->
                </form>
            </div>
        </div>
    </div>
</div>



<script>
    $(document).ready(function()
    {
        $(document).on('click', '#select_tiket', function()
        {
            var id_tiket        = $(this).data('id_tiket')
            var status_tiket    = $(this).data('status_tiket')

            $('#id_tiket').val(id_tiket)
            $('status_tiket').val(status_tiket)
        })

        // ==========================JS untuk Reply Massage Tiket====================================
         $(document).on('click', '#reply-message', function()
        {
            var id_tiket        = $(this).data('id_tiket')
            var id_tiket_id     = $(this).data('id_tiket_id')
            var judul_tiket     = $(this).data('judul_tiket')
            var deskripsi       = $(this).data('deskripsi')

            $('#id_tiket')      .val(id_tiket)
            $('#id_tiket_id')   .val(id_tiket_id)
            $('#judul_tiket')   .val(judul_tiket)
            $('#deskripsi')     .val(deskripsi)
        })

        // ==========================JS untuk close Tiket====================================
         $(document).on('click', '#ctiket', function()
        {
            var closetiket      = $(this).data('closetiket')
            var closestatus      = $(this).data('closestatus')

            $('#closetiket').val(closetiket)
            $('#closestatus').val(closestatus)
        })
    })
</script>

<?php } else {?>

<div class="content-wrapper">
    <p>
    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">Data Tiket</h3>
                            <a href="<?= base_url('tiket/add_tiket') ?>" class="btn btn-primary btn-sm float-right" data-toggle="modal" data-target="#form_tiket"> Tambah Tiket </a>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                            <?= $this->session->flashdata('message'); ?>
                            <table class="table table-bordered" >
                                <thead>
                                    <tr>
                                        <th style="width: 10px">NO</th>
                                        <th>No Tiket</th>
                                        <th>Status Tiket</th>
                                        <th>Judul tiket</th>
                                        <th style="width: 300px">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php 
                                    $no = 1;
                                    foreach ($tiket_user as $row) { ?>
                                        <tr>
                                            <td><?= $no++ ?></td>
                                            <td><?= $row->no_tiket ?></td>
                                            <td>
                                                <?php if ($row->status_tiket == '0')
                                                    {
                                                        echo '<span class="badge badge-warning"> Menunggu Respond </span>';
                                                    } else if ($row->status_tiket == '1'){
                                                        echo '<span class="badge badge-info"> -== Sedang di Respond ==- </span>';
                                                    } else if ($row->status_tiket == '2'){
                                                        echo '<span class="badge badge-success"> -== Proses by Admin ==- </span>';
                                                    }else {
                                                        echo '<span class="badge badge-danger"> -== Solved ==- </span>';
                                                    }
                                                ?>
                                            </td>
                                            <td><?= $row->judul_tiket ?></td>
                                          
                                            <td>
                                                <a class="btn btn-primary btn-sm" href="<?= base_url('tiket/detail_tiket/'. $row->no_tiket) ?>">
                                                    <i class="fas fa-eye"></i>
                                                        Lihat
                                                </a>
                                            </td>
                                        </tr>
                                    <?php } ?>
                                </tbody>    
                            </table>
                        </div>
                    </div><!-- /.card -->
                </div>
            </div>
        </div>
        
        <!-- ================================== form tambah tiket ======================================= -->
        <div class="modal fade" id="form_tiket">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Form Tambah Tiket</h5>
                        <button class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="<?= base_url('tiket/save_tiket') ?>" method="POST" enctype="multipart/form-data">
                        <form action="<?= base_url('email') ?>" method="POST">
                            <div class="form-group">
                                <label> Keluhan</label>
                                <input type="hidden" name="no_tiket" value="<?= $no_tiket ?>" class="form-control">
                                <input type="text" name="judul_tiket" class="form-control">
                            </div>
                            <div class="form-group">
                                <label> Keterangan</label>
                                <textarea name="deskripsi" class="form-control"></textarea>
                                <br>
                            <div class="form-group">
                                <label> Gambar</label>
                                <input type="file" name="gambar_tiket">
                            </div>
                            <button type="submit" class="btn btn-primary btn-sm"> Save </button>
                            <button type="reset" class="btn btn-danger btn-sm"> Reset </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        
        
    </section>
</div>

<?php } ?>