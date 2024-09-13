package com.javatpoint.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.javatpoint.beans.Items;
import com.javatpoint.dao.ItemDao;

import java.util.List;

@Controller
public class ItemController {

	@Autowired
	ItemDao dao;

	@RequestMapping("/itemform")
	public String showForm(Model m) {
		m.addAttribute("command", new Items());
		return "itemform";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(@ModelAttribute("item") Items item) {
		dao.save(item);
		return "redirect:/viewitems";
	}

	@RequestMapping("/viewitems")
	public String viewItems(Model m) {
		List<Items> list = dao.getItems();
		m.addAttribute("list", list);
		double totalCost = list.stream().mapToDouble(Items::getItemCost).sum();
		m.addAttribute("totalCost", totalCost);
		return "viewitems";
	}


	@RequestMapping(value = "/deleteItems", method = RequestMethod.POST)
	public String deleteItems(@RequestParam("itemNumbers") List<String> itemNumbers) {
		for (String itemNumber : itemNumbers) {
			
			dao.delete(Integer.parseInt(itemNumber));
		}
		return "redirect:/viewitems"; 
	}
	
	 // Show edit form for an item
    @RequestMapping(value = "/edititem", method = RequestMethod.GET)
    public String editItem(@RequestParam("itemNumber") int itemNumber, Model m) {
        Items item = dao.getItemById(itemNumber); // Fetch the item by its ID
        m.addAttribute("command", item); // Add item to the model
        return "edititemform"; // Return the edit form view
    }

    // Handle the update request
    @RequestMapping(value = "/updateitem", method = RequestMethod.POST)
    public String updateItem(@ModelAttribute("item") Items item) {
        dao.update(item); // Update the item in the database
        return "redirect:/viewitems"; // Redirect to the view items page
    }
}
