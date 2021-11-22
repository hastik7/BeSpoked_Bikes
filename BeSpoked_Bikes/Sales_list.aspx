<%@ Page Title="Sales List" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Sales_list.aspx.cs" Inherits="BeSpoked_Bikes.Sales_list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row jumbotron">
        <div class="col-md-6">
            <h2>Sales</h2>
        </div>
        <div class="col-md-6 text-right">
            <asp:Button runat="server" ID="btnAddNewSales" Text="Create a Sale" PostBackUrl="~/Sales_details.aspx" />
        </div>
    </div>
    <div class="row">
        <div class="col-md-3 text-right">
            <p>Filter: </p>
        </div>
        <div class="col-md-2">
            <asp:TextBox runat="server" ID="txtStart_Date" TextMode="Date"></asp:TextBox>
        </div>
        <div class="col-md-2">
            <asp:TextBox runat="server" ID="txtEndDate" TextMode="Date"></asp:TextBox>
        </div>
        <div class="col-md-2">

            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />

        </div>
        <div class="col-md-3"></div>
    </div>
    <br />


    <div class="row">
        <div class="col-md-12">
            <asp:UpdatePanel ID="upSales" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:GridView runat="server" ID="gvSales" DataKeyNames="pk_sales" AutoGenerateColumns="false" CssClass="gridview"
                        HorizontalAlign="Center">
                        <Columns>
                            <asp:BoundField HeaderText="Product" DataField="product" />
                            <asp:BoundField HeaderText="Customer" DataField="customer" />
                            <asp:BoundField HeaderText="Date" DataField="sales_date" DataFormatString="{0:MM/dd/yyyy}" />
                            <asp:BoundField HeaderText="Price ($)" DataField="price" />
                            <asp:BoundField HeaderText="Salesperson" DataField="sales_person" />
                            <asp:BoundField HeaderText="Salesperson Commission ($)" DataField="commission" />
                        </Columns>
                        <EmptyDataTemplate>No Sales Record Available</EmptyDataTemplate>
                    </asp:GridView>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnSearch" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>

        </div>
    </div>
</asp:Content>
