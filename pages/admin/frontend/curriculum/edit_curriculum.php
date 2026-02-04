<?php
require_once '../../../system/connect.php';
session_start();

if (!isset($_SESSION['username'])) {
    header("Location: ../login.php");
    exit();
}

if (isset($_SESSION['role']) && intval($_SESSION['role']) !== 1) {
    header("Location: ../../index.php");
    exit();
}

// Kiểm tra ID
if (!isset($_GET['id']) || empty($_GET['id'])) {
    header("Location: curriculum.php");
    exit();
}

$id = intval($_GET['id']);

// Lấy dữ liệu cũ
$sql = "SELECT * FROM curriculum WHERE id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $id);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows === 0) {
    echo "Không tìm thấy dữ liệu!";
    exit();
}

$data = $result->fetch_assoc();

// Xử lý submit form
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $title   = $_POST['title'];
    $content = $_POST['content'];
    $image   = $data['image']; // mặc định giữ ảnh cũ

    // Nếu có upload ảnh mới
    if (!empty($_FILES['image']['name'])) {
        $target_dir = "../../../../images/uploads/";
        $new_image  = time() . "_" . basename($_FILES['image']['name']);
        $target_file = $target_dir . $new_image;

        if (move_uploaded_file($_FILES['image']['tmp_name'], $target_file)) {
            // Xóa ảnh cũ
            if (!empty($data['image'])) {
                $old_image_path = $target_dir . $data['image'];
                if (file_exists($old_image_path)) {
                    unlink($old_image_path);
                }
            }
            $image = $new_image;
        }
    }

    // Cập nhật database
    $sql_update = "UPDATE curriculum SET title = ?, content = ?, image = ? WHERE id = ?";
    $stmt = $conn->prepare($sql_update);
    $stmt->bind_param("sssi", $title, $content, $image, $id);

    if ($stmt->execute()) {
        header("Location: curriculum.php");
        exit();
    } else {
        echo "<script>alert('Cập nhật thất bại!');</script>";
    }
}
?>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Sửa Chương Trình Học</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">
    <h2 class="mb-4">Sửa Chương Trình Học</h2>

    <form method="POST" enctype="multipart/form-data">
        <div class="mb-3">
            <label class="form-label">Tiêu đề</label>
            <input type="text" name="title" class="form-control"
                   value="<?= htmlspecialchars($data['title']) ?>" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Nội dung</label>
            <textarea name="content" class="form-control" rows="4" required><?= htmlspecialchars($data['content']) ?></textarea>
        </div>

        <div class="mb-3">
            <label class="form-label">Ảnh mới (nếu muốn thay)</label>
            <input type="file" name="image" class="form-control" accept="image/*" onchange="previewImage(event)">
        </div>

        <!-- Ảnh hiện tại -->
        <?php if (!empty($data['image'])): ?>
        <div class="mb-3">
            <p>Ảnh hiện tại:</p>
            <img src="../../../../images/uploads/<?= htmlspecialchars($data['image']) ?>"
                 class="img-thumbnail" style="max-width:200px">
        </div>
        <?php endif; ?>

        <!-- Xem trước ảnh mới -->
        <div class="mb-3">
            <img id="preview" class="img-thumbnail d-none" style="max-width:200px">
        </div>

        <button type="submit" class="btn btn-primary">Cập nhật</button>
        <a href="curriculum.php" class="btn btn-secondary">Quay lại</a>
    </form>
</div>

<script>
function previewImage(event) {
    let preview = document.getElementById("preview");
    let file = event.target.files[0];

    if (file) {
        let reader = new FileReader();
        reader.onload = function(e) {
            preview.src = e.target.result;
            preview.classList.remove("d-none");
        }
        reader.readAsDataURL(file);
    }
}
</script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>
