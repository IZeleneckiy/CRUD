package crud.dao;

import crud.model.Book;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public class BookDaoImpl implements BookDao {
    private static final Logger logger = LoggerFactory.getLogger(BookDaoImpl.class);

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void addBook(Book book) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(book);
        logger.info("Book successfully added. Book details: " + book);
    }

    @Override
    public void updateBook(Book book) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(book);
        logger.info("Book successfully updated. Book details: " + book);
    }

    @Override
    public void readBook(Book book) {
        Session session = this.sessionFactory.getCurrentSession();
        book.setReadAlready(true);
        session.update(book);
        logger.info("Book successfully updated. Book details: " + book);
    }

    @Override
    public void removeBook(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Book book = session.load(Book.class, id);
        if (book != null) {
            session.delete(book);
            logger.info("Book successfully deleted. Book details: " + book);
        }
    }

    @Override
    public Book getBookById(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Book book = session.load(Book.class, id);
        logger.info("Book successfully loaded. Book details: " + book);
        return book;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Book> listBooks() {
        Session session = this.sessionFactory.getCurrentSession();
        List<Book> bookList = session.createQuery("from Book").list();
        for(Book book: bookList) logger.info("Book list: " + book);
        return bookList;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Book> listBooks(String string) {
        Session session = this.sessionFactory.getCurrentSession();
        //List<Book> bookList = session.createQuery("from book where title = \"" + string + "\"").list();
        Query query = session.createQuery("from Book where title = :title ");
        query.setParameter("title", string);
        List<Book> bookList = query.list();
        for(Book book: bookList) logger.info("Search book list: " + book);
        return bookList;
    }
}
