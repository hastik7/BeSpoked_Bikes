using Microsoft.Practices.EnterpriseLibrary.Data;
using System;
using System.Data;
using System.Data.Common;

namespace BeSpoked_Bikes_DAL
{
    public sealed class Sales_Persons : IData
    {
        #region Variables
        private int? _PK_Sales_Person;
        private string _First_Name;
        private string _Last_Name;
        private string _Address;
        private string _Phone;
        private DateTime? _Start_Date;
        private DateTime? _Termination_Date;
        private int? _FK_Manager;
        private bool _Is_Manager;

        #endregion

        #region Public Properties
        /// <summary>
        /// Gets or sets the PK_Sales_Person value.
        /// </summary>
        public int? PK_Sales_Person
        {
            get { return _PK_Sales_Person; }
            set { _PK_Sales_Person = value; }
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

        /// <summary>
        /// Gets or sets the Termination_Date value.
        /// </summary>
        public DateTime? Termination_Date
        {
            get { return _Termination_Date; }
            set { _Termination_Date = value; }
        }

        /// <summary>
        /// Gets or sets the FK_Manager value.
        /// </summary>
        public int? FK_Manager
        {
            get { return _FK_Manager; }
            set { _FK_Manager = value; }
        }

        /// <summary>
        /// Gets or sets the Is_Manager value.
        /// </summary>
        public bool Is_Manager
        {
            get { return _Is_Manager; }
            set { _Is_Manager = value; }
        }

        #endregion

        #region Default Constructors

        /// <summary>
        /// Initializes a new instance of the Sales Persons class.
        /// </summary>
        public Sales_Persons(int pk_sales_person)
        {
            DataTable dtsalesPerson = SelectByPK(pk_sales_person).Tables[0];

            if (dtsalesPerson.Rows.Count == 1)
            {
                DataRow drSalesPerson = dtsalesPerson.Rows[0];

                this._PK_Sales_Person = (int?)drSalesPerson["pk_sales_person"];
                this._First_Name = (string)drSalesPerson["first_name"];
                this._Last_Name = (string)drSalesPerson["last_name"];

                if (drSalesPerson["address"] == DBNull.Value)
                    this._Address = null;
                else
                    this._Address = (string)drSalesPerson["address"];

                this._Phone = (string)drSalesPerson["phone"];
                this._Start_Date = (DateTime)drSalesPerson["start_date"];

                if (drSalesPerson["termination_date"] == DBNull.Value)
                    this._Termination_Date = null;
                else
                    this._Termination_Date = (DateTime?)drSalesPerson["termination_date"];

                if (drSalesPerson["fk_manager"] == DBNull.Value)
                    this._FK_Manager = null;
                else
                    this._FK_Manager = (int?)drSalesPerson["fk_manager"];

                this._Is_Manager = Convert.ToBoolean(drSalesPerson["is_manager"]);
            }
            else
            {
                this._PK_Sales_Person = null;
                this._First_Name = null;
                this._Last_Name = null;
                this._Address = null;
                this._Phone = null;
                this._Start_Date = null;
                this._Termination_Date = null;
                this._FK_Manager = null;
                this._Is_Manager = false;
            }
        }

        /// <summary>
        /// Default constructor
        /// </summary>
        public Sales_Persons()
        {
            this._PK_Sales_Person = null;
            this._First_Name = null;
            this._Last_Name = null;
            this._Address = null;
            this._Phone = null;
            this._Start_Date = null;
            this._Termination_Date = null;
            this._FK_Manager = null;
            this._Is_Manager = false;
        }

        #endregion

        #region Methods
        /// <summary>
        /// Inserts a record into the Sales Persons table.
        /// </summary>
        /// <returns></returns>
        public int Insert()
        {
            Database db = DatabaseFactory.CreateDatabase();
            DbCommand dbCommand = db.GetStoredProcCommand("P_InsertSalesPerson");

            db.AddInParameter(dbCommand, "first_name", DbType.String, this._First_Name);
            db.AddInParameter(dbCommand, "last_name", DbType.String, this._Last_Name);

            if (string.IsNullOrEmpty(this._Address))
                db.AddInParameter(dbCommand, "address", DbType.String, DBNull.Value);
            else
                db.AddInParameter(dbCommand, "address", DbType.String, this._Address);

            db.AddInParameter(dbCommand, "phone", DbType.String, this._Phone);
            db.AddInParameter(dbCommand, "start_date", DbType.Date, this._Start_Date);

            if (string.IsNullOrEmpty(Convert.ToString(this._Termination_Date)))
                db.AddInParameter(dbCommand, "termination_date", DbType.String, DBNull.Value);
            else
                db.AddInParameter(dbCommand, "termination_date", DbType.Date, this._Termination_Date);

            db.AddInParameter(dbCommand, "fk_manager", DbType.Int32, this._FK_Manager);

            db.AddInParameter(dbCommand, "is_manager", DbType.Boolean, this._Is_Manager);

            // Execute the query and return the new identity value
            int returnValue = Convert.ToInt32(db.ExecuteScalar(dbCommand));

            return returnValue;
        }

        /// <summary>
        /// Update a record in Sales Persons table
        /// </summary>
        public void Update()
        {
            Database db = DatabaseFactory.CreateDatabase();
            DbCommand dbCommand = db.GetStoredProcCommand("P_UpdateSalesPerson");


            db.AddInParameter(dbCommand, "pk_sales_person", DbType.Int32, this._PK_Sales_Person);

            db.AddInParameter(dbCommand, "first_name", DbType.String, this._First_Name);
            db.AddInParameter(dbCommand, "last_name", DbType.String, this._Last_Name);

            if (string.IsNullOrEmpty(this._Address))
                db.AddInParameter(dbCommand, "address", DbType.String, DBNull.Value);
            else
                db.AddInParameter(dbCommand, "address", DbType.String, this._Address);

            db.AddInParameter(dbCommand, "phone", DbType.String, this._Phone);
            db.AddInParameter(dbCommand, "start_date", DbType.Date, this._Start_Date);

            if (string.IsNullOrEmpty(Convert.ToString(this._Termination_Date)))
                db.AddInParameter(dbCommand, "termination_date", DbType.String, DBNull.Value);
            else
                db.AddInParameter(dbCommand, "termination_date", DbType.Date, this._Termination_Date);

            db.AddInParameter(dbCommand, "fk_manager", DbType.Int32, this._FK_Manager);

            db.AddInParameter(dbCommand, "is_manager", DbType.Boolean, this._Is_Manager);

            db.ExecuteNonQuery(dbCommand);
        }

        /// <summary>
        /// Selects a single record from the Sales Persons table by a primary key.
        /// </summary>
        /// <returns>DataSet</returns>
        private DataSet SelectByPK(decimal pk_sales_person)
        {
            Database db = DatabaseFactory.CreateDatabase();
            DbCommand dbCommand = db.GetStoredProcCommand("P_SalesPersonSelectByPK");

            db.AddInParameter(dbCommand, "pk_sales_person", DbType.Int32, pk_sales_person);

            return db.ExecuteDataSet(dbCommand);
        }

        /// <summary>
        /// Get all records from sales persons table
        /// </summary>
        public static DataSet Get_SalesPersons_List()
        {
            Database db = DatabaseFactory.CreateDatabase();
            DbCommand dbCommand = db.GetStoredProcCommand("P_GetSalesPersons_List");

            return db.ExecuteDataSet(dbCommand);
        }

        /// <summary>
        /// Selects Managers record from the sales persons table.
        /// </summary>
        /// <returns>DataSet</returns>
        public static DataSet Get_Manager_List()
        {
            Database db = DatabaseFactory.CreateDatabase();
            DbCommand dbCommand = db.GetStoredProcCommand("P_Get_Manager_List");

            return db.ExecuteDataSet(dbCommand);
        }

        /// <summary>
        /// Check if first name and last name exists in sales persons table
        /// </summary>
        /// <param name="first_name"></param>
        /// <param name="last_name"></param>
        /// <returns></returns>
        public static bool Name_exists(string first_name, string last_name)
        {
            if (!string.IsNullOrEmpty(first_name) && !string.IsNullOrEmpty(last_name))
            {
                Database db = DatabaseFactory.CreateDatabase();
                DbCommand dbCommand = db.GetStoredProcCommand("P_SalesPerson_Name_Exists");

                db.AddInParameter(dbCommand, "first_name", DbType.String, first_name);
                db.AddInParameter(dbCommand, "last_name", DbType.String, last_name);

                bool returnValue = Convert.ToBoolean(db.ExecuteScalar(dbCommand));

                return returnValue;
            }
            else
                return false;
        }
        #endregion
    }
}
