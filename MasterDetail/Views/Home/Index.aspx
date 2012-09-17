<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MasterDetail.Models.Order>" %>
<%@ Import Namespace="EditorDemo.Helpers"%>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Home Page
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%Html.EnableClientValidation(); %>
    <%Html.BeginForm(); %>
    <div id="orderMaster">
        <div>
            <%:Html.LabelFor(x =>x.OrderID)%>
            <%:Html.TextBoxFor(x=>x.OrderID)%>
        </div>
        <div>
            <%:Html.LabelFor(x =>x.CustomerID)%>
            <%:Html.DropDownListFor(x => x.CustomerID, new SelectList(Model.Customers, "CustomerID", "CustomerName"), "Select Customer", new { @class = "xyz" })%>
        </div>
        <div>
            <%:Html.LabelFor(x =>x.OrderDate)%>
            <%:Html.TextBoxFor(x=>x.OrderDate)%>
        </div>
    </div>
    <div id="orderDetail">
        <%foreach (var x in Model.OrderLines)
          {%> 
             <div class="editorRow">
               <%using(Html.BeginCollectionItem("OrderLines")) {
                   Html.RenderPartial("OrderLine",x);
               }%>
               </div> 
        <%} %>
       
    </div>
    <a href="#" id="add">Add Another</a>
    <input type="submit" value="save" />
    <%Html.EndForm(); %>
    <script id="OrderLine" type="text/x-jQuery-tmpl">
    <div class="editorRow">
    <%using(Html.BeginCollectionItem("OrderLines",true)) { %>
        <%Html.RenderClientTemplate(typeof(MasterDetail.Models.OrderLine), "OrderLine"); %>
        <%} %>
    </div>
    </script>
    
</asp:Content>

