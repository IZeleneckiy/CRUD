package crud.dao;

import crud.model.Book;

import java.util.List;

public interface BookDao {

    void addBook(Book book);

    void updateBook(Book book);

    void readBook(Book book);

    void removeBook(int id);

    Book getBookById(int id);

    List<Book> listBooks();

    List<Book> listBooks(String string);
}
