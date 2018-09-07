<%@ Page Title="" Language="C#" MasterPageFile="~/JobSeeker.Master" AutoEventWireup="true" CodeBehind="SeekerProfile.aspx.cs" Inherits="EEEx.SeekerProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            text-align: center;
        }
        .auto-style7 {
            width: 1222px;
            height: 23px;
        }
        .auto-style8 {
            height: 23px;
            width: 475px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <td class="auto-style5" style="font-size:25px"">
                <asp:Label ID="Label1" runat="server" Text="Profile"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <table class="auto-style7">
                                            <tr>
                                                <td class="auto-style8" style="text-align: right">
                                                    <asp:Label ID="FNLbl" runat="server" Text="First Name"></asp:Label>
                                                </td>
                                                <td style="text-align: center">
                                                    <asp:TextBox ID="FNTB" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RFVFirstName" runat="server" ControlToValidate="FNTB" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style8" style="text-align: right">
                                                    <asp:Label ID="LNLbl" runat="server" Text="Last Name"></asp:Label>
                                                </td>
                                                <td style="text-align: center">
                                                    <asp:TextBox ID="LNTB" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RFVLastName" runat="server" ControlToValidate="LNTB" ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style8" style="text-align: right">
                                                    <asp:Label ID="AddrLbl" runat="server" Text="Address"></asp:Label>
                                                </td>
                                                <td style="text-align: center">
                                                    <asp:TextBox ID="AddrTB" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RFVAddr" runat="server" ControlToValidate="AddrTB" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style8" style="text-align: right">
                                                    <asp:Label ID="StateLbl" runat="server" Text="State"></asp:Label>
                                                </td>
                                                <td style="text-align: center">
                                                    <asp:DropDownList ID="DDLState" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DDLState_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="RFVState" runat="server" ControlToValidate="DDLState" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style8" style="text-align: right">
                                                    <asp:Label ID="CityLbl" runat="server" Text="City"></asp:Label>
                                                </td>
                                                <td style="text-align: center">
                                                    <asp:DropDownList ID="DDLCity" runat="server">
                                                        <asp:ListItem>Select</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="RFVCity" runat="server" ControlToValidate="DDLCity" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style8" style="text-align: right">
                                                    <asp:Label ID="PinLbl" runat="server" Text="Pincode"></asp:Label>
                                                </td>
                                                <td style="text-align: center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <asp:TextBox ID="PinTB" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RFVPincode" runat="server" ControlToValidate="PinTB" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="REVPin" runat="server" ControlToValidate="PinTB" ErrorMessage="Invalid" ForeColor="Red" ValidationExpression="\d{6}"></asp:RegularExpressionValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style8" style="text-align: right">
                                                    <asp:Label ID="DegreeLbl" runat="server" Text="Degree"></asp:Label>
                                                </td>
                                                <td style="text-align: center">
                                                    <asp:DropDownList ID="DDLDegree" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DDLDegree_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="RFVDegree" runat="server" ControlToValidate="DDLDegree" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style8" style="text-align: right">
                                                    <asp:Label ID="FieldLbl" runat="server" Text="Field"></asp:Label>
                                                </td>
                                                <td style="text-align: center">
                                                    <asp:DropDownList ID="DDLField" runat="server">
                                                        <asp:ListItem>Select</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="RFVField" runat="server" ControlToValidate="DDLField" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style8" style="text-align: right">
                                                    <asp:Label ID="ResumeLbl" runat="server" Text="Resume URL"></asp:Label>
                                                </td>
                                                <td style="text-align: center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <asp:TextBox ID="ResumeTB" runat="server" TextMode="Url"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RFVResume" runat="server" ControlToValidate="ResumeTB" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="REVResume" runat="server" ControlToValidate="ResumeTB" ErrorMessage="Invalid" ForeColor="Red" ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?"></asp:RegularExpressionValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style8" style="text-align: right">
                                                    <asp:Label ID="CertificateLbl" runat="server" Text="Certificate URL"></asp:Label>
                                                </td>
                                                <td style="text-align: center">
                                                    <table class="auto-style1">
                                                        <tr>
                                                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                <asp:TextBox ID="CertificateTB" runat="server" TextMode="Url"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RFVCertificate" runat="server" ControlToValidate="CertificateTB" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                                <asp:RegularExpressionValidator ID="REVCertificate" runat="server" ControlToValidate="CertificateTB" ErrorMessage="Invalid" ForeColor="Red" ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?"></asp:RegularExpressionValidator>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style3" colspan="2" style="text-align: center">
                                                    <asp:Button ID="SubmitBtn" runat="server" OnClick="Register" Text="Update" />
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    </td>
                                            </tr>
                                        </table>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
