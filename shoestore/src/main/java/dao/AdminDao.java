package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Restrictions;

import connection.ProjectConn;
import pojo.Admin;
import pojo.Category;
import pojo.Coupon;
import pojo.Product;
import pojo.Reviews;
import pojo.Slider;
import pojo.Team;

public class AdminDao {

	 static SessionFactory factory = new Configuration().configure().buildSessionFactory();
	
	public Admin Adminlogin(String name, String password){
		Session session=factory.openSession();
		Transaction tr=session.beginTransaction();
		Query query = session.createQuery("from Admin where name = :name and password = :password");
        query.setParameter("name", name);
        query.setParameter("password", password);
        Admin admin = (Admin) query.uniqueResult();
        tr.commit();
        session.close();
		return admin;
	}
	
	public void updateAdmin(Admin a) {
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		String sql = "UPDATE Admin SET name = :name " + "WHERE id = :id";
		Query query = session.createQuery(sql);
		query.setParameter("name", a.getName());
		query.setParameter("id", a.getId());
		int result = query.executeUpdate();
		System.out.println("Rows affected: " + result);
		tx.commit();
		session.close();
	}
	
	//---------------------------------------category---------------------------------------------------//
	
	public void AddCategory(Category c){
		Session session=factory.openSession();
		Transaction tr=session.beginTransaction();
		session.saveOrUpdate(c);
		tr.commit();
		session.close();
	}
	
	public List<Category> ShowCategory(){
		Session session = factory.openSession();
		Criteria cr = session.createCriteria(Category.class);
		List<Category> list = cr.list();
		return list;
	}
	
	public Category getCategoryById(int id) {
		Session session = factory.openSession();
		Criteria cr = session.createCriteria(Category.class);
		cr.add(Restrictions.eq("id", id));
		Category c = (Category) cr.uniqueResult();
		return c;
	}

	public Category getCategoryByName(String cname) {
		Session session = factory.openSession();
		Criteria cr = session.createCriteria(Category.class);
		cr.add(Restrictions.eq("cname", cname));
		Category c = (Category) cr.uniqueResult();
		return c;
	}
	
	public void deleteCategory(int id) {
		Session session = factory.openSession();
		Transaction tr = session.beginTransaction();
		Category c = session.get(Category.class, id);
		session.delete(c);
		tr.commit();
		session.close();
	}
	
	//---------------------------------------product----------------------------------------------------//
	
	public void AddProduct (Product p){
		Session ses=factory.openSession();
		Transaction tr=ses.beginTransaction();
		ses.saveOrUpdate(p);
		tr.commit();
		ses.close();
	}
	
	public List<Product> viewProduct() {
		Session session = factory.openSession();
		Criteria cri = session.createCriteria(Product.class);
		List<Product> list = cri.list();
		return list;
	}
	
	public List<Product> viewcategoryById(int cid) {
		Session session = factory.openSession();
		Query query = session.createQuery("from Product as p where p.category.id =:id");
		query.setParameter("id", cid);
		List<Product> list = query.list();
		return list;
	}
	
	public List<Product> viewcategoryByName(String cname) {
		Session session = factory.openSession();
		Query query = session.createQuery("from Product as p where p.category.cname =:cname");
		query.setParameter("cname", cname);
		List<Product> list = query.list();
		return list;
	}

	public Product getProductByName(String productName) {
		Session session = factory.openSession();
		Criteria cr = session.createCriteria(Product.class);
		cr.add(Restrictions.eq("pname", productName));
		Product c = (Product) cr.uniqueResult();
		return c;
	}

	public Product getProductById(int pid) {
		Session session = factory.openSession();
		Criteria cr = session.createCriteria(Product.class);
		cr.add(Restrictions.eq("id", pid));
		Product c = (Product) cr.uniqueResult();
		return c;
	}
	
	@SuppressWarnings("deprecation")
	public static List<Product> searchProduct(String keyword) {
	    Session session = factory.openSession();
	    Query<Product> query = session.createQuery("from Product where pname like :keyword", Product.class);
	    query.setParameter("keyword", "%" + keyword + "%");
	    return query.getResultList();
	}

	
	public static List<Product> searchProducts(String keyword) throws SQLException {
        List<Product> productList = new ArrayList<>();
        Connection con=ProjectConn.createConnection();
        String sql = "SELECT * FROM product WHERE pname LIKE ?";
        PreparedStatement statement=con.prepareStatement(sql);
        statement.setString(1, "%" + keyword + "%");
        ResultSet result = statement.executeQuery();
        
        while(result.next()) {
            Product product = new Product();
            product.setId(result.getInt("id"));
            product.setPname(result.getString("pname"));
            product.setQty(result.getInt("qty"));
            product.setDescription(result.getString("description"));
            product.setPrice(result.getFloat("price"));
            product.setImage1(result.getString("image1"));
            product.setImage2(result.getString("image2"));
            product.setImage3(result.getString("image3"));
            product.setImage3(result.getString("image4"));
            product.setAvailability(result.getString("availability"));
            productList.add(product);
        }
        return productList;
    }
	
	public void deleteProduct(int id) {
		Session session = factory.openSession();
		Transaction tr = session.beginTransaction();
		Product p = session.get(Product.class, id);
		session.delete(p);
		tr.commit();
		session.close();
	}
	
	
	//----------------------------------------coupon----------------------------------------------------//
	
	public void AddCoupon(Coupon c){
		Session ses=factory.openSession();
		Transaction tr=ses.beginTransaction();
		ses.saveOrUpdate(c);
		tr.commit();
		ses.close();
	}
	
	public List<Coupon> viewCoupon() {
		Session session = factory.openSession();
		Criteria cri = session.createCriteria(Coupon.class);
		List<Coupon> list = cri.list();
		return list;
	}
	
	public void deletecopon(int id){
		Session ses=factory.openSession();
		Transaction tr=ses.beginTransaction();
		Coupon c=ses.get(Coupon.class, id);
		ses.delete(c);
		tr.commit();
		ses.close();
		}
	
	//----------------------------------------slider----------------------------------------------------//
	
	public void Addslider(Slider s){
		Session ses=factory.openSession();
		Transaction tr=ses.beginTransaction();
		ses.saveOrUpdate(s);
		tr.commit();
		ses.close();
	}
	
	public List<Slider> viewSlider() {
		Session session = factory.openSession();
		Criteria cri = session.createCriteria(Slider.class);
		List<Slider> list = cri.list();
		return list;
	}
	
	public Slider getSliderById(int id) {
		Session session = factory.openSession();
		Criteria cr = session.createCriteria(Slider.class);
		cr.add(Restrictions.eq("id", id));
		Slider c = (Slider) cr.uniqueResult();
		return c;
	}
	
	public void deleteSlider(int id) {
		Session session = factory.openSession();
		Transaction tr = session.beginTransaction();
		Slider s = session.get(Slider.class, id);
		session.delete(s);
		tr.commit();
		session.close();
	}

	//----------------------------------------team----------------------------------------------------//
	
	public void Addteam(Team t) {
		Session ses=factory.openSession();
		Transaction tr=ses.beginTransaction();
		ses.saveOrUpdate(t);
		tr.commit();
		ses.close();
	}
	
	public List<Team> viewTeam() {
		Session session = factory.openSession();
		Criteria cri = session.createCriteria(Team.class);
		List<Team> list = cri.list();
		return list;
	}
	
	public Team getTeamById(int id) {
		Session session = factory.openSession();
		Criteria cr = session.createCriteria(Team.class);
		cr.add(Restrictions.eq("id", id));
		Team c = (Team) cr.uniqueResult();
		return c;
	}
	
	public void deleteTeam(int id) {
		Session session = factory.openSession();
		Transaction tr = session.beginTransaction();
		Team t = session.get(Team.class, id);
		session.delete(t);
		tr.commit();
		session.close();
	}
	
	//----------------------------------------review----------------------------------------------------//

	public void deletereview(int id) {
		Session session = factory.openSession();
		Transaction tr = session.beginTransaction();
		Reviews t = session.get(Reviews.class, id);
		session.delete(t);
		tr.commit();
		session.close();
		
	}

}
