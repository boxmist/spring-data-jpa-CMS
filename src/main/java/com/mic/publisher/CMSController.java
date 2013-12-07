package com.mic.publisher;


import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mic.publisher.model.Article;
import com.mic.publisher.model.ArticleRepository;


@Controller
public class CMSController {
	@Autowired
	private ArticleRepository repository;		
	
	private static final Logger logger = LoggerFactory.getLogger(CMSController.class);
	
	@RequestMapping(value = "/createArticle", method = RequestMethod.GET)
	public ModelAndView createArticle() {
		logger.info("createArticle view - user must submit to add to DB");
	    return new ModelAndView("createArticle", "articleModel", new Article());
	}

	@RequestMapping(value = "/addArticle", method = RequestMethod.POST) 
	public String submitArticle(@ModelAttribute("Article") Article article, ModelMap model) {
		logger.info("addArticle");
		repository.save(article);				
		model.addAttribute("articles", repository.findAll());
	    return "redirect:/home";
	}	
	
	@RequestMapping(value = "/removeArticle", method = RequestMethod.POST) 
	public String removeArticle(@ModelAttribute("articleID") Integer myID,ModelMap model) {	
		logger.info("removeArticle");
		repository.delete(myID);					
		model.addAttribute("articles", repository.findAll());
	    return "redirect:/home";
	}		
	
	@RequestMapping(value = "/viewArticle", method = RequestMethod.GET) 
	public String viewArticle(@ModelAttribute("articleID") Integer myID, ModelMap model) {		
		model.addAttribute("article", repository.findOne(myID));		
	    return "article";
	}		
	
	@RequestMapping(value ="/viewArticle/{id}", method = RequestMethod.GET)
	public @ResponseBody
	Article getArticleInJSON(@PathVariable Integer id) {
		return repository.findOne(id);
	}	
		
	@RequestMapping(value ="/viewArticles", method = RequestMethod.GET)
	public @ResponseBody
	Iterable<Article> getArticlesInJSON() {
		return repository.findAll();
	}	
		
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale); // we can check locale information
		model.addAttribute("articles", repository.findAll());
		return "home";
	}

}
