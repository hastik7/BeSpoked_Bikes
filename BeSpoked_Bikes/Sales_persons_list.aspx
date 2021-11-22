<%@ Page Title="Salesperson List" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Sales_persons_list.aspx.cs" Inherits="BeSpoked_Bikes.Sales_persons_list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
            <h2 class="md-">Salespersons</h2>
            <asp:Button Style="float: right;" runat="server" ID="btnAddNewSalesPerson" Text="Add New Salesperson" PostBackUrl="~/Sales_person_details.aspx" />
    </div>
    <div id="main">
        <asp:GridView runat="server" ID="gvSales_persons" DataKeyNames="pk_sales_person" AutoGenerateColumns="false" CssClass="gridview"
            HorizontalAlign="Center" OnRowEditing="gvSales_persons_RowEditing">
            <Columns>
                <asp:BoundField HeaderText="First Name" DataField="first_name" />
                <asp:BoundField HeaderText="Last Name" DataField="last_name" />
                <asp:BoundField HeaderText="Address" DataField="address" />
                <asp:BoundField HeaderText="Phone" DataField="phone" />
                <asp:BoundField HeaderText="Start Date" DataField="start_date" DataFormatString="{0:MM/dd/yyyy}" />
                <asp:BoundField HeaderText="Termination Date" DataField="termination_date" DataFormatString="{0:MM/dd/yyyy}" />
                <asp:BoundField HeaderText="Manager Name" DataField="manager" />
                <asp:BoundField HeaderText="Is Manager" DataField="is_manager" />
                <asp:TemplateField HeaderText="Edit" HeaderStyle-Width="80">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkEdit" CommandName="Edit" Text="Edit" runat="server"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EmptyDataTemplate>No Sales Person Record Available</EmptyDataTemplate>
        </asp:GridView>
    </div>
</asp:Content>
