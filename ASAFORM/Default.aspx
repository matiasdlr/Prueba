<%@ Page Title="CMS ASA CHECK IN/OUT SYSTEM" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ASAFORM._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron text-center ">
        <h2>CMS ASA CHECK IN/OUT SYSTEM</h2><a>
    </div>
    <div class="col-md-12 row">
        <div class="col-md-5 text-center" style="border: 1px solid #d8d8d8; height: 400px; border-radius: 5px;">
            <h2>Log in</h2>
            <div class="form-vertical">
            <div class="form-group row">
                <label class="col-md-3" for="txtuser">User:</label>
                <div class="col-md-8">
                    <input type="text" id="txtuser" class="form-control" />
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3" for="txtpass">Password:</label>
                <div class="col-md-8">
                    <input type="password" id="txtpass" class="form-control" />
                </div>

            </div>
            <div class="row">
                <br />
                <a href="#" id="btnValid" class="btn btn-success">Login</a>
            </div>
            <br />
            <p>Type Here your Username and Password to proceed.</p>
                </div>
        </div>
        
        <div class="col-md-7" style="height: 400px;">
            <img src="ImgFolder/ASA.jpg" style="width: 100%" />
        </div>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#btnValid").click(function () {
                var valores = $("#txtuser").val() + '|';
                valores += $("#txtpass").val() + '|';
                if (validaUser(valores)) {
                    window.location.href = "CheckInOut.aspx";
                } else {
                    alert("Failed to Login!");
                }
            });

            $("#txtpass").keypress(function (e) {
                if (e.which == 13) {
                    var valores = $("#txtuser").val() + '|';
                    valores += $("#txtpass").val() + '|';
                    if (validaUser(valores)) {
                        window.location.href = "CheckInOut.aspx";
                    } else {
                        alert("Failed to Login!");
                    }
                }
            });
        });
        function validaUser(valor) {
            var retorna = false;
            var param = "'chkvalues':'" + valor + "'";
            $.ajax({
                type: "POST",
                async: false,
                url: "Default.aspx/validaUser",
                data: "{" + param + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var m = response.d;
                    if (m != '') {

                        retorna = true;
                    }
                    return false;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Respuesta = " + XMLHttpRequest.responseText + "\n Estatus = " + textStatus + "\n Error = " + errorThrown);
                }
            });

            return retorna;
        }
    </script>
</asp:Content>
