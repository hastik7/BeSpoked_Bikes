using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data;
using System.Data.Common;

namespace BeSpoked_Bikes_DAL
{
    public sealed class Report
    {
        #region Methods
        /// <summary>
        /// Get distinct years from sales table
        /// </summary>
        public static DataSet GetYear_from_Sales()
        {
            Database db = DatabaseFactory.CreateDatabase();
            DbCommand dbCommand = db.GetStoredProcCommand("P_GetYear_from_Sales");

            return db.ExecuteDataSet(dbCommand);
        }

        /// <summary>
        /// Generate Quarter commission report
        /// </summary>
        /// <param name="year"></param>
        /// <param name="quarter"></param>
        /// <returns></returns>
        public static DataSet GenerateReport(int year, int quarter)
        {
            Database db = DatabaseFactory.CreateDatabase();
            DbCommand dbCommand = db.GetStoredProcCommand("P_GenerateCommission_Report");

            db.AddInParameter(dbCommand, "year", DbType.Int32, year);
            db.AddInParameter(dbCommand, "quarter", DbType.Int32, quarter);

            return db.ExecuteDataSet(dbCommand);
        } 
        #endregion

    }
}
