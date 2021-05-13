package Controllers;

import DAO.AdminDAO;
import Models.Game;
import Config.User;
import DataProcessors.GameProcessor;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

public class MainPageController extends HttpServlet {
    private static final String filepath = "/WEB-INF/pages/index.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        makeForward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String login = request.getParameter("login");
        String password = request.getParameter("password");

        if (login.equals(AdminDAO.getLogin()) && password.equals(AdminDAO.getPassword())) {
            User.enter(request);
            response.sendRedirect("Admin/");
            return;
        }

        makeForward(request, response);
    }

    private void makeForward(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        GameProcessor processor = new GameProcessor();

        ArrayList<Game> games = new ArrayList<>();

        String firstTeamName = request.getParameter("first-team-name");
        String secondTeamName = request.getParameter("second-team-name");
        String sportName = request.getParameter("sport-name");

        if (firstTeamName != null) {
            games = processor.getByFirstTeam(firstTeamName);
        } else if (secondTeamName != null) {
            games = processor.getBySecondTeam(secondTeamName);
        } else if (sportName != null) {
            games = processor.getBySport(sportName);
        } else {
            games = processor.getAll();
        }

        request.setAttribute("isAdmin", User.isAuthorized(request));
        request.setAttribute("Games", games);

        request.getRequestDispatcher(filepath).forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
