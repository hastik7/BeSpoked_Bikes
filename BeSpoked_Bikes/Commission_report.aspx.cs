using System;
using BeSpoked_Bikes_DAL;
using System.Web.UI;
using System.Data;

namespace BeSpoked_Bikes
{
    public partial class Commission_report : General
    {
        #region Page Load
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillYear();
            }
        }
        #endregion

        #region Methods

        /// <summary>
        /// Bind year from sales table to drop down list
        /// </summary>
        void FillYear()
        {
            try
            {
                DataTable dtCustomers = Report.GetYear_from_Sales().Tables[0];
                ddlYear.DataSource = dtCustomers;
                ddlYear.DataTextField = "year";
                ddlYear.DataValueField = "year";
                ddlYear.DataBind();
            }
            catch (Exception exc)
            {
                LogError(exc);
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Something went wrong. Please try again later.');", true);
            }
        }

        #endregion

        /// <summary>
        /// Generate quarterly salespersons commission report
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnGenerate_Click(object sender, EventArgs e)
        {
            try
            {
                DataSet dsReport = Report.GenerateReport(Convert.ToInt32(ddlYear.SelectedValue), Convert.ToInt32(ddlQuater.SelectedValue));
                gvReport.DataSource = dsReport.Tables[0];
                gvReport.DataBind();
            }
            catch (Exception exc)
            {
                LogError(exc);
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Something went wrong. Please try again later.');", true);
            }
        }
    }
}