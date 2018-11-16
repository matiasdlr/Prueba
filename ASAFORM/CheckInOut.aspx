<%@ Page Title="CMS ASA CHECK IN/OUT SYSTEM" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CheckInOut.aspx.cs" Inherits="ASAFORM.CheckInOut" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Content/bootstrap-datepicker.css" rel="stylesheet" />

    <script src="Scripts/bootstrap-datepicker.js"></script>
    <script src="Scripts/printThis.js"></script>
    <div class="jumbotron text-center ">
        <h2>CMS ASA CHECK IN/OUT SYSTEM</h2>
    </div>

    <ul id="menu" class="nav nav-tabs">
        <li id="chkli" class="active"><a data-toggle="tab" href="#chkinout">Check In/Out</a></li>
        <li id="tMaint"><a data-toggle="tab" href="#Maint">Tables Maintenance</a></li>
        <li id="admin"><a data-toggle="tab" href="#Admin">Administration</a></li>
    </ul>

    <div class="tab-content">
        <div id="chkinout" class="tab-pane fade in active">
            <hgroup class="text-center">
                <h2>Check In/Out</h2>
            </hgroup>
            <div class="form-vertical col-md-12">
                <div class="row">
                    <label class="col-md-2">Date</label>
                    <div class="col-md-2 right ">
                        <%: DateTime.Now.Date.ToString("dd/MM/yyy") %>   <strong>Hora:</strong><span class="timer"></span>
                    </div>
                </div>
                <div id="attend" class="row" style="display:none;">
                    <label class="col-md-2">Show Attendance</label>
                    <div class="col-md-2">
                        <input type="text" id="chkDate" class="form-control" />
                    </div>
                    <div>
                        <a href="#" id="btnDatego" class="btn btn-success">Go</a>
                    </div>
                    
                </div>
                
                <div class="row">
                    <label class="col-md-2">Name</label>
                    <div class="col-md-4 ">
                        <input id="chkName" type="text" class="form-control" />
                    </div>
                    <label class="col-md-2">Last Name</label>
                    <div class="col-md-4 ">
                        <input id="chkLast" type="text" class="form-control" />
                    </div>
                </div>
                <div class="row">
                    <label class="col-md-2">Teacher</label>
                    <div class="col-md-4 ">
                        <select id="ddlTeacher" class="form-control">
                            <option>--Select Teacher--</option>
                        </select>
                    </div>
                    <div class="col-offset-1 col-md-2">
                        <a href="#" id="btnObserv" class="btn btn-success">Observations</a>
                    </div>
                </div>
                <div class="row">
                    <label class="col-md-2">Actividad</label>
                    <div class="col-md-4 ">
                        <select id="ddlActivity" class="form-control">
                            <option>--Select Activity--</option>

                        </select>
                    </div>
                </div>
                <div class="row">
                    <label class="col-md-2">Embassy BUS</label>
                    <div class="col-md-1">
                        <input id="chkEmbBus" type="checkbox" name="proc" class="form-control" />
                    </div>
                </div>
                <div class="row">
                    <label class="col-md-2">Schedule</label>
                    <div class="col-md-4 ">
                        <select id="ddlSched" class="form-control">
                            <option>--Select Schedule--</option>
                        </select>
                    </div>
                    <label class="col-md-2">Chkin-out Gral</label>
                    <div class="col-md-2 left ">
                        <select id="chShortDay" class="form-control"></select>
                    </div>
                </div>
                <div class="row"><span id="stcount"></span></div>
                <div class="row thumbnail">
                    <table class="table table-tripped" style="background-color: #ffe1cb">
                        <thead>
                            <tr style="background-color: #9ddeff">
                                <th>PICT</th>
                                <th>STUDENT</th>
                                <th>ACTIVITY</th>
                                <th>SCHEDULE</th>
                                <th>CHK_IN CAF</th>
                                <th>CHK_IN SUP</th>
                                <th>CHK_OUT SUP</th>
                                <th>CHK_OUT GTE</th>
                                <th>NOTES</th>
                            </tr>
                        </thead>
                        <tbody id="chkTbody">
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div id="Maint" class="tab-pane fade ">
            <ul class="nav nav-tabs">
                <li id="stli" class="active"><a data-toggle="tab" href="#Stud">Students</a></li>
                <li id="stActli"><a data-toggle="tab" href="#stAct">Student Activities</a></li>
                <li id="teali"><a data-toggle="tab" href="#Teach">Teachers</a></li>
                <li id="grali"><a data-toggle="tab" href="#Grad">Grades</a></li>
                <li id="actli"><a data-toggle="tab" href="#Acti">Activities</a></li>
                <li id="schli"><a data-toggle="tab" href="#Sched">Schedules</a></li>
                <li id="actSchli"><a data-toggle="tab" href="#Actsch">Acti-Schedule</a></li>
                <li id="regli"><a data-toggle="tab" href="#RegApr">Registration Approval</a></li>
                
            </ul>
            <div class="tab-content">
                <div id="Stud" class="tab-pane fade in active">
                    <div class="form-vertical col-md-12">
                        <div class="form-group row" style="margin-top: 10px;">
                            <div class="col-md-12">
                                <div class="col-md-6" style="vertical-align: bottom">
                                    <label class="col-md-2">State</label>
                                    <div class="col-md-4 left ">
                                        <select id="stState" class="form-control">
                                            <option value="0">--Select--</option>

                                        </select>
                                    </div>
                                </div>
                                <div id="dvFoto" class="col-md-3">
                                    <img src="ImgFolder/fotoP.jpg" class="thumbnail" style="width: 150px; cursor: pointer;" />
                                </div>
                                <input type="file" id="stPhoto" onchange="PhotoUp()" style="display: none;" />
                            </div>
                        </div>
                        <hr />
                        <div class="form-group row">
                            <label class="col-md-2 col-form-label">Name</label>
                            <div class="col-md-4">
                                <div class="input-group">
                                    <input type="text" id="stName" class="form-control" />
                                    <span id="btnSt" class="input-group-addon"><i class="glyphicon glyphicon-search" style="cursor: pointer;"></i></span>
                                </div>
                            </div>

                        </div>
                        <div class="form-group row">
                            <label class="col-md-2 col-form-label">Last Name</label>
                            <div class="col-md-6 left ">
                                <input type="text" id="stLastName" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-md-2 col-form-label">Age</label>
                            <div class="col-md-2 left ">
                                <input type="text" id="stAge" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-md-2">Grade</label>
                            <div class="col-md-2 left ">
                                <select id="stGrade" class="form-control">
                                    <option value="0">--Select--</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-md-2">Procedence</label>
                            <div class="col-md-2 left ">
                                <select id="stFrom" class="form-control">
                                    <option value="0">--Select--</option>

                                </select>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-md-2">School</label>
                            <div class="col-md-4 left ">
                                <input type="text" id="proColeg" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-md-2">CMS Teacher</label>
                            <div class="col-md-4 left ">
                                <input type="text" id="cmsTeac" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-md-2">Embassy Bus</label>
                            <div class="col-md-4 left ">
                                <input type="checkbox" id="EmBus" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-md-2">Mother's Name</label>
                            <div class="col-md-4 left ">
                                <input type="text" id="stMother" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-md-2">Mother Cellphone</label>
                            <div class="col-md-2 left ">
                                <input type="text" id="motCell" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-md-2">Mother Email</label>
                            <div class="col-md-4 left ">
                                <input type="text" id="motEmail" class="form-control" />
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-md-2">Father's Name</label>
                            <div class="col-md-4 left ">
                                <input type="text" id="stFather" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-md-2">Father Cellphone</label>
                            <div class="col-md-2 left ">
                                <input type="text" id="fatCell" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-md-2">Father Email</label>
                            <div class="col-md-4 left ">
                                <input type="text" id="fatEmail" class="form-control" />
                            </div>
                        </div>
                        <hr />
                        <h3>Medical Informations</h3>
                        <div class="form-group row">
                            <label class="col-md-2">Allergies</label>
                            <div class="col-md-4 left">
                                <input type="text" id="Allerg" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-md-2">Auth Medication</label>
                            <div class="col-md-4 left">
                                <input type="text" id="AuthMed" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-md-2">EmergContact</label>
                            <div class="col-md-4 left ">
                                <input type="text" id="EContact" class="form-control" />
                            </div>
                        </div>

                        <div class="form-group row">
                            <div class="col-md-2 left ">
                                <a href="#" id="btnStSave" class="btn btn-success">Save</a>
                                <a href="#" id="btnStClear" class="btn btn-success">Clear</a>
                            </div>
                        </div>
                        <input type="text" id="stId" style="display: none;" />
                        <input type="text" id="stFotoName" style="display: none;" />

                    </div>
                </div>
                <div id="stAct" class="tab-pane fade">
                    <div class="form-vertical" style="margin-top: 10px;">
                        <div class="form-group row">
                            <label class="col-md-2 col-form-label">Name</label>
                            <div class="col-md-4">
                                <div class="input-group">
                                    <input type="text" id="stNameAct" class="form-control" />
                                    <span id="btnStschSear" class="input-group-addon"><i class="glyphicon glyphicon-search" style="cursor: pointer;"></i></span>
                                </div>
                            </div>

                        </div>
                        <div class="form-group row">
                            <label class="col-md-2">Activity</label>
                            <div class="col-md-3 left ">
                                <select id="stActiSelect" class="form-control">
                                    <option value="0">--Select--</option>
                                </select>
                            </div>
                            <label class="col-md-2">Schedule</label>
                            <div class="col-md-3 left ">
                                <select id="stSched" class="form-control">
                                    <option value="0">--Select--</option>
                                </select>
                            </div>
                            <div class="col-md-2 left">
                                <a href="#" id="btnstactSave" class="btn btn-success">Save</a>
                                <a href="#" id="btnstactNew" class="btn btn-success">New</a>
                            </div>
                        
                        </div>
                        <input type="text" id="stactId" style="display: none;" />
                        <input type="text" id="stactscId" style="display: none;" />
                        <div class="form-group row">
                            <table class="table table-tripped">
                                <thead>
                                    <tr>
                                        <th>Student
                                        </th>
                                        <th>Activity
                                        </th>
                                        <th>Schedule
                                        </th>
                                        <th>Load</th>
                                        <th>Remove</th>
                                    </tr>
                                </thead>
                                <tbody id="stschTbody">
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div id="Teach" class="tab-pane fade">
                    <h3>Teachers</h3>
                    <div class="form-vertical">
                        <div class="form-group row">
                            <label class="col-md-2">Name</label>
                            <div class="col-md-4 left ">
                                <input type="text" id="teaName" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-md-2">Contact</label>
                            <div class="col-md-4 left ">
                                <input type="text" id="teaContact" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-md-2">Mail</label>
                            <div class="col-md-4 left ">
                                <input type="text" id="teaMail" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-md-2 left ">
                                <a href="#" id="teabtnSave" class="btn btn-success">Save</a>
                                <a href="#" id="teabtnClear" class="btn btn-success">Clear</a>
                            </div>
                        </div>
                        <input type="text" id="teaId" style="display: none;" />
                        <div class="form-group row">
                            <table class="table table-tripped">
                                <thead>
                                    <tr>
                                        <th>Name
                                        </th>
                                        <th>Contact
                                        </th>
                                        <th>Mail
                                        </th>
                                        <th>Load</th>
                                        <th>Remove</th>
                                    </tr>
                                </thead>
                                <tbody id="teaTbody">
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div id="Grad" class="tab-pane fade">
                    <h3>Grades</h3>
                    <div class="form-vertical">
                        <div class="form-group row">
                            <label class="col-md-2">Grade</label>
                            <div class="col-md-4 left ">
                                <input type="text" id="Grade" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-md-2 left ">
                                <a href="#" id="btnGraSave" class="btn btn-success">Save</a>
                                <a href="#" id="btnGraClear" class="btn btn-success">Clear</a>
                            </div>
                        </div>
                        <input type="text" id="graId" style="display: none;" />
                        <div class="form-group row">
                            <table class="table table-tripped">
                                <thead>
                                    <tr>
                                        <th>ID
                                        </th>
                                        <th>Grade
                                        </th>
                                        <th>Load</th>
                                        <th>Remove</th>
                                    </tr>
                                </thead>
                                <tbody id="graTbody">
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div id="Acti" class="tab-pane fade">
                    <h3>Activities</h3>
                    <div class="form-vertical">
                           <div class="form-group row">
                            <label class="col-md-2">Cathegory</label>
                            <div class="col-md-3 left ">
                                <select id="actCat" class="form-control">
                                    <option value="0">--Select--</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-md-2">Activity</label>
                            <div class="col-md-4 left ">
                                <input type="text" id="Activity" class="form-control" />
                            </div>
                        </div>
                          <div class="form-group row">
                            <label class="col-md-2">Grade</label>
                            <div class="col-md-4 left ">
                                <input type="text" id="actGrade" class="form-control" />
                            </div>
                        </div>
                         <div class="form-group row">
                            <label class="col-md-2">Price</label>
                            <div class="col-md-4 left ">
                                <input type="text" id="actPrice" class="form-control" />
                            </div>
                        </div>
                     
                        <div class="form-group row">
                            <label class="col-md-2">Teacher</label>
                            <div class="col-md-3 left ">
                                <select id="actTeach" class="form-control">
                                    <option value="0">--Select--</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-md-2 left ">
                                <a href="#" id="btnActSave" class="btn btn-success">Save</a>
                                <a href="#" id="btnActClear" class="btn btn-success">Clear</a>
                            </div>
                        </div>
                        <input type="text" id="actId" style="display: none;" />
                        <div class="form-group row">
                            <table class="table table-tripped">
                                <thead>
                                    <tr>
                                        <th>Activity
                                        </th>
                                        <th>Grade
                                        </th>
                                        <th>Price
                                        </th>
                                        <th>Teacher
                                        </th>
                                        <th>Load</th>
                                        <th>Remove</th>
                                    </tr>
                                </thead>
                                <tbody id="actTbody">
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div id="Sched" class="tab-pane fade">
                    <h3>Schedules</h3>
                    <div class="form-vertical">
                        <div class="form-group row">
                            <label class="col-md-2">Activity Day</label>
                            <div class="col-md-4 left ">
                                <input type="text" id="actDay" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-md-2">Short Day</label>
                            <div class="col-md-2 left ">
                                <select id="scShortDay" class="form-control"></select>
                                <%--<input type="text" id="actSday" class="form-control" />--%>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-md-2">Time</label>
                            <div class="col-md-2 left ">
                                <input type="text" id="actTime" class="form-control" />
                            </div>
                        </div>
                        <input type="text" id="schId" style="display: none;" />
                        <div class="form-group row">
                            <div class="col-md-2 left ">
                                <a href="#" id="btnSch" class="btn btn-success">Save</a>
                                <a href="#" id="btnClear" class="btn btn-success">Clear</a>
                            </div>
                        </div>
                        <div class="form-group row">
                            <table class="table table-tripped">
                                <thead>
                                    <tr>
                                        <th>Day
                                        </th>
                                        <th>ShortDay
                                        </th>
                                        <th>Time
                                        </th>
                                        <th>Load</th>
                                        <th>Remove</th>
                                    </tr>
                                </thead>
                                <tbody id="scTbody">
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div id="Actsch" class="tab-pane fade">
                    <h3>Activity-Schedule</h3>
                    <div class="form-vertical">
                        <div class="form-group row">
                            <label class="col-md-2">Activity</label>
                            <div class="col-md-3 left ">
                                <select id="actisc" class="form-control">
                                    <option value="0">--Select--</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-md-2">Schedule</label>
                            <div class="col-md-3 left ">
                                <select id="ddlactSched" class="form-control">
                                    <option value="0">--Select--</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-md-2">Teacher</label>
                            <div class="col-md-3 left ">
                                <select id="actscTea" class="form-control">
                                    <option value="0">--Select--</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-md-2 left ">
                                <a href="#" id="btnActScSave" class="btn btn-success">Save</a>
                                <a href="#" id="btnActScClear" class="btn btn-success">Clear</a>
                            </div>
                        </div>
                        <input type="text" id="actscId" style="display: none;" />
                        <div class="form-group row">
                            <table class="table table-tripped">
                                <thead>
                                    <tr>
                                        <th>Activity
                                        </th>
                                        <th>Schedule
                                        </th>
                                        <th>Teacher
                                        </th>
                                        <th>Load</th>
                                        <th>Remove</th>
                                    </tr>
                                </thead>
                                <tbody id="actscTbody">
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div id="RegApr" class="tab-pane fade">
                    <h3>Registration Approval</h3>
                    <div class="form-vertical">
                        <div class="form-group row">
                            <label class="col-md-2">Select Student</label>
                            <div class="col-md-3 left ">
                                <select id="stList" class="form-control">
                                    <option value="0">--Select--</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group row">
                            <table class="table table-tripped">
                                <thead>
                                    <tr>
                                        <th>ACTIVITIES
                                        </th>
                                        <th>DAYS/TIME
                                        </th>
                                        <th>INSTRUCTOR
                                        </th>
                                        <th>PRICE</th>
                                    </tr>
                                </thead>
                                <tbody id="RegBody">
                                </tbody>
                            </table>
                        </div>
                         
                        <div class="form-group row">
                            <label class="col-md-2">State</label>
                            <div class="col-md-3 left ">
                                <select id="stStat" class="form-control">
                                    <option value="0">--Select--</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-md-2">Payment Info.</label>
                            <div class="col-md-2 left ">
                               <textarea id="regPay" cols="20" rows="20" Class="form-control"></textarea>
                            </div>
                        </div>
                         <div class="form-group row">
                            <div class="col-md-2 left ">
                                <a href="#" id="btnRegSave" class="btn btn-success">Save</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="Admin" class="tab-pane fade">
            <ul class="nav nav-tabs">
                <li id="wali" class="active"><a data-toggle="tab" href="#WA">Work-Area</a></li>
                <li id="Userli"><a data-toggle="tab" href="#Users">Users Manager</a></li>
                <li id="o"><a data-toggle="tab" href="#Ot">Other</a></li>

            </ul>
            <div class="tab-content">
                <div id="WA" class="tab-pane fade in active">
                    <div class="form-vertical col-md-12">
                        <div class="row">
                            <label class="col-md-2">Actividad</label>
                            <div class="col-md-4 ">
                                <select id="ddlwaActivity" class="form-control">
                                    <option>--Select Activity--</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <label class="col-md-2">Embassy BUS</label>
                            <div class="col-md-1">
                                <input id="waEmbBus" type="checkbox" name="proc" class="form-control" />
                            </div>
                        </div>
                        <div class="row">
                            <label class="col-md-2">Schedule</label>
                            <div class="col-md-4 ">
                                <select id="ddlwaSched" class="form-control">
                                    <option>--Select Schedule--</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <label class="col-md-2">CMS Teachers</label>
                            <div class="col-md-4 ">
                                <select id="ddlwateac" class="form-control">
                                    <option>--Select Teacher--</option>
                                </select>
                            </div>
                        </div>
                        <div id="printT" class="row thumbnail">
                            <h3 class="text-center" style="color: dimgrey">-- STUDENTS LIST --</h3>
                            <table class="table table-tripped" style="background-color: #ffe1cb; margin-left: 5px;">
                                <thead>
                                    <tr style="background-color: #9ddeff;">
                                        <th>STUDENT</th>
                                        <th>ACTIVITY</th>
                                        <th>SCHEDULE</th>
                                        <th>MOTHER'S EMAIL</th>
                                        <th>FATHER'S EMAIL</th>
                                        <th>CMS TEACHER</th>
                                    </tr>
                                </thead>
                                <tbody id="waTbody">
                                </tbody>
                            </table>
                        </div>
                        <div class="row">
                            <a href="#" id="notParents" class="btn btn-success"><span class="glyphicon glyphicon-envelope"></span>Notify Parents</a>
                            <a href="#" id="notTeachers" class="btn btn-success"><span class="glyphicon glyphicon-envelope"></span>Notify CMS Teachers</a>
                            <a href="#" id="SLSecurity" class="btn btn-success"><span class="glyphicon glyphicon-envelope"></span>Send List to Security</a>
                            <a href="#" id="waprint" class="btn btn-success"><span class="glyphicon glyphicon-print"></span>Print</a>
                        </div>
                    </div>
                </div>
                <div id="Users" class="tab-pane fade">
                    <div class="form-vertical" style="margin-top: 10px;">
                        <div class="form-group row">
                            <label class="col-md-2 col-form-label">Name</label>
                            <div class="col-md-4">
                                <input type="text" id="usName" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-md-2 col-form-label">CellPhone</label>
                            <div class="col-md-2">
                                <input type="text" id="usCell" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-md-2 col-form-label">User Name</label>
                            <div class="col-md-3">
                                <input type="text" id="UserName" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-md-2 col-form-label">Password</label>
                            <div class="col-md-3">
                                <input type="password" id="usPass" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-md-2 col-form-label">Roll</label>
                            <div class="col-md-3">
                                <select id="usRoll" class="form-control">
                                    <option value="0">--Select--</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-md-2 left ">
                                <a href="#" id="btnUsSave" class="btn btn-success">Save</a>
                                <a href="#" id="btnUsClear" class="btn btn-success">Clear</a>
                            </div>
                        </div>
                        <input type="text" id="UsId" style="display: none;" />
                        <div class="form-group row">
                            <table class="table table-tripped">
                                <thead>
                                    <tr>
                                        <th>Name
                                        </th>
                                        <th>Cell-Phone
                                        </th>
                                        <th>UserName
                                        </th>
                                        <th>Roll
                                        </th>
                                        <th>Load</th>
                                        <th>Remove</th>
                                    </tr>
                                </thead>
                                <tbody id="usTbody">
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div id="Ot" class="tab-pane fade">
                    <h3>UNDER CONSTRUCCION</h3>
                </div>
            </div>
        </div>

    </div>

    <script type="text/javascript">
        var modifica = 0;
        var modifica1 = 0;
        var roll = 0;
        var uname = "";
        var uid = 0;
        var edita = 0;
        $(document).ready(function () {
            isUserIn();
            //$("#admin").css("pointer-events", "none");
            ddlTeacher();
            ddlActivity();
            ddlSched();
            ddlgral();

            //start WorkArea block
            $("#admin").click(function () {
                ddlwActivity();
                ddlwSched();
                ddlwteac();
            });

            $("#chkDate").datepicker({
                autoclose: true,
                multidate: false,
                format: 'dd/mm/yyyy',

            });

            $("#btnDatego").click(function (e) {
                e.preventDefault();
                if ($("#chkDate").val() != "") {
                    chkAssist($("#chkDate").val());
                    edita = 1;
                }
            });

            $("#ddlwaSched").change(function () {
                if ($("#ddlwaSched").val() != 0) {
                    var ddl = "";
                    ddl += $("#ddlwaSched").val() + '|';
                    ddl += $("#ddlwaActivity").val() + '|';
                    ddl += $("#ddlwateac option:selected").text() + '|';
                    if ($("#waEmbBus").prop("checked")) {
                        ddl += 1 + '|';
                    } else {
                        ddl += 0 + '|';
                    }

                    wafiltra(ddl);
                }

            });
            $("#ddlwaActivity").change(function () {
                if ($("#ddlwaActivity").val() != 0) {
                    var ddl = "";
                    ddl += $("#ddlwaSched").val() + '|';
                    ddl += $("#ddlwaActivity").val() + '|';
                    ddl += $("#ddlwateac option:selected").text() + '|';
                    if ($("#waEmbBus").prop("checked")) {
                        ddl += 1 + '|';
                    } else {
                        ddl += 0 + '|';
                    }
                    wafiltra(ddl);
                }

            });
            $("#waEmbBus").click(function () {
                var ddl = "";
                ddl += $("#ddlwaSched").val() + '|';
                ddl += $("#ddlwaActivity").val() + '|';
                ddl += $("#ddlwateac option:selected").text() + '|';
                if ($("#waEmbBus").prop("checked")) {
                    ddl += 1 + '|';
                } else {
                    ddl += 0 + '|';
                }

                wafiltra(ddl);

            });

            $("#ddlwateac").change(function () {
                if ($("#ddlwateac").val() != 0) {
                    var ddl = "";
                    ddl += $("#ddlwaSched").val() + '|';
                    ddl += $("#ddlwaActivity").val() + '|';
                    ddl += $("#ddlwateac option:selected").text() + '|';
                    if ($("#waEmbBus").prop("checked")) {
                        ddl += 1 + '|';
                    } else {
                        ddl += 0 + '|';
                    }

                    wafiltra(ddl);
                }
            });

            $("#notParents").click(function () {
                if ($("#waTbody tr").length > 0) {
                    $("#paSubjet").val("");
                    $("#paMess").val("");
                    $("#paModal").modal('show');
                } else {
                    alert("Do a Search first!");
                }
            });

            $("#btnSend").click(function (e) {
                e.preventDefault();
                if ($("#paSubjet").val() != "" && $("#paMess").val() != "") {
                    var correoP = getparentemail();
                    var subMes = $("#paSubjet").val() + "|";
                    subMes += $("#paMess").val() + "|";
                    sendParents(correoP, subMes);
                } else {
                    alert("Field required!")
                }
            });

            $("#btncmsteaSend").click(function (e) {
                e.preventDefault();
                if ($("#cmsteaSubjet").val() != "" && $("#cmsteaMess").val() != "") {
                    var correoT = getteacheremail();
                    var corre = correoT.split('|');
                    var teaSt = "";
                    var unico = unique(corre);

                    for (var i = 0; i < unico.length - 1; i++) {
                        teaSt += teaStu(unico[i]) + unico[i] + '^';
                    }
                    var subMes = $("#cmsteaSubjet").val() + "|";
                    subMes += $("#cmsteaMess").val() + "|";
                    sendTea(teaSt, subMes);
                } else { alert("Do a Search first!"); }

            });

            $("#notTeachers").click(function () {
                if ($("#waTbody tr").length > 0) {
                    $("#cmsteaSubjet").val("");
                    $("#cmsteaMess").val("");
                    $("#cmsteaModal").modal('show');
                } else {
                    alert("Do a Search first!");
                }
            });

            $("#SLSecurity").click(function () {

                if ($("#waTbody tr").length > 0) {

                    $("#secTo").val("");
                    $("#secSubjet").val("");
                    $("#secModal").modal('show');
                } else {
                    alert("Do a Search first!");
                }

            });

            $("#btnSecSend").click(function (e) {
                e.preventDefault();
                if ($("#secTo").val() != "" && $("#secSubjet").val() != "") {
                    if (validateEmail($("#secTo").val())) {
                        var datoslista = GetSecdata();
                        var subMes = $("#secTo").val() + "|";
                        subMes += $("#secSubjet").val() + "|";
                        sendSec(datoslista, subMes);
                    } else {
                        alert("Invalid Email");
                        $("#secTo").focus();

                    }
                } else { alert("Fields required!") }
            });


            $("#waprint").click(function (e) {
                e.preventDefault();
                if ($("#waTbody tr").length > 0) {
                    $("#printT").printThis();
                } else {
                    alert("Nothing to Print!");
                }

            });

            //end WorkArea block

            //start check in out block
            $("#chkli").click(function () {
                ddlTeacher();
                ddlActivity();
                ddlSched();
                ddlgral();
                //filtra("0|0|0|0||");
            });

            $("#chShortDay").change(function () {
                if ($("#chShortDay").val() != 0) {
                    var ddl = "";
                    ddl += $("#ddlTeacher").val() + '|';
                    ddl += $("#ddlSched").val() + '|';
                    ddl += $("#ddlActivity").val() + '|';
                    if ($("#chkEmbBus").prop("checked")) {
                        ddl += '1|';
                    } else {
                        ddl += '0|';
                    }

                    ddl += $("#chkName").val() + '|';
                    ddl += $("#chkLast").val() + '|';
                    ddl += $("#chShortDay").val() + '|';

                    filtra(ddl);
                }

            });

            $("#ddlTeacher").change(function () {
                if ($("#ddlTeacher").val() != 0) {
                    var ddl = "";
                    ddl += $("#ddlTeacher").val() + '|';
                    ddl += $("#ddlSched").val() + '|';
                    ddl += $("#ddlActivity").val() + '|';
                    if ($("#chkEmbBus").prop("checked")) {
                        ddl += '1|';
                    } else {
                        ddl += '0|';
                    }

                    ddl += $("#chkName").val() + '|';
                    ddl += $("#chkLast").val() + '|';
                    ddl += $("#chShortDay").val() + '|';

                    filtra(ddl);
                }

            });

            $("#ddlSched").change(function () {
                if ($("#ddlSched").val() != 0) {
                    var ddl = "";
                    ddl += $("#ddlTeacher").val() + '|';
                    ddl += $("#ddlSched").val() + '|';
                    ddl += $("#ddlActivity").val() + '|';
                    if ($("#chkEmbBus").prop("checked")) {
                        ddl += 1 + '|';
                    } else {
                        ddl += 0 + '|';
                    }

                    ddl += $("#chkName").val() + '|';
                    ddl += $("#chkLast").val() + '|';
                    ddl += $("#chShortDay").val() + '|';

                    filtra(ddl);
                }

            });
            $("#ddlActivity").change(function () {
                if ($("#ddlActivity").val() != 0) {
                    var ddl = "";
                    ddl += $("#ddlTeacher").val() + '|';
                    ddl += $("#ddlSched").val() + '|';
                    ddl += $("#ddlActivity").val() + '|';
                    if ($("#chkEmbBus").prop("checked")) {
                        ddl += 1 + '|';
                    } else {
                        ddl += 0 + '|';
                    }

                    ddl += $("#chkName").val() + '|';
                    ddl += $("#chkLast").val() + '|';
                    ddl += $("#chShortDay").val() + '|';

                    filtra(ddl);
                }

            });

            $("#chkEmbBus").click(function () {

                var ddl = "";
                ddl += $("#ddlTeacher").val() + '|';
                ddl += $("#ddlSched").val() + '|';
                ddl += $("#ddlActivity").val() + '|';
                if ($("#chkEmbBus").prop("checked")) {
                    ddl += 1 + '|';
                } else {
                    ddl += 0 + '|';
                }

                ddl += $("#chkName").val() + '|';
                ddl += $("#chkLast").val() + '|';
                ddl += $("#chShortDay").val() + '|';

                filtra(ddl);

            });

            $("#chkName").keypress(function (e) {
                if (e.which == 13) {
                    if ($("#chkName").val() != "") {
                        var ddl = "";
                        ddl += $("#ddlTeacher").val() + '|';
                        ddl += $("#ddlSched").val() + '|';
                        ddl += $("#ddlActivity").val() + '|';
                        if ($("#chkEmbBus").prop("checked")) {
                            ddl += 1 + '|';
                        } else {
                            ddl += 0 + '|';
                        }

                        ddl += $("#chkName").val() + '|';
                        ddl += $("#chkLast").val() + '|';
                        ddl += $("#chShortDay").val() + '|';

                        filtra(ddl);
                    }
                }
            });
            $("#chkName").blur(function () {
                if ($("#chkName").val() != "") {
                    var ddl = "";
                    ddl += $("#ddlTeacher").val() + '|';
                    ddl += $("#ddlSched").val() + '|';
                    ddl += $("#ddlActivity").val() + '|';
                    if ($("#chkEmbBus").prop("checked")) {
                        ddl += 1 + '|';
                    } else {
                        ddl += 0 + '|';
                    }

                    ddl += $("#chkName").val() + '|';
                    ddl += $("#chkLast").val() + '|';
                    ddl += $("#chShortDay").val() + '|';

                    filtra(ddl);
                }
            });

            $("#chkLast").keypress(function (e) {
                if (e.which == 13) {
                    if ($("#chkLast").val() != "") {
                        var ddl = "";
                        ddl += $("#ddlTeacher").val() + '|';
                        ddl += $("#ddlSched").val() + '|';
                        ddl += $("#ddlActivity").val() + '|';
                        if ($("#chkEmbBus").prop("checked")) {
                            ddl += 1 + '|';
                        } else {
                            ddl += 0 + '|';
                        }

                        ddl += $("#chkName").val() + '|';
                        ddl += $("#chkLast").val() + '|';
                        ddl += $("#chShortDay").val() + '|';

                        filtra(ddl);
                    }
                }
            });
            $("#chkLast").blur(function () {
                if ($("#chkLast").val() != "") {
                    var ddl = "";
                    ddl += $("#ddlTeacher").val() + '|';
                    ddl += $("#ddlSched").val() + '|';
                    ddl += $("#ddlActivity").val() + '|';
                    if ($("#chkEmbBus").prop("checked")) {
                        ddl += 1 + '|';
                    } else {
                        ddl += 0 + '|';
                    }

                    ddl += $("#chkName").val() + '|';
                    ddl += $("#chkLast").val() + '|';
                    ddl += $("#chShortDay").val() + '|';

                    filtra(ddl);
                }
            });

            $("#chkTbody").on('click', '.chGrC,.chSup,.chteaC,.chGrG', function () {
                var id = this.id.split('_')[1];
                var idch = this.value;
                var values = "";
                values += $("#st_" + id).val() + '|';
                if ($("#chGrC_" + id).prop("checked")) {
                    values += 1 + '|';
                } else {
                    values += 0 + '|';
                }
                if ($("#chSup_" + id).prop("checked")) {
                    values += 1 + '|';
                } else {
                    values += 0 + '|';
                }
                if ($("#chteaC_" + id).prop("checked")) {
                    values += 1 + '|';
                } else {
                    values += 0 + '|';
                }
                if ($("#chGrG_" + id).prop("checked")) {
                    values += 1 + '|';
                } else {
                    values += 0 + '|';
                }
                var editan = edita + ',' + $("#chkDate").val();
                if (edita == 1) {
                    idch = getactid($("#st_" + id).val(), $("#chkDate").val());
                }
                savechk(idch, values, editan);

            });

            $("#chkTbody").on('click', '.usNote', function () {
                var id = this.id.split('_')[1];
                var values = "";
                var stid = $("#st_" + id).val();
                stNote(stid);

            });

            

            $("#ObservTbody").on('click', '.lObserv', function () {
                var id = this.id;
                getObserv(id);

            });

            $("#btnObserv").click(function (e) {
                e.preventDefault();
                ObserT();
            });
            
            $("#btnClearObser").click(function () {
                $("#Obserid").val("");
                $("#txtObser").val("").focus();
            });

            $("#btnAddNotes").click(function (e) {
                e.preventDefault();
                var ntes = $("#stidN").val() + '|';
                ntes += $("#stNote").val() + '|';
                svaNotes(ntes);
            });
            $("#btnAddObser").click(function (e) {
                e.preventDefault();
                var ntes = $("#Obserid").val() + '|';
                ntes += $("#txtObser").val() + '|';
                savObser(ntes);
            });
            
            //end check in out block

            setInterval('updateClock()', 1000);
            //Photo block
            $("#dvFoto").click(function () {
                $("#stPhoto").focus().click();
            });
            //Photo Block

            //start Users Events
            $("#Userli").click(function () {
                usTable();
                RollSelect();
                modifica = 0;
            });

            $("#usTbody").on('click', '.usloa', function () {
                var id = this.id.split('_')[1];
                getUs(id);
            });

            $("#btnUsClear").click(function (e) {
                e.preventDefault();
                $("#usName").val("");
                $("#usCell").val("");
                $("#UserName").val("");
                $("#usPass").val("");
                $("#usRoll").val(0);
                $("#UsId").val("");
                modifica = 0;
            });

            $("#btnUsSave").click(function (e) {
                e.preventDefault();
                if ($("#usName").val() != "") {
                    var valores = "";
                    valores += $("#usName").val() + '|';
                    valores += $("#usCell").val() + '|';
                    valores += $("#UserName").val() + '|';
                    valores += $("#usPass").val() + '|';
                    valores += $("#usRoll").val() + '|';
                    valores += $("#UsId").val() + '|';
                    saveUs(valores, modifica);
                    usTable();
                } else {
                    alert("The Name is requiered!");
                    $("#usName").focus();
                }
            });

            $("#usTbody").on('click', '.usrem', function () {
                var id = this.id.split('_')[1];
                DelUs(id);

            });
            //end Users Events

            //start Student Activity Events
            $("#stActli").click(function () {
                actiSelect();
                modifica1 = 0;
            });

            $("#stActiSelect").change(function () {
                if ($("#stActiSelect").val() != 0) {
                    var actid = $("#stActiSelect").val();
                    actiSchSelect(actid);
                }
            });

            $("#btnStschSear").click(function () {
                stTable();
            });

            $("#btnstsrc").click(function () {
                if ($("#stsrchName").val() != "") {
                    stsrcTable($("#stsrchName").val());
                }
            });

            $("#stTbody").on('click', '.stactloa', function () {
                var id = this.id.split('_')[1];
                getStacti(id);
                stactTable(id);
            });

            $("#btnstactSave").click(function (e) {
                e.preventDefault();
                if ($("#stSched").val() != 0 && $("#stActiSelect").val() != 0 && $("#stactId").val() != "") {
                    var valores = "";
                    valores += $("#stactId").val() + '|';
                    valores += $("#stActiSelect").val() + '|';
                    valores += $("#stSched").val() + '|';
                    valores += $("#stactscId").val() + '|';
                    savestact(valores, modifica1);
                    stactTable($("#stactId").val());
                } else {
                    alert("The student, Activity or schedule is requiered!");
                    $("#stActiSelect").focus();
                }
            });

            $("#btnstactNew").click(function (e) {
                e.preventDefault();
                $("#stActiSelect").val(0);
                $("#stActiSelect").change();
                $("#stSched").val(0);
                $("#stactscId").val(0);
                modifica1 = 0;
            });

            $("#stschTbody").on('click', '.stactrem', function () {
                var id = this.id.split('_')[1];
                Delstact(id);
                if ($("#stactId").val() != "") {
                    stactTable($("#stactId").val());
                }
                modifica1 = 1;
            });

            $("#stschTbody").on('click', '.stactload', function () {
                var id = this.id.split('_')[1];
                getStsch(id);
                modifica1 = 1;
            });
            //end Sudent Activity Events


            //start Student Events
            $("#tMaint").click(function () {
                stStateSelect();
                stGraSelect();
                stFromSelect();
                modifica = 0;
            });

            $("#regli").click(function () {
                stSelect();
                StateSelect();
                modifica = 0;
            });

            $("#stList").change(function () {
                if ($("#stList").val() != 0) {
                    traeSelect($("#stList").val());

                }

            });

            $("#stli").click(function () {
                stGraSelect();
                stFromSelect();
                modifica = 0;
            });

            $("#btnSt").click(function () {
                stTable();
            });

            $("#stTbody").on('click', '.stloa', function () {
                var id = this.id.split('_')[1];
                getSt(id);
            });

            $("#btnStClear").click(function (e) {
                e.preventDefault();
                $("#stState").val(0);
                $("#stName").val("");
                $("#stLastName").val("");
                $("#stAge").val("");
                $("#stGrade").val(0);
                $("#stFrom").val(0);
                $("#proColeg").val("");
                $("#cmsTeac").val("");
                $("#stMother").val("");
                $("#motCell").val("");
                $("#motEmail").val("");
                $("#stFather").val("");
                $("#fatCell").val("");
                $("#fatEmail").val("");
                $("#stId").val("");
                $("#stFotoName").val("");
                $("#Allerg").val("");
                $("#AuthMed").val("");
                $("#EContact").val("");
                $("#EmBus").prop("checked", false);


                document.getElementById("dvFoto").innerHTML = '<img src="ImgFolder/fotoP.jpg" class="thumbnail" style="width: 150px; cursor: pointer;" />';
                modifica = 0;
            });

            $("#btnStSave").click(function (e) {
                e.preventDefault();
                if ($("#stName").val() != "" && $("#stGrade").val() != 0 && $("#stFrom").val() != 0) {
                    var valores = "";
                    valores += $("#stName").val() + '|';
                    valores += $("#stLastName").val() + '|';
                    valores += $("#stAge").val() + '|';
                    valores += $("#stGrade").val() + '|';
                    valores += $("#stFrom").val() + '|';
                    valores += $("#proColeg").val() + '|';
                    valores += $("#cmsTeac").val() + '|';
                    valores += $("#stFotoName").val() + '|';
                    valores += $("#stMother").val() + '|';
                    valores += $("#motCell").val() + '|';
                    valores += $("#motEmail").val() + '|';
                    valores += $("#stFather").val() + '|';
                    valores += $("#fatCell").val() + '|';
                    valores += $("#fatEmail").val() + '|';
                    valores += $("#stState").val() + '|';
                    valores += $("#Allerg").val() + '|';
                    valores += $("#AuthMed").val() + '|';
                    valores += $("#EContact").val() + '|';

                    if ($("#EmBus").prop("checked")) {
                        $("#EmBus").val(1)
                    } else { $("#EmBus").val(0) }
                    valores += $("#EmBus").val() + '|';
                    valores += $("#stId").val() + '|';

                    saveSt(valores, modifica);
                } else {
                    alert("Fields requiered!");
                }
            });

            //$("#stTbody").on('click', '.strem', function () {
            //    var id = this.id.split('_')[1];
            //    DelSt(id);
            //});

            //end Student Events


            //start Graces Events
            $("#grali").click(function () {
                graTable();
                modifica = 0;
            });

            $("#graTbody").on('click', '.graloa', function () {
                var id = this.id.split('_')[1];
                getGra(id);
            });

            $("#btnGraClear").click(function (e) {
                e.preventDefault();
                $("#Grade").val("");
                $("#graId").val("");
                modifica = 0;
            });

            $("#btnGraSave").click(function (e) {
                e.preventDefault();
                if ($("#Grade").val() != "") {
                    var valores = "";
                    valores += $("#Grade").val() + '|';
                    valores += $("#graId").val() + '|';
                    saveGra(valores, modifica);
                    graTable();
                } else {
                    alert("The Grade is requiered!");
                    $("#Grade").focus();
                }
            });

            $("#graTbody").on('click', '.grarem', function () {
                var id = this.id.split('_')[1];
                Delgra(id);

            });
            //end Grades Events


            //start Activity Events
            $("#actli").click(function () {
                actTable();
                actTeachSelect();
                actCat();
                //actSchedSelect();
                modifica = 0;
            });

            $("#actTbody").on('click', '.actloa', function () {
                var id = this.id.split('_')[1];
                getAct(id);
                modifica = 1;

            });


            $("#btnActClear").click(function (e) {
                e.preventDefault();
                $("#actCat").val(0);
                $("#Activity").val("");
                $("#actGrade").val("");
                $("#actPrice").val("");
                $("#actTeach").val(0);
                $("#actId").val("");
                modifica = 0;
            });

            $("#btnActSave").click(function (e) {
                e.preventDefault();
                if ($("#Activity").val() != "") {
                    var valores = "";
                    valores += $("#actCat").val() + '|';
                    valores += $("#Activity").val() + '|';
                    valores += $("#actGrade").val() + '|';
                    valores += $("#actPrice").val() + '|';
                    valores += $("#actTeach").val() + '|';
                    valores += $("#actId").val() + '|';
                    saveAct(valores, modifica);
                    actTable();
                } else {
                    alert("The Activity is requiered!");
                    $("#Activity").focus();
                }
            });

            $("#actTbody").on('click', '.actrem', function () {
                var id = this.id.split('_')[1];
                DelAct(id);

            });
            //end Activity Events

            //start Teacher Events
            $("#teali").click(function () {
                teaTable();
                modifica = 0;
            });

            $("#teaTbody").on('click', '.tealoa', function () {
                var id = this.id.split('_')[1];
                getTea(id);

            });

            
           

            $("#teabtnClear").click(function (e) {
                e.preventDefault();
                $("#teaName").val("");
                $("#teaContact").val("");
                $("#teaMail").val("");
                $("#teaId").val("");
                modifica = 0;
            });

            $("#teabtnSave").click(function (e) {
                e.preventDefault();
                if ($("#teaName").val() != "") {
                    var valores = "";
                    valores += $("#teaName").val() + '|';
                    valores += $("#teaContact").val() + '|';
                    valores += $("#teaMail").val() + '|';
                    valores += $("#teaId").val() + '|';
                    saveTea(valores, modifica);
                    teaTable();
                } else {
                    alert("The Teacher's Name is requiered!");
                    $("#teaName").focus();
                }
            });

            $("#teaTbody").on('click', '.tearem', function () {
                var id = this.id.split('_')[1];
                DelTea(id);
            });
            //end Teacher Events

            //start Schedule Events
            $("#schli").click(function () {
                schTable();
                ddlshortday();
            });

            $("#scTbody").on('click', '.loa', function () {
                var id = this.id.split('_')[1];
                getsch(id);

            });

            $("#btnClear").click(function (e) {
                e.preventDefault();
                $("#actDay").val("");
                $("#scShortDay").val(0);
                $("#actTime").val("");
                $("#schId").val("");
                modifica = 0;
            });

            $("#btnSch").click(function (e) {
                e.preventDefault();
                if ($("#actDay").val() != "") {
                    var valores = "";
                    valores += $("#actDay").val() + '|';
                    valores += $("#scShortDay").val() + '|';
                    valores += $("#actTime").val() + '|';
                    valores += $("#schId").val() + '|';
                    saveSch(valores, modifica);
                    schTable();
                } else {
                    alert("The Activity Day is requiered!");
                    $("#actDay").focus();
                }
            });

            $("#scTbody").on('click', '.rem', function () {
                var id = this.id.split('_')[1];
                Delsch(id);

            });
            //end Schedule Events

            //act sched block
            $("#actSchli").click(function () {
                actschTable();
                ddlTeachersc();
                ddlActivitysc();
                ddlSchedsc();
            });

            $("#actscTbody").on('click', '.loa', function () {
                var id = this.id.split('_')[1];
                getatsch(id);

            });

            $("#btnActScClear").click(function (e) {
                e.preventDefault();
                $("#actisc").val(0);
                $("#ddlactSched").val(0);
                $("#actscTea").val(0);
                $("#actscId").val("");
                modifica = 0;
            });

           

            $("#btnActScSave").click(function (e) {
                e.preventDefault();

                if ($("#actisc").val() != 0) {
                    var valores = "";

                    valores += $("#actisc").val() + '|';
                    valores += $("#ddlactSched").val() + '|';
                    valores += $("#actscTea").val() + '|';
                    valores += $("#actscId").val() + '|';
                    saveactSch(valores, modifica);
                    actschTable();
                } else {
                    alert("The Activity is requiered!");
                    $("#actisc").focus();
                }
            });

            $("#actscTbody").on('click', '.rem', function () {
                var id = this.id.split('_')[1];
                Delactsch(id);

            });
            //end act sched block
        });


        function getactid(idst, dat) {
            var retorna = "";
            var param = "'idstu':" + idst + ",'dati':'" + dat + "'";
            $.ajax({
                type: "POST",
                async:false,
                url: "CheckInOut.aspx/getactid",
                data: "{" + param + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var m = response.d;
                    if (m != '') {
                        retorna = m;
                    }
                    return false;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Respuesta = " + XMLHttpRequest.responseText + "\n Estatus = " + textStatus + "\n Error = " + errorThrown);
                }
            });
            return retorna;
        }

        
        //fill select functions
        function stSelect() {
            $.ajax({
                type: "POST",
                async: false,
                url: "CheckInOut.aspx/stSelect",
                // data: "{" + param + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var m = response.d;
                    if (m != '') {
                        var tbg = "";
                        var h = m.split('^');
                        tbg += '<option value="0">--Select Student--</option>';
                        for (var i = 0; i < h.length - 1; i++) {
                            var b = h[i].split('|');
                            tbg += '<option value="' + b[0] + '">' + b[2] +', '+b[1]+ '</option>';
                        }
                        document.getElementById("stList").innerHTML = tbg;
                    }
                    return false;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Respuesta = " + XMLHttpRequest.responseText + "\n Estatus = " + textStatus + "\n Error = " + errorThrown);
                }
            });
        }


        function ddlwteac() {
            var tbg = '';
            $.ajax({
                type: "POST",
                async: false,
                url: "CheckInOut.aspx/ddlwteac",
                // data: "{" + param + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var m = response.d;
                    if (m != '') {
                        var x = m.split('|');
                        tbg += '<option value="0">--Select--</option>';
                        for (var i = 0; i < x.length - 1; i++) {
                            tbg += '<option >' + x[i] + '</option>';
                        }
                        document.getElementById("ddlwateac").innerHTML = tbg;
                    }
                    return false;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Respuesta = " + XMLHttpRequest.responseText + "\n Estatus = " + textStatus + "\n Error = " + errorThrown);
                }
            });
        }

        function ddlwActivity() {
            var tbg = '';
            $.ajax({
                type: "POST",
                async: false,
                url: "CheckInOut.aspx/actiSelect",
                // data: "{" + param + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var m = response.d;
                    if (m != '') {
                        var h = m.split('^');
                        tbg += '<option value="0">--Select Activity--</option>';
                        for (var i = 0; i < h.length - 1; i++) {
                            var b = h[i].split('|');
                            tbg += '<option value="' + b[0] + '">' + b[1] + '</option>';
                        }
                        document.getElementById("ddlwaActivity").innerHTML = tbg;
                    }
                    return false;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Respuesta = " + XMLHttpRequest.responseText + "\n Estatus = " + textStatus + "\n Error = " + errorThrown);
                }
            });
        }
        function ddlwSched() {
            var tbg = '';
            $.ajax({
                type: "POST",
                async: false,
                url: "CheckInOut.aspx/actSchedSelect",
                // data: "{" + param + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var m = response.d;
                    if (m != '') {
                        var h = m.split('^');
                        tbg += '<option value="0">--Select Schedule--</option>';
                        for (var i = 0; i < h.length - 1; i++) {
                            var b = h[i].split('|');
                            if (b[2] != "") {
                                tbg += '<option value="' + b[0] + '">' + b[2] + ' ' + b[3] + '</option>';
                            } else { tbg += '<option value="' + b[0] + '">' + b[1] + ' ' + b[3] + '</option>'; }

                        }
                        document.getElementById("ddlwaSched").innerHTML = tbg;
                    }
                    return false;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Respuesta = " + XMLHttpRequest.responseText + "\n Estatus = " + textStatus + "\n Error = " + errorThrown);
                }
            });
        }

        function actCat() {
            var tbg = '';
            $.ajax({
                type: "POST",
                async: false,
                url: "CheckInOut.aspx/actCat",
                // data: "{" + param + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var m = response.d;
                    if (m != '') {
                        var h = m.split('^');
                        tbg += '<option value="0">--Select Teacher--</option>';
                        for (var i = 0; i < h.length - 1; i++) {
                            var b = h[i].split('|');
                            tbg += '<option value="' + b[0] + '">' + b[1] + '</option>';
                        }
                        document.getElementById("actCat").innerHTML = tbg;
                    }
                    return false;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Respuesta = " + XMLHttpRequest.responseText + "\n Estatus = " + textStatus + "\n Error = " + errorThrown);
                }
            });
        }

        function ddlTeachersc() {
            var tbg = '';
            $.ajax({
                type: "POST",
                async: false,
                url: "CheckInOut.aspx/actTeachSelect",
                // data: "{" + param + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var m = response.d;
                    if (m != '') {
                        var h = m.split('^');
                        tbg += '<option value="0">--Select Teacher--</option>';
                        for (var i = 0; i < h.length - 1; i++) {
                            var b = h[i].split('|');
                            tbg += '<option value="' + b[0] + '">' + b[1] + '</option>';
                        }
                        document.getElementById("actscTea").innerHTML = tbg;
                    }
                    return false;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Respuesta = " + XMLHttpRequest.responseText + "\n Estatus = " + textStatus + "\n Error = " + errorThrown);
                }
            });
        }

        function ddlActivitysc() {
            var tbg = '';
            $.ajax({
                type: "POST",
                async: false,
                url: "CheckInOut.aspx/actiSelect",
                // data: "{" + param + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var m = response.d;
                    if (m != '') {
                        var h = m.split('^');
                        tbg += '<option value="0">--Select Activity--</option>';
                        for (var i = 0; i < h.length - 1; i++) {
                            var b = h[i].split('|');
                            tbg += '<option value="' + b[0] + '">' + b[1] + '</option>';
                        }
                        document.getElementById("actisc").innerHTML = tbg;
                    }
                    return false;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Respuesta = " + XMLHttpRequest.responseText + "\n Estatus = " + textStatus + "\n Error = " + errorThrown);
                }
            });
        }
        function ddlSchedsc() {
            var tbg = '';
            $.ajax({
                type: "POST",
                async: false,
                url: "CheckInOut.aspx/actSchedSelect",
                // data: "{" + param + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var m = response.d;
                    if (m != '') {
                        var h = m.split('^');
                        tbg += '<option value="0">--Select Schedule--</option>';
                        for (var i = 0; i < h.length - 1; i++) {
                            var b = h[i].split('|');
                            tbg += '<option value="' + b[0] + '">' + b[2] + ' ' + b[3] + '</option>';
                        }
                        document.getElementById("ddlactSched").innerHTML = tbg;
                    }
                    return false;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Respuesta = " + XMLHttpRequest.responseText + "\n Estatus = " + textStatus + "\n Error = " + errorThrown);
                }
            });
        }
        function ddlTeacher() {
            var tbg = '';
            $.ajax({
                type: "POST",
                async: false,
                url: "CheckInOut.aspx/actTeachSelect",
                // data: "{" + param + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var m = response.d;
                    if (m != '') {
                        var h = m.split('^');
                        tbg += '<option value="0">--Select Teacher--</option>';
                        for (var i = 0; i < h.length - 1; i++) {
                            var b = h[i].split('|');
                            tbg += '<option value="' + b[0] + '">' + b[1] + '</option>';
                        }
                        document.getElementById("ddlTeacher").innerHTML = tbg;
                    }
                    return false;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Respuesta = " + XMLHttpRequest.responseText + "\n Estatus = " + textStatus + "\n Error = " + errorThrown);
                }
            });
        }
        function ddlActivity() {
            var tbg = '';
            $.ajax({
                type: "POST",
                async: false,
                url: "CheckInOut.aspx/actiSelect",
                // data: "{" + param + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var m = response.d;
                    if (m != '') {
                        var h = m.split('^');
                        tbg += '<option value="0">--Select Activity--</option>';
                        for (var i = 0; i < h.length - 1; i++) {
                            var b = h[i].split('|');
                            tbg += '<option value="' + b[0] + '">' + b[1] + '</option>';
                        }
                        document.getElementById("ddlActivity").innerHTML = tbg;
                    }
                    return false;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Respuesta = " + XMLHttpRequest.responseText + "\n Estatus = " + textStatus + "\n Error = " + errorThrown);
                }
            });
        }
        function ddlgral() {
            var tbg = '';
            $.ajax({
                type: "POST",
                async: false,
                url: "CheckInOut.aspx/ddlshortday",
                // data: "{" + param + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var m = response.d;
                    if (m != '') {
                        var h = m.split('^');
                        tbg += '<option value="0">--Select--</option>';
                        for (var i = 0; i < h.length - 1; i++) {
                            var b = h[i].split('|');
                            tbg += '<option value="' + b[0] + '">' + b[1] + '</option>';
                        }
                        document.getElementById("chShortDay").innerHTML = tbg;
                    }
                    return false;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Respuesta = " + XMLHttpRequest.responseText + "\n Estatus = " + textStatus + "\n Error = " + errorThrown);
                }
            });
        }

        function ddlSched() {
            var tbg = '';
            $.ajax({
                type: "POST",
                async: false,
                url: "CheckInOut.aspx/actSchedSelect",
                // data: "{" + param + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var m = response.d;
                    if (m != '') {
                        var h = m.split('^');
                        tbg += '<option value="0">--Select Schedule--</option>';
                        for (var i = 0; i < h.length - 1; i++) {
                            var b = h[i].split('|');
                            if (b[2] != "") {
                                tbg += '<option value="' + b[0] + '">' + b[2] + ' ' + b[3] + '</option>';
                            } else { tbg += '<option value="' + b[0] + '">' + b[1] + ' ' + b[3] + '</option>'; }

                        }
                        document.getElementById("ddlSched").innerHTML = tbg;
                    }
                    return false;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Respuesta = " + XMLHttpRequest.responseText + "\n Estatus = " + textStatus + "\n Error = " + errorThrown);
                }
            });
        }
        function RollSelect() {
            var tbg = '';
            $.ajax({
                type: "POST",
                async: false,
                url: "CheckInOut.aspx/RollSelect",
                // data: "{" + param + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var m = response.d;
                    if (m != '') {
                        var h = m.split('^');
                        tbg += '<option value="0">--Select--</option>';
                        for (var i = 0; i < h.length - 1; i++) {
                            var b = h[i].split('|');
                            tbg += '<option value="' + b[0] + '">' + b[1] + ',' + b[2] + '</option>';
                        }
                        document.getElementById("usRoll").innerHTML = tbg;
                    }
                    return false;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Respuesta = " + XMLHttpRequest.responseText + "\n Estatus = " + textStatus + "\n Error = " + errorThrown);
                }
            });
        }
        function actiSchSelect(scid) {
            var param = "'actid':" + scid + "";
            var tbg = '';
            $.ajax({
                type: "POST",
                async: false,
                url: "CheckInOut.aspx/actiSchSelect",
                data: "{" + param + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var m = response.d;
                    if (m != '') {
                        var h = m.split('^');
                        tbg += '<option value="0">--Select--</option>';
                        for (var i = 0; i < h.length - 1; i++) {
                            var b = h[i].split('|');
                            tbg += '<option value="' + b[0] + '">' + b[1] + ' ' + b[2] + '</option>';
                        }
                        document.getElementById("stSched").innerHTML = tbg;
                    }
                    return false;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Respuesta = " + XMLHttpRequest.responseText + "\n Estatus = " + textStatus + "\n Error = " + errorThrown);
                }
            });
        }
        function actiSelect() {
            var tbg = '';
            $.ajax({
                type: "POST",
                async: false,
                url: "CheckInOut.aspx/actiSelect",
                // data: "{" + param + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var m = response.d;
                    if (m != '') {
                        var h = m.split('^');
                        tbg += '<option value="0">--Select--</option>';
                        for (var i = 0; i < h.length - 1; i++) {
                            var b = h[i].split('|');
                            tbg += '<option value="' + b[0] + '">' + b[1] + '</option>';
                        }
                        document.getElementById("stActiSelect").innerHTML = tbg;
                    }
                    return false;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Respuesta = " + XMLHttpRequest.responseText + "\n Estatus = " + textStatus + "\n Error = " + errorThrown);
                }
            });
        }
        function stFromSelect() {
            var tbg = '';
            $.ajax({
                type: "POST",
                async: false,
                url: "CheckInOut.aspx/stFromSelect",
                // data: "{" + param + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var m = response.d;
                    if (m != '') {
                        var h = m.split('^');
                        tbg += '<option value="0">--Select--</option>';
                        for (var i = 0; i < h.length - 1; i++) {
                            var b = h[i].split('|');
                            tbg += '<option value="' + b[0] + '">' + b[1] + '</option>';
                        }
                        document.getElementById("stFrom").innerHTML = tbg;
                    }
                    return false;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Respuesta = " + XMLHttpRequest.responseText + "\n Estatus = " + textStatus + "\n Error = " + errorThrown);
                }
            });
        }
        function stGraSelect() {
            var tbg = '';
            $.ajax({
                type: "POST",
                async: false,
                url: "CheckInOut.aspx/stGraSelect",
                // data: "{" + param + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var m = response.d;
                    if (m != '') {
                        var h = m.split('^');
                        tbg += '<option value="0">--Select--</option>';
                        for (var i = 0; i < h.length - 1; i++) {
                            var b = h[i].split('|');
                            tbg += '<option value="' + b[0] + '">' + b[1] + '</option>';
                        }
                        document.getElementById("stGrade").innerHTML = tbg;
                    }
                    return false;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Respuesta = " + XMLHttpRequest.responseText + "\n Estatus = " + textStatus + "\n Error = " + errorThrown);
                }
            });
        }
        function stStateSelect() {
            var tbg = '';
            $.ajax({
                type: "POST",
                async: false,
                url: "CheckInOut.aspx/stStateSelect",
                // data: "{" + param + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var m = response.d;
                    if (m != '') {
                        var h = m.split('^');
                        for (var i = 0; i < h.length - 1; i++) {
                            var b = h[i].split('|');
                            tbg += '<option value="' + b[0] + '">' + b[1] + '</option>';
                        }
                        document.getElementById("stState").innerHTML = tbg;
                    }
                    return false;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Respuesta = " + XMLHttpRequest.responseText + "\n Estatus = " + textStatus + "\n Error = " + errorThrown);
                }
            });
        }
        function StateSelect() {
            var tbg = '';
            $.ajax({
                type: "POST",
                async: false,
                url: "CheckInOut.aspx/stStateSelect",
                // data: "{" + param + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var m = response.d;
                    if (m != '') {
                        var h = m.split('^');
                        for (var i = 0; i < h.length - 1; i++) {
                            var b = h[i].split('|');
                            tbg += '<option value="' + b[0] + '">' + b[1] + '</option>';
                        }
                        document.getElementById("stStat").innerHTML = tbg;
                    }
                    return false;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Respuesta = " + XMLHttpRequest.responseText + "\n Estatus = " + textStatus + "\n Error = " + errorThrown);
                }
            });
        }
        function actTeachSelect() {
            var tbg = '';
            $.ajax({
                type: "POST",
                async: false,
                url: "CheckInOut.aspx/actTeachSelect",
                // data: "{" + param + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var m = response.d;
                    if (m != '') {
                        var h = m.split('^');
                        tbg += '<option value="0">--Select--</option>';
                        for (var i = 0; i < h.length - 1; i++) {
                            var b = h[i].split('|');
                            tbg += '<option value="' + b[0] + '">' + b[1] + '</option>';
                        }
                        document.getElementById("actTeach").innerHTML = tbg;
                    }
                    return false;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Respuesta = " + XMLHttpRequest.responseText + "\n Estatus = " + textStatus + "\n Error = " + errorThrown);
                }
            });
        }
        function actSchedSelect() {
            var tbg = '';
            $.ajax({
                type: "POST",
                async: false,
                url: "CheckInOut.aspx/actSchedSelect",
                // data: "{" + param + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var m = response.d;
                    if (m != '') {
                        var h = m.split('^');
                        tbg += '<option value="0">--Select--</option>';
                        for (var i = 0; i < h.length - 1; i++) {
                            var b = h[i].split('|');
                            if (b[2] != "") {
                                tbg += '<option value="' + b[0] + '">' + b[2] + ' ' + b[3] + '</option>';
                            } else { tbg += '<option value="' + b[0] + '">' + b[1] + ' ' + b[3] + '</option>'; }

                        }
                        document.getElementById("actSched").innerHTML = tbg;
                    }
                    return false;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Respuesta = " + XMLHttpRequest.responseText + "\n Estatus = " + textStatus + "\n Error = " + errorThrown);
                }
            });
        }
        function ddlshortday() {
            var tbg = '';
            $.ajax({
                type: "POST",
                async: false,
                url: "CheckInOut.aspx/ddlshortday",
                // data: "{" + param + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var m = response.d;
                    if (m != '') {
                        var h = m.split('^');
                        tbg += '<option value="0">--Select--</option>';
                        for (var i = 0; i < h.length - 1; i++) {
                            var b = h[i].split('|');
                            tbg += '<option value="' + b[0] + '">' + b[1] + '</option>';
                        }
                        document.getElementById("scShortDay").innerHTML = tbg;
                    }
                    return false;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Respuesta = " + XMLHttpRequest.responseText + "\n Estatus = " + textStatus + "\n Error = " + errorThrown);
                }
            });
        }

        //fill select functions

        function chkAssist(dt) {
            var param = "'dat':'" + dt + "'";
            $.ajax({
                type: "POST",
                async: false,
                url: "CheckInOut.aspx/chkAssist",
                data: "{" + param + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var m = response.d;
                    if (m != '') {
                        var valua = "";
                        var b = m.split('^');
                        for (var i = 0; i < b.length - 1; i++) {
                            var c = b[i].split('|');

                            $('#chkTbody tr').each(function (index, element) {
                                if ($(element).find("td").eq(0).html() == c[0]) {
                                    if (c[2] == 1) {
                                        $(":checkbox:eq(0)", this).attr("checked", "checked");
                                    }
                                    if (c[3] == 1) {
                                        $(":checkbox:eq(1)", this).attr("checked", "checked");
                                    }
                                    if (c[4] == 1) {
                                        $(":checkbox:eq(2)", this).attr("checked", "checked");
                                    }
                                    if (c[5] == 1) {
                                        $(":checkbox:eq(3)", this).attr("checked", "checked");
                                    }
                                }

                            });
                        }

                    }
                    return false;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Respuesta = " + XMLHttpRequest.responseText + "\n Estatus = " + textStatus + "\n Error = " + errorThrown);
                }
            });


        }

        //start photoupload
        function PhotoUp() {
            var files = $("#stPhoto")[0].files;
            if (files.length > 0) {
                var formData = new FormData();
                for (var i = 0; i < files.length; i++) {
                    formData.append(files[i].name, files[i]);
                }

                $.ajax({
                    url: 'Scripts/UploadHandler.ashx',
                    async: false,
                    method: 'post',
                    data: formData,
                    contentType: false,
                    processData: false,
                    success: function (response) {
                        $("#stFotoName").val(response);
                        document.getElementById("dvFoto").innerHTML = '<img src="ImgFolder/' + response + '" class="thumbnail" style="width: 150px; cursor: pointer;" />';
                    },
                    error: function (err) {
                        alert(err.statusText);
                    }
                });

            }
        }
        // end photoupload

        //start workarea block
        function getparentemail() {
            var Pemails = "";
            var tblenth = $('#waTbody').length;
            var co = 0;
            $('#waTbody tr').each(function (index, element) {
                if (!$(element).find("td").eq(3).html() == "") {
                    Pemails += $(element).find("td").eq(3).html() + '|';
                }
                if (!$(element).find("td").eq(4).html() == "") {
                    Pemails += $(element).find("td").eq(4).html() + '^';
                }
                if (co == tblenth) {
                    return false;
                }
                co += 1;
            });
            return Pemails;

        }
        function unique(list) {
            var result = [];
            $.each(list, function (i, e) {
                if ($.inArray(e, result) == -1) result.push(e);
            });
            return result;
        }

        function getteacheremail() {
            var Pemails = "";
            var tblenth = $('#waTbody tr').length;
            var co = 0;
            $('#waTbody tr').each(function (index, element) {
                if (!$(element).find("td").eq(5).html() == "") {
                    Pemails += $(element).find("td").eq(5).html() + '|';
                }
                if (co == tblenth) {
                    return false;
                }
                co += 1;
            });
            return Pemails;

        }

        function teaStu(ca) {
            var Pemails = "";
            var tblenth = $('#waTbody tr').length;
            var co = 0;

            $('#waTbody tr').each(function (index, element) {

                if (ca == $(element).find("td").eq(5).html()) {
                    Pemails += $(element).find("td").eq(0).html() + ', ' + $(element).find("td").eq(1).html() + ', ' + $(element).find("td").eq(2).html()+ '|';
                }

                if (co == tblenth) {
                    return false;
                }
                co += 1;
            });

            return Pemails;

        }

        function GetSecdata() {
            var Pemails = "";
            var tblenth = $('#waTbody tr').length;
            var co = 0;
            $('#waTbody tr').each(function (index, element) {
                Pemails += $(element).find("td").eq(0).html() + '|';
                Pemails += $(element).find("td").eq(1).html() + '|';
                Pemails += $(element).find("td").eq(2).html() + '|';
                Pemails += $(element).find("td").eq(3).html() + '|';
                Pemails += $(element).find("td").eq(4).html() + '|';
                Pemails += $(element).find("td").eq(5).html() + '^';
                if (co == tblenth) {
                    return false;
                }
                co += 1;
            });
            return Pemails;

        }

        function wafiltra(valis) {
            var param = "'vals':'" + valis + "'";
            $.ajax({
                type: "POST",
                async: false,
                url: "CheckInOut.aspx/wafiltra",
                data: "{" + param + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var m = response.d;
                    if (m != '') {
                        var valua = "";
                        var b = m.split('^');
                        for (var i = 0; i < b.length - 1; i++) {
                            var c = b[i].split('|');
                            valua += '<tr style="background-color:#ffa94d;">';
                            valua += '<td>' + c[0] + ' ' + c[1] + '</td>';
                            valua += '<td>' + c[2] + '</td>';
                            if (c[4] != "") {
                                valua += '<td>' + c[4] + ' ' + c[5] + '</td>';
                            } else {
                                valua += '<td>' + c[3] + ' ' + c[5] + '</td>';
                            }
                            valua += '<td>' + c[7] + '</td>';
                            valua += '<td>' + c[8] + '</td>';
                            valua += '<td>' + c[6] + '</td>';
                            valua += '</tr>';
                        }

                        document.getElementById("waTbody").innerHTML = valua;

                    } else {
                        document.getElementById("waTbody").innerHTML = "";
                    }
                    return false;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Respuesta = " + XMLHttpRequest.responseText + "\n Estatus = " + textStatus + "\n Error = " + errorThrown);
                }
            });
        }

        function sendTea(tea, mens) {
            var param = "'datos':'" + tea + "','teamen':'" + mens + "'";
            $.ajax({
                type: "POST",
                url: "CheckInOut.aspx/sendTea",
                data: "{" + param + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var m = response.d;
                    if (m == '1') {
                        alert("Message sent to Teachers!");
                        $("#cmsteaclose").focus().click();
                    } else {
                        alert(m);
                    }
                    return false;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Respuesta = " + XMLHttpRequest.responseText + "\n Estatus = " + textStatus + "\n Error = " + errorThrown);
                }
            });
        }

        function sendSec(secD, SecE) {
            var param = "'secD':'" + secD + "','SecE':'" + SecE + "'";
            $.ajax({
                type: "POST",
                url: "CheckInOut.aspx/sendSec",
                data: "{" + param + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var m = response.d;
                    if (m == '1') {
                        alert("Message sent!");
                        $("#secClose").focus().click();
                    } else {
                        alert(m);
                    }
                    return false;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Respuesta = " + XMLHttpRequest.responseText + "\n Estatus = " + textStatus + "\n Error = " + errorThrown);
                }
            });
        }

        function sendParents(dat, sub) {
            var param = "'datos':'" + dat + "','subj':'" + sub + "'";
            $.ajax({
                type: "POST",
                url: "CheckInOut.aspx/sendParents",
                data: "{" + param + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var m = response.d;
                    if (m == '1') {
                        alert("Message sent!");
                        $("#modclose").focus().click();
                    } else {
                        alert(m);
                    }
                    return false;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Respuesta = " + XMLHttpRequest.responseText + "\n Estatus = " + textStatus + "\n Error = " + errorThrown);
                }
            });
        }

        function validateEmail(email) {
            var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
            return re.test(email);
        }
        //end workarea block


        // start checkinout block

        
        function savObser(stidn) {
            var param = "'stid':'" + stidn + "'";
            $.ajax({
                type: "POST",
                async: false,
                url: "CheckInOut.aspx/savObser",
                data: "{" + param + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var m = response.d;
                    if (m != '-1') {
                        ObserT(); //stNote(stidn.split('|')[0]);
                    }
                    return false;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Respuesta = " + XMLHttpRequest.responseText + "\n Estatus = " + textStatus + "\n Error = " + errorThrown);
                }
            });
        }

        function svaNotes(stidn) {
            var param = "'stid':'" + stidn + "'";
            $.ajax({
                type: "POST",
                async: false,
                url: "CheckInOut.aspx/svaNotes",
                data: "{" + param + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var m = response.d;
                    if (m != '-1') {
                        stNote(stidn.split('|')[0]);
                    }
                    return false;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Respuesta = " + XMLHttpRequest.responseText + "\n Estatus = " + textStatus + "\n Error = " + errorThrown);
                }
            });
        }

        function traeSelect(id) {
            var param = "'stid':'" + id + "'";
            $.ajax({
                type: "POST",
                async: false,
                url: "CheckInOut.aspx/traeSelect",
                data: "{" + param + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var m = response.d;
                    if (m != '') {
                        var valua = "";
                        var b = m.split('^');
                        var total=0;
                        for (var i = 0; i < b.length - 1; i++) {
                            var c = b[i].split('|');
                            valua += '<tr>';
                            valua += '<td>' + c[3] + '</td>';
                            valua += '<td>' + c[4] + '</td>';
                            valua += '<td>' + c[5] + '</td>';
                            valua += '<td>' + c[6] + '</td>';
                            valua += '<td>' + c[7] + '</td>';
                            valua += '</tr>';
                            total += parseInt(c[7].replace(/,/g, ''));
                            
                        }
                        total = digits(total);
                        valua += '<tr><td colspan=5>RD$' + total + '</td></tr>';
                        document.getElementById("RegBody").innerHTML = valua;
                    }
                    return false;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Respuesta = " + XMLHttpRequest.responseText + "\n Estatus = " + textStatus + "\n Error = " + errorThrown);
                }
            });
        }

        function digits(algo) {
            algo.test.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,");
            return algo;
        }

        function ObserT() {
            $.ajax({
                type: "POST",
                async: false,
                url: "CheckInOut.aspx/ObserT",
                //data: "{" + param + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var m = response.d;
                    if (m != '') {
                        var valua = "";
                        var b = m.split('^');
                        for (var i = 0; i < b.length - 1; i++) {
                            var c = b[i].split('|');
                            valua += '<tr id="' + c[3] + '" class="lObserv" style="cursor:pointer;">';
                            valua += '<td>' + c[0] + '</td>';
                            valua += '<td>' + c[1] + '</td>';
                            valua += '<td>' + c[2] + '</td>';
                            valua += '</tr>';
                        }
                        document.getElementById("ObservTbody").innerHTML = valua;
                        $("#ObsModal").modal('show');

                    } else {
                        document.getElementById("ObservTbody").innerHTML = "";
                        $("#ObsModal").modal('show');
                    }
                    return false;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Respuesta = " + XMLHttpRequest.responseText + "\n Estatus = " + textStatus + "\n Error = " + errorThrown);
                }
            });

        }
        function getObserv(idobs) {
            var param = "'idob':" + idobs + "";
            $.ajax({
                type: "POST",
                async: false,
                url: "CheckInOut.aspx/getObserv",
                data: "{" + param + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var m = response.d;
                    if (m != '') {
                        var c = m.split('|');
                        $("#txtObser").val(c[0]);
                            $("#Obserid").val(c[1])
                    }
                    return false;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Respuesta = " + XMLHttpRequest.responseText + "\n Estatus = " + textStatus + "\n Error = " + errorThrown);
                }
            });
        }

        function stNote(stid) {
            $("#stidN").val(stid);
            $("#stNote").val("");
            var param = "'stnotid':" + stid + "";
            $.ajax({
                type: "POST",
                async: false,
                url: "CheckInOut.aspx/stNote",
                data: "{" + param + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var m = response.d;
                    if (m != '') {
                        var valua = "";
                        var b = m.split('^');
                        for (var i = 0; i < b.length - 1; i++) {
                            var c = b[i].split('|');
                            valua += '<tr>';
                            valua += '<td>' + c[1] + '</td>';
                            valua += '<td>' + c[2] + '</td>';
                            valua += '</tr>';
                        }
                        document.getElementById("stNotTbody").innerHTML = valua;
                        $("#stModal").modal('show');

                    } else {
                        document.getElementById("stNotTbody").innerHTML = "";
                        $("#stModal").modal('show');
                    }
                    return false;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Respuesta = " + XMLHttpRequest.responseText + "\n Estatus = " + textStatus + "\n Error = " + errorThrown);
                }
            });

        }
        function savechk(id, values,ed) {
            var param = "'chkvals':'" + values + "','idchk':'" + id + "','edi':'" + ed + "'";
            $.ajax({
                type: "POST",
                async: false,
                url: "CheckInOut.aspx/savechk",
                data: "{" + param + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var m = response.d;
                    if (m != '') {
                    }
                    return false;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Respuesta = " + XMLHttpRequest.responseText + "\n Estatus = " + textStatus + "\n Error = " + errorThrown);
                }
            });

        }

        function bigpict(pict) {
            document.getElementById("bpict").innerHTML = '<img src="' + pict.src + '" class="thumbnail" style="width:95%;" />';
            $("#pictModal").modal('show');
        }

        function filtra(ddl) {
            edita = 0;
            var param = "'vals':'" + ddl + "'";
            $.ajax({
                type: "POST",
                async: false,
                url: "CheckInOut.aspx/filtra",
                data: "{" + param + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var m = response.d;
                    var valua = "";
                    var cout = 0;
                    if (m != '') {
                        var chk = m.split('&')[1].split('^');
                        var b = m.split('&')[0].split('^');
                        for (var i = 0; i < b.length - 1; i++) {
                            var c = b[i].split('|');

                            valua += '<tr id="' + c[8] + '" style="background-color:#ffa94d;">';
                            if (c[7] != "") {
                                valua += '<td style="display:none;">' + c[0] + '</td><td><img src="ImgFolder/' + c[7] + '" class="thumbnail" onclick="bigpict(this);" style="width:50px;" /></td>';
                            } else {
                                valua += '<td style="display:none;">' + c[0] + '</td><td><img src="ImgFolder/fotoP.jpg" class="thumbnail" style="width:50px;" /></td>';
                            }
                            valua += '<td>' + c[1] + ' ' + c[2] + '</td>';
                            valua += '<td>' + c[3] + '</td>';
                            if (c[5] != "") {
                                valua += '<td>' + c[5] + ' ' + c[6] + '</td>';
                            } else {
                                valua += '<td>' + c[4] + ' ' + c[5] + '</td>';
                            }
                            var j = "";
                            if (chk != "") {
                                for (var x = 0; x < chk.length - 1; x++) {
                                    var a = chk[x].split('|');
                                    if (a[0] == c[0]) {
                                        j = a[2] + ',' + a[3] + ',' + a[4] + ',' + a[5] + ',' + a[1];
                                    }
                                }
                                if (j != "") {
                                    var h = j.split(',');
                                    if (roll == 1 || roll == 4) {
                                        if (h[0] == 1) {
                                            valua += '<td><input type="checkbox" value="' + h[4] + '" id="chGrC_' + c[8] + '" checked class="chGrC" /></td>';
                                        } else {
                                            valua += '<td><input type="checkbox" value="' + h[4] + '" id="chGrC_' + c[8] + '" class="chGrC" /></td>';
                                        }
                                    } else {
                                        if (h[0] == 1) {
                                            valua += '<td><input type="checkbox" value="' + h[4] + '" id="chGrC_' + c[8] + '" class="chGrC" checked disabled="disabled" /></td>';
                                        } else {
                                            valua += '<td><input type="checkbox" value="' + h[4] + '" id="chGrC_' + c[8] + '" class="chGrC" disabled="disabled" /></td>';
                                        }
                                    }
                                    if (roll == 2 || roll == 4) {
                                        if (h[1] == 1) {
                                            valua += '<td><input type="checkbox" value="' + h[4] + '" id="chSup_' + c[8] + '" checked class="chSup" /></td>';
                                        } else {
                                            valua += '<td><input type="checkbox" value="' + h[4] + '" id="chSup_' + c[8] + '" class="chSup" /></td>';
                                        }
                                    } else {
                                        if (h[1] == 1) {
                                            valua += '<td><input type="checkbox" value="' + h[4] + '" id="chSup_' + c[8] + '" class="chSup" checked disabled="disabled" /></td>';
                                        } else {
                                            valua += '<td><input type="checkbox" value="' + h[4] + '" id="chSup_' + c[8] + '" class="chSup" disabled="disabled" /></td>';
                                        }
                                    }
                                    if (roll == 2 || roll == 3 || roll == 4) {
                                        if (h[2] == 1) {
                                            valua += '<td><input type="checkbox" value="' + h[4] + '" id="chteaC_' + c[8] + '" checked class="chteaC" /></td>';
                                        } else {
                                            valua += '<td><input type="checkbox" value="' + h[4] + '" id="chteaC_' + c[8] + '"  class="chteaC" /></td>';
                                        }
                                    }
                                    else {
                                        if (h[2] == 1) {
                                            valua += '<td><input type="checkbox" value="' + h[4] + '" id="chteaC_' + c[8] + '" checked class="chteaC" disabled="disabled" /></td>';
                                        } else {
                                            valua += '<td><input type="checkbox" value="' + h[4] + '" id="chteaC_' + c[8] + '" class="chteaC" disabled="disabled" /></td>';
                                        }

                                    }
                                    if (roll == 1 || roll == 4) {
                                        if (h[3] == 1) {
                                            valua += '<td><input type="checkbox" value="' + h[4] + '" id="chGrG_' + c[8] + '" checked class="chGrG" /></td>';
                                        } else {
                                            valua += '<td><input type="checkbox" value="' + h[4] + '" id="chGrG_' + c[8] + '" class="chGrG" /></td>';
                                        }
                                    } else {
                                        if (h[3] == 1) {
                                            valua += '<td><input type="checkbox" value="' + h[4] + '" id="chGrG_' + c[8] + '" class="chGrG " checked disabled="disabled" /></td>';
                                        } else {
                                            valua += '<td><input type="checkbox" value="' + h[4] + '" id="chGrG_' + c[8] + '" class="chGrG " disabled="disabled" /></td>';
                                        }
                                    }
                                }
                                else {
                                    if (roll == 1 || roll == 4) {
                                        valua += '<td><input type="checkbox" value="" id="chGrC_' + c[8] + '" class="chGrC" /></td>';
                                    } else {
                                        valua += '<td><input type="checkbox" Value="" id="chGrC_' + c[8] + '" class="chGrC" disabled="disabled" /></td>';
                                    }
                                    if (roll == 2 || roll == 4) {
                                        valua += '<td><input type="checkbox" value="" id="chSup_' + c[8] + '" class="chSup" /></td>';
                                    } else {
                                        valua += '<td><input type="checkbox" value="" id="chSup_' + c[8] + '" class="chSup" disabled="disabled" /></td>';
                                    }
                                    if (roll == 2 || roll == 3 || roll == 4) {
                                        valua += '<td><input type="checkbox" value="" id="chteaC_' + c[8] + '"  class="chteaC" /></td>';
                                    }
                                    else {
                                        valua += '<td><input type="checkbox" value="" id="chteaC_' + c[8] + '" class="chteaC" disabled="disabled" /></td>';
                                    }
                                    if (roll == 1 || roll == 4) {
                                        valua += '<td><input type="checkbox" value="" id="chGrG_' + c[8] + '" class="chGrG" /></td>';
                                    } else {
                                        valua += '<td><input type="checkbox" value="" id="chGrG_' + c[8] + '" class="chGrG " disabled="disabled" /></td>';
                                    }
                                }

                            } else {
                                if (roll == 1 || roll == 4) {
                                    valua += '<td><input type="checkbox" value="" id="chGrC_' + c[8] + '" class="chGrC" /></td>';
                                } else {
                                    valua += '<td><input type="checkbox" value="" id="chGrC_' + c[8] + '" class="chGrC" disabled="disabled" /></td>';
                                }
                                if (roll == 2 || roll == 4) {
                                    valua += '<td><input type="checkbox" value="" id="chSup_' + c[8] + '" class="chSup" /></td>';
                                } else {
                                    valua += '<td><input type="checkbox" value="" id="chSup_' + c[8] + '" class="chSup" disabled="disabled" /></td>';
                                }
                                if (roll == 2 || roll == 3 || roll == 4) {
                                    valua += '<td><input type="checkbox" value="" id="chteaC_' + c[8] + '"  class="chteaC" /></td>';
                                }
                                else {
                                    valua += '<td><input type="checkbox" value="" id="chteaC_' + c[8] + '" class="chteaC" disabled="disabled" /></td>';
                                }
                                if (roll == 1 || roll == 4) {
                                    valua += '<td><input type="checkbox" value="" id="chGrG_' + c[8] + '" class="chGrG" /></td>';
                                } else {
                                    valua += '<td><input type="checkbox" value="" id="chGrG_' + c[8] + '" class="chGrG " disabled="disabled" /></td>';
                                }

                            }

                            valua += '<td><a href="#" id="Note_' + c[08] + '" class="btn btn-success usNote">Notes</a><input type="text" id="st_' + c[08] + '" value="' + c[0] + '" style="display:none;" /></td>';
                            valua += '</tr>';
                            cout += 1;
                        }
                        
                        document.getElementById("stcount").innerHTML ="Total Students(<strong>"+cout+"</strong>)";
                        document.getElementById("chkTbody").innerHTML = valua;

                    } else {
                        document.getElementById("stcount").innerHTML = "Total Students(<strong>" + cout + "</strong>)";
                        document.getElementById("chkTbody").innerHTML = "";
                    }
                    return false;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Respuesta = " + XMLHttpRequest.responseText + "\n Estatus = " + textStatus + "\n Error = " + errorThrown);
                }
            });
        }
        //end checkinout block

        //start Users Functions
        function DelUs(id) {
            var param = "'usid':" + id + "";
            $.ajax({
                type: "POST",
                //async: false,
                url: "CheckInOut.aspx/DelUs",
                data: "{" + param + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var m = response.d;
                    if (m != '-1') {
                        $("#btnUsClear").click();
                        usTable();
                        alert("User Deleted!");

                    }
                    return false;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Respuesta = " + XMLHttpRequest.responseText + "\n Estatus = " + textStatus + "\n Error = " + errorThrown);
                }
            });

        }

        function getUs(id) {
            var param = "'usid':" + id + "";
            $.ajax({
                type: "POST",
                async: false,
                url: "CheckInOut.aspx/getUs",
                data: "{" + param + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var m = response.d;
                    if (m != '') {
                        var valua = "";
                        var b = m.split('|');
                        $("#usName").val(b[1]);
                        $("#usCell").val(b[2]);
                        $("#UserName").val(b[3]);
                        $("#usPass").val(b[4]);
                        $("#usRoll").val(b[5]);
                        $("#UsId").val(b[0]);
                        modifica = 1;
                    }
                    return false;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Respuesta = " + XMLHttpRequest.responseText + "\n Estatus = " + textStatus + "\n Error = " + errorThrown);
                }
            });

        }

        function usTable() {

            //var param = "'schVal':'" + vals + "','modif':" + modi + "";
            $.ajax({
                type: "POST",
                async: false,
                url: "CheckInOut.aspx/usTable",
                //data: "{" + param + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var m = response.d;
                    if (m != '') {
                        var valua = "";
                        var b = m.split('^');
                        for (var i = 0; i < b.length - 1; i++) {
                            var c = b[i].split('|');
                            valua += '<tr>';
                            valua += '<td>' + c[1] + '</td>';
                            valua += '<td>' + c[2] + '</td>';
                            valua += '<td>' + c[3] + '</td>';
                            valua += '<td>' + c[4] + '</td>';
                            valua += '<td><a href="#" id="Load_' + c[0] + '" class="btn btn-success usloa">Load</a></td>';
                            valua += '<td><a href="#" id="Rem_' + c[0] + '" class="btn btn-success usrem">X</a></td>';
                            valua += '</tr>';
                        }
                        document.getElementById("usTbody").innerHTML = valua;

                    } else {
                        document.getElementById("usTbody").innerHTML = "";
                    }
                    return false;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Respuesta = " + XMLHttpRequest.responseText + "\n Estatus = " + textStatus + "\n Error = " + errorThrown);
                }
            });

        }

        function saveUs(vals, modi) {

            var param = "'usVal':'" + vals + "','modif':" + modi + "";
            $.ajax({
                type: "POST",
                async: false,
                url: "CheckInOut.aspx/saveUs",
                data: "{" + param + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var m = response.d;
                    if (m != '') {
                    }
                    return false;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Respuesta = " + XMLHttpRequest.responseText + "\n Estatus = " + textStatus + "\n Error = " + errorThrown);
                }
            });

        }
        //end Users Functions


        //start student Activities
        function getStacti(id) {
            var param = "'stscid':" + id + "";

            $.ajax({
                type: "POST",
                async: false,
                url: "CheckInOut.aspx/getStacti",
                data: "{" + param + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var m = response.d;
                    if (m != '') {
                        var valua = "";
                        var b = m.split('|');
                        $("#stNameAct").val(b[1] + ' ' + b[2]);
                        $("#stactId").val(b[0]);
                        modifica = 0;
                    }
                    return false;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Respuesta = " + XMLHttpRequest.responseText + "\n Estatus = " + textStatus + "\n Error = " + errorThrown);
                }
            });

        }

        function Delstact(id) {
            var param = "'stactid':" + id + "";
            $.ajax({
                type: "POST",
                async: false,
                url: "CheckInOut.aspx/Delstact",
                data: "{" + param + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var m = response.d;
                    if (m != '-1') {

                        //graTable();
                        alert("Activity Deleted!");

                    }
                    return false;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Respuesta = " + XMLHttpRequest.responseText + "\n Estatus = " + textStatus + "\n Error = " + errorThrown);
                }
            });

        }

        function getStsch(id) {
            var param = "'stacid':" + id + "";
            $.ajax({
                type: "POST",
                async: false,
                url: "CheckInOut.aspx/getStsch",
                data: "{" + param + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var m = response.d;
                    if (m != '') {

                        var valua = "";
                        var b = m.split('|');
                        $("#stActiSelect").val(b[1]);
                        $("#stActiSelect").change();
                        $("#stSched").val(b[2]);
                        $("#stactscId").val(b[0]);
                        modifica = 1;
                    }
                    return false;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Respuesta = " + XMLHttpRequest.responseText + "\n Estatus = " + textStatus + "\n Error = " + errorThrown);
                }
            });

        }

        function stactTable(idst) {

            var param = "'stactid':" + idst + "";
            $.ajax({
                type: "POST",
                async: false,
                url: "CheckInOut.aspx/stactTable",
                data: "{" + param + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var m = response.d;
                    if (m != '') {
                        var valua = "";
                        var b = m.split('^');
                        for (var i = 0; i < b.length - 1; i++) {
                            var c = b[i].split('|');

                            valua += '<tr>';
                            valua += '<td>' + c[1] + ' ' + c[2] + '</td>';
                            valua += '<td>' + c[3] + '</td>';
                            if (c[5] != "") {
                                valua += '<td>' + c[5] + ' ' + c[6] + '</td>';
                            } else {
                                valua += '<td>' + c[4] + ' ' + c[6] + '</td>';
                            }
                            valua += '<td><a href="#" id="Load_' + c[0] + '" class="btn btn-success stactload">Load</a></td>';
                            valua += '<td><a href="#" id="Rem_' + c[0] + '" class="btn btn-success stactrem">X</a></td>';
                            valua += '</tr>';
                        }
                        document.getElementById("stschTbody").innerHTML = valua;

                    } else {
                        document.getElementById("stschTbody").innerHTML = "";
                    }
                    return false;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Respuesta = " + XMLHttpRequest.responseText + "\n Estatus = " + textStatus + "\n Error = " + errorThrown);
                }
            });

        }

        function savestact(vals,modif) {

            var param = "'stactVal':'" + vals + "','modi':"+modif+"";
            $.ajax({
                type: "POST",
                async: false,
                url: "CheckInOut.aspx/savestact",
                data: "{" + param + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var m = response.d;
                    if (m != '') {
                    }
                    return false;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Respuesta = " + XMLHttpRequest.responseText + "\n Estatus = " + textStatus + "\n Error = " + errorThrown);
                }
            });

        }

        //end student Activities

        //start Student Functions
        function Delst(id) {
            var param = "'graid':" + id + "";
            $.ajax({
                type: "POST",
                //async: false,
                url: "CheckInOut.aspx/Delgra",
                data: "{" + param + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var m = response.d;
                    if (m != '-1') {
                        $("#btnGraClear").click();
                        graTable();
                        alert("Grade " + id + " Deleted!");

                    }
                    return false;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Respuesta = " + XMLHttpRequest.responseText + "\n Estatus = " + textStatus + "\n Error = " + errorThrown);
                }
            });

        }

        function getSt(id) {
            var param = "'stid':" + id + "";
            $.ajax({
                type: "POST",
                async: false,
                url: "CheckInOut.aspx/getSt",
                data: "{" + param + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var m = response.d;
                    if (m != '') {

                        var valua = "";
                        var b = m.split('|');
                        $("#stName").val(b[1]);
                        $("#stLastName").val(b[2]);
                        $("#stAge").val(b[3]);
                        $("#stGrade").val(b[4]);
                        $("#stFrom").val(b[5]);
                        $("#proColeg").val(b[6]);
                        $("#cmsTeac").val(b[7]);
                        $("#stFotoName").val(b[8]);
                        $("#stMother").val(b[9]);
                        $("#motCell").val(b[10]);
                        $("#motEmail").val(b[11]);
                        $("#stFather").val(b[12]);
                        $("#fatCell").val(b[13]);
                        $("#fatEmail").val(b[14]);
                        $("#stState").val(b[15]);
                        $("#Allerg").val(b[16]);
                        $("#AuthMed").val(b[17]);
                        $("#EContact").val(b[18]);
                        $("#stId").val(b[0]);
                        $("#EmBus").val(b[19])
                        if (b[19] == 1) {
                            $("#EmBus").prop("checked", true);
                        } else {
                            $("#EmBus").prop("checked", false);
                        }
                        if (b[8] != "") {
                            document.getElementById("dvFoto").innerHTML = '<img src="ImgFolder/' + b[8] + '" class="thumbnail" style="width: 150px; cursor: pointer;" />';
                        } else {
                            document.getElementById("dvFoto").innerHTML = '<img src="ImgFolder/fotoP.jpg" class="thumbnail" style="width: 150px; cursor: pointer;" />';
                        }
                        modifica = 1;
                    }
                    return false;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Respuesta = " + XMLHttpRequest.responseText + "\n Estatus = " + textStatus + "\n Error = " + errorThrown);
                }
            });

        }

        function stTable() {

            //var param = "'schVal':'" + vals + "','modif':" + modi + "";
            $.ajax({
                type: "POST",
                async: false,
                url: "CheckInOut.aspx/stTable",
                //data: "{" + param + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var m = response.d;
                    if (m != '') {
                        var valua = "";
                        var b = m.split('^');
                        for (var i = 0; i < b.length - 1; i++) {
                            var c = b[i].split('|');

                            valua += '<tr>';
                            valua += '<td>' + c[1] + ' ' + c[2] + '</td>';
                            valua += '<td>' + c[3] + '</td>';
                            valua += '<td>' + c[4] + '</td>';
                            valua += '<td>' + c[5] + '</td>';
                            valua += '<td><a href="#" id="Load_' + c[0] + '" class="btn btn-success stloa stactloa stHloa">Load</a></td>';
                            //valua += '<td><a href="#" id="Rem_' + c[0] + '" class="btn btn-success strem">X</a></td>';
                            valua += '</tr>';
                        }
                        document.getElementById("stTbody").innerHTML = valua;
                        $("#myModal").modal("show");
                    } else {
                        document.getElementById("stTbody").innerHTML = "";
                    }
                    return false;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Respuesta = " + XMLHttpRequest.responseText + "\n Estatus = " + textStatus + "\n Error = " + errorThrown);
                }
            });

        }

        function stsrcTable(namest) {
            document.getElementById("stTbody").innerHTML = "";
            var param = "'stname':'" + namest + "'";
            $.ajax({
                type: "POST",
                async: false,
                url: "CheckInOut.aspx/stsrcTable",
                data: "{" + param + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var m = response.d;
                    if (m != '') {
                        var valua = "";
                        var b = m.split('^');
                        for (var i = 0; i < b.length - 1; i++) {
                            var c = b[i].split('|');

                            valua += '<tr>';
                            valua += '<td>' + c[1] + ' ' + c[2] + '</td>';
                            valua += '<td>' + c[3] + '</td>';
                            valua += '<td>' + c[4] + '</td>';
                            valua += '<td>' + c[5] + '</td>';
                            valua += '<td><a href="#" id="Load_' + c[0] + '" class="btn btn-success stloa stactloa stHloa">Load</a></td>';
                            //valua += '<td><a href="#" id="Rem_' + c[0] + '" class="btn btn-success strem">X</a></td>';
                            valua += '</tr>';
                        }
                        document.getElementById("stTbody").innerHTML = valua;
                    } else {
                        document.getElementById("stTbody").innerHTML = "Not Found.";
                    }
                    return false;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Respuesta = " + XMLHttpRequest.responseText + "\n Estatus = " + textStatus + "\n Error = " + errorThrown);
                }
            });

        }

        function saveSt(vals, modi) {

            var param = "'stVal':'" + vals + "','modif':" + modi + "";
            $.ajax({
                type: "POST",
                async: false,
                url: "CheckInOut.aspx/saveSt",
                data: "{" + param + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var m = response.d;
                    if (m != '') {
                        alert("Student Saved!")
                    } else { alert("Student Could not be Saved!") }
                    return false;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Respuesta = " + XMLHttpRequest.responseText + "\n Estatus = " + textStatus + "\n Error = " + errorThrown);
                }
            });

        }
        //end Student Functions


        //start Grade Functions
        function Delgra(id) {
            var param = "'graid':" + id + "";
            $.ajax({
                type: "POST",
                //async: false,
                url: "CheckInOut.aspx/Delgra",
                data: "{" + param + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var m = response.d;
                    if (m != '-1') {
                        $("#btnGraClear").click();
                        graTable();
                        alert("Grade " + id + " Deleted!");

                    }
                    return false;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Respuesta = " + XMLHttpRequest.responseText + "\n Estatus = " + textStatus + "\n Error = " + errorThrown);
                }
            });

        }

        function getGra(id) {
            var param = "'graid':" + id + "";
            $.ajax({
                type: "POST",
                async: false,
                url: "CheckInOut.aspx/getGra",
                data: "{" + param + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var m = response.d;
                    if (m != '') {
                        var valua = "";
                        var b = m.split('|');
                        $("#Grade").val(b[1]);
                        $("#graId").val(b[0]);
                        modifica = 1;
                    }
                    return false;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Respuesta = " + XMLHttpRequest.responseText + "\n Estatus = " + textStatus + "\n Error = " + errorThrown);
                }
            });

        }

        function graTable() {

            //var param = "'schVal':'" + vals + "','modif':" + modi + "";
            $.ajax({
                type: "POST",
                async: false,
                url: "CheckInOut.aspx/graTable",
                //data: "{" + param + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var m = response.d;
                    if (m != '') {
                        var valua = "";
                        var b = m.split('^');
                        for (var i = 0; i < b.length - 1; i++) {
                            var c = b[i].split('|');

                            valua += '<tr>';
                            valua += '<td>' + c[0] + '</td>';
                            valua += '<td>' + c[1] + '</td>';
                            valua += '<td><a href="#" id="Load_' + c[0] + '" class="btn btn-success graloa">Load</a></td>';
                            valua += '<td><a href="#" id="Rem_' + c[0] + '" class="btn btn-success grarem">X</a></td>';
                            valua += '</tr>';
                        }
                        document.getElementById("graTbody").innerHTML = valua;

                    } else {
                        document.getElementById("graTbody").innerHTML = "";
                    }
                    return false;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Respuesta = " + XMLHttpRequest.responseText + "\n Estatus = " + textStatus + "\n Error = " + errorThrown);
                }
            });

        }

        function saveGra(vals, modi) {

            var param = "'graVal':'" + vals + "','modif':" + modi + "";
            $.ajax({
                type: "POST",
                async: false,
                url: "CheckInOut.aspx/saveGra",
                data: "{" + param + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var m = response.d;
                    if (m != '') {
                    }
                    return false;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Respuesta = " + XMLHttpRequest.responseText + "\n Estatus = " + textStatus + "\n Error = " + errorThrown);
                }
            });

        }
        //end Grade Functions


        //start Activity Functions
        function DelAct(id) {
            var param = "'actid':" + id + "";
            $.ajax({
                type: "POST",
                //async: false,
                url: "CheckInOut.aspx/DelAct",
                data: "{" + param + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var m = response.d;
                    if (m != '-1') {
                        $("#btnActClear").click();
                        actTable();
                        alert("Activity " + id + " Deleted!");

                    }
                    return false;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Respuesta = " + XMLHttpRequest.responseText + "\n Estatus = " + textStatus + "\n Error = " + errorThrown);
                }
            });

        }

        function getAct(id) {
            var param = "'actid':" + id + "";
            $.ajax({
                type: "POST",
                async: false,
                url: "CheckInOut.aspx/getAct",
                data: "{" + param + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var m = response.d;
                    if (m != '') {
                        var valua = "";
                        var b = m.split('|');
                        $("#actCat").val(b[0]);
                        $("#Activity").val(b[2]);
                        $("#actGrade").val(b[3]);
                        $("#actPrice").val(parseInt(b[4]));
                        $("#actTeach").val(b[5]);
                        $("#actId").val(b[1]);
                        modifica = 1;
                    }
                    return false;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Respuesta = " + XMLHttpRequest.responseText + "\n Estatus = " + textStatus + "\n Error = " + errorThrown);
                }
            });

        }

        function actTable() {

            //var param = "'schVal':'" + vals + "','modif':" + modi + "";
            $.ajax({
                type: "POST",
                async: false,
                url: "CheckInOut.aspx/actTable",
                //data: "{" + param + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var m = response.d;
                    if (m != '') {
                        var valua = "";
                        var b = m.split('^');
                        for (var i = 0; i < b.length - 1; i++) {
                            var c = b[i].split('|');
                            valua += '<tr>';
                            valua += '<td>' + c[1] + '</td>';
                            valua += '<td>' + c[2] + '</td>';
                            valua += '<td>' + parseInt(c[3]) + '</td>';
                            //if (c[3] != "") {
                            //    valua += '<td>' + c[3] + ' ' + c[4] + '</td>';
                            //} else {
                            valua += '<td>' + c[4] + '</td>';
                            //}
                            //valua += '<td>' + c[5] + '</td>';
                            valua += '<td><a href="#" id="Load_' + c[0] + '" class="btn btn-success actloa">Load</a></td>';
                            valua += '<td><a href="#" id="Rem_' + c[0] + '" class="btn btn-success actrem">X</a></td>';
                            valua += '</tr>';
                        }
                        document.getElementById("actTbody").innerHTML = valua;

                    } else {
                        document.getElementById("actTbody").innerHTML = "";
                    }
                    return false;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Respuesta = " + XMLHttpRequest.responseText + "\n Estatus = " + textStatus + "\n Error = " + errorThrown);
                }
            });

        }

        function saveAct(vals, modi) {

            var param = "'actVal':'" + vals + "','modif':" + modi + "";
            $.ajax({
                type: "POST",
                async: false,
                url: "CheckInOut.aspx/saveAct",
                data: "{" + param + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var m = response.d;
                    if (m != '') {
                    }
                    return false;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Respuesta = " + XMLHttpRequest.responseText + "\n Estatus = " + textStatus + "\n Error = " + errorThrown);
                }
            });

        }
        //end Activity Functions

        function isUserIn() {
            // var param = "'teaid':" + id + "";
            $.ajax({
                type: "POST",
                async: false,
                url: "CheckInOut.aspx/isUserIn",
                //data: "{" + param + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var m = response.d;
                    if (m != "") {
                        var datos = m.split('|');
                        roll = datos[2];
                        uname = datos[1];
                        uid = datos[0];
                        if (datos[2] == 5) {
                            $("#chkli").removeClass("active");
                            $("#admin").css("pointer-events", "none");
                            $("#chkli").css("pointer-events", "none");
                            $('#menu li:nth-child(2) a').click();
                            $("#stActli").css("pointer-events", "none");
                            $("#teali").css("pointer-events", "none");
                            $("#grali").css("pointer-events", "none");
                            $("#actli").css("pointer-events", "none");
                            $("#schli").css("pointer-events", "none");
                            $("#btnStSave").css("pointer-events", "none");

                        }
                        if (datos[2] == 5 || datos[2] != 4) {
                            $("#admin").css("pointer-events", "none");
                            $("#tMaint").css("pointer-events", "none");
                        }
                        if (roll == 4) {
                            $("#attend").css("display", "block");
                        }

                    } else {
                        window.location.href = "Default.aspx";
                    }

                    return false;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Respuesta = " + XMLHttpRequest.responseText + "\n Estatus = " + textStatus + "\n Error = " + errorThrown);
                }
            });
        }

        //start Teacher Functions
        function DelTea(id) {
            var param = "'teaid':" + id + "";
            $.ajax({
                type: "POST",
                //async: false,
                url: "CheckInOut.aspx/DelTea",
                data: "{" + param + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var m = response.d;
                    if (m != '-1') {
                        $("#teabtnClear").click();
                        teaTable();
                        alert("Teacher " + id + " Deleted!");

                    }
                    return false;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Respuesta = " + XMLHttpRequest.responseText + "\n Estatus = " + textStatus + "\n Error = " + errorThrown);
                }
            });

        }

        function getTea(id) {
            var param = "'teaid':" + id + "";
            $.ajax({
                type: "POST",
                async: false,
                url: "CheckInOut.aspx/getTea",
                data: "{" + param + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var m = response.d;
                    if (m != '') {
                        var valua = "";
                        var b = m.split('|');
                        $("#teaName").val(b[1]);
                        $("#teaContact").val(b[2]);
                        $("#teaMail").val(b[3]);
                        $("#teaId").val(b[0]);
                        modifica = 1;
                    }
                    return false;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Respuesta = " + XMLHttpRequest.responseText + "\n Estatus = " + textStatus + "\n Error = " + errorThrown);
                }
            });

        }

        function teaTable() {

            //var param = "'schVal':'" + vals + "','modif':" + modi + "";
            $.ajax({
                type: "POST",
                async: false,
                url: "CheckInOut.aspx/teaTable",
                //data: "{" + param + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var m = response.d;
                    if (m != '') {
                        var valua = "";
                        var b = m.split('^');
                        for (var i = 0; i < b.length - 1; i++) {
                            var c = b[i].split('|');
                            valua += '<tr>';
                            valua += '<td>' + c[1] + '</td>';
                            valua += '<td>' + c[2] + '</td>';
                            valua += '<td>' + c[3] + '</td>';
                            valua += '<td><a href="#" id="Load_' + c[0] + '" class="btn btn-success tealoa">Load</a></td>';
                            valua += '<td><a href="#" id="Rem_' + c[0] + '" class="btn btn-success tearem">X</a></td>';
                            valua += '</tr>';
                        }
                        document.getElementById("teaTbody").innerHTML = valua;

                    } else {
                        document.getElementById("teaTbody").innerHTML = "";
                    }
                    return false;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Respuesta = " + XMLHttpRequest.responseText + "\n Estatus = " + textStatus + "\n Error = " + errorThrown);
                }
            });

        }

        function saveTea(vals, modi) {

            var param = "'teaVal':'" + vals + "','modif':" + modi + "";
            $.ajax({
                type: "POST",
                async: false,
                url: "CheckInOut.aspx/saveTea",
                data: "{" + param + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var m = response.d;
                    if (m != '') {
                    }
                    return false;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Respuesta = " + XMLHttpRequest.responseText + "\n Estatus = " + textStatus + "\n Error = " + errorThrown);
                }
            });

        }
        //end Teacher Functions

        //start Schedule Functions
        function Delsch(id) {
            var param = "'schid':" + id + "";
            $.ajax({
                type: "POST",
                //async: false,
                url: "CheckInOut.aspx/Delsch",
                data: "{" + param + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var m = response.d;
                    if (m != '-1') {
                        $("#btnClear").click();
                        schTable();
                        alert("Schedule " + id + " Deleted!");

                    }
                    return false;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Respuesta = " + XMLHttpRequest.responseText + "\n Estatus = " + textStatus + "\n Error = " + errorThrown);
                }
            });

        }
        function Delactsch(id) {
            var param = "'schid':" + id + "";
            $.ajax({
                type: "POST",
                //async: false,
                url: "CheckInOut.aspx/Delactsch",
                data: "{" + param + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var m = response.d;
                    if (m != '-1') {
                        $("#btnActScClear").click();
                        actschTable();
                        alert("Deleted!");

                    }
                    return false;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Respuesta = " + XMLHttpRequest.responseText + "\n Estatus = " + textStatus + "\n Error = " + errorThrown);
                }
            });

        }

        function getatsch(id) {
            var param = "'schid':" + id + "";
            $.ajax({
                type: "POST",
                async: false,
                url: "CheckInOut.aspx/getatsch",
                data: "{" + param + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var m = response.d;
                    if (m != '') {
                        var valua = "";
                        var b = m.split('|');

                        $("#actisc").val(b[1]);
                        $("#ddlactSched").val(b[2]);
                        $("#actscTea").val(b[3]);
                        $("#actscId").val(b[0]);
                        modifica = 1;
                    }
                    return false;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Respuesta = " + XMLHttpRequest.responseText + "\n Estatus = " + textStatus + "\n Error = " + errorThrown);
                }
            });

        }

        function getsch(id) {
            var param = "'schid':" + id + "";
            $.ajax({
                type: "POST",
                async: false,
                url: "CheckInOut.aspx/getsch",
                data: "{" + param + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var m = response.d;
                    if (m != '') {
                        var valua = "";
                        var b = m.split('|');

                        $("#actDay").val(b[1]);
                        $("#scShortDay").val(b[2]);
                        $("#actTime").val(b[3]);
                        $("#schId").val(b[0]);
                        modifica = 1;
                    }
                    return false;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Respuesta = " + XMLHttpRequest.responseText + "\n Estatus = " + textStatus + "\n Error = " + errorThrown);
                }
            });

        }

        function actschTable() {
            //var param = "'schVal':'" + vals + "','modif':" + modi + "";
            $.ajax({
                type: "POST",
                async: false,
                url: "CheckInOut.aspx/actschTable",
                //data: "{" + param + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var m = response.d;
                    if (m != '') {
                        var valua = "";
                        var b = m.split('^');
                        for (var i = 0; i < b.length - 1; i++) {
                            var c = b[i].split('|');
                            valua += '<tr>';
                            valua += '<td>' + c[1] + '</td>';
                            valua += '<td>' + c[2] + ' ' + c[3] + '</td>';
                            valua += '<td>' + c[4] + '</td>';
                            valua += '<td><a href="#" id="Load_' + c[0] + '" class="btn btn-success loa">Load</a></td>';
                            valua += '<td><a href="#" id="Rem_' + c[0] + '" class="btn btn-success rem">X</a></td>';
                            valua += '</tr>';
                        }
                        document.getElementById("actscTbody").innerHTML = valua;

                    } else {
                        document.getElementById("actscTbody").innerHTML = "";
                    }
                    return false;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Respuesta = " + XMLHttpRequest.responseText + "\n Estatus = " + textStatus + "\n Error = " + errorThrown);
                }
            });

        }

        function schTable() {

            //var param = "'schVal':'" + vals + "','modif':" + modi + "";
            $.ajax({
                type: "POST",
                async: false,
                url: "CheckInOut.aspx/schTable",
                //data: "{" + param + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var m = response.d;
                    if (m != '') {
                        var valua = "";
                        var b = m.split('^');
                        for (var i = 0; i < b.length - 1; i++) {
                            var c = b[i].split('|');
                            valua += '<tr>';
                            valua += '<td>' + c[1] + '</td>';
                            valua += '<td>' + c[2] + '</td>';
                            valua += '<td>' + c[3] + '</td>';
                            valua += '<td><a href="#" id="Load_' + c[0] + '" class="btn btn-success loa">Load</a></td>';
                            valua += '<td><a href="#" id="Rem_' + c[0] + '" class="btn btn-success rem">X</a></td>';
                            valua += '</tr>';
                        }
                        document.getElementById("scTbody").innerHTML = valua;

                    } else {
                        document.getElementById("scTbody").innerHTML = "";
                    }
                    return false;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Respuesta = " + XMLHttpRequest.responseText + "\n Estatus = " + textStatus + "\n Error = " + errorThrown);
                }
            });

        }

        function saveSch(vals, modi) {

            var param = "'schVal':'" + vals + "','modif':" + modi + "";
            $.ajax({
                type: "POST",
                async: false,
                url: "CheckInOut.aspx/saveSch",
                data: "{" + param + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var m = response.d;
                    if (m != '') {
                    }
                    return false;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Respuesta = " + XMLHttpRequest.responseText + "\n Estatus = " + textStatus + "\n Error = " + errorThrown);
                }
            });

        }
        function saveactSch(vals, modi) {

            var param = "'schVal':'" + vals + "','modif':" + modi + "";
            $.ajax({
                type: "POST",
                async: false,
                url: "CheckInOut.aspx/saveactSch",
                data: "{" + param + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var m = response.d;
                    if (m != '') {
                    }
                    return false;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Respuesta = " + XMLHttpRequest.responseText + "\n Estatus = " + textStatus + "\n Error = " + errorThrown);
                }
            });

        }
        //end Schedule Functions

        function updateClock() {

            var currentTime = new Date();
            var currentHours = currentTime.getHours();
            var currentMinutes = currentTime.getMinutes();
            var currentSeconds = currentTime.getSeconds();

            currentHours = (currentHours < 10 ? "0" : "") + currentHours;
            currentMinutes = (currentMinutes < 10 ? "0" : "") + currentMinutes;
            currentSeconds = (currentSeconds < 10 ? "0" : "") + currentSeconds;

            var currentTimeString = currentHours + ":" + currentMinutes + ":" + currentSeconds;

            $(".timer").html(currentTimeString);

        }
    </script>
</asp:Content>
