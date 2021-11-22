using System;
using BeSpoked_Bikes_DAL;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BeSpoked_Bikes
{
    public partial class Sales_persons_list : General
    {
        #region Page Load
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillSalesPersons_List();
            }
        }
        #endregion

        #region Methods
        /// <summary>
        /// Bind list of all sales persons in grid view
        /// </summary>
        void FillSalesPersons_List()
        {
            try
            {
                DataSet dsSalesPersons = Sales_Persons.Get_SalesPersons_List();
                gvSales_persons.DataSource = dsSalesPersons.Tables[0];
                gvSales_persons.DataBind();
            }
            catch (Exception exc)
            {
                LogError(exc);
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Something went wrong. Please try again later.');", true);
            }
        }
        #endregion

        #region Events
        /// <summary>
        /// Edit click on the gridview
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void gvSales_persons_RowEditing(object sender, GridViewEditEventArgs e)
        {
            int pk_sales_Person = Convert.ToInt32(gvSales_persons.DataKeys[e.NewEditIndex].Values["pk_sales_person"]);
            Response.Redirect("Sales_Person_details.aspx?id=" + pk_sales_Person);
        }
        #endregion
    }
}