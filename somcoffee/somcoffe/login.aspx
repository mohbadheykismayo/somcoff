﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="somcoffe.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> Login</title>
  
    <link href="assets/bootstrap.min.css" rel="stylesheet" />
        <style>
        .gradient-custom {
/* fallback for old browsers */
background: #6a11cb;

/* Chrome 10-25, Safari 5.1-6 */
background: -webkit-linear-gradient(to right, rgba(106, 17, 203, 1), rgba(37, 117, 252, 1));

/* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
background: linear-gradient(to right, rgba(106, 17, 203, 1), rgba(37, 117, 252, 1))
}


    </style>
</head>
<body>
    <form id="form1" runat="server">
                  <section class="vh-100 gradient-custom">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-12 col-md-8 col-lg-6 col-xl-5">
        <div class="card bg-info text-white" style="border-radius: 1rem;">
          <div class="card-body p-5 text-center">

            <div class="mb-md-5 mt-md-4 pb-5">

              <h2 class="fw-bold mb-2 text-uppercase">Login</h2>
              <p class="text-white-50 mb-5">Please enter your login and password!</p>

              <div data-mdb-input-init class="form-outline form-white mb-4">
                    <asp:TextBox ID="TextBox2"  type="text"  class="form-control form-control-lg"  runat="server"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="TextBox2" ErrorMessage="username is required." CssClass="text-danger" Display="Dynamic" />
                <label class="form-label" for="typeEmailX">UserName</label>
              </div>

              <div data-mdb-input-init class="form-outline form-white mb-4">
             
                  <asp:TextBox ID="TextBox1"  type="password"  class="form-control form-control-lg"  runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="TextBox1" ErrorMessage="Password is required." CssClass="text-danger" Display="Dynamic" />
                <label class="form-label" for="typePasswordX">Password</label>
              </div>




                                       <br />
            
                <asp:Button ID="lognbtn" class="btn btn-outline-light btn-lg px-5" type="submit" runat="server" Text="Login" OnClick="lognbtn_Click"   />
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="text-danger" />
              <div class="d-flex justify-content-center text-center mt-4 pt-1">
                <a href="#!" class="text-white"><i class="fab fa-facebook-f fa-lg"></i></a>
                <a href="#!" class="text-white"><i class="fab fa-twitter fa-lg mx-4 px-2"></i></a>
                <a href="#!" class="text-white"><i class="fab fa-google fa-lg"></i></a>
              </div>

            </div>

         

          </div>
        </div>
      </div>
    </div>
  </div>
</section>
    </form>
</body>
</html>
