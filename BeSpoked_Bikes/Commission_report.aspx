<%@ Page Title="Commission Report" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Commission_report.aspx.cs" Inherits="BeSpoked_Bikes.Commission_report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h2>Quarterly Salesperson Commission Report</h2>
    </div>

    <div class="row">

        <div class="col-md-6 text-right">
            Year:
        </div>

        <div class="col-md-6 text-left">
            <asp:DropDownList ID="ddlYear" runat="server"></asp:DropDownList>
        </div>
    </div>
    <br />

    <div class="row">
        <div class="col-md-6 text-right">
            Quarter:
        </div>

        <div class="col-md-6 text-left">
            <asp:DropDownList ID="ddlQuater" runat="server">
                <asp:ListItem Text="First Quarter (Q1)" Value="1" Selected="True"></asp:ListItem>
                <asp:ListItem Text="Second Quarter (Q2)" Value="2"></asp:ListItem>
                <asp:ListItem Text="Third Quarter (Q3)" Value="3"></asp:ListItem>
                <asp:ListItem Text="Fourth Quarter (Q4)" Value="4"></asp:ListItem>
            </asp:DropDownList>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-md-12 text-center">
            <asp:Button ID="btnGenerate" runat="server" Text="Generate Report" OnClick="btnGenerate_Click" />
        </div>

    </div>
    <br />
    <div class="row">

        <div class="col-md-12">
            <asp:GridView runat="server" ID="gvReport" AutoGenerateColumns="false" CssClass="gridview" HorizontalAlign="Center">
                <Columns>
                    <asp:BoundField HeaderText="Salesperson" DataField="name" />
                    <asp:BoundField HeaderText="Commission ($)" DataField="commission" />
                </Columns>
                <EmptyDataTemplate>No Record Available</EmptyDataTemplate>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
