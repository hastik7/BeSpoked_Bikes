using BeSpoked_Bikes_DAL;
using System;
using System.Web.UI;

namespace BeSpoked_Bikes
{
    public partial class Product_details : General
    {
        #region Page Load 
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    int pk_product = Convert.ToInt32(Request.QueryString["id"]);
                    FillProduct(pk_product);
                }
            }
        }
        #endregion

        #region Events
        /// <summary>
        /// Insert/update product details into product table
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                Products objProduct = new Products();
                objProduct.Name = txtProduct_Name.Text;
                objProduct.Manufacturer = txtManufacturer.Text;
                objProduct.Style = txtStyle.Text;
                objProduct.Purchase_Price = Convert.ToDecimal(txtPurchase_Price.Text);
                objProduct.Sale_Price = Convert.ToDecimal(txtSale_Price.Text);
                objProduct.Quantity = Convert.ToInt32(txtQuantity.Text);
                objProduct.Commission_Percentage = Convert.ToDecimal(txtCommission_Percentage.Text);

                if (string.IsNullOrEmpty(hdnProduct_Name.Value))
                {
                    objProduct.Insert();

                    String strUrl = "product_details.aspx";
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('New Product added successfully.');window.location.href = '" + strUrl + "'", true);
                }
                else
                {
                    objProduct.PK_Product = Convert.ToInt32(hdnID.Value);
                    objProduct.Update();
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Product updated successfully.');", true);
                }
            }
            catch (Exception exc)
            {
                LogError(exc);
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Something went wrong. Please try again later.');", true);
            }

        }

        /// <summary>
        /// Check product name exist or not in product table.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void txtProduct_Name_TextChanged(object sender, EventArgs e)
        {
            if (Convert.ToString(hdnProduct_Name.Value) != txtProduct_Name.Text && Products.ProductName_exists(txtProduct_Name.Text))
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Product Name already exists.');", true);
                txtProduct_Name.Text = string.IsNullOrEmpty(hdnProduct_Name.Value) ? string.Empty : hdnProduct_Name.Value;
                txtProduct_Name.Focus();
            }

        }

        #endregion

        #region Methods
        /// <summary>
        /// Fill details for product by pk_product
        /// </summary>
        /// <param name="pk_product"></param>
        public void FillProduct(int pk_product)
        {
            Products objProduct = new Products(pk_product);
            txtProduct_Name.Text = objProduct.Name;
            hdnProduct_Name.Value = objProduct.Name;
            hdnID.Value = Convert.ToString(objProduct.PK_Product);
            txtManufacturer.Text = objProduct.Manufacturer;
            txtStyle.Text = objProduct.Style;
            txtPurchase_Price.Text = Convert.ToString(objProduct.Purchase_Price);
            txtSale_Price.Text = Convert.ToString(objProduct.Sale_Price);
            txtQuantity.Text = Convert.ToString(objProduct.Quantity);
            txtCommission_Percentage.Text = Convert.ToString(objProduct.Commission_Percentage);
        }
        #endregion

    }
}

