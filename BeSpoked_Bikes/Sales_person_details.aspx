<%@ Page Title="Salesperson Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Sales_person_details.aspx.cs" Inherits="BeSpoked_Bikes.Sales_person_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div id="main">
        <h1>New Salesperson</h1>

        <table class="table">
            <tr>
                <td style="width: 40%">First Name:</td>
                <td style="width: 60%">
                    <asp:UpdatePanel ID="upFirst_Name" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:TextBox runat="server" ID="txtFirst_Name" MaxLength="50" Width="200px" OnTextChanged="txtName_TextChanged" AutoPostBack="true"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="reqFirst_Name" ControlToValidate="txtFirst_Name" Display="Dynamic"
                                runat="server" ValidationGroup="AddSalesPerson" ForeColor="Red">*
                            </asp:RequiredFieldValidator>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="txtLast_Name" EventName="TextChanged" />
                        </Triggers>
                    </asp:UpdatePanel>
                    <asp:HiddenField runat="server" ID="hdnFirst_Name" />
                </td>
            </tr>
            <tr>
                <td>Last Name: </td>
                <td>
                    <asp:UpdatePanel ID="upLast_Name" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:TextBox runat="server" ID="txtLast_Name" MaxLength="50" Width="200px" OnTextChanged="txtName_TextChanged" AutoPostBack="true"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="reqLast_Name" ControlToValidate="txtLast_Name" Display="Dynamic"
                                runat="server" ValidationGroup="AddSalesPerson" ForeColor="Red">*
                            </asp:RequiredFieldValidator>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="txtFirst_Name" EventName="TextChanged" />
                        </Triggers>
                    </asp:UpdatePanel>
                    <asp:HiddenField runat="server" ID="hdnLast_Name" />
                </td>
            </tr>
            <tr>
                <td>Address: </td>
                <td>
                    <asp:TextBox runat="server" ID="txtAddress" TextMode="MultiLine" MaxLength="200" Width="200px"></asp:TextBox>

                </td>
            </tr>
            <tr>
                <td>Phone: </td>
                <td>
                    <asp:TextBox runat="server" ID="txtPhone" MaxLength="20" Width="200px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqPhone" ControlToValidate="txtPhone" Display="Dynamic"
                        runat="server" ValidationGroup="AddSalesPerson" ForeColor="Red">*
                    </asp:RequiredFieldValidator>

                </td>
            </tr>
            <tr>
                <td>Start Date: </td>
                <td>
                    <asp:TextBox runat="server" ID="txtStart_Date" TextMode="Date" Width="200px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqStart_Date" ControlToValidate="txtStart_Date" Display="Dynamic"
                        runat="server" ValidationGroup="AddSalesPerson" ForeColor="Red">*
                    </asp:RequiredFieldValidator>

                </td>
            </tr>
            <tr>
                <td>Termination Date: </td>
                <td>
                    <asp:TextBox runat="server" ID="txtTermination_Date" TextMode="Date" Width="200px"></asp:TextBox>
                    <asp:CompareValidator ID="vTermination_Date" runat="server" Display="Dynamic" ControlToCompare="txtStart_Date" ControlToValidate="txtTermination_Date"
                        ValidationGroup="AddSalesPerson" ErrorMessage="Please enter termination date greater than start date." Operator="GreaterThan"
                        Type="Date" ForeColor="Red"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td>Reporting To:</td>
                <td>
                    <asp:DropDownList runat="server" ID="ddlManager" Width="210px"></asp:DropDownList>

                </td>
            </tr>
            <tr>
                <td>Is Manager:</td>
                <td>
                    <asp:CheckBox ID="ckbIs_Manager" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button runat="server" Text="Save" ID="btnSave" OnClick="btnSave_Click" ValidationGroup="AddSalesPerson" />
                </td>
                <td>
                    <asp:Button runat="server" Text="Cancel" ID="btnCancel" PostBackUrl="~/Sales_persons_list.aspx" />
                </td>
            </tr>

        </table>

        <asp:HiddenField ID="hdnID" runat="server" />
        <br />

    </div>
</asp:Content>
