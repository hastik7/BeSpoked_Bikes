using System;
using BeSpoked_Bikes_DAL;
using System.Data;
using System.Web.UI;
using System.Text;

namespace BeSpoked_Bikes
{
    public partial class Sales_list : General
    {
        #region Page Load
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillSales_List();
            }
        }
        #endregion

        #region Methods
        /// <summary>
        /// Bind Sales records in grid view.
        /// </summary>
        void FillSales_List()
        {
            DataSet dsSales = Sales.Get_Sales_List();
            gvSales.DataSource = dsSales.Tables[0];
            gvSales.DataBind();
        }
        #endregion

        #region Events
        /// <summary>
        /// Bind filtered sales in grid by search click.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                DataView dvSales = new DataView(Sales.Get_Sales_List().Tables[0]);
                StringBuilder sbFilter = new StringBuilder();
                if (!string.IsNullOrEmpty(txtStart_Date.Text))
                    sbFilter.Append("sales_date >= '" + Convert.ToDateTime(txtStart_Date.Text).ToString() + "' and");

                if (!string.IsNullOrEmpty(txtEndDate.Text))
                    sbFilter.Append(" sales_date <= '" + Convert.ToDateTime(txtEndDate.Text).ToString() + "'");
                else
                    sbFilter.Length = sbFilter.Length > 0 ? sbFilter.Length - 3 : sbFilter.Length;


                dvSales.RowFilter = Convert.ToString(sbFilter);
                gvSales.DataSource = dvSales;
                gvSales.DataBind();
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