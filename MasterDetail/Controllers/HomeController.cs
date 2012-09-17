using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MasterDetail.Models;

namespace MasterDetail.Controllers
{
    public class HomeController : Controller
    {
        string _customerKey = "Customers";
        string _productKey = "Products";
        protected override void Initialize(System.Web.Routing.RequestContext requestContext)
        {
            base.Initialize(requestContext);
            if (Session[_customerKey] == null) 
            {
                var customers = new List<Customer> { new Customer { CustomerID = 1, CustomerName = "Atif" }, new Customer { CustomerID = 2, CustomerName = "Ali" }, new Customer { CustomerID = 3, CustomerName = "Ahmed" } };
                Session[_customerKey] = customers;
            }
            if (Session[_productKey] == null) 
            {
                var products = new List<Product>{new Product{ProductID = 1, ProductName = "Printer"},
                    new Product{ProductID = 2, ProductName = "Camera"},
                    new Product{ProductID = 3, ProductName = "Monitor"}};
                Session[_productKey] = products;
            }
        }
        public ActionResult Index()
        {
            ViewBag.Products = Session[_productKey] as List<Product>;
            Order _order = new Order { CustomerID = 1, OrderDate = DateTime.Now, OrderID = 1 };
            _order.OrderLines = new List<OrderLine> { new OrderLine { ProductID = 1, Quantity = 3 }, new OrderLine { ProductID = 2, Quantity = 56 } };
            _order.Customers = Session[_customerKey] as List<Customer>; 
            return View(_order);
        }
        [HttpPost]
        public ActionResult Index(Order order) 
        {
            ViewBag.Products = Session[_productKey] as List<Product>;
            order.Customers = Session[_customerKey] as List<Customer>;
            if (ModelState.IsValid) 
            {
                return View("DisplayOrder", order);
            }
            return View(order);
        }

        public ActionResult About()
        {
            return View(new Order());
        }
    }
}
