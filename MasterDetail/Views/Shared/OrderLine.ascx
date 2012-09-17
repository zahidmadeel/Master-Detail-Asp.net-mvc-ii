<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<MasterDetail.Models.OrderLine>" %>
<%@ Import Namespace="EditorDemo.Helpers"%>


    
        Item: <%= Html.EditorFor(x => x.ProductID) %> 
        Quantity: <%= Html.TextBoxFor(x => x.Quantity, new { size = 4 }) %> 
        <a href="#" class="deleteRow">delete</a>
        
        <%= Html.ValidationMessageFor(x => x.ProductID) %>
        <%= Html.ValidationMessageFor(x => x.Quantity) %>
    
    

