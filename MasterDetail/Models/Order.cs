using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace MasterDetail.Models
{
    public class Order
    {
        public int OrderID { get; set; }
        public DateTime OrderDate { get; set; }
        public int CustomerID { get; set; }
        public IEnumerable<Customer> Customers { get; set; }
        public List<OrderLine> OrderLines { get; set; }
    }
    public class OrderLine
    {
        [UIHint("Product")]
        public int ProductID { get; set; }
        public int Quantity { get; set; }

    }

    public class Customer 
    {
        public int CustomerID { get; set; }
        public string CustomerName { get; set; }
    }

    public class Product 
    {
        public int ProductID { get; set; }
        public string ProductName { get; set; }
    }


}