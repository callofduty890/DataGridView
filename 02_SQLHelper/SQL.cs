using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _02_SQLHelper
{
    public class SQL
    {
        private static string connstring = @"Server=DESKTOP-CTV4ATU\SQLSERVER;DataBase=Student_Information;Uid=sa;Pwd=123456";

        /// <summary>
        /// 获取全部的查询数据
        /// </summary>
        /// <param name="sql"></param>
        /// <returns></returns>
        public static DataTable GetDataTable(string sql)
        {
            //构建连接->接上数据库
            SqlConnection sqlcon = new SqlConnection(connstring);
            //执行查询语句
            SqlDataAdapter sqlda = new SqlDataAdapter(sql, sqlcon);
            //创建数据集用于接收 P263
            DataSet myds = new DataSet();
            //往数据集中填充数据
            sqlda.Fill(myds);
            //返回查询到的数据
            return myds.Tables[0];
        }

        public static int Upada(string sql)
        {
            //连接数据库
            using (SqlConnection sqlcon= new SqlConnection(connstring))
            {
                //创建数据库操作对象
                using (SqlCommand sql_cmd= new SqlCommand(sql,sqlcon))
                {
                    //打开数据库
                    sqlcon.Open();
                    //操作数据库返回受影响的行
                    return sql_cmd.ExecuteNonQuery();
                }
            }
        }

    }
}
