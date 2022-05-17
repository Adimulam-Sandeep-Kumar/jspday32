package ai.jobiak.data;

import java.io.Serializable;

public class Fruit implements Serializable{
	
	private String fruitId;
	private String description;
	private double price;
	
	public Fruit() {
		// TODO Auto-generated constructor stub
	}

	public Fruit(String fruitId, String description, double price) {
		this.fruitId = fruitId;
		this.description = description;
		this.price = price;
	}

	public String getFruitId() {
		return fruitId;
	}

	public void setFruitId(String fruitId) {
		this.fruitId = fruitId;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "Fruit [fruitId=" + fruitId + ", description=" + description + ", price=" + price + "]";
	}
	
}
