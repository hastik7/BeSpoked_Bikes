using System;
using BeSpoked_Bikes_DAL;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BeSpoked_Bikes
{
    public partial class Sales_person_details : General
    {
        #region Page Load
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillManager();
                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    int pk_sales_person = Convert.ToInt32(Request.QueryString["id"]);
                    FillProduct(pk_sales_person);
                }

            }
        }
        #endregion

        #region Events

        /// <summary>
        /// Insert/update Sales persons details into sales persons table
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                Sales_Persons objSales_Person = new Sales_Persons();
                objSales_Person.First_Name = txtFirst_Name.Text;
                objSales_Person.Last_Name = txtLast_Name.Text;
                objSales_Person.Address = txtAddress.Text;
                objSales_Person.Phone = txtPhone.Text;
                objSales_Person.Start_Date = Convert.ToDateTime(txtStart_Date.Text);

                if (!string.IsNullOrEmpty(txtTermination_Date.Text))
                    objSales_Person.Termination_Date = Convert.ToDateTime(txtTermination_Date.Text);

                if (ddlManager.SelectedIndex > 0)
                    objSales_Person.FK_Manager = Convert.ToInt32(ddlManager.SelectedValue);

                objSales_Person.Is_Manager = ckbIs_Manager.Checked;


                if (string.IsNullOrEmpty(hdnID.Value))
                {
                    objSales_Person.Insert();

                    String strUrl = "sales_person_details.aspx";
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('New Sales Person added successfully.');window.location.href = '" + strUrl + "'", true);
                }
                else
                {
                    objSales_Person.PK_Sales_Person = Convert.ToInt32(hdnID.Value);
                    objSales_Person.Update();
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Sales Person updated successfully.');", true);
                }
            }
            catch (Exception exc)
            {
                LogError(exc);
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Something went wrong. Please try again later.');", true);
            }
        }

        /// <summary>
        /// Check first and last name exists in sales persons table
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void txtName_TextChanged(object sender, EventArgs e)
        {
            if (CheckName() && Sales_Persons.Name_exists(txtFirst_Name.Text, txtLast_Name.Text))
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('First Name and Last Name already exists.');", true);
                txtFirst_Name.Text = string.IsNullOrEmpty(hdnFirst_Name.Value) ? string.Empty : hdnFirst_Name.Value;
                txtLast_Name.Text = string.IsNullOrEmpty(hdnLast_Name.Value) ? string.Empty : hdnLast_Name.Value;
                txtFirst_Name.Focus();
            }
            
        }

        #endregion

        #region Methods
        /// <summary>
        /// Method to fill manager dropdown list.
        /// </summary>
        void FillManager()
        {
            DataSet dsManager = Sales_Persons.Get_Manager_List();
            ddlManager.Items.Clear();

            if (dsManager.Tables[0].Rows.Count > 0)
            {
                ddlManager.DataTextField = "name";
                ddlManager.DataValueField = "id";
                ddlManager.DataSource = dsManager.Tables[0];
            }
            ddlManager.AppendDataBoundItems = true;
            ddlManager.Items.Insert(0, new ListItem("No Manager", "-1"));
            ddlManager.SelectedIndex = 0;

            ddlManager.DataBind();
        }

        /// <summary>
        /// Fill details for sales person by pk_sales_person
        /// </summary>
        /// <param name="pk_slaes_person"></param>
        void FillProduct(int pk_slaes_person)
        {
            Sales_Persons objSales_Person = new Sales_Persons(pk_slaes_person);
            txtFirst_Name.Text = objSales_Person.First_Name;
            hdnFirst_Name.Value = objSales_Person.First_Name;
            hdnID.Value = Convert.ToString(objSales_Person.PK_Sales_Person);
            txtLast_Name.Text = objSales_Person.Last_Name;
            hdnLast_Name.Value = objSales_Person.Last_Name;
            txtAddress.Text = objSales_Person.Address;
            txtPhone.Text = objSales_Person.Phone;

            if (!string.IsNullOrEmpty(Convert.ToString(objSales_Person.Start_Date)))
                txtStart_Date.Text = Convert.ToDateTime(objSales_Person.Start_Date).ToString("yyyy-MM-dd");

            if (!string.IsNullOrEmpty(Convert.ToString(objSales_Person.Termination_Date)))
                txtTermination_Date.Text = Convert.ToDateTime(objSales_Person.Termination_Date).ToString("yyyy-MM-dd");

            ddlManager.SelectedValue = Convert.ToString(objSales_Person.FK_Manager);
            ckbIs_Manager.Checked = objSales_Person.Is_Manager;
        }

        /// <summary>
        /// Verify if same name is inserted on edit.
        /// </summary>
        /// <returns></returns>
        bool CheckName()
        {
            if(Convert.ToString(hdnFirst_Name.Value) == txtFirst_Name.Text && Convert.ToString(hdnLast_Name.Value) == txtLast_Name.Text)
            {
                return false;
            }

            return true;
        }
        #endregion

    }
}