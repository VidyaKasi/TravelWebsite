package servlets;

import java.io.IOException;
import java.sql.Date;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mvc.bean.PackageBean;
import com.mvc.bean.PurchaseBean;
import com.mvc.dao.LoginDao;
import com.mvc.dao.PackageDao;
import com.mvc.dao.PurchaseDao;


public class PurchaseServlet extends HttpServlet {
	public PurchaseServlet() {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		String custEmail = (String) session.getAttribute("Cust_Email");
		String packageid = (String) session.getAttribute("packageid");
		int numpax = Integer.parseInt(request.getParameter("numpax"));
		java.sql.Date today = new Date(Calendar.getInstance().getTimeInMillis());

		

	    

        


		LoginDao loginDao = new LoginDao();
		int custId = Integer.parseInt(loginDao.findCustIdByEmail(custEmail));

		PackageBean packageBean = new PackageBean();
		PackageDao packageDao = new PackageDao();
		packageBean = packageDao.getPackage(packageid);
		int cost = packageBean.getCost();

		PurchaseBean purchaseBean = new PurchaseBean();
		purchaseBean.setCust_id(custId);
		purchaseBean.setPackage_id(packageid);
		purchaseBean.setTotal_pax(numpax);
		purchaseBean.setTotal_cost(cost * numpax);
		purchaseBean.setDate(today);

		PurchaseDao purchaseDao = new PurchaseDao();
		String status = purchaseDao.addPurchase(purchaseBean);

		System.out.println("debug purchase status " + status);
		session.setAttribute("custId", Integer.toString(custId));
		request.getRequestDispatcher("/Itinerary/Success.jsp").forward(request, response);
	}
}
