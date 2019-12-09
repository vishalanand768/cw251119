using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace cw251119
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["xyz"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            bindData();
        }


        public void bindData()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from cw251119", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();

            grd.DataSource = dt;
            grd.DataBind();
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {

            if (btnsubmit.Text == "Submit")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into cw251119(Food_Name,Food_Price)values('" + txtfoodname.Text + "','" + txtfoodprice.Text + "')", con);
                cmd.ExecuteNonQuery();
                con.Close();
                bindData();
            }
            else if (btnsubmit.Text == "Update")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("update cw251119 set food_name = '" + txtfoodname.Text + "', food_Price = '" + txtfoodprice.Text + "' where id = '" + ViewState["pp"] + "'", con);
                cmd.ExecuteNonQuery();
                con.Close();
                bindData();
                btnsubmit.Text = "Submit";
            }
        }

     
        protected void grd_RowCommand1(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "vishal")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("delete from cw251119 where Id='" + e.CommandArgument + "'", con);
                cmd.ExecuteNonQuery();
                con.Close();
                bindData();
            }
            else if (e.CommandName == "anand")
            {

                con.Open();
                SqlCommand cmd = new SqlCommand("select * from cw251119 where Id='" + e.CommandArgument + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();
                txtfoodname.Text = dt.Rows[0][1].ToString();
                txtfoodprice.Text = dt.Rows[0][2].ToString();
                btnsubmit.Text = "Update";
                ViewState["pp"] = e.CommandArgument;


            }
        }
    }
}