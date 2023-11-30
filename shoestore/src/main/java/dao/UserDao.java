package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Restrictions;

import pojo.Cart;
import pojo.Cities;
import pojo.Contact;
import pojo.Order;
import pojo.Reviews;
import pojo.ShippingAddress;
import pojo.Sproduct;
import pojo.States;
import pojo.Subscribe;
import pojo.User;
import pojo.Usercoupon;
import pojo.Wishlist;
import connection.ProjectConn;

public class UserDao {

	static SessionFactory factory = new Configuration().configure().buildSessionFactory();

	public void RegisterUser(User u) {
		Session session = factory.openSession();
		Transaction tr = session.beginTransaction();
		session.saveOrUpdate(u);
		tr.commit();
		session.close();
	}

	public User userlogin(String email, String password) {
		Session session = factory.openSession();
		Transaction tr = session.beginTransaction();
		Query query = session
				.createQuery("from User where email = :email and password = :password");
		query.setParameter("email", email);
		query.setParameter("password", password);
		User user = (User) query.uniqueResult();
		tr.commit();
		session.close();
		return user;
	}

	public User getUserById(int uids) {
		Session session = factory.openSession();
		Criteria cr = session.createCriteria(User.class);
		cr.add(Restrictions.eq("id", uids));
		User u = (User) cr.uniqueResult();
		return u;
	}

	public List<User> viewUsers() {

		Session session = factory.openSession();
		Criteria cr = session.createCriteria(User.class);
		List<User> list = cr.list();
		return list;
	}

	public void edituseraddress(User u) {
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		String sql = "UPDATE User SET fname = :fname, " +
	             "lname = :lname, " +
	             "email = :email, " +
	             "contact = :contact, " +
	             "address = :address " +
	             "WHERE id = :id";
		Query query = session.createQuery(sql);
		query.setParameter("fname",u.getFname());
		query.setParameter("lname",u.getLname());
		query.setParameter("email",u.getEmail());
		query.setParameter("contact",u.getContact());
		query.setParameter("address",u.getAddress());
		query.setParameter("id", u.getId());
		int result = query.executeUpdate();
		System.out.println("Rows affected: " + result);
		tx.commit();
		session.close();
	}

	// -----------------------------------contact---------------------------------------------------------

	public void addContact(Contact c) {
		Session session = factory.openSession();
		Transaction tr = session.beginTransaction();
		session.saveOrUpdate(c);
		tr.commit();
		session.close();
	}

	public List<Contact> viewContact() {

		Session session = factory.openSession();
		Criteria cr = session.createCriteria(Contact.class);
		List<Contact> list = cr.list();
		return list;
	}
	
	public void replay(Contact c) {
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		String sql = "UPDATE  Contact set replay = :replay " + "WHERE id = :id";
		Query query = session.createQuery(sql);
		query.setParameter("replay", c.getReplay());
		query.setParameter("id", c.getId());
		int result = query.executeUpdate();
		tx.commit();
		session.close();
	}
	
	// -----------------------------------subscribe-------------------------------------------------------

	public void addsubscibe(Subscribe s) {
		Session session = factory.openSession();
		Transaction tr = session.beginTransaction();
		session.saveOrUpdate(s);
		tr.commit();
		session.close();
	}

	public List<Subscribe> viewsbcribe() {
		Session session = factory.openSession();
		Criteria cr = session.createCriteria(Subscribe.class);
		List<Subscribe> list = cr.list();
		return list;
	}

	public void deleteSubscribe(int id) {
		Session session = factory.openSession();
		Transaction tr = session.beginTransaction();
		Subscribe s = session.get(Subscribe.class, id);
		session.delete(s);
		tr.commit();
		session.close();
	}

	// -----------------------------------wishlist--------------------------------------------------------

	public void addWishlist(Wishlist w) {
		Session session = factory.openSession();
		Transaction tr = session.beginTransaction();
		session.saveOrUpdate(w);
		tr.commit();
		session.close();
	}

	public List<Wishlist> showwishlist(int uid) {
		Session session = factory.openSession();
		Query<Wishlist> query = session.createQuery("from Wishlist where uid = :uid", Wishlist.class);
		query.setParameter("uid", uid);
		return query.getResultList();
	}

	public void deletewishlist(int id) {
		Session session = factory.openSession();
		Transaction tr = session.beginTransaction();
		Wishlist w = session.get(Wishlist.class, id);
		session.delete(w);
		tr.commit();
		session.close();
	}

	// -------------------------------------cart----------------------------------------------------------

	public void addCart(Cart c) {
		Session session = factory.openSession();
		Transaction tr = session.beginTransaction();
		session.saveOrUpdate(c);
		tr.commit();
		session.close();
	}

	public List<Cart> showCart(int uid) {
		Session session = factory.openSession();
		Query<Cart> query = session.createQuery("from Cart where uid = :uid", Cart.class);
		query.setParameter("uid", uid);
		return query.getResultList();
	}

	public void deletecart(int id) {
		Session session = factory.openSession();
		Transaction tr = session.beginTransaction();
		Cart c = session.get(Cart.class, id);
		session.delete(c);
		tr.commit();
		session.close();
	}

	public Cart getCartById(int id) {
		Session session = factory.openSession();
		Criteria cr = session.createCriteria(Cart.class);
		cr.add(Restrictions.eq("id", id));
		Cart c = (Cart) cr.uniqueResult();
		return c;
	}

	public static void updateCart(int id, float qty, Double total) {
		try {
			Connection conn = ProjectConn.createConnection();
			String sql = "update cart set qty=?,total=? where id=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setFloat(1, qty);
			pst.setDouble(2, total);
			pst.setInt(3, id);
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public double gettotalprice(List<Cart> cartlist) {
		double sum = 0;
		try {
			if (cartlist.size() > 0) {
				for (Cart item : cartlist) {
					Connection con = ProjectConn.createConnection();
					String sql = "select price from cart where id=?";
					PreparedStatement pst = con.prepareStatement(sql);
					pst.setInt(1, item.getId());
					ResultSet rs = pst.executeQuery();
					while (rs.next()) {
						sum += rs.getDouble("price") * item.getQty();
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sum;
	}
	
	public double getShipping(List<Cart> cartList) {
		double totalSum = 0;
		try {
			if (!cartList.isEmpty()) {
				for (Cart item : cartList) {
					Connection con = ProjectConn.createConnection();
					String itemSql = "SELECT price FROM cart WHERE id=?";
					PreparedStatement itemPst = con.prepareStatement(itemSql);
					itemPst.setInt(1, item.getId());
					ResultSet itemRs = itemPst.executeQuery();
					if (itemRs.next()) {
						double price = itemRs.getDouble("price");
						totalSum += price * item.getQty();
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return totalSum;
	}

	// -------------------------------------shipping------------------------------------------------------

	public void AddShipping(ShippingAddress s) {
		Session session = factory.openSession();
		Transaction tr = session.beginTransaction();
		session.saveOrUpdate(s);
		tr.commit();
		session.close();
	}

	public List<ShippingAddress> showShipping(int uid) {
		Session session = factory.openSession();
		Query<ShippingAddress> query = session.createQuery("from Shipping where uid = :uid", ShippingAddress.class);
		query.setParameter("uid", uid);
		return query.getResultList();
	}

	public ShippingAddress getShippingById(Integer sid) {
		Session session = factory.openSession();
		Criteria cr = session.createCriteria(ShippingAddress.class);
		cr.add(Restrictions.eq("id", sid));
		ShippingAddress s = (ShippingAddress) cr.uniqueResult();
		return s;
	}

	// -----------------------------------------Order--------------------------------------------------

	public void saveOrder(Order o) {
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		session.saveOrUpdate(o);
		tx.commit();
		session.close();
	}

	public List<Order> viewOrder() {
		Session session = factory.openSession();
		Criteria cr = session.createCriteria(Order.class);
		List<Order> list = cr.list();
		return list;
	}

	/*
	 * public List<Order> getOrderDetailsByOrderId(int id) { Session session =
	 * factory.openSession(); Query<Order> query =
	 * session.createQuery("from Order where id=:id", Order.class);
	 * query.setParameter("id", id); return query.getResultList(); }
	 */

	public List<Order> pending() {
		Session session = factory.openSession();
		Query<Order> query = session.createQuery("from Order where status = 1", Order.class);
		return query.getResultList();
	}

	public List<Order> active() {
		Session session = factory.openSession();
		Query<Order> query = session.createQuery("from Order where status = 2", Order.class);
		return query.getResultList();
	}

	public void activeorders(Order o) {
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		String sql = "UPDATE  Order set status = :status " + "WHERE id = :id";
		Query query = session.createQuery(sql);
		query.setParameter("status", 2);
		query.setParameter("id", o.getId());
		int result = query.executeUpdate();
		System.out.println("Rows affected: " + result);
		tx.commit();
		session.close();
	}

	public List<Order> shipping() {
		Session session = factory.openSession();
		Query<Order> query = session.createQuery("from Order where status = 3", Order.class);
		return query.getResultList();
	}

	public void activeShipping(Order o) {
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		String sql = "UPDATE  Order set status = :status " + "WHERE id = :id";
		Query query = session.createQuery(sql);
		query.setParameter("status", 3);
		query.setParameter("id", o.getId());
		int result = query.executeUpdate();
		System.out.println("Rows affected: " + result);
		tx.commit();
		session.close();
	}

	public List<Order> Deliverd() {
		Session session = factory.openSession();
		Query<Order> query = session.createQuery("from Order where status = 4", Order.class);
		return query.getResultList();
	}

	public void activeDelivered(Order o) {
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		String sql = "UPDATE  Order set status = :status " + "WHERE id = :id";
		Query query = session.createQuery(sql);
		query.setParameter("status", 4);
		query.setParameter("id", o.getId());
		int result = query.executeUpdate();
		System.out.println("Rows affected: " + result);
		tx.commit();
		session.close();
	}

	public List<Order> Cancelled() {
		Session session = factory.openSession();
		Query<Order> query = session.createQuery("from Order where status = 5", Order.class);
		return query.getResultList();
	}

	public void activecancel(Order o) {
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		String sql = "UPDATE  Order set status = :status, cancelorder = :cancelorder WHERE id = :id";
		Query query = session.createQuery(sql);
		query.setParameter("status", 5);
		query.setParameter("cancelorder", o.getCancelorder());
		query.setParameter("id", o.getId());
		int result = query.executeUpdate();
		System.out.println("Rows affected: " + result);
		tx.commit();
		session.close();
	}

	public List<Order> viewOrders(int uid) {
		Session session = factory.openSession();
		Query<Order> query = session.createQuery("from Order where uid = :uid", Order.class);
		query.setParameter("uid", uid);
		return query.getResultList();
	}
	
	public List<Order> getDeliveredOrders(int uid) {
	    Session session = factory.openSession();
	    Query<Order> query = session.createQuery("from Order where status = :status AND uid = :uid", Order.class);
	    query.setParameter("status", 4);
	    query.setParameter("uid", uid);
		return query.getResultList();
	}
	
	public List<Order> viewOrdersId(int id) {
		Session session = factory.openSession();
		Query<Order> query = session.createQuery("from Order where id = :id", Order.class);
		query.setParameter("id", id);
		return query.getResultList();
	}

	public Order getOrderById(int id) {
		Session session = factory.openSession();
		Criteria cr = session.createCriteria(Order.class);
		cr.add(Restrictions.eq("id", id));
		Order c = (Order) cr.uniqueResult();
		return c;
	}
	
	@SuppressWarnings("deprecation")
	public static Order searchOrderId(int orderId) {
	    Session session = factory.openSession();
	    Query<Order> query = session.createQuery("from Order where id like :OrderId", Order.class);
	    query.setParameter("OrderId",orderId);
	    return query.uniqueResult();
	}
	
	@SuppressWarnings("deprecation")
	public static List<Order> OrderFilter(String fromDate, String toDate) {
	    Session session = factory.openSession();
	    Query<Order> query = session.createQuery("from Order where odate between :fromDate and :toDate", Order.class);
	    query.setParameter("fromDate", fromDate);
	    query.setParameter("toDate", toDate);
	    return query.getResultList();
	}
	
	
	// -----------------------------------Shipping Order-------------------------------------------------

	public void addsproduct(Sproduct sp) {
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		session.saveOrUpdate(sp);
		tx.commit();
		session.close();
	}

	public List<Sproduct> getSproductDetailsByOrderId(int id) {
		Session session = factory.openSession();
		Query<Sproduct> query = session.createQuery("from Sproduct where oid=:oid", Sproduct.class);
		query.setParameter("oid", id);
		return query.getResultList();
	}

	// -----------------------------------rating---------------------------------------------------------
		
	public void Addrating(Reviews r) {
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		session.saveOrUpdate(r);
		tx.commit();
		session.close();
	}
	
	public List<Reviews> viewReviews(int uid) {
		Session session = factory.openSession();
		Query<Reviews> query = session.createQuery("from Reviews where uid = :uid", Reviews.class);
		query.setParameter("uid", uid);
		return query.getResultList();
	}
	
	public List<Reviews> viewReview() {
		Session session = factory.openSession();
		Criteria cr = session.createCriteria(Reviews.class);
		List<Reviews> list = cr.list();
		return list;
	}
	
	public List<Reviews> ViewReview(int pid) {
		Session session = factory.openSession();
		Query<Reviews> query = session.createQuery("from Reviews where pid = :pid", Reviews.class);
		query.setParameter("pid", pid);
		return query.getResultList();
	}
	
	// -----------------------------------Coupon---------------------------------------------------------
	
	public void applycoupon(Usercoupon uc){
    	Session ses=factory.openSession();
		Transaction tr=ses.beginTransaction();
		ses.saveOrUpdate(uc);
		tr.commit();
		ses.close();
    }
	
	public boolean checkCouponMatch(Usercoupon uc) {
        String enteredCoupon = uc.getCoupon();

        try (Connection connection = ProjectConn.createConnection()) {
            String query = "SELECT code FROM coupon WHERE code = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, enteredCoupon);
            ResultSet resultSet = statement.executeQuery();
            return resultSet.next();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
	
	public List<Usercoupon> ShowUserCoupon(){
    	Session ses=factory.openSession();
    	Criteria ce=ses.createCriteria(Usercoupon.class);
    	List<Usercoupon> list=ce.list();
		return list;
    }
	
	public List<Usercoupon> ViewUsercoupon(int uid) {
		Session session = factory.openSession();
		Query<Usercoupon> query = session.createQuery("from Usercoupon where uid = :uid", Usercoupon.class);
		query.setParameter("uid", uid);
		return query.getResultList();
	}
	
	public void deletecoupon(int id) {
		Session session = factory.openSession();
		Transaction tr = session.beginTransaction();
		Usercoupon uc = session.get(Usercoupon.class, id);
		session.delete(uc);
		tr.commit();
		session.close();
	}
	
	// -----------------------------------cities---------------------------------------------------------
	
	public List<Cities> showcities(){
		Session session =factory.openSession();
		Criteria cr=session.createCriteria(Cities.class);
		List<Cities> list=cr.list();
		return list;
	}
	
	public List<Cities> ViewCities(int id) {
		Session session = factory.openSession();
		Query<Cities> query = session.createQuery("from Cities where State_id = :State_id", Cities.class);
		query.setParameter("State_id", id);
		return query.getResultList();
	}
	
	// -----------------------------------states---------------------------------------------------------
	
	public List<States> showStates(){
		Session session =factory.openSession();
		Criteria cr=session.createCriteria(States.class);
		List<States> list=cr.list();
		return list;
	}

	
}
