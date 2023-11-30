package pojo;

// Generated 12 Sep, 2023 12:36:48 PM by Hibernate Tools 3.4.0.CR1

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * Slider generated by hbm2java
 */
@Entity
@Table(name = "slider", catalog = "shoe_store")
public class Slider implements java.io.Serializable {

	private Integer id;
	private Category category;
	private String tital;
	private String content;
	private String image;

	public Slider() {
	}

	public Slider(Category category, String tital, String content, String image) {
		this.category = category;
		this.tital = tital;
		this.content = content;
		this.image = image;
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

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "cid")
	public Category getCategory() {
		return this.category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	@Column(name = "tital", length = 100)
	public String getTital() {
		return this.tital;
	}

	public void setTital(String tital) {
		this.tital = tital;
	}

	@Column(name = "content", length = 100)
	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Column(name = "image", length = 300)
	public String getImage() {
		return this.image;
	}

	public void setImage(String image) {
		this.image = image;
	}

}