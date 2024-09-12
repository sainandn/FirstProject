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

import com.javatpoint.beans.Item;
import com.javatpoint.dao.ItemDao;

import java.util.List;

@Controller
public class ItemController {

	@Autowired
	ItemDao dao;

	@RequestMapping("/itemform")
	public String showForm(Model m) {
		m.addAttribute("command", new Item());
		return "itemform";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(@ModelAttribute("item") Item item) {
		dao.save(item);
		return "redirect:/viewitems";
	}

	@RequestMapping("/viewitems")
	public String viewItems(Model m) {
		List<Item> list = dao.getItems();
		m.addAttribute("list", list);
		double totalCost = list.stream().mapToDouble(Item::getItemCost).sum();
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
}
