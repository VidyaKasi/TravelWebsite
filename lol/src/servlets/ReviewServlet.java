package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.mvc.bean.ReviewBean;
import com.mvc.dao.LoginDao;
import com.mvc.dao.ReviewDao;


public class ReviewServlet extends HttpServlet {
	public ReviewServlet(){
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        
		HttpSession session = request.getSession();
		String custEmail = (String)session.getAttribute("Cust_Email");
		int packageRating = Integer.parseInt(request.getParameter("radioPackageRate"));
		int foodRating = Integer.parseInt(request.getParameter("radioFoodRate"));
		int hotelRating = Integer.parseInt(request.getParameter("radioHotelRate"));
		int agentRating = Integer.parseInt(request.getParameter("radioAgentRate"));
		String comment = request.getParameter("comment");
		String packageId = (String)session.getAttribute("package_id");
		//clean user input
		comment = comment.replace('<',' ');
		comment = comment.replace('>',' ');
		comment = comment.replace(';',' ');
		comment = comment.replace('=',' ');
		comment = comment.trim();
		
		LoginDao loginDao = new LoginDao();
		int custId = Integer.parseInt(loginDao.findCustIdByEmail(custEmail));
		
		ReviewBean reviewBean = new ReviewBean();
		reviewBean.setPackage_rating(packageRating);
		reviewBean.setFood_rating(foodRating);
		reviewBean.setHotel_rating(hotelRating);
		reviewBean.setTour_guide_rating(agentRating);
		reviewBean.setComment(comment);
		reviewBean.setCust_id(custId);
		reviewBean.setPackage_id(packageId);
		
		ReviewDao reviewDao = new ReviewDao();
		String status = reviewDao.addReview(reviewBean);
		request.getRequestDispatcher("/Itinerary/Success2.jsp").forward(request, response);
	}
}
