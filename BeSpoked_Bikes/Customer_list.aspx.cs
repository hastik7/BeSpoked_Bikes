using System;
using BeSpoked_Bikes_DAL;
using System.Data;
using System.Web.UI;

namespace BeSpoked_Bikes
{
    public partial class Customer_list : General
    {
        #region Page Load
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillCustomer_List();
            }
        }
        #endregion

        #region Methods
        /// <summary>
        /// Bind Customers data into gridview.
        /// </summary>
        void FillCustomer_List()
        {
            try
            {
                DataSet dsProduct = Customers.Get_Customers_List();
                gvCustomer.DataSource = dsProduct.Tables[0];
                gvCustomer.DataBind();
            }
            catch (Exception exc)
            {
                LogError(exc);
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Something went wrong. Please try again later.');", true);
            }
        } 
        #endregion
    }
}