<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="EEEx.Signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 100%;
            background-color: #99CCFF;
        }
        .auto-style3 {
        }
        .auto-style4 {
            width: 367px;
        }
        .auto-style5 {
            width: 367px;
            height: 30px;
        }
        .auto-style6 {
            height: 30px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="auto-style1">
            <tr>
                <td>&nbsp;
                    <asp:Image ID="Image1" runat="server" Height="215px" ImageUrl="~/Images/eeex.png" ToolTip="E Employment Exchange" Width="100%" />
                    <br />
                    <table class="auto-style1">
                        <tr>
                            <td style="color:White;background-color:#507CD1;text-align:center ;font-size:1.5em;font-weight:bold;" Text="Login" Width="100%">
                                <asp:Label ID="signupLbl" runat="server" Text="Sign Up"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table class="auto-style1">
                        <tr>
                            <td>
                                <table class="auto-style1">
                                    <tr>
                                        <td>
                                            <asp:Button ID="JSBtn" runat="server" Text="Job Seeker" CausesValidation="False" OnClick="EnableJSV" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Button ID="JPBtn" runat="server" Text="Job Provider" CausesValidation="False" OnClick="EnableJPV" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <asp:MultiView ID="SignUpMV" runat="server">
                                    <asp:View ID="JSV" runat="server">
                                        <table class="auto-style2">
                                            <tr>
                                                <td class="auto-style4" style="text-align: right">
                                                    <asp:Label ID="FNLbl" runat="server" Text="First Name"></asp:Label>
                                                </td>
                                                <td style="text-align: center">
                                                    <asp:TextBox ID="FNTB" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RFVFirstName" runat="server" ControlToValidate="FNTB" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style4" style="text-align: right">
                                                    <asp:Label ID="LNLbl" runat="server" Text="Last Name"></asp:Label>
                                                </td>
                                                <td style="text-align: center">
                                                    <asp:TextBox ID="LNTB" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RFVLastName" runat="server" ControlToValidate="LNTB" ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style4" style="text-align: right">
                                                    <asp:Label ID="PhoneLbl" runat="server" Text="Phone"></asp:Label>
                                                </td>
                                                <td style="text-align: center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <asp:TextBox ID="PhoneTB" runat="server" TextMode="Phone"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RFVPhone" runat="server" ControlToValidate="PhoneTB" ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="REVPhone" runat="server" ControlToValidate="PhoneTB" ErrorMessage="Invalid" ForeColor="Red" ValidationExpression="^[789]\d{9}$"></asp:RegularExpressionValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style4" style="text-align: right">
                                                    <asp:Label ID="EmailLbl" runat="server" Text="Email"></asp:Label>
                                                </td>
                                                <td style="text-align: center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <asp:TextBox ID="EmailTB" runat="server" TextMode="Email"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RFVEmail" runat="server" ControlToValidate="EmailTB" ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="REVEmail" runat="server" ControlToValidate="EmailTB" ErrorMessage="Invalid" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style4" style="text-align: right">
                                                    <asp:Label ID="PassLbl" runat="server" Text="Password"></asp:Label>
                                                </td>
                                                <td style="text-align: center">
                                                    <asp:TextBox ID="PassTB" runat="server" TextMode="Password"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RFVPassword" runat="server" ControlToValidate="PassTB" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style4" style="text-align: right">
                                                    <asp:Label ID="CpLbl" runat="server" Text="Confirm Password"></asp:Label>
                                                </td>
                                                <td style="text-align: center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <asp:TextBox ID="CpTB" runat="server" TextMode="Password"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RFVCP" runat="server" ControlToValidate="CpTB" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                    <asp:CompareValidator ID="CVPass" runat="server" ControlToCompare="PassTB" ControlToValidate="CpTB" ErrorMessage="Password Mismatch" ForeColor="Red"></asp:CompareValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style4" style="text-align: right">
                                                    <asp:Label ID="AddrLbl" runat="server" Text="Address"></asp:Label>
                                                </td>
                                                <td style="text-align: center">
                                                    <asp:TextBox ID="AddrTB" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RFVAddr" runat="server" ControlToValidate="AddrTB" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style4" style="text-align: right">
                                                    <asp:Label ID="StateLbl" runat="server" Text="State"></asp:Label>
                                                </td>
                                                <td style="text-align: center">
                                                    <asp:DropDownList ID="DDLState" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DDLState_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="RFVState" runat="server" ControlToValidate="DDLState" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style4" style="text-align: right">
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
                                                <td class="auto-style4" style="text-align: right">
                                                    <asp:Label ID="PinLbl" runat="server" Text="Pincode"></asp:Label>
                                                </td>
                                                <td style="text-align: center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <asp:TextBox ID="PinTB" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RFVPincode" runat="server" ControlToValidate="PinTB" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="REVPin" runat="server" ControlToValidate="PinTB" ErrorMessage="Invalid" ForeColor="Red" ValidationExpression="\d{6}"></asp:RegularExpressionValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style4" style="text-align: right">
                                                    <asp:Label ID="GenderLbl" runat="server" Text="Gender"></asp:Label>
                                                </td>
                                                <td style="text-align: center">
                                                    <asp:RadioButton ID="RBMale" runat="server" Checked="True" Text="Male" />
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <asp:RadioButton ID="RBFemale" runat="server" Text="Female" />
                                                    &nbsp;&nbsp;&nbsp; </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style4" style="text-align: right">
                                                    <asp:Label ID="DegreeLbl" runat="server" Text="Degree"></asp:Label>
                                                </td>
                                                <td style="text-align: center">
                                                    <asp:DropDownList ID="DDLDegree" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DDLDegree_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="RFVDegree" runat="server" ControlToValidate="DDLDegree" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style4" style="text-align: right">
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
                                                <td class="auto-style4" style="text-align: right">
                                                    <asp:Label ID="ResumeLbl" runat="server" Text="Resume URL"></asp:Label>
                                                </td>
                                                <td style="text-align: center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <asp:TextBox ID="ResumeTB" runat="server" TextMode="Url"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RFVResume" runat="server" ControlToValidate="ResumeTB" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="REVResume" runat="server" ControlToValidate="ResumeTB" ErrorMessage="Invalid" ForeColor="Red" ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?"></asp:RegularExpressionValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style4" style="text-align: right">
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
                                                <td class="auto-style5" style="text-align: right">
                                                    <asp:Label ID="DOB" runat="server" Text="Date of Birth"></asp:Label>
                                                </td>
                                                <td class="auto-style6" style="text-align: center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <asp:TextBox ID="DOBTB" runat="server" TextMode="Date"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RFVDate" runat="server" ControlToValidate="DOBTB" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                    <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="DOBTB" ErrorMessage="Invalid" ForeColor="Red" MaximumValue="01/01/2018" MinimumValue="01/01/1950" Type="Date"></asp:RangeValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style3" colspan="2" style="text-align: center">
                                                    <asp:Button ID="SubmitBtn" runat="server" OnClick="Register" Text="Submit" />
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <asp:Label ID="errorlbl" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:View>
                                    <asp:View ID="JPV" runat="server">
                                        <table class="auto-style2">
                                            <tr>
                                                <td class="auto-style4" style="text-align: right">
                                                    <asp:Label ID="CNLbl" runat="server" Text="Company Name"></asp:Label>
                                                </td>
                                                <td style="text-align: center">
                                                    <asp:TextBox ID="CNTB" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RFVFirstName0" runat="server" ControlToValidate="CNTB" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style4" style="text-align: right">
                                                    <asp:Label ID="PhoneLbl0" runat="server" Text="Phone"></asp:Label>
                                                </td>
                                                <td style="text-align: center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <asp:TextBox ID="PhoneTB0" runat="server" TextMode="Phone"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RFVPhone0" runat="server" ControlToValidate="PhoneTB0" ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="REVPhone0" runat="server" ControlToValidate="PhoneTB0" ErrorMessage="Invalid" ForeColor="Red" ValidationExpression="^[789]\d{9}$"></asp:RegularExpressionValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style4" style="text-align: right">
                                                    <asp:Label ID="EmailLbl0" runat="server" Text="Email"></asp:Label>
                                                </td>
                                                <td style="text-align: center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <asp:TextBox ID="EmailTB0" runat="server" TextMode="Email"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RFVEmail0" runat="server" ControlToValidate="EmailTB0" ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="REVEmail0" runat="server" ControlToValidate="EmailTB0" ErrorMessage="Invalid" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style4" style="text-align: right">
                                                    <asp:Label ID="PassLbl0" runat="server" Text="Password"></asp:Label>
                                                </td>
                                                <td style="text-align: center">
                                                    <asp:TextBox ID="PassTB0" runat="server" TextMode="Password"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RFVPassword0" runat="server" ControlToValidate="PassTB0" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style4" style="text-align: right">
                                                    <asp:Label ID="CpLbl0" runat="server" Text="Confirm Password"></asp:Label>
                                                </td>
                                                <td style="text-align: center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <asp:TextBox ID="CpTB0" runat="server" TextMode="Password"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RFVCP0" runat="server" ControlToValidate="CpTB0" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                    <asp:CompareValidator ID="CVPass0" runat="server" ControlToCompare="PassTB0" ControlToValidate="CpTB" ErrorMessage="Password Mismatch" ForeColor="Red"></asp:CompareValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style4" style="text-align: right">
                                                    <asp:Label ID="AddrLbl0" runat="server" Text="Address"></asp:Label>
                                                </td>
                                                <td style="text-align: center">
                                                    <asp:TextBox ID="AddrTB0" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RFVAddr0" runat="server" ControlToValidate="AddrTB0" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style4" style="text-align: right">
                                                    <asp:Label ID="StateLbl0" runat="server" Text="State"></asp:Label>
                                                </td>
                                                <td style="text-align: center">
                                                    <asp:DropDownList ID="DDLState0" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DDLState0_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="RFVState0" runat="server" ControlToValidate="DDLState0" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style4" style="text-align: right">
                                                    <asp:Label ID="CityLbl0" runat="server" Text="City"></asp:Label>
                                                </td>
                                                <td style="text-align: center">
                                                    <asp:DropDownList ID="DDLCity0" runat="server">
                                                        <asp:ListItem>Select</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="RFVCity0" runat="server" ControlToValidate="DDLCity0" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style4" style="text-align: right">
                                                    <asp:Label ID="PinLbl0" runat="server" Text="Pincode"></asp:Label>
                                                </td>
                                                <td style="text-align: center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <asp:TextBox ID="PinTB0" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RFVPincode0" runat="server" ControlToValidate="PinTB0" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="REVPin0" runat="server" ControlToValidate="PinTB0" ErrorMessage="Invalid" ForeColor="Red" ValidationExpression="\d{6}"></asp:RegularExpressionValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style3" colspan="2" style="text-align: center">
                                                    <asp:Button ID="SubmitBtn0" runat="server" OnClick="Register0" Text="Submit" />
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <asp:Label ID="ErrorLbl0" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:View>
                                </asp:MultiView>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td id="footer" style="color:White;background-color:#507CD1;text-align:center ;font-size:1.5em;font-weight:bold;">&nbsp;
                                &copy E-Employment Exchange
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
