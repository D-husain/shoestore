package pojo;

// Generated 12 Sep, 2023 12:36:48 PM by Hibernate Tools 3.4.0.CR1

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Team generated by hbm2java
 */
@Entity
@Table(name = "team", catalog = "shoe_store")
public class Team implements java.io.Serializable {

	private Integer id;
	private String name;
	private String position;
	private String img;
	private String facebook;
	private String twitter;
	private String instagram;

	public Team() {
	}

	public Team(String name, String position, String img, String facebook, String twitter, String instagram) {
		this.name = name;
		this.position = position;
		this.img = img;
		this.facebook = facebook;
		this.twitter = twitter;
		this.instagram = instagram;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "name", length = 100)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "position", length = 100)
	public String getPosition() {
		return this.position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	@Column(name = "img", length = 500)
	public String getImg() {
		return this.img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	@Column(name = "facebook", length = 500)
	public String getFacebook() {
		return this.facebook;
	}

	public void setFacebook(String facebook) {
		this.facebook = facebook;
	}

	@Column(name = "twitter", length = 500)
	public String getTwitter() {
		return this.twitter;
	}

	public void setTwitter(String twitter) {
		this.twitter = twitter;
	}

	@Column(name = "instagram", length = 500)
	public String getInstagram() {
		return this.instagram;
	}

	public void setInstagram(String instagram) {
		this.instagram = instagram;
	}

}