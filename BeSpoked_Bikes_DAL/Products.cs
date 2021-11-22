using System;
using System.Data;
using System.Data.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace BeSpoked_Bikes_DAL
{
    public sealed class Products : IData
    {
        #region Variables
        private int? _PK_Product;
        private string _Name;
        private string _Manufacturer;
        private string _Style;
        private decimal _Purchase_Price;
        private decimal _Sale_Price;
        private int _Quantity;
        private decimal _Commission_Percentage;
        #endregion

        #region Public Properties

        /// <summary>
        /// Gets or sets the PK_Product value.
        /// </summary>
        public int? PK_Product
        {
            get { return _PK_Product; }
            set { _PK_Product = value; }
        }

        /// <summary>
        /// Gets or sets the Name value.
        /// </summary>
        public string Name
        {
            get { return _Name; }
            set { _Name = value; }
        }

        /// <summary>
        /// Gets or sets the Manufacturer value.
        /// </summary>
        public string Manufacturer
        {
            get { return _Manufacturer; }
            set { _Manufacturer = value; }
        }

        /// <summary>
        /// Gets or sets the Style value.
        /// </summary>
        public string Style
        {
            get { return _Style; }
            set { _Style = value; }
        }

        /// <summary>
        /// Gets or sets the Purchase_Price value.
        /// </summary>
        public decimal Purchase_Price
        {
            get { return _Purchase_Price; }
            set { _Purchase_Price = value; }
        }

        /// <summary>
        /// Gets or sets the Sale_Price value.
        /// </summary>
        public decimal Sale_Price
        {
            get { return _Sale_Price; }
            set { _Sale_Price = value; }
        }

        /// <summary>
        /// Gets or sets the Quantity value.
        /// </summary>
        public int Quantity
        {
            get { return _Quantity; }
            set { _Quantity = value; }
        }

        /// <summary>
        /// Gets or sets the Commission_Percentage value.
        /// </summary>
        public decimal Commission_Percentage
        {
            get { return _Commission_Percentage; }
            set { _Commission_Percentage = value; }
        }

        #endregion

        #region Default Constructors

        /// <summary>
        /// Initializes a new instance of the Product class.
        /// </summary>
        public Products(int pk_product)
        {
            DataTable dtProduct = SelectByPK(pk_product).Tables[0];

            if (dtProduct.Rows.Count == 1)
            {
                DataRow drProduct = dtProduct.Rows[0];

                this._PK_Product = (int?)drProduct["pk_product"];
                this._Name = (string)drProduct["name"];
                this._Manufacturer = (string)drProduct["manufacturer"];

                if (drProduct["style"] == DBNull.Value)
                    this._Style = null;
                else
                    this._Style = (string)drProduct["style"];

                this._Purchase_Price = (decimal)drProduct["purchase_price"];
                this._Sale_Price = (decimal)drProduct["sale_price"];
                this._Quantity = (int)drProduct["available_qty"];
                this._Commission_Percentage = (decimal)drProduct["commission_percentage"];
            }
            else
            {
                this._PK_Product = null;
                this._Name = null;
                this._Manufacturer = null;
                this._Style = null;
                this._Purchase_Price = 0;
                this._Sale_Price = 0;
                this._Quantity = 0;
                this._Commission_Percentage = 0;
            }
        }

        /// <summary>
        /// Default constructor
        /// </summary>
        public Products()
        {
            this._PK_Product = null;
            this._Name = null;
            this._Manufacturer = null;
            this._Style = null;
            this._Purchase_Price = 0;
            this._Sale_Price = 0;
            this._Quantity = 0;
            this._Commission_Percentage = 0;
        }

        #endregion

        #region Methods
        /// <summary>
        /// Inserts a record into the Product table.
        /// </summary>
        /// <returns></returns>
        public int Insert()
        {
            Database db = DatabaseFactory.CreateDatabase();
            DbCommand dbCommand = db.GetStoredProcCommand("P_InsertProduct");

            db.AddInParameter(dbCommand, "name", DbType.String, this._Name);
            db.AddInParameter(dbCommand, "manufacturer", DbType.String, this._Manufacturer);

            if (string.IsNullOrEmpty(this._Style))
                db.AddInParameter(dbCommand, "style", DbType.String, DBNull.Value);
            else
                db.AddInParameter(dbCommand, "style", DbType.String, this._Style);

            db.AddInParameter(dbCommand, "purchase_price", DbType.Decimal, this._Purchase_Price);
            db.AddInParameter(dbCommand, "sale_price", DbType.Decimal, this._Sale_Price);

            db.AddInParameter(dbCommand, "available_qty", DbType.Int32, this._Quantity);
            db.AddInParameter(dbCommand, "commission_percentage", DbType.Decimal, this._Commission_Percentage);

            // Execute the query and return the new identity value
            int returnValue = Convert.ToInt32(db.ExecuteScalar(dbCommand));

            return returnValue;
        }

        /// <summary>
        /// Update Product record in product table
        /// </summary>
        public void Update()
        {
            Database db = DatabaseFactory.CreateDatabase();
            DbCommand dbCommand = db.GetStoredProcCommand("P_ProductUpdate");


            db.AddInParameter(dbCommand, "pk_product", DbType.Int32, this._PK_Product);

            db.AddInParameter(dbCommand, "name", DbType.String, this._Name);
            db.AddInParameter(dbCommand, "manufacturer", DbType.String, this._Manufacturer);

            if (string.IsNullOrEmpty(this._Style))
                db.AddInParameter(dbCommand, "style", DbType.String, DBNull.Value);
            else
                db.AddInParameter(dbCommand, "style", DbType.String, this._Style);

            db.AddInParameter(dbCommand, "purchase_price", DbType.Decimal, this._Purchase_Price);
            db.AddInParameter(dbCommand, "sale_price", DbType.Decimal, this._Sale_Price);

            db.AddInParameter(dbCommand, "available_qty", DbType.Int32, this._Quantity);
            db.AddInParameter(dbCommand, "commission_percentage", DbType.Decimal, this._Commission_Percentage);

            db.ExecuteNonQuery(dbCommand);
        }

        /// <summary>
        /// Selects a single record from the Product table by a primary key.
        /// </summary>
        /// <returns>DataSet</returns>
        private DataSet SelectByPK(decimal pk_product)
        {
            Database db = DatabaseFactory.CreateDatabase();
            DbCommand dbCommand = db.GetStoredProcCommand("P_ProductSelectByPK");

            db.AddInParameter(dbCommand, "pk_product", DbType.Int32, pk_product);

            return db.ExecuteDataSet(dbCommand);
        }

        /// <summary>
        /// Check if product name exists or not from the product table.
        /// </summary>
        /// <returns>DataSet</returns>
        public static bool ProductName_exists(string name)
        {
            Database db = DatabaseFactory.CreateDatabase();
            DbCommand dbCommand = db.GetStoredProcCommand("P_ProductName_Exists");

            db.AddInParameter(dbCommand, "name", DbType.String, name);

            bool returnValue = Convert.ToBoolean(db.ExecuteScalar(dbCommand));

            return returnValue;
        }

        /// <summary>
        /// Get all products from products table
        /// </summary>
        public static DataSet Get_Product_List()
        {
            Database db = DatabaseFactory.CreateDatabase();
            DbCommand dbCommand = db.GetStoredProcCommand("P_GetProduct_List");

            return db.ExecuteDataSet(dbCommand);
        } 

        #endregion
    }
}
