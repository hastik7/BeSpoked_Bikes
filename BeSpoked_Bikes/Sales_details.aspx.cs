using System;
using BeSpoked_Bikes_DAL;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BeSpoked_Bikes
{
    public partial class Sales_details : General
    {
        #region Page Load
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillProduct();
                FillSalesPerson();
                FillSCustomer();
            }
        }

        #endregion

        #region Events

        /// <summary>
        /// Insert sales information into sales table
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                Sales objSales = new Sales();
                objSales.FK_Product = Convert.ToInt32(ddlProduct.SelectedValue);
                objSales.FK_Sales_Person = Convert.ToInt32(ddlSales_Person.SelectedValue);
                objSales.FK_Customer = Convert.ToInt32(ddlCustomer.SelectedValue);
                objSales.Sales_Date = Convert.ToDateTime(txtSales_Date.Text);

                objSales.Insert();

                String strUrl = "sales_details.aspx";
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Sale created successfully.');window.location.href = '" + strUrl + "'", true);

            }
            catch (Exception exc)
            {
                LogError(exc);
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Something went wrong. Please try again later.');", true);
            }
        }
        #endregion

        #region Methods
        /// <summary>
        /// Bind product drop down list
        /// </summary>
        void FillProduct()
        {
            DataView dvProducts = new DataView(Products.Get_Product_List().Tables[0]);
            dvProducts.RowFilter = "available_qty > 0";
            ddlProduct.DataSource = dvProducts;
            ddlProduct.DataTextField = "name";
            ddlProduct.DataValueField = "pk_product";
            ddlProduct.DataBind();

            ddlProduct.Items.Insert(0, new ListItem("--Select--", "0"));
        }

        /// <summary>
        /// Bind Sales Persons drop down list
        /// </summary>
        void FillSalesPerson()
        {
            DataTable dtSalesPersons = Sales_Persons.Get_SalesPersons_List().Tables[0];
            ddlSales_Person.DataSource = dtSalesPersons;
            ddlSales_Person.DataTextField = "name";
            ddlSales_Person.DataValueField = "pk_sales_person";
            ddlSales_Person.DataBind();

            ddlSales_Person.Items.Insert(0, new ListItem("--Select--", "0"));
        }

        /// <summary>
        /// Bind Customer drop down list
        /// </summary>
        void FillSCustomer()
        {
            DataTable dtCustomers = Customers.Get_Customers_List().Tables[0];
            ddlCustomer.DataSource = dtCustomers;
            ddlCustomer.DataTextField = "name";
            ddlCustomer.DataValueField = "pk_customer";
            ddlCustomer.DataBind();

            ddlCustomer.Items.Insert(0, new ListItem("--Select--", "0"));
        } 
        #endregion
    }
}