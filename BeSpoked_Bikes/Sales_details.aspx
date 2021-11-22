<%@ Page Title="Sales Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Sales_details.aspx.cs" Inherits="BeSpoked_Bikes.Sales_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div id="main">
        <h1>Create a Sale</h1>

        <table class="table">
            <tr>
                <td style="width: 40%">Product:</td>
                <td style="width: 60%">
                    <asp:DropDownList runat="server" ID="ddlProduct" Width="210px"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="reqProduct" runat="server" ValidationGroup="AddSales"
                        SetFocusOnError="true" ErrorMessage="Please Select Product" Display="Dynamic"
                        ControlToValidate="ddlProduct" InitialValue="0">*</asp:RequiredFieldValidator>

                </td>
            </tr>
            <tr>
                <td>Salesperson: </td>
                <td>
                    <asp:DropDownList ID="ddlSales_Person" runat="server" Width="210px"></asp:DropDownList>
                      <asp:RequiredFieldValidator ID="reqSales_Person" runat="server" ValidationGroup="AddSales"
                        SetFocusOnError="true" ErrorMessage="Please Select Sales Person" Display="Dynamic"
                        ControlToValidate="ddlSales_Person" InitialValue="0">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Customer: </td>
                <td>
                    <asp:DropDownList runat="server" ID="ddlCustomer" Width="210px"></asp:DropDownList>
                      <asp:RequiredFieldValidator ID="reqCustomer" runat="server" ValidationGroup="AddSales"
                        SetFocusOnError="true" ErrorMessage="Please Select Customer" Display="Dynamic"
                        ControlToValidate="ddlCustomer" InitialValue="0">*</asp:RequiredFieldValidator>

                </td>
            </tr>

            <tr>
                <td>Sales Date: </td>
                <td>
                    <asp:TextBox runat="server" ID="txtSales_Date" TextMode="Date" Width="200px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqSales_Date" ControlToValidate="txtSales_Date" Display="Dynamic"
                        runat="server" ValidationGroup="AddSales" ForeColor="Red">*
                    </asp:RequiredFieldValidator>

                </td>
            </tr>

            <tr>
                <td>
                    <asp:Button runat="server" Text="Save" ID="btnSave" OnClick="btnSave_Click" ValidationGroup="AddSales" />
                </td>
                <td>
                    <asp:Button runat="server" Text="Cancel" ID="btnCancel" PostBackUrl="~/Sales_list.aspx" />
                </td>
            </tr>

        </table>

        <br />



    </div>

</asp:Content>
