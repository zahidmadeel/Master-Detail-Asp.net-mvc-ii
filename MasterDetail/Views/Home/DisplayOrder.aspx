<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MasterDetail.Models.Order>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    DisplayOrder
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>DisplayOrder</h2>

<fieldset>
    <legend>Order</legend>
    
    <div class="display-label">OrderDate</div>
    <div class="display-field"><%: String.Format("{0:g}", Model.OrderDate) %></div>

    <div class="display-label">Customer Name</div>
    <div class="display-field"><%: Model.Customers.SingleOrDefault(x=>x.CustomerID == Model.CustomerID).CustomerName %></div>
    <%if (Model.OrderLines.Count() > 0)
      { %>
    <table>
        <thead>
            <tr>
                <th>Product ID</th><th>Quantity</th>
            </tr>
        </thead>
        <tbody>
            <%foreach (var x in Model.OrderLines)
              { %>
                <tr><td><%:(ViewBag.Products as List<MasterDetail.Models.Product>).SingleOrDefault(z=>z.ProductID == x.ProductID).ProductName %></td><td><%:x.Quantity %></td></tr>
            <%} %>
        </tbody>
        
    </table>
    <%} %>
</fieldset>
<p>

    <%: Html.ActionLink("Edit", "Edit", new { id=Model.OrderID }) %> |
    <%: Html.ActionLink("Back to List", "Index") %>
</p>

</asp:Content>

