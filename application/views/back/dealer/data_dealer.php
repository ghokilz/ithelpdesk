<?php if (is_it()) { ?>
<div class="card">
    <div class="card-header">
        <h3 class="card-title">List Dealer</h3>
    </div>
    <!-- /.card-header -->
    <div class="card-body">
        <?= $this->session->flashdata('hapus'); ?>
        <table id="datatable1" class="table table-bordered">
            <thead>
                <tr>
                <th style="width: 10px">NO</th>
                <th>Nama Dealer</th>
                <th>Alamat Dealer</th>
                <th>Dealer Code</th>
                <th>Jenis Dealer</th>
                <th style="width: 200px">Action</th>
                </tr>
            </thead>
        <tbody>
            <?php 
            $no = 1;
            foreach ($dealer as $row) { ?>
                <tr>
                    <td><?= $no++ ?></td>
                    <td><?= $row->dealer ?></td>
                    <td><?= $row->alamat ?></td>
                    <td><?= $row->dealer_code ?></td>
                    <!-- <td><?= $row->jenis ?></td> -->
                    <td>
                        <?php if ($row->jenis == 'wing')
                            {
                                echo '<span class="badge badge-warning"> WING </span>';
                            } else if ($row->jenis == 'regular'){
                                echo '<span class="badge badge-info"> -== REGULAR ==- </span>';
                            } else if ($row->jenis == 'main_dealer'){
                                echo '<span class="badge badge-success"> -== MAIN DEALER ==- </span>';
                            }else if ($row->jenis == 'ahass') {
                                echo '<span class="badge badge-danger"> -== AHASS ==- </span>';
                            }else {
                                echo '<span class="badge badge-danger"> -== Belum di Daftarkan ==- </span>';
                            }
                        ?>
                    </td>
                    <td>
                        <a class="btn btn-info btn-sm" href="<?= base_url('dealer/edit_dealer/'. $row->id_dealer) ?>">
                            <i class="fas fa-pencil-alt"></i>
                                Edit
                        </a>
                        <a onclick="return confirm('Yakin ingin dihapus?');" href="<?= base_url('dealer/delete_dealer/'. $row->id_dealer) ?>" class="btn btn-danger btn-sm" >
                            <i class="fas fa-trash"></i>
                                Hapus
                        </a>
                    </td>
                </tr>
            <?php } ?>
        </tbody>
        </table>
    </div>
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