package com.javatpoint.dao;

import java.util.List;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import com.javatpoint.beans.Item;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ItemDao {

	JdbcTemplate template;

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	public void delete(int itemNumber) {
		String sql = "DELETE FROM items WHERE Item_Number = ?";
		template.update(sql, itemNumber);
	}

	public List<Item> getAllItems() {
		String sql = "SELECT * FROM items";
		return template.query(sql, (rs, rowNum) -> {
			Item item = new Item();
			item.setItemNumber(rs.getInt("Item_Number"));
			item.setItemName(rs.getString("Item_Name"));
			item.setItemCost(rs.getDouble("Item_Cost"));
			return item;
		});
	}

	public double getTotalCost() {
		String sql = "SELECT SUM(Item_Cost) FROM items";
		return template.queryForObject(sql, Double.class);
	}

	public int save(Item item) {
		String sql = "INSERT INTO items (Item_Number, Item_Name, Item_Cost) VALUES (?, ?, ?)";
		return template.update(sql, item.getItemNumber(), item.getItemName(), item.getItemCost());
	}

	public int update(Item item) {
		String sql = "UPDATE items SET Item_Name = '" + item.getItemName() + "', Item_Cost = " + item.getItemCost()
				+ " WHERE Item_Number = " + item.getItemNumber();
		return template.update(sql);
	}

	public Item getItemById(int itemNumber) {
		String sql = "SELECT * FROM items WHERE Item_Number = ?";
		return template.queryForObject(sql, new Object[] { itemNumber }, new BeanPropertyRowMapper<Item>(Item.class));
	}

	public List<Item> getItems() {
		return template.query("SELECT * FROM items", new RowMapper<Item>() {
			public Item mapRow(ResultSet rs, int row) throws SQLException {
				Item item = new Item();
				item.setItemNumber(rs.getInt(1));
				item.setItemName(rs.getString(2));
				item.setItemCost(rs.getDouble(3));
				return item;
			}
		});
	}
}
