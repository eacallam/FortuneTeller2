using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using FortuneTeller2.Models;

namespace FortuneTeller2.Controllers
{
    public class CustomersController : Controller
    {
        private FortuneTeller2Context db = new FortuneTeller2Context();

        // GET: Customers
        public ActionResult Index()
        {
            var customers = db.Customers.Include(c => c.BirthMonth).Include(c => c.FavoriteColor);
            return View(customers.ToList());
        }

        // GET: Customers/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Customer customer = db.Customers.Find(id);
            if (customer == null)
            {
                return HttpNotFound();
            }

            if (customer.Age % 2 != 0)
            {
                ViewBag.RetirementAge = customer.Age + 20;
            }

            else
            {
                ViewBag.RetirementAge = customer.Age + 30;
            }

            if (customer.BirthMonthID < 5) 
            {
                ViewBag.Bank = "$50,000";
            }
            else if (customer.BirthMonthID > 4 && customer.BirthMonthID < 9)
            {
                ViewBag.Bank = "$100,000";
            }
            else if (customer.BirthMonthID > 8 && customer.BirthMonthID < 13)
            {
                ViewBag.Bank = "$1,000,000";
            }
            else
            {
                ViewBag.Bank = "$0";
            }

            if (customer.FavoriteColorID == 1)
            {
                ViewBag.Transportation = "a car";
            }
            else if (customer.FavoriteColorID == 2)
            {
                ViewBag.Transportation = "a bicycle";
            }
            else if (customer.FavoriteColorID == 3)
            {
                ViewBag.Transportation = "a train";
            }
            else if (customer.FavoriteColorID == 4)
            {
                ViewBag.Transportation = "an airplane";
            }
            else if (customer.FavoriteColorID == 5)
            {
                ViewBag.Transportation = "a scooter";
            }
            else if (customer.FavoriteColorID == 6)
            {
                ViewBag.Transportation = "a boat";
            }
            else
            {
                ViewBag.Transportation = "skis";
            }

            if (customer.NumberOfSiblings == 0)
            {
                ViewBag.VacationHome = "Rome";
            }
            else if (customer.NumberOfSiblings == 1)
            {
                ViewBag.VacationHome = "Paris";
            }
            else if (customer.NumberOfSiblings == 2)
            {
                ViewBag.VacationHome = "Chile";
            }
            else if (customer.NumberOfSiblings >= 3)
            {
                ViewBag.VacationHome = "Canada";
            }
            else
            {
                ViewBag.VacationHome = "Cleveland, OH";
            }

            return View(customer);
        }

        // GET: Customers/Create
        public ActionResult Create()
        {
            ViewBag.BirthMonthID = new SelectList(db.BirthMonths, "BirthMonthID", "BirthMonth1");
            ViewBag.FavoriteColorID = new SelectList(db.FavoriteColors, "FavoriteColorID", "FavoriteColor1");
            return View();
        }

        // POST: Customers/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "CustomerID,BirthMonthID,FavoriteColorID,FirstName,LastName,Age,NumberOfSiblings")] Customer customer)
        {
            if (ModelState.IsValid)
            {
                db.Customers.Add(customer);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.BirthMonthID = new SelectList(db.BirthMonths, "BirthMonthID", "BirthMonth1", customer.BirthMonthID);
            ViewBag.FavoriteColorID = new SelectList(db.FavoriteColors, "FavoriteColorID", "FavoriteColor1", customer.FavoriteColorID);
            return View(customer);
        }

        // GET: Customers/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Customer customer = db.Customers.Find(id);
            if (customer == null)
            {
                return HttpNotFound();
            }
            ViewBag.BirthMonthID = new SelectList(db.BirthMonths, "BirthMonthID", "BirthMonth1", customer.BirthMonthID);
            ViewBag.FavoriteColorID = new SelectList(db.FavoriteColors, "FavoriteColorID", "FavoriteColor1", customer.FavoriteColorID);
            return View(customer);
        }

        // POST: Customers/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "CustomerID,BirthMonthID,FavoriteColorID,FirstName,LastName,Age,NumberOfSiblings")] Customer customer)
        {
            if (ModelState.IsValid)
            {
                db.Entry(customer).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.BirthMonthID = new SelectList(db.BirthMonths, "BirthMonthID", "BirthMonth1", customer.BirthMonthID);
            ViewBag.FavoriteColorID = new SelectList(db.FavoriteColors, "FavoriteColorID", "FavoriteColor1", customer.FavoriteColorID);
            return View(customer);
        }

        // GET: Customers/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Customer customer = db.Customers.Find(id);
            if (customer == null)
            {
                return HttpNotFound();
            }
            return View(customer);
        }

        // POST: Customers/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Customer customer = db.Customers.Find(id);
            db.Customers.Remove(customer);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
