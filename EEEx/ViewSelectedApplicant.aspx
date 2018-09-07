<%@ Page Title="" Language="C#" MasterPageFile="~/JobProvider.Master" AutoEventWireup="true" CodeBehind="ViewSelectedApplicant.aspx.cs" Inherits="EEEx.ViewSelectedApplicant" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <td style="text-align: center">
                <asp:Label ID="JobDesc" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:FormView ID="ApplicantFormView" runat="server" AllowPaging="True" OnPageIndexChanging="ApplicantFormView_PageIndexChanging" Width="1070px">
                    <ItemTemplate>
                        <table class="auto-style1">
                            <tr>
                                <td>&nbsp;
                                    <table class="auto-style2" style="width: 1056px">
                                            <tr>
                                                <td class="auto-style7" style="text-align: right">
                                                    <asp:Label ID="FNLbl" runat="server" Text="First Name"></asp:Label>
                                                </td>
                                                <td class="auto-style9" style="text-align: center">&nbsp;</td>
                                                <td class="auto-style12">
                                                    <asp:Label ID="FirstNameLbl" runat="server" Text='<%# Eval("First Name") %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style7" style="text-align: right">
                                                    <asp:Label ID="LNLbl" runat="server" Text="Last Name"></asp:Label>
                                                </td>
                                                <td class="auto-style9" style="text-align: center">&nbsp;</td>
                                                <td class="auto-style12">
                                                    <asp:Label ID="LastNameLbl" runat="server" Text='<%# Eval("Last Name") %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style7" style="text-align: right">
                                                    <asp:Label ID="EmailLbl" runat="server" Text="Email"></asp:Label>
                                                </td>
                                                <td class="auto-style9" style="text-align: center">&nbsp;</td>
                                                <td class="auto-style12">&nbsp;<asp:Label ID="Email" runat="server" Text='<%# Eval("username") %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style7" style="text-align: right">
                                                    <asp:Label ID="AddrLbl" runat="server" Text="Address"></asp:Label>
                                                </td>
                                                <td class="auto-style9" style="text-align: center">&nbsp;</td>
                                                <td class="auto-style12">
                                                    <asp:Label ID="Address" runat="server" Text='<%# Eval("Address") %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style7" style="text-align: right">
                                                    <asp:Label ID="StateLbl" runat="server" Text="State"></asp:Label>
                                                </td>
                                                <td class="auto-style9" style="text-align: center">&nbsp;</td>
                                                <td class="auto-style12">
                                                    <asp:Label ID="State" runat="server" Text='<%# Eval("SName") %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style7" style="text-align: right">
                                                    <asp:Label ID="CityLbl" runat="server" Text="City"></asp:Label>
                                                </td>
                                                <td class="auto-style9" style="text-align: center">&nbsp;</td>
                                                <td class="auto-style12">
                                                    <asp:Label ID="City" runat="server" Text='<%# Eval("CName") %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style7" style="text-align: right">
                                                    <asp:Label ID="PinLbl" runat="server" Text="Pincode"></asp:Label>
                                                </td>
                                                <td class="auto-style9" style="text-align: center">&nbsp;</td>
                                                <td class="auto-style12"><asp:Label ID="Pincode" runat="server" Text='<%# Eval("Pincode") %>'></asp:Label>
&nbsp;
                                                    </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style7" style="text-align: right">
                                                    <asp:Label ID="GenderLbl" runat="server" Text="Gender"></asp:Label>
                                                </td>
                                                <td class="auto-style9" style="text-align: center">&nbsp;</td>
                                                <td class="auto-style12">
                                                    &nbsp;<asp:Label ID="Gender" runat="server" Text='<%# Eval("Gender") %>'></asp:Label>
                                                    &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style7" style="text-align: right">
                                                    <asp:Label ID="DegreeLbl" runat="server" Text="Degree"></asp:Label>
                                                </td>
                                                <td class="auto-style9" style="text-align: center">&nbsp;</td>
                                                <td class="auto-style12">
                                                    <asp:Label ID="Degree" runat="server" Text='<%# Eval("DValue") %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style7" style="text-align: right">
                                                    <asp:Label ID="FieldLbl" runat="server" Text="Field"></asp:Label>
                                                </td>
                                                <td class="auto-style9" style="text-align: center">&nbsp;</td>
                                                <td class="auto-style12">
                                                    <asp:Label ID="Field" runat="server" Text='<%# Eval("FValue") %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style7" style="text-align: right">
                                                    <asp:Label ID="ResumeLbl" runat="server" Text="Resume URL"></asp:Label>
                                                </td>
                                                <td class="auto-style9" style="text-align: center">&nbsp;</td>
                                                <td class="auto-style12"><asp:Label ID="Resume" runat="server" Text='<%# Eval("Resume") %>'></asp:Label>
                                                    &nbsp;&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style7" style="text-align: right">
                                                    <asp:Label ID="CertificateLbl" runat="server" Text="Certificate URL"></asp:Label>
                                                </td>
                                                <td class="auto-style9" style="text-align: center">&nbsp;</td>
                                                <td style="text-align: center">
                                                    <table class="auto-style1">
                                                        <tr>
                                                            <td class="auto-style5">&nbsp;<asp:Label ID="Certificate" runat="server" Text='<%# Eval("Certificate") %>'></asp:Label>
                                                                &nbsp;&nbsp;
                                                                </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style7" style="text-align: right">
                                                    <asp:Label ID="DOB" runat="server" Text="Date of Birth"></asp:Label>
                                                </td>
                                                <td class="auto-style9" style="text-align: center">&nbsp;</td>
                                                <td class="auto-style13"><asp:Label ID="DOBLbl" runat="server" Text='<%# Eval("DOB") %>'></asp:Label>
                                                    &nbsp;&nbsp;
                                                    </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style7" style="text-align: right">
                                                    <asp:Label ID="Label1" runat="server" Text="Application Status"></asp:Label>
                                                </td>
                                                <td class="auto-style9" style="text-align: center">&nbsp;</td>
                                                <td class="auto-style13">
                                                    <asp:Label ID="Status" runat="server" Text='<%# Eval("Status") %>'></asp:Label>
                                                    <asp:HiddenField ID="AppId" runat="server" Value='<%# Eval("ApplicationId") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style3" colspan="3" style="text-align: center">
                                                    <table class="auto-style1">
                                                        <tr>
                                                            <td class="auto-style11">
                                                                &nbsp;</td>
                                                            <td class="auto-style10">
                                                                &nbsp;</td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>

                </asp:FormView>
            </td>
        </tr>
    </table>

</asp:Content>
