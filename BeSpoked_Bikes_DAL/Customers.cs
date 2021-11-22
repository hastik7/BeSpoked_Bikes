using Microsoft.Practices.EnterpriseLibrary.Data;
using System;
using System.Data;
using System.Data.Common;

namespace BeSpoked_Bikes_DAL
{
    public sealed class Customers
    {
        #region Variables
        private int? _PK_Customer;
        private string _First_Name;
        private string _Last_Name;
        private string _Address;
        private string _Phone;
        private DateTime? _Start_Date;

        #endregion

        #region Public Properties
        /// <summary>
        /// Gets or sets the PK_Customer value.
        /// </summary>
        public int? PK_Customer
        {
            get { return _PK_Customer; }
            set { _PK_Customer = value; }
        }

        /// <summary>
        /// Gets or sets the First_Name value.
        /// </summary>
        public string First_Name
        {
            get { return _First_Name; }
            set { _First_Name = value; }
        }

        /// <summary>
        /// Gets or sets the Last_Name value.
        /// </summary>
        public string Last_Name
        {
            get { return _Last_Name; }
            set { _Last_Name = value; }
        }

        /// <summary>
        /// Gets or sets the Address value.
        /// </summary>
        public string Address
        {
            get { return _Address; }
            set { _Address = value; }
        }

        /// <summary>
        /// Gets or sets the Phone value.
        /// </summary>
        public string Phone
        {
            get { return _Phone; }
            set { _Phone = value; }
        }

        /// <summary>
        /// Gets or sets the Start_Date value.
        /// </summary>
        public DateTime? Start_Date
        {
            get { return _Start_Date; }
            set { _Start_Date = value; }
        }

        
        #endregion

        #region Default Constructors

        /// <summary>
        /// Default constructor
        /// </summary>
        public Customers()
        {
            this._PK_Customer = null;
            this._First_Name = null;
            this._Last_Name = null;
            this._Address = null;
            this._Phone = null;
            this._Start_Date = null;
        }

        #endregion

        #region Methods
      
        /// <summary>
        /// Get all records from customers table
        /// </summary>
        public static DataSet Get_Customers_List()
        {
            Database db = DatabaseFactory.CreateDatabase();
            DbCommand dbCommand = db.GetStoredProcCommand("P_GetCustomer_List");

            return db.ExecuteDataSet(dbCommand);
        }
        
        #endregion
    }
}
