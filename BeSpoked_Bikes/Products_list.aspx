<%@ Page Title="Products List" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Products_list.aspx.cs" Inherits="BeSpoked_Bikes.Product_list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
       <h2>Products</h2>
        <asp:Button Style="float: right;" runat="server" ID="btnAddNewProduct" Text="Add New Product" PostBackUrl="~/Product_details.aspx" />
    </div>
    <div id="main">
        <asp:GridView runat="server" ID="gvProduct" DataKeyNames="pk_product" AutoGenerateColumns="false" CssClass="gridview"
            HorizontalAlign="Center" OnRowEditing="gvProduct_RowEditing">
            <Columns>
                <asp:BoundField HeaderText="Product Name" DataField="name" />
                <asp:BoundField HeaderText="Manufacturer" DataField="manufacturer" />
                <asp:BoundField HeaderText="Style" DataField="style" />
                <asp:BoundField HeaderText="Purchase Price ($)" DataField="purchase_price" />
                <asp:BoundField HeaderText="Sale Price ($)" DataField="sale_price" />
                <asp:BoundField HeaderText="Available Quantity" DataField="available_qty" />
                <asp:BoundField HeaderText="Commission Percentage" DataField="commission_percentage" />
                <asp:TemplateField HeaderText="Edit" HeaderStyle-Width="80">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkEdit" CommandName="Edit" Text="Edit" runat="server"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EmptyDataTemplate>No Product Record Available</EmptyDataTemplate>
        </asp:GridView>
    </div>
</asp:Content>
