<!DOCTYPE html>
<html lang="en">
<head>
  <?php $this->load->view("includes/header");?>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">

  <!-- Navbar -->
      <?php $this->load->view("includes/navbar"); ?>
  <!-- /.navbar -->
  
  <!-- Sidebar Container -->
  <?php $this->load->view("includes/sidebar");?>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
      <!-- Content Header (Page header) -->
      <div class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1 class="m-0">Markalar Tablosu</h1>
            </div><!-- /.col -->
            <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="#">Ana Sayfa</a></li>
                <li class="breadcrumb-item active">Markalar Tablosu</li>
              </ol>
            </div><!-- /.col -->
          </div><!-- /.row -->
        </div><!-- /.container-fluid -->
      </div>
      <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            
            <div class="card">
              <!-- /.card-header -->
              <div class="card-body">
                <table id="example1" class="table table-bordered table-striped">
                  <thead>
                  <tr>
                    <th>ID</th>
                    <th>Resim URL</th>
                    <th>Başlık</th>
                    <th>Rank</th>
                    <th>Oluşturulma Tarihi</th>
                    <th>Durum</th>
                    <th>İşlemler</th>
                  </tr>
                  </thead>

                  <tbody>
                    <?php foreach ($items as $items) { ?>
                      <tr>
                        <td><?php echo $items->id; ?> </td>
                        <td><?php echo $items->img_url; ?></td>
                        <td><?php echo $items->title; ?></td>
                        <td><?php echo $items->rank; ?></td>
                        <td><?php echo $items->created_at; ?></td>
                        <td><?php echo $items->is_active == 0 ? "Pasif" : "Aktif"; ?></td>
                        <td>Sil - Düzenle </td>
                      </tr>

                    <?php } ?>
                  
                  </tbody>
                  
                </table>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div>
      <!-- /.container-fluid -->
    </section>
    <!-- Main content -->

    </div>

<!-- Footer -->
<?php $this->load->view("includes/footer") ?>