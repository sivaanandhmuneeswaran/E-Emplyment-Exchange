<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="EEEx.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 23px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="auto-style1">
            <tr>
                <td>
                    <asp:Image ID="Image1" runat="server" Height="215px" ImageUrl="~/Images/eeex.png" ToolTip="E Employment Exchange" Width="100%" />
                </td>
            </tr>
            <tr>
                <td colspan="1">
                    <table class="auto-style1">
                        <tr>
                            <td id="login" style="text-align:center">
                                <table class="auto-style1">
                                    <tr>
                                        <td>
                                            <asp:Label ID="LoginLabel" runat="server" style="color:White;background-color:#507CD1;text-align:center ;font-size:1.5em;font-weight:bold;" Text="Login" Width="100%"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style2">
                                            <table class="auto-style1">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="UsernameLabel" runat="server" style="text-align:right" Text="Username"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UserName" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="PasswordLabel" runat="server" Text="Password"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Password" ErrorMessage="RequiredFieldValidator" ForeColor="Red">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Button ID="LoginBtn" runat="server" Text="Login" OnClick="LoginUser" />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:LinkButton ID="SignUpLink" runat="server" OnClick="SignUp" CausesValidation="False" PostBackUrl="~/Signup.aspx">Sign up</asp:LinkButton>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:Label ID="ErrorLabel" runat="server" ForeColor="Red"></asp:Label>
                                            <table class="auto-style1">
                                                <tr>
                                                    <td>&nbsp;</td>
                                                </tr>
                                            </table>
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
                </td>
            </tr>
        </table>
    
    </div>

    </form>
</body>
</html>
