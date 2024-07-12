<%@ Page Title="" Language="C#" MasterPageFile="~/MainPage.master" AutoEventWireup="true" CodeFile="usuarios.aspx.cs" Inherits="usuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3>Lista de Usuários</h3>
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSourceUsuarios" DataKeyNames="email" InsertItemPosition="LastItem">
    <AlternatingItemTemplate>
        <tr style="background-color:#FFF8DC;">
            <td>
                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Excluir" />
                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Editar" />
            </td>
            <td>
                <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
            </td>
            <td>
                <asp:Label ID="passwordLabel" runat="server" Text='<%# Eval("password") %>' />
            </td>
            <td>
                <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
            </td>
        </tr>
    </AlternatingItemTemplate>
    <EditItemTemplate>
        <tr style="background-color:#008A8C;color: #FFFFFF;">
            <td>
                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Atualizar" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancelar" />
            </td>
            <td>
                <asp:Label ID="emailLabel1" runat="server" Text='<%# Eval("email") %>' />
            </td>
            <td>
                <asp:TextBox ID="passwordTextBox" runat="server" Text='<%# Bind("password") %>' />
            </td>
            <td>
                <asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("name") %>' />
            </td>
        </tr>
    </EditItemTemplate>
    <EmptyDataTemplate>
        <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
            <tr>
                <td>Nenhum dado foi retornado.</td>
            </tr>
        </table>
    </EmptyDataTemplate>
    <InsertItemTemplate>
        <tr style="">
            <td>
                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Inserir" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Limpar" />
            </td>
            <td>
                <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
            </td>
            <td>
                <asp:TextBox ID="passwordTextBox" runat="server" Text='<%# Bind("password") %>' />
            </td>
            <td>
                <asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("name") %>' />
            </td>
        </tr>
    </InsertItemTemplate>
    <ItemTemplate>
        <tr style="background-color:#DCDCDC;color: #000000;">
            <td>
                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Excluir" />
                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Editar" />
            </td>
            <td>
                <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
            </td>
            <td>
                <asp:Label ID="passwordLabel" runat="server" Text='<%# Eval("password") %>' />
            </td>
            <td>
                <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
            </td>
        </tr>
    </ItemTemplate>
    <LayoutTemplate>
        <table runat="server">
            <tr runat="server">
                <td runat="server">
                    <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                        <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                            <th runat="server"></th>
                            <th runat="server">email</th>
                            <th runat="server">password</th>
                            <th runat="server">name</th>
                        </tr>
                        <tr id="itemPlaceholder" runat="server">
                        </tr>
                    </table>
                </td>
            </tr>
            <tr runat="server">
                <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                    <asp:DataPager ID="DataPager1" runat="server">
                        <Fields>
                            <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                        </Fields>
                    </asp:DataPager>
                </td>
            </tr>
        </table>
    </LayoutTemplate>
    <SelectedItemTemplate>
        <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
            <td>
                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Excluir" />
                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Editar" />
            </td>
            <td>
                <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
            </td>
            <td>
                <asp:Label ID="passwordLabel" runat="server" Text='<%# Eval("password") %>' />
            </td>
            <td>
                <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
            </td>
        </tr>
    </SelectedItemTemplate>
</asp:ListView>
<asp:SqlDataSource ID="SqlDataSourceUsuarios" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [users] WHERE [email] = @email" InsertCommand="INSERT INTO [users] ([email], [password], [name]) VALUES (@email, @password, @name)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [email], [password], [name] FROM [users]" UpdateCommand="UPDATE [users] SET [password] = @password, [name] = @name WHERE [email] = @email">
    <DeleteParameters>
        <asp:Parameter Name="email" Type="String" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="email" Type="String" />
        <asp:Parameter Name="password" Type="String" />
        <asp:Parameter Name="name" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="password" Type="String" />
        <asp:Parameter Name="name" Type="String" />
        <asp:Parameter Name="email" Type="String" />
    </UpdateParameters>
</asp:SqlDataSource>
</asp:Content>

