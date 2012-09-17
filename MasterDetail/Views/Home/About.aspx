<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MasterDetail.Models.Order>" %>

<asp:Content ID="aboutTitle" ContentPlaceHolderID="TitleContent" runat="server">
    About Us
</asp:Content>

<asp:Content ID="aboutContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>About</h2>
    <p>
        Put content here.
    </p>
    
    <%Html.BeginForm(); %>
    <div id = "order">
    customerID  <%:Html.TextBoxFor(x=>x.CustomerID) %>

    </div>
    <a href="#" id = "add2">add</a>

    <input value="save" type="submit" />
    <%Html.EndForm(); %>
    <script type="text/javascript">
        $("#add2").live('click', function () { 
            
var html = "<input data-val='true' "+ "data-val-required='This field is required' " + "name='inputFieldName' id='inputFieldId' type='text'/>";
$("#order").append(html);

$.validator.unobtrusive.parseDynamicContent('form input:last');

        });
    </script>
</asp:Content>
