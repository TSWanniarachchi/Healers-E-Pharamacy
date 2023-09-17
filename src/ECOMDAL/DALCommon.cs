using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace ECOMDAL
{
    public class DALCommon
    {
        internal SqlConnection conSQL = new SqlConnection();
        public SqlTransaction sqlTxn;
        private SqlTransaction TransNew;

        public Boolean ConnectToDB()
        {
            if (conSQL.ConnectionString == "")
            {
                conSQL.ConnectionString = ConfigurationManager.ConnectionStrings["DefualtConnection"].ConnectionString;
            }
            if (conSQL.State == ConnectionState.Closed)
            {
                conSQL.Open();
            }

            return true;
        }

        public void DisconnectFromDB()
        {
            if (conSQL.State == ConnectionState.Open)
            {
                if (sqlTxn == null)
                {
                    conSQL.Close();
                }
            }
        }

        public DataSet ReturnDataSet(String strSqlCommand)
        {
            SqlCommand cmdSql = default(SqlCommand);
            SqlDataAdapter daCommen = new SqlDataAdapter();
            DataSet dsCommen = new DataSet();

            ConnectToDB();

            cmdSql = new SqlCommand(strSqlCommand, conSQL);
            daCommen.SelectCommand = cmdSql;
            cmdSql.Transaction = sqlTxn;
            daCommen.Fill(dsCommen, "MyDataTable");

            DisconnectFromDB();

            return dsCommen;
        }

        public int ExecuteProcedure(string CommandText, CommandType CommandType, SqlParameter[] Parameters = null)
        {
            SqlCommand sqlComm = default(SqlCommand);
            int res = 0;

            ConnectToDB();

            sqlComm = new SqlCommand(CommandText, conSQL);
            sqlComm.CommandType = CommandType;
            sqlComm.Transaction = sqlTxn;

            if ((Parameters != null))
            {
                for (int i = 0; i <= Parameters.Length - 1; i++)
                {
                    if (Parameters[i].Value == null)
                    {
                        Parameters[i].Value = DBNull.Value;
                        sqlComm.Parameters.Add(Parameters[i]);
                    }
                    else
                    {
                        sqlComm.Parameters.Add(Parameters[i]);
                    }
                }
            }
            res = sqlComm.ExecuteNonQuery();

            DisconnectFromDB();

            return res;
        }

        public void BeginTransaction()
        {
            ConnectToDB();
            sqlTxn = conSQL.BeginTransaction();
        }

        public void RollbackTransaction()
        {
            if (sqlTxn.Connection != null)
            {
                sqlTxn.Rollback();
            }
        }

        public void CommitTransaction()
        {
            if (sqlTxn.Connection != null)
            {
                sqlTxn.Commit();
            }
            sqlTxn = null;
            DisconnectFromDB();
        }

        public string GetServername()
        {
            return conSQL.DataSource.ToString();
        }

        public void BeginTransactionTrans(SqlTransaction Trans = null)
        {
            ConnectToDB();
            TransNew = conSQL.BeginTransaction();
        }

        public void CommitTransactionTrans(SqlTransaction Trans = null)
        {
            if ((TransNew.Connection != null))
            {
                TransNew.Commit();
            }
            TransNew = null;

            DisconnectFromDBTrans();
        }

        public void DisconnectFromDBTrans()
        {
            if (conSQL.State == ConnectionState.Open)
            {
                if (TransNew == null)
                {
                    conSQL.Close();
                }
            }
        }

        public void RollbackTransactionTrans(SqlTransaction Trans = null)
        {
            if ((TransNew.Connection != null))
            {
                TransNew.Rollback();
            }
            TransNew = null;

            DisconnectFromDBTrans();
        }

        public int ExecuteProcedureWithTransaction(string CommandText, CommandType CommandType, SqlParameter[] Parameters = null, SqlTransaction Trans = null)
        {
            SqlCommand sqlComm = default(SqlCommand);
            int res = 0;

            ConnectToDB();

            sqlComm = new SqlCommand(CommandText, conSQL);
            sqlComm.CommandType = CommandType;

            sqlComm.Transaction = Trans;

            if ((Parameters != null))
            {
                for (int i = 0; i <= Parameters.Length - 1; i++)
                {
                    if (Parameters[i].Value == null)
                    {
                        Parameters[i].Value = DBNull.Value;
                        sqlComm.Parameters.Add(Parameters[i]);
                    }
                    else
                    {
                        sqlComm.Parameters.Add(Parameters[i]);
                    }
                }
            }
            res = sqlComm.ExecuteNonQuery();

            DisconnectFromDB();

            return res;
        }

        public DataSet ExecuteProcedure_select(string CommandText, SqlParameter[] Parameters = null)
        {
            DataSet res = new DataSet();
            SqlCommand sqlComm = default(SqlCommand);

            ConnectToDB();

            sqlComm = new SqlCommand(CommandText, conSQL);
            sqlComm.CommandType = CommandType.StoredProcedure;

            sqlComm.Transaction = sqlTxn;

            if ((Parameters != null))
            {
                for (int i = 0; i <= Parameters.Length - 1; i++)
                {
                    if (Parameters[i].Value == null)
                    {
                        Parameters[i].Value = DBNull.Value;
                        sqlComm.Parameters.Add(Parameters[i]);
                    }
                    else
                    {
                        sqlComm.Parameters.Add(Parameters[i]);
                    }
                }
            }
            SqlDataAdapter da = new SqlDataAdapter(sqlComm);
            DataSet ds = new DataSet();
            da.Fill(ds);

            DisconnectFromDB();

            return ds;
        }

        public DataTable ExecuteProcedure_select_dt(string CommandText, SqlParameter[] Parameters = null)
        {
            DataTable res = new DataTable();
            SqlCommand sqlComm = default(SqlCommand);

            ConnectToDB();

            sqlComm = new SqlCommand(CommandText, conSQL);
            sqlComm.CommandType = CommandType.StoredProcedure;

            sqlComm.Transaction = sqlTxn;

            if ((Parameters != null))
            {
                for (int i = 0; i <= Parameters.Length - 1; i++)
                {
                    if (Parameters[i].Value == null)
                    {
                        Parameters[i].Value = DBNull.Value;
                        sqlComm.Parameters.Add(Parameters[i]);
                    }
                    else
                    {
                        sqlComm.Parameters.Add(Parameters[i]);
                    }
                }
            }
            SqlDataAdapter da = new SqlDataAdapter(sqlComm);
            DataTable dt = new DataTable();
            da.Fill(dt);

            DisconnectFromDB();

            return dt;
        }
    }
}