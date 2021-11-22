using Microsoft.Practices.EnterpriseLibrary.Data;
using System;
using System.Data;
using System.Data.Common;

namespace BeSpoked_Bikes_DAL
{
    public sealed class Sales
    {
        #region Variables
        private int? _PK_Sales;
        private int? _FK_Product;
        private int? _FK_Sales_Person;
        private int? _FK_Customer;
        private DateTime? _Sales_Date;

        #endregion

        #region Public Properties
        /// <summary>
        /// Gets or sets the PK_Sales value.
        /// </summary>
        public int? PK_Sales
        {
            get { return _PK_Sales; }
            set { _PK_Sales = value; }
        }


        /// <summary>
        /// Gets or sets the FK_Product value.
        /// </summary>
        public int? FK_Product
        {
            get { return _FK_Product; }
            set { _FK_Product = value; }
        }

        /// <summary>
        /// Gets or sets the FK_Sales_Person value.
        /// </summary>
        public int? FK_Sales_Person
        {
            get { return _FK_Sales_Person; }
            set { _FK_Sales_Person = value; }
        }


        /// <summary>
        /// Gets or sets the FK_Customer value.
        /// </summary>
        public int? FK_Customer
        {
            get { return _FK_Customer; }
            set { _FK_Customer = value; }
        }


        /// <summary>
        /// Gets or sets the Sales_Date value.
        /// </summary>
        public DateTime? Sales_Date
        {
            get { return _Sales_Date; }
            set { _Sales_Date = value; }
        }

      

        #endregion

        #region Default Constructors

        /// <summary>
        /// Default constructor
        /// </summary>
        public Sales()
        {
            this._PK_Sales = null;
            this._FK_Product = null;
            this._FK_Sales_Person = null;
            this._FK_Customer = null;
            this._Sales_Date = null;
        }

        #endregion

        #region Methods
        
        /// <summary>
        /// Inserts a record into the Sales table.
        /// </summary>
        /// <returns></returns>
        public void Insert()
        {
            Database db = DatabaseFactory.CreateDatabase();
            DbCommand dbCommand = db.GetStoredProcCommand("P_InsertSales");

            db.AddInParameter(dbCommand, "fk_product", DbType.Int32, this._FK_Product);
            db.AddInParameter(dbCommand, "fk_sales_person", DbType.Int32, this._FK_Sales_Person);
            db.AddInParameter(dbCommand, "fk_customer", DbType.Int32, this._FK_Customer);
            db.AddInParameter(dbCommand, "start_date", DbType.Date, this._Sales_Date);

            db.ExecuteNonQuery(dbCommand);

        }

       
        /// <summary>
        /// Get all records from sales table
        /// </summary>
        public static DataSet Get_Sales_List()
        {
            Database db = DatabaseFactory.CreateDatabase();
            DbCommand dbCommand = db.GetStoredProcCommand("P_GetSales_List");

            return db.ExecuteDataSet(dbCommand);
        }

        #endregion
    }
}
