package Controllers;

import Services.MainService;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class MainListener implements ServletContextListener {
    public void contextInitialized(ServletContextEvent sce) {
        MainService service = new MainService();

        sce.getServletContext().setAttribute("Service", service);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {

    }
}
