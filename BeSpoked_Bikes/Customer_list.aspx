<%@ Page Title="Customers List" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Customer_list.aspx.cs" Inherits="BeSpoked_Bikes.Customer_list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h2>Customers</h2>
    </div>
    <div id="main">
        <asp:GridView runat="server" ID="gvCustomer" DataKeyNames="pk_customer" AutoGenerateColumns="false" CellSpacing="1"
            HorizontalAlign="Center" CssClass="gridview">
            <Columns>
                <asp:BoundField HeaderText="First Name" DataField="first_name" />
                <asp:BoundField HeaderText="Last Name" DataField="last_name" />
                <asp:BoundField HeaderText="Address" DataField="address" />
                <asp:BoundField HeaderText="Phone" DataField="phone" />
                <asp:BoundField HeaderText="Start Date" DataField="start_date" DataFormatString="{0:MM/dd/yyyy}"/>
            </Columns>
            <EmptyDataTemplate>No Customer Record Available</EmptyDataTemplate>
        </asp:GridView>
    </div>
</asp:Content>
