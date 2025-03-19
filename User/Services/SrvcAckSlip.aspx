﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SrvcAckSlip.aspx.cs" Inherits="MeghalayaUIP.User.Services.SrvcAckSlip" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ACKNOWLEDGEMENT SLIP</title>
    <link href="assets/admin/css/style.css" rel="stylesheet" />
    <style>
        a#lbtnBack {
            float: right;
            background: #607D8B;
            width: 59px;
            height: 24px;
            border-radius: 4px;
            transition: all 0.4s;
            text-align: center !important;
            color: #fff;
            text-transform: capitalize;
            text-decoration: none;
            padding: 6px 4px 1px;
            position: absolute;
            top: 39px;
            right: 210px;
        }

        ul.list-unstyled.mb-0.list-item li {
            list-style: none;
        }

        .invoice-container {
            background-color: #fff;
            border: 1px solid #000;
            margin: 0 auto 1.875rem;
            max-width: 900px;
            padding: 1.5rem;
            border-radius: 8px;
            box-shadow: 1px 4px 8px 2px #919191;
            margin-top: 75px;
        }

        body {
            background: url(../../assets/admin/img/bgo.jpg);
            background-size: contain;
            background-position: inherit;
        }

        .fotter {
            margin-left: 93px;
        }

            .fotter p {
                line-height: 14px;
            }
    </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.js"></script>

    <script>
        function downloadPDF() {
            var content = document.getElementById('ackcontent'); // Get the content to be converted

            // Create a new jsPDF instance
            const { jsPDF } = window.jspdf;
            const doc = new jsPDF();

            // Convert the HTML content into PDF
            doc.html(content, {
                callback: function (doc) {
                    // Save the generated PDF
                    doc.save('application_acknowledgement.pdf');
                },
                margin: [10, 10, 10, 10], // Margin for the PDF
                x: 10,
                y: 10
            });
        }
    </script>


</head>
<body>
    <form id="form1" runat="server">
        <%--   <div class="col-md-1 pb-2 pt-2">
            <asp:LinkButton ID="lbtnBack" runat="server" Text="Back" OnClick="lbtnBack_Click" CssClass="btn btn-sm btn-dark"><i class="fi fi-br-angle-double-small-left" style="position: absolute;margin-left: 32px;margin-top: 3px;"></i> Back </asp:LinkButton>
        </div>--%>

        <div id="ackcontent" runat="server">
            <div class="page-wrapper" style="min-height: 293px;">
                <div class="content container-fluid">
                    <!-- Invoice Container -->
                    <div class="invoice-container">
                        <asp:HiddenField ID="hdnUserID" runat="server" />

                        <div class="row">
                            <div class="col-sm-12 m-b-20 text-center" style="display: flex; justify-content: center;">
                                <img alt="Logo" class="img-fluid" src="../../assets/admin/img/logo.png" />
                            </div>

                            <div class="col-sm-6 m-b-20 text-center" style="display: flex; justify-content: center;">
                                <div class="invoice-details text-center d-flex" style="text-align: center;">
                                    <h3 class="text-uppercase" style="margin-bottom: 0;"><u>Application Acknowledgement</u></h3>


                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 ">
                            <div id="success" runat="server" visible="false" class="alert alert-success alert-dismissible fade show" align="Center">
                                <strong>Success!</strong><asp:Label ID="lblmsg" runat="server"></asp:Label>
                                <asp:Label ID="Label1" runat="server"></asp:Label>
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">×</span></button>
                            </div>
                        </div>
                        <div class="col-md-12 ">
                            <div id="Failure" runat="server" visible="false" class="alert alert-danger alert-dismissible fade show" align="Center">
                                <strong>Warning!</strong>
                                <asp:Label ID="lblmsg0" runat="server"></asp:Label>
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">×</span>
                                </button>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 m-b-20">
                                <ul class="list-unstyled mb-0 list-item">
                                    <li>Date : 
                                        <asp:Label runat="server" ID="lblApplDate"></asp:Label>,
                                    </li>
                                    <li>
                                        <label runat="server" id="lblEnterPrise" visible="false"></label>
                                    </li>
                                    <li>Dear : <label runat="server" id="lblApplicant"></label>,<br />
                                        Your Request for Other Sevices has been successfully submitted to Meghalaya Investment Promotion Authority (MIPA), Government of Meghalaya.</li>
                                </ul>
                                <div class="col-sm-12 m-b-20 text-center" style="display: flex; justify-content: center;">
                                    <div class="invoice-details text-center d-flex" style="text-align: center;">
                                        <h3 class="text-uppercase" style="margin-bottom: 0;"><u>Application Summary</u></h3>


                                    </div>
                                </div>
                                <ul class="list-unstyled mb-0 list-item">


                                    <li>Your Application reference number is :
                                        <b>
                                            <asp:Label runat="server" ID="lblUIDNo"></asp:Label></b></li>
                                    <li>Approval Name :                                     
                                        <b>
                                             <asp:Label runat="server" ID="lblApproval"></asp:Label></b></li>
                                       
                                   
                                    <li>Your application was recevied by Online mode on
                                        <asp:Label runat="server" ID="lblApplDate1"></asp:Label></li>

                                </ul>
                                <%-- <div class="col-sm-12 m-b-20 text-center" style="display: flex; justify-content: center;">
                                    <div class="invoice-details text-center d-flex" style="text-align: center;">
                                        <h3 class="text-uppercase" style="margin-bottom: 0;"><u>List of Enclosures with Applications</u></h3>


                                    </div>
                                </div>



                                <ol style="margin-left: 18px;">
                                    <li>Copy of incorporation.</li>
                                    <li>Proof of Udyami/EMI No.</li>
                                    <li>Copy of PAN.</li>
                                    <li>Copy of GSTIN Certificate.</li>
                                    <li>Proof of CIN.</li>
                                    <li>Detailed Project Report.</li>
                                </ol>
                                --%>


                                <div class="fotter">
                                    <p>
                                        <br />
                                        <br />
                                        Regards
                                    </p>
                                    <p><b>Meghalaya Investment Promotion Authority (MIPA)</b></p>
                                    <p><b>Government of Meghalaya</b></p>
                                    <p>Email : meghalayainvestmentpromotionauthority@gmail.com</p>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12 d-flex" style="display: flex; width: 100%; flex-direction: row; flex-wrap: nowrap; justify-content: center;">
                            <div class="col-md-6" style="width: 10%;">
                                <asp:Button ID="btndownload" runat="server" Text="Download" class="btn btn-sm btn-info" OnClick="btndownload_Click"></asp:Button>
                            </div>
                            <div class="col-md-6">
                                <button id="btnprint" onclick="window.print()" class="btn btn-sm btn-info">Print</button>
                            </div>
                        </div>

                    </div>
                    <!-- /Invoice Container -->

                </div>

            </div>
        </div>
    </form>
</body>
</html>
