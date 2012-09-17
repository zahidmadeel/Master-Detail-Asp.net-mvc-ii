<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<System.Int32 >" %>
<%:Html.DropDownList("", new SelectList((List<MasterDetail.Models.Product>)ViewBag.Products,"ProductID","ProductName",Model), "--Select Product--")%>


