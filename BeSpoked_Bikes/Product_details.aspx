<%@ Page Title="Product Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Product_details.aspx.cs" Inherits="BeSpoked_Bikes.Product_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div id="main">
        <h1>New Product</h1>

        <table class="table">
            <tr>
                <td style="width: 40%">Product Name:</td>
                <td style="width: 60%">
                    <asp:UpdatePanel ID="upProduct_Name" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:TextBox runat="server" ID="txtProduct_Name" MaxLength="200" Width="200px" OnTextChanged="txtProduct_Name_TextChanged" AutoPostBack="true"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="reqProduct_Name" ControlToValidate="txtProduct_Name" Display="Dynamic"
                                runat="server" ValidationGroup="AddProduct" ForeColor="Red">*
                            </asp:RequiredFieldValidator>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="txtProduct_Name" EventName="TextChanged" />
                        </Triggers>
                    </asp:UpdatePanel>

                </td>
            </tr>
            <tr>
                <td>Manufacturer: </td>
                <td>
                    <asp:TextBox runat="server" ID="txtManufacturer" MaxLength="100" Width="200px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqManufacturer" ControlToValidate="txtManufacturer" Display="Dynamic"
                        runat="server" ValidationGroup="AddProduct" ForeColor="Red">*
                    </asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Style: </td>
                <td>
                    <asp:TextBox runat="server" ID="txtStyle" MaxLength="100" Width="200px"></asp:TextBox>

                </td>
            </tr>
            <tr>
                <td>Purchase Price ($): </td>
                <td>
                    <asp:TextBox runat="server" ID="txtPurchase_Price" MaxLength="11" Width="200px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqPurchase_Price" ControlToValidate="txtPurchase_Price" Display="Dynamic"
                        runat="server" ValidationGroup="AddProduct" ForeColor="Red">*
                    </asp:RequiredFieldValidator>
                    <br />
                    <asp:CompareValidator ID="vPurchase_Price" runat="server" Display="Dynamic" ValueToCompare="0" ValidationGroup="AddProduct"
                        ControlToValidate="txtPurchase_Price" ErrorMessage="Please enter purchase price greater than 0" Operator="GreaterThan"
                        Type="Currency" ForeColor="Red"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td>Sale Price ($): </td>
                <td>
                    <asp:TextBox runat="server" ID="txtSale_Price" MaxLength="10" Width="200px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqSale_Price" ControlToValidate="txtSale_Price" Display="Dynamic"
                        runat="server" ValidationGroup="AddProduct" ForeColor="Red">*
                    </asp:RequiredFieldValidator>
                    <br />
                    <asp:CompareValidator ID="vSale_Price" runat="server" Display="Dynamic" ControlToCompare="txtPurchase_Price" ValidationGroup="AddProduct"
                        ControlToValidate="txtSale_Price" ErrorMessage="Please enter sale price greater than purchase price" Operator="GreaterThanEqual"
                        Type="Currency" ForeColor="Red"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td>Quantity:</td>
                <td>
                    <asp:TextBox runat="server" ID="txtQuantity" TextMode="Number" MaxLength="5" Width="200px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqQuantity" ControlToValidate="txtQuantity" Display="Dynamic"
                        runat="server" ValidationGroup="AddProduct" ForeColor="Red">*
                    </asp:RequiredFieldValidator>
                    <br />
                    <asp:CompareValidator ID="vQauntity" runat="server" Display="Dynamic" ValueToCompare="0" ValidationGroup="AddProduct"
                        ControlToValidate="txtQuantity" ErrorMessage="Please enter quantity greater than 0" Operator="GreaterThan"
                        Type="Integer" ForeColor="Red"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td>Commission Percentage (%):</td>
                <td>
                    <asp:TextBox runat="server" ID="txtCommission_Percentage" MaxLength="5" Width="200px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqCommission_Percentage" ControlToValidate="txtCommission_Percentage" Display="Dynamic"
                        runat="server" ValidationGroup="AddProduct" ForeColor="Red">*
                    </asp:RequiredFieldValidator>
                    
                    <asp:RangeValidator runat="server" ID="vComm_Per" ControlToValidate="txtCommission_Percentage" Display="Dynamic" Type="Double" 
                        MinimumValue="0" MaximumValue="100" ErrorMessage="Please enter commission percentage between 0 and 100" ValidationGroup="AddProduct" ForeColor="Red"></asp:RangeValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button runat="server" Text="Save" ID="btnSave" OnClick="btnSave_Click" ValidationGroup="AddProduct" />
                </td>
                <td>
                    <asp:Button runat="server" Text="Cancel" ID="btnCancel" PostBackUrl="~/Products_list.aspx" />
                </td>
            </tr>

        </table>

        <asp:HiddenField runat="server" ID="hdnProduct_Name" />
        <asp:HiddenField runat="server" ID="hdnID" />

    </div>

</asp:Content>
