<%@ Page Title="" Language="C#" MasterPageFile="~/JobProvider.Master" AutoEventWireup="true" CodeBehind="Jobs.aspx.cs" Inherits="EEEx.Jobs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style4 {
            width: 100%;
            background-color: #99CCFF;
        }
    .auto-style5 {
        width: 510px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <td>
                <table class="auto-style4">
                    <tr>
                        <td style="text-align: center">
                            <asp:Button ID="VJBtn" runat="server" CausesValidation="False" OnClick="VJBtn_Click" Text="View Jobs" />
                        </td>
                        <td style="text-align: center">
                            <asp:Button ID="AJBtn" runat="server" CausesValidation="False" OnClick="AJBtn_Click" Text="Add Job" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:MultiView ID="MultiViewJob" runat="server">
                    <asp:View ID="VJV" runat="server">
                        <table class="auto-style1">
                            <tr>
                                <td>
                                    <asp:FormView ID="VJFormView" runat="server" AllowPaging="True" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" GridLines="Both" OnPageIndexChanging="VJFormView_PageIndexChanging" Width="1071px">
                                        <EditRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                        <FooterStyle BackColor="#CCCCCC" />
                                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                                        <ItemTemplate>
                                            <table class="auto-style1">
                                                <tr>
                                                    <td>
                                                        <table class="auto-style1">
                                                            <tr>
                                                                <td class="auto-style5" style="text-align: right">
                                                                    <asp:Label ID="JNLbl" runat="server" Text="Job Name"></asp:Label>
                                                                </td>
                                                                <td style="text-align: center">
                                                                    <asp:Label ID="JNLabel" runat="server" Text='<%# Eval("Job Name") %>'></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="auto-style5" style="text-align: right">
                                                                    <asp:Label ID="CatgLbl" runat="server" Text="Category"></asp:Label>
                                                                </td>
                                                                <td style="text-align: center">
                                                                    <asp:Label ID="Category" runat="server" Text='<%# Eval("Category") %>'></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="auto-style5" style="text-align: right">
                                                                    <asp:Label ID="SalaryLbl" runat="server" Text="Salary"></asp:Label>
                                                                </td>
                                                                <td style="text-align: center">
                                                                    <asp:Label ID="Salary" runat="server" Text='<%# Eval("Salary") %>'></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="auto-style5" style="text-align: right">
                                                                    <asp:Label ID="DescLbl" runat="server" Text="Description"></asp:Label>
                                                                </td>
                                                                <td style="text-align: center">
                                                                    <asp:Label ID="Desc" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
&nbsp;</td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: center">
                                                        <table class="auto-style1">
                                                            <tr>
                                                                <td class="auto-style5" style="text-align: right">
                                                                    <asp:Label ID="AppLbl" runat="server" Text="No of applications"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="AppCount" runat="server" Text='<%# Eval("Application Count") %>'></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: center">
                                                        <table class="auto-style1">
                                                            <tr>
                                                                <td>
                                                                    <asp:Button ID="DeleteBtn" runat="server" Text="Delete Job" OnClick="DeleteBtn_Click" OnClientClick="return confirm('Are you sure want to delete the job?')"/>
                                                                </td>
                                                                <td>
                                                                    <asp:Button ID="ApplicantBtn" runat="server" Text="View Applicants" OnClick="ApplicantBtn_Click" />
                                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                    <asp:Button ID="VSABtn" runat="server" OnClick="VSABtn_Click" Text="View Selected Applicants" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2">
                                                                    <asp:HiddenField ID="JobId" runat="server" Value='<%# Eval("Job Id") %>' />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                                        <RowStyle BackColor="White" />
                                    </asp:FormView>
                                </td>
                            </tr>
                        </table>
                    </asp:View>
                    <asp:View ID="AJV" runat="server">
                        <table class="auto-style1">
                            <tr>
                                <td>
                                    <table class="auto-style1">
                                        <tr>
                                            <td style="text-align: right">
                                                <asp:Label ID="JNLbl" runat="server" Text="Job Name"></asp:Label>
                                            </td>
                                            <td style="text-align: center">
                                                <asp:TextBox ID="JNTB" runat="server" style="text-align: center"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RFVJN" runat="server" ControlToValidate="JNTB" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: right">
                                                <asp:Label ID="CatgLbl" runat="server" Text="Category"></asp:Label>
                                            </td>
                                            <td style="text-align: center">
                                                <asp:DropDownList ID="DDLCatg" runat="server">
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RFVCatg" runat="server" ControlToValidate="DDLCatg" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: right">
                                                <asp:Label ID="SalaryLbl" runat="server" Text="Salary"></asp:Label>
                                            </td>
                                            <td style="text-align: center">
                                                <asp:TextBox ID="SalaryTD" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RFVSalary" runat="server" ControlToValidate="SalaryTD" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: right">
                                                <asp:Label ID="DescLbl" runat="server" Text="Description"></asp:Label>
                                            </td>
                                            <td style="text-align: center">&nbsp;&nbsp;&nbsp;&nbsp;
                                                <asp:TextBox ID="DescTD" runat="server" TextMode="MultiLine"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RFVDesc" runat="server" ControlToValidate="DescTD" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: center">
                                    <asp:Button ID="SubmitBtn" runat="server" OnClick="SubmitBtn_Click" Text="Submit" />
                                </td>
                            </tr>
                        </table>
                    </asp:View>
                </asp:MultiView>
            </td>
        </tr>
    </table>
</asp:Content>
