<%@ Page Title="" Language="C#" MasterPageFile="~/JobSeeker.Master" AutoEventWireup="true" CodeBehind="JobsSeeker.aspx.cs" Inherits="EEEx.JobsSeeker" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">

        .auto-style6 {
            width: 311px;
        }
        .auto-style7 {
            width: 456px;
        }
        .auto-style8 {
            height: 23px;
            width: 462px;
        }
        .auto-style9 {
            width: 431px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <table class="auto-style1">
        <tr>
            <td>    <table class="auto-style1">
        <tr>
            <td>
                <table class="auto-style4" style="width: 1078px">
                    <tr>
                        <td style="text-align: center" class="auto-style6">
                            <asp:Button ID="VJBtn" runat="server" CausesValidation="False" OnClick="VJBtn_Click" Text="View Jobs" />
                        </td>
                        <td style="text-align: center" class="auto-style9">
                            <asp:Button ID="RejectBtn" runat="server" OnClick="RejectBtn_Click" Text="View Rejected Jobs" />
                        </td>
                        <td style="text-align: center">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="VAJBtn" runat="server" CausesValidation="False" OnClick="VAJBtn_Click" Text="View Applied Jobs" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:MultiView ID="MultiViewJob" runat="server">
                    <asp:View ID="RejectedView" runat="server">
                        <asp:FormView ID="RejectFV" runat="server" AllowPaging="True" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" GridLines="Both" OnPageIndexChanging="RejectFV_PageIndexChanging" Width="1093px">
                            <EditRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                            <FooterStyle BackColor="#CCCCCC" />
                            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                            <ItemTemplate>
                                <table class="auto-style1">
                                    <tr>
                                        <td>
                                            <table class="auto-style1">
                                                <tr>
                                                    <td class="auto-style7" style="text-align: right">
                                                        <asp:Label ID="JNLbl1" runat="server" Text="Job Name"></asp:Label>
                                                    </td>
                                                    <td style="text-align: center">
                                                        <asp:Label ID="JNLabel1" runat="server" Text='<%# Eval("Job Name") %>'></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style7" style="text-align: right">
                                                        <asp:Label ID="CatgLbl1" runat="server" Text="Category"></asp:Label>
                                                    </td>
                                                    <td style="text-align: center">
                                                        <asp:Label ID="Category1" runat="server" Text='<%# Eval("Category") %>'></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style7" style="text-align: right">
                                                        <asp:Label ID="SalaryLbl1" runat="server" Text="Salary"></asp:Label>
                                                    </td>
                                                    <td style="text-align: center">
                                                        <asp:Label ID="Salary1" runat="server" Text='<%# Eval("Salary") %>'></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style7" style="text-align: right">
                                                        <asp:Label ID="DescLbl1" runat="server" Text="Description"></asp:Label>
                                                    </td>
                                                    <td style="text-align: center">
                                                        <asp:Label ID="Desc1" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
                                                        &nbsp;</td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center">
                                            <table class="auto-style1">
                                                <tr>
                                                    <td>
                                                        <table class="auto-style1">
                                                            <tr>
                                                                <td class="auto-style8" style="text-align: right">
                                                                    <asp:Label ID="JPLbl1" runat="server" Text="Job Provider"></asp:Label>
                                                                </td>
                                                                <td class="auto-style4">
                                                                    <asp:Label ID="JPName1" runat="server" Text='<%# Eval("Company Name") %>'></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="auto-style8" style="text-align: right">
                                                                    <asp:Label ID="ContactLbl1" runat="server" Text="Contact Number"></asp:Label>
                                                                </td>
                                                                <td class="auto-style4">
                                                                    <asp:Label ID="ContactNum1" runat="server" Text='<%# Eval("Phone") %>'></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="auto-style8" style="text-align: right">
                                                                    <asp:Label ID="SLbl0" runat="server" Text="Status"></asp:Label>
                                                                </td>
                                                                <td class="auto-style4">
                                                                    <asp:Label ID="Status0" runat="server" Text='<%# Eval("Status") %>'></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:HiddenField ID="ApplicationId0" runat="server" Value='<%# Eval("Job Id") %>' />
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
                    </asp:View>
                    <asp:View ID="VJV" runat="server">
                        <table class="auto-style1">
                            <tr>
                                <td>
                                    <asp:FormView ID="VJFormView" runat="server" AllowPaging="True" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" GridLines="Both" OnPageIndexChanging="VJFormView_PageIndexChanging" Width="1093px">
                                        <EditRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                        <FooterStyle BackColor="#CCCCCC" />
                                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                                        <ItemTemplate>
                                            <table class="auto-style1">
                                                <tr>
                                                    <td>
                                                        <table class="auto-style1">
                                                            <tr>
                                                                <td class="auto-style7" style="text-align: right">
                                                                    <asp:Label ID="JNLbl" runat="server" Text="Job Name"></asp:Label>
                                                                </td>
                                                                <td style="text-align: center">
                                                                    <asp:Label ID="JNLabel" runat="server" Text='<%# Eval("Job Name") %>'></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="auto-style7" style="text-align: right">
                                                                    <asp:Label ID="CatgLbl" runat="server" Text="Category"></asp:Label>
                                                                </td>
                                                                <td style="text-align: center">
                                                                    <asp:Label ID="Category" runat="server" Text='<%# Eval("Category") %>'></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="auto-style7" style="text-align: right">
                                                                    <asp:Label ID="SalaryLbl" runat="server" Text="Salary"></asp:Label>
                                                                </td>
                                                                <td style="text-align: center">
                                                                    <asp:Label ID="Salary" runat="server" Text='<%# Eval("Salary") %>'></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="auto-style7" style="text-align: right">
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
                                                                <td>
                                                                    <table class="auto-style1">
                                                                        <tr>
                                                                            <td class="auto-style8" style="text-align: right">
                                                                                <asp:Label ID="JPLbl" runat="server" Text="Job Provider"></asp:Label>
                                                                            </td>
                                                                            <td class="auto-style4">
                                                                                <asp:Label ID="JPName" runat="server" Text='<%# Eval("Company Name") %>'></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="auto-style8" style="text-align: right">
                                                                                <asp:Label ID="ContactLbl" runat="server" Text="Contact Number"></asp:Label>
                                                                            </td>
                                                                            <td class="auto-style4">
                                                                                <asp:Label ID="ContactNum" runat="server" Text='<%# Eval("Phone") %>'></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Button ID="ApplyBtn" runat="server" Text="Apply" OnClick="ApplyBtn_Click" OnClientClick="return confirm('Are you sure want to apply?')" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
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
                    <asp:View ID="VAJV" runat="server">
                        <table class="auto-style1">
                            <tr>
                                <td>
                                    <asp:FormView ID="VAJFormView" runat="server" AllowPaging="True" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" GridLines="Both" OnPageIndexChanging="VAJFormView_PageIndexChanging" Width="1093px">
                                        <EditRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                        <FooterStyle BackColor="#CCCCCC" />
                                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                                        <ItemTemplate>
                                            <table class="auto-style1">
                                                <tr>
                                                    <td>
                                                        <table class="auto-style1">
                                                            <tr>
                                                                <td class="auto-style7" style="text-align: right">
                                                                    <asp:Label ID="JNLbl0" runat="server" Text="Job Name"></asp:Label>
                                                                </td>
                                                                <td style="text-align: center">
                                                                    <asp:Label ID="JNLabel0" runat="server" Text='<%# Eval("Job Name") %>'></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="auto-style7" style="text-align: right">
                                                                    <asp:Label ID="CatgLbl0" runat="server" Text="Category"></asp:Label>
                                                                </td>
                                                                <td style="text-align: center">
                                                                    <asp:Label ID="Category0" runat="server" Text='<%# Eval("Category") %>'></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="auto-style7" style="text-align: right">
                                                                    <asp:Label ID="SalaryLbl0" runat="server" Text="Salary"></asp:Label>
                                                                </td>
                                                                <td style="text-align: center">
                                                                    <asp:Label ID="Salary0" runat="server" Text='<%# Eval("Salary") %>'></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="auto-style7" style="text-align: right">
                                                                    <asp:Label ID="DescLbl0" runat="server" Text="Description"></asp:Label>
                                                                </td>
                                                                <td style="text-align: center">
                                                                    <asp:Label ID="Desc0" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
                                                                    &nbsp;</td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: center">
                                                        <table class="auto-style1">
                                                            <tr>
                                                                <td>
                                                                    <table class="auto-style1">
                                                                        <tr>
                                                                            <td class="auto-style8" style="text-align: right">
                                                                                <asp:Label ID="JPLbl0" runat="server" Text="Job Provider"></asp:Label>
                                                                            </td>
                                                                            <td class="auto-style4">
                                                                                <asp:Label ID="JPName0" runat="server" Text='<%# Eval("Company Name") %>'></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="auto-style8" style="text-align: right">
                                                                                <asp:Label ID="ContactLbl0" runat="server" Text="Contact Number"></asp:Label>
                                                                            </td>
                                                                            <td class="auto-style4">
                                                                                <asp:Label ID="ContactNum0" runat="server" Text='<%# Eval("Phone") %>'></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="auto-style8" style="text-align: right">
                                                                                <asp:Label ID="SLbl" runat="server" Text="Status"></asp:Label>
                                                                            </td>
                                                                            <td class="auto-style4">
                                                                                <asp:Label ID="Status" runat="server" Text='<%# Eval("Status") %>'></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Button ID="CancelBtn" runat="server" OnClick="CancelBtn_Click" OnClientClick="return confirm('Are you sure want to cancel application?')" Text="Cancel Application" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:HiddenField ID="ApplicationId" runat="server" Value='<%# Eval("Job Id") %>' />
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
                </asp:MultiView>
            </td>
        </tr>
    </table>
            </td>
        </tr>
    </table>
</asp:Content>

