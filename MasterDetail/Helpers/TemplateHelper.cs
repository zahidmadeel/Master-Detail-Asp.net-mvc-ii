using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Html;

namespace EditorDemo.Helpers
{
    public static class TemplateHelper
    {
        public static void RenderClientTemplate(this HtmlHelper helper, Type _type, string _partialViewName) 
        {
            
            object model = Activator.CreateInstance(_type);
            helper.RenderPartial(_partialViewName, model);
             
        }
    }
}