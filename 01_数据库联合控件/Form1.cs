using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using _02_SQLHelper;

namespace _01_数据库联合控件
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            if (this.textBox1.Text.Length > 0)
            {
                this.dataGridView1.DataSource = SQL.GetDataTable("select * from 学生信息 where 学号=" + this.textBox1.Text);
            }
            else if (this.textBox2.Text.Length > 0)
            {
                this.dataGridView1.DataSource = SQL.GetDataTable("select * from 学生信息 where 姓名="+"'" + this.textBox2.Text+"'");
            }
            else if (this.textBox3.Text.Length > 0)
            {
                this.dataGridView1.DataSource = SQL.GetDataTable("select * from 学生信息 where 年龄=" + "'" + this.textBox3.Text + "'");
            }
            else if (this.textBox4.Text.Length > 0)
            {
                this.dataGridView1.DataSource = SQL.GetDataTable("select * from 学生信息 where 性别=" +"'"+ this.textBox4.Text + "'");
            }
            else if (this.textBox5.Text.Length > 0)
            {
                this.dataGridView1.DataSource = SQL.GetDataTable("select * from 学生信息 where 电话号码=" + "'" + this.textBox5.Text + "'");
            }
            else
            {
                this.dataGridView1.DataSource = SQL.GetDataTable("select * from 学生信息");                
            }



        }

        private void button1_Click(object sender, EventArgs e)
        {
            string sql = " insert into 学生信息(姓名,年龄,性别,电话号码)values('{0}',{1},'{2}','{3}') ";
            sql = string.Format(sql, this.textBox2.Text, this.textBox3.Text, this.textBox4.Text, this.textBox5.Text);

            if (SQL.Upada(sql) > 0)//如果返回大于0说受影响行大于0，修改成功
            {
                //修改成功-执行查询全部内容
                this.dataGridView1.DataSource = SQL.GetDataTable("select * from 学生信息");
            }
            else
            {
                MessageBox.Show("增加失败,请检查SQL语句", "修改信息");
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {

            //获取鼠标选中的学生ID
            string studentID = this.dataGridView1.CurrentRow.Cells[0].Value.ToString();

            //构建SQL语句
            string sql = "delete from 学生信息 where 学号=" + studentID;

            //返回受影响的行
            if (SQL.Upada(sql) > 0)//如果返回大于0说受影响行大于0，修改成功
            {
                //修改成功-执行查询全部内容
                this.dataGridView1.DataSource = SQL.GetDataTable("select * from 学生信息");
            }
            else
            {
                MessageBox.Show("删除失败,请检查SQL语句", "修改信息");
            }

        }

        private void button4_Click(object sender, EventArgs e)
        {
            string sql = "update 学生信息 set 姓名='{0}',年龄='{1}',性别='{2}',电话号码='{3}' where 学号={4}";

            sql = string.Format(sql,this.textBox2.Text,this.textBox3.Text,this.textBox4.Text, this.textBox5.Text, this.textBox1.Text);

            //返回受影响的行
            if (SQL.Upada(sql) > 0)//如果返回大于0说受影响行大于0，修改成功
            {
                //修改成功-执行查询全部内容
                this.dataGridView1.DataSource = SQL.GetDataTable("select * from 学生信息");
            }
            else
            {
                MessageBox.Show("修改失败,请检查SQL语句", "修改信息");
            }
        }
    }
}
