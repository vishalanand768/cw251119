<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="cw251119.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.css"/> 

     <script type ="text/javascript">
         function validation() {
             var dabba = "";
             dabba += checkfoodName();
             dabba += checkfoodPrice();
             if (dabba == "") {
                 return true;
             }
             else {
                 alert(dabba);
                 return false;
             }
         }
         {
             function checkfoodName() {
                 var TB = document.getElementById('txtfoodname');
                 if (TB.value == "") {
                     return 'Plz enter food name!!\n';
                 }
                 else {
                     return "";
                 }
             }
             function checkfoodPrice() {
                 var TB = document.getElementById('txtfoodprice');
                 if (TB.value == "") {
                     return 'Plz enter foodprice!!\n';

                 }
                 else {
                     return "";
                 }
           
             }

         }
    </script>

    <title></title>
</head>
<body>
    <form id="form1" runat="server" class ="ui form">
    <div>
        <table>
            <tr>
                 <td>Food Name :</td>
                 <td><asp:TextBox ID="txtfoodname" runat="server"></asp:TextBox></td>
            </tr>

            <tr>
                 <td>Food Price :</td>
                 <td><asp:TextBox ID="txtfoodprice" runat="server"></asp:TextBox></td>
            </tr>

            <tr>
                 <td></td>
                 <td><asp:Button ID="btnsubmit" Text="Submit" runat="server" OnClientClick="return validation()" OnClick="btnsubmit_Click" class ="ui button"></asp:Button></td>
            </tr>

            <tr>
                 <td></td>
                 <td><asp:GridView ID="grd" runat="server" OnRowCommand="grd_RowCommand1"  AutoGenerateColumns="false">
                        <Columns>

                            <asp:TemplateField HeaderText="Menu">
                                <ItemTemplate>
                                    <%#Eval("Food_Name") %>
                                </ItemTemplate>
                            </asp:TemplateField>

                          <asp:TemplateField HeaderText="Price">
                              <ItemTemplate>
                                  <%#Eval("Food_Price")%>
                              </ItemTemplate>
                          </asp:TemplateField>

                           <asp:TemplateField HeaderText="Action">
                              <ItemTemplate>
                                  <asp:linkButton ID="btndelete" runat="server"  Text="Delete" CommandName="vishal" OnClientClick="return confirm('Are you sure!!!')" CommandArgument='<%#Eval("Id")%>'></asp:linkButton> | 
                                  <asp:linkButton ID="btnedit" runat="server"  Text="Edit" CommandName="anand" CommandArgument='<%#Eval("Id")%>'></asp:linkButton>
                              </ItemTemplate>
                          </asp:TemplateField>
                       </Columns>

                     </asp:GridView></td>
            </tr>

        </table>
    </div>
    </form>
</body>
</html>
