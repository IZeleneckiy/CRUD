package crud.controller;

import crud.model.Book;
import crud.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class BookController {
    private BookService bookService;

    @Autowired(required = true)
    @Qualifier(value = "bookService")
    public void setBookService(BookService bookService) {
        this.bookService = bookService;
    }

    @RequestMapping("/remove/{id}")
    public String removeBook(@PathVariable("id") int id) {
        this.bookService.removeBook(id);
        return "redirect:/books";
    }

    @RequestMapping(value = "add", method = RequestMethod.GET)
    public String add(Model model) {
        model.addAttribute("book", new Book());
        return "add";
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String edit(@PathVariable("id") int id, Model model) {
        Book book = this.bookService.getBookById(id);
        model.addAttribute(book);
        return "edit";
    }

    @RequestMapping(value = "/books/add", method = RequestMethod.POST)
    public String addBook(@ModelAttribute("book") Book book) {
        this.bookService.addBook(book);
        return "redirect:/books";
    }

    @RequestMapping(value = "/books/edit", method = RequestMethod.POST)
    public String editBook(@ModelAttribute("book") Book book) {
        book.setReadAlready(false);
        this.bookService.updateBook(book);
        return "redirect:/books";
    }

    @RequestMapping(value = "/read/{id}", method = RequestMethod.GET)
    public String read(@PathVariable("id") int id) {
        Book book = this.bookService.getBookById(id);
        this.bookService.readBook(book);
        return "redirect:/books";
    }

    @RequestMapping(value = "books", method = RequestMethod.GET)
    public String listBooks(@RequestParam(required = false) Integer page, Model model) {
        List<Book> books = bookService.listBooks();
        PagedListHolder<Book> pagedListHolder = new PagedListHolder<Book>(books);
        pagedListHolder.setPageSize(10);
        model.addAttribute("maxPages", pagedListHolder.getPageCount());
        if(page==null || page < 1 || page > pagedListHolder.getPageCount()) page=1;
        model.addAttribute("page", page);
        if(page == null || page < 1 || page > pagedListHolder.getPageCount()){
            pagedListHolder.setPage(0);
            model.addAttribute("listBooks", pagedListHolder.getPageList());
        } else if(page <= pagedListHolder.getPageCount()) {
            pagedListHolder.setPage(page-1);
            model.addAttribute("listBooks", pagedListHolder.getPageList());
        }
        model.addAttribute("book", new Book());
        return "books";
    }

    @RequestMapping(value = "searchBook")
    public String searchBook (@RequestParam("searchTitle") String searchTitle, Model model) {
        model.addAttribute("listBooks", this.bookService.listBooks(searchTitle));
        return "books";
    }
}
/*
@RequestMapping("searchUser")
    public ModelAndView searchUser(@RequestParam("searchName") String searchName){
        logger.info("Searching the User. User Names: "+searchName);
        List<User> usersList = userService.getAllUsers(searchName);
        return new ModelAndView("userList", "userList", usersList);
    }
 */