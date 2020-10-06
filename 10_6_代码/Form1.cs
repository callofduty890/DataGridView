using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace _10_6_代码
{
    public partial class Form1 : Form
    {
        //1.新建数据类型:DataTable[储存在内存条中的表格数据类型]
        DataTable dt = new DataTable();

        public Form1()
        {
            InitializeComponent();
            this.dataGridView1.DataSource = dt;//将控件的数据源绑定Datatable
        }
        //创建表头信息
        private void button1_Click(object sender, EventArgs e)
        {
            //学号
            dt.Columns.Add("学号", typeof(int));
            //姓名
            dt.Columns.Add("姓名", typeof(string));
            //班级
            dt.Columns.Add("班级", typeof(string));
            //电话号码
            dt.Columns.Add("电话号码", typeof(string));
        }

        private void button2_Click(object sender, EventArgs e)
        {
            dt.Rows.Add(1, "助教", "语言班", "123-456");
            dt.Rows.Add(2, "龙傲天", "语言班", "123-456");
            dt.Rows.Add(3, "龙嗷嗷", "语言班", "123-456");
        }

        private void button3_Click(object sender, EventArgs e)
        {
            //拿到最后一行的索引
            int Index = dt.Rows.Count - 1;
            //显示当前最后一行
            for (int j = 0; j < dt.Rows.Count; j++)
            {
                for (int i = 0; i < dt.Rows[j].ItemArray.Length; i++)
                {
                    Console.Write(dt.Rows[j].ItemArray[i] + " ");
                }
                Console.WriteLine();
            }
            //删除最后一行
            if (Index >= 0)
            {
                dt.Rows.Remove(dt.Rows[Index]);
            }
            else
            {
                MessageBox.Show("已删除完毕!", "提示消息", MessageBoxButtons.YesNo);
            }
        }

        private void button4_Click(object sender, EventArgs e)
        {
            //拿到最后一行的索引
            int Index = dt.Rows.Count - 1;
            //修改修后一行
            dt.Rows[Index][1] = "佳佳";
            dt.Rows[Index][2] = "三年二班";
            dt.Rows[Index][3] = "089-789";
        }

        private void button5_Click(object sender, EventArgs e)
        {
            //拿到活跃单元格的索引
            int Index = this.dataGridView1.CurrentCell.RowIndex;
            //删除指定的活跃单元格
            dt.Rows.Remove(dt.Rows[Index]);
        }
    }
}
