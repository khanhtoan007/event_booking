<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Manager Account</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"> 
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="icon" type="image/png" href="https://banner2.cleanpng.com/20190319/qeo/kisspng-logo-d-letter-d-derbyshire-font-brand-5c919bfa131018.1916527415530465220781.jpg" sizes="96x96" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css"
              integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g=="
              crossorigin="anonymous" referrerpolicy="no-referrer"/>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.css"/>
        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2> <b>Manage Account</b></h2>
                        </div>
                    </div>
                </div>
                <table class="table table-bordered table-striped" id="table">
                    <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Username</th>
                        <th scope="col">Password</th>
                        <th scope="col">Name</th>
                        <th scope="col">Phone</th>
                        <th scope="col">Email</th>
                        <th scope="col">Role</th>
                        <th class="col-4">Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${listP}" var="user" >
                        <tr>
                            <td>${user.id}</td>
                            <td>${user.user}</td>
                            <td>${user.pass}</td>
                            <td>${user.name}</td>
                            <td>${user.phone}</td>
                            <td>${user.email}</td>
                            <td>${user.role}</td>
                            <td class="col-3">
                                <div class="row">
                                    <div class="col-md-6">
                                        <a style="width: 100%"
                                           href="${pageContext.request.contextPath}/admin/user/delete?id=${user.id}">
                                            <button class="btn btn-danger btn-block" style="
    border-top-width: 0;
    border-left-width: 0;
    border-right-width: 0;
    padding-right: 0;
    padding-left: 0;
min-width: 70px;">Xóa
                                            </button>
                                        </a>
                                    </div>
                                    <div class="col-md-6">
                                        <button type="button" onclick="showMyModal('${user.id}', '${user.name}', '${user.email}', '${user.pass}', '${user.phone}', '${user.role}')" data-toggle="modal" data-target="#editModal" class="btn btn-warning btn-block" style="
    border-top-width: 0;
    border-left-width: 0;
    border-right-width: 0;
    padding-right: 0;
    padding-left: 0;
min-width: 70px;">Sửa
                                        </button>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <a href="Home"><button type="button" class="btn btn-primary">Back to home</button></a>

        </div>
        <!-- Edit Modal HTML -->
        <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Chỉnh sửa</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="${pageContext.request.contextPath}/edit-account" method="post">
                            <div class="container">
                                <input type="hidden" name="id" id="id">
                                <div class="form-group row align-items-center ">
                                    <label class="col-md-12 form-control-label required" for="name_update">
                                        Tên </label>
                                    <div class="col-md-12">
                                        <input class="form-control" id="name_update" name="name_update" type="text" required="">
                                    </div>
                                </div>
                                <div class="form-group row align-items-center ">
                                    <label class="col-md-12 form-control-label required" for="email_update">
                                        Email
                                    </label>
                                    <div class="col-md-12">
                                        <input class="form-control" name="email_update" id="email_update" rows="8" style="width: 100%" required>
                                    </div>
                                </div>
                                <div class="form-group row align-items-center ">
                                    <label class="col-md-12 form-control-label required" for="phone_update">
                                        Phone
                                    </label>
                                    <div class="col-md-12">
                                        <input class="form-control" name="phone_update" id="phone_update" rows="8" style="width: 100%" required>
                                    </div>
                                </div>
                                <div class="form-group row align-items-center ">
                                    <label class="col-md-12 form-control-label required" for="password_update">
                                        Password
                                    </label>
                                    <div class="col-md-12">
                                        <input class="form-control" name="password_update" id="password_update" rows="8" style="width: 100%" required>
                                    </div>
                                </div>
                                <div class="form-group row align-items-center ">
                                    <label class="col-md-12 form-control-label required" for="role_update">
                                        Role
                                    </label>
                                    <div class="col-md-12">
                                        <select name="role_update" id="role_update">
                                            <option value="admin">Admin</option>
                                            <option value="poster">Poster</option>
                                            <option value="User">User</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="container">
                                    <div class="form-group row align-items-center ">

                                        <button class="btn btn-outline-primary-2 btn-block" id="submit_update" type="submit">
                                            Cập nhật
                                        </button>
                                    </div>

                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        
      
        <script src="js/manager.js" type="text/javascript"></script>
        <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.js"></script>
    </body>
</html>
<script>
    function showMyModal(id, name, email, pass, phone, role) {
        $("#name_update").val(name)
        $("#id").val(id)
        $("#email_update").val(email)
        $("#password_update").val(pass)
        $("#phone_update").val(phone)
        $("#role_update").val(role)
    }
    $("#submit_update").on('click', function (e) {
        var toastr_text = ""
        if ($("#name_update").val() === "") {
            toastr_text += "Tên";
        }
        if ($("#email_update").val() === "") {
            if (toastr_text === "") {
                toastr_text += "Email";
            } else {
                toastr_text += ", email";
            }
        }
        if (toastr_text !== "") {
            e.preventDefault()
            toastr.warning(toastr_text + " không được để trống.")
        }
    })
    $('#table').DataTable();
    $("#editModal").on("hidden.bs.modal", function () {
        $("#name_update").val("")
        $("#id").val("")
        $("#email_update").val("")
        $("#password_update").val("")
        $("#phone_update").val("")
        $("#role_update").val("")
    });
</script>