using System;
using BeSpoked_Bikes_DAL;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI;

namespace BeSpoked_Bikes
{
    public partial class Product_list : General
    {
        #region Page Load
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillProduct_List();
            }
        }
        #endregion

        #region Methods

        /// <summary>
        /// Bind list of all products in grid view.
        /// </summary>
        void FillProduct_List()
        {
            try
            {
                DataSet dsProduct = Products.Get_Product_List();
                gvProduct.DataSource = dsProduct.Tables[0];
                gvProduct.DataBind();
            }
            catch (Exception exc)
            {
                LogError(exc);
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Something went wrong. Please try again later.');", true);
            }
        }
        #endregion

        #region Events
        protected void gvProduct_RowEditing(object sender, GridViewEditEventArgs e)
        {
            int pk_product = Convert.ToInt32(gvProduct.DataKeys[e.NewEditIndex].Values["pk_product"]);
            Response.Redirect("Product_details.aspx?id=" + pk_product);

        }
        #endregion
    }
}