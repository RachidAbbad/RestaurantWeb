package com.sigl.servlet;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.sigl.entities.*;
import com.sigl.session.SessionImplLocal;
import com.sigl.model.Model;
import com.sigl.utils.LocalPanier;


@WebServlet("/index.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 5,
        maxRequestSize = 1024 * 1024 * 5 * 5)
public class Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @EJB
    private SessionImplLocal metier;

    Model model;
    public String uploadPath = "C:\\Users\\Mahraz Mohamed Adnan\\eclipse-workspace2022\\TP1\\WebContent\\Images";
    public static final String IMAGES_FOLDER = "/Images";

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Servlet() {
        super();

    }

    @Override
    public void init() throws ServletException {
        model = new Model();
        uploadPath = getServletContext().getRealPath(IMAGES_FOLDER);
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();
    }

    private boolean checkAccess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Cookie[] cookies = request.getCookies();
        HttpSession session = request.getSession();
        if (session.getAttribute("login") != null)
            return true;
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("login")) {
                session.setAttribute("login", cookie.getValue());
                return true;
            }
        }
        return false;
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String page = request.getParameter("page");
        String id = request.getParameter("id");
        Long idLong = 0L;
        try {
            idLong = Long.parseLong(id);
        } catch (Exception e) {
        }

        if(page!=null && page.equals("7")){
            request.getRequestDispatcher("/WEB-INF/inscription.jsp").forward(request, response);
            return;
        }

        if (!checkAccess(request, response))
            request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);

        request.setAttribute("isAdmin", metier.getClientByEmail((String) request.getSession().getAttribute("login")).isAdmin());

        if (page == null) page = "1";

        //Default : Enregistrer menu
        //Page 1 : Enregistrer menu
        //Page 2 : Afficher menus
        //Page 3 : Logout
        //Page 4 : Supprimer menu
        //Page 5 : Afficher panier
        //Page 6 : Afficher commandes
        //Page 7 : inscription

        switch (page) {
            case "1":
                request.setAttribute("categories", metier.getAllCategories());
                request.getRequestDispatcher("/WEB-INF/saisimenu.jsp").forward(request, response);
                break;
            case "2":
                model.setMenus(metier.getAllMenus());
                request.setAttribute("model", model);
                request.getRequestDispatcher("/WEB-INF/affichemenu.jsp").forward(request, response);
                break;
            case "3":
                request.getSession().invalidate();
                request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
                break;
            case "4":
                metier.deleteMenu(idLong);
                model.setMenus(metier.getAllMenus());
                request.setAttribute("model", model);
                request.getRequestDispatcher("/WEB-INF/affichemenu.jsp").forward(request, response);
                break;
            case "5":
                request.setAttribute("panier",request.getSession().getAttribute("panier"));
                request.getRequestDispatcher("/WEB-INF/ajoutercommande.jsp").forward(request, response);
                break;
            case "6":
                request.setAttribute("commandes",metier.getCommandesByIdClient(metier.getClientByEmail((String) request.getSession().getAttribute("login")).getId()));
                request.getRequestDispatcher("/WEB-INF/afficherCommandes.jsp").forward(request, response);
                break;
            case "8":
                String menu_id = request.getParameter("menu");
                metier.deleteMenu(Long.parseLong(menu_id));
                model.setMenus(metier.getAllMenus());
                request.setAttribute("model", model);
                request.getRequestDispatcher("/WEB-INF/affichemenu.jsp").forward(request, response);
                break;

            case "9":
                Client c = metier.getClientByEmail((String) request.getSession().getAttribute("login"));
                request.setAttribute("client", c);
                request.getRequestDispatcher("/WEB-INF/profile.jsp").forward(request, response);
                break;

            default:
                request.getRequestDispatcher("/WEB-INF/affichemenu.jsp").forward(request, response);
                break;
        }
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        request.setAttribute("isAdmin", metier.getClientByEmail((String) request.getSession().getAttribute("login")).isAdmin());

        if (action.equals("login")) {
            String login = request.getParameter("login");
            String pass = request.getParameter("pass");
            String case1 = request.getParameter("case");
            HttpSession session = request.getSession();

            if (metier.login(login, pass) != null) {
                if (case1 != null) {
                    Cookie cookie = new Cookie("login", login);
                    cookie.setMaxAge(30 * 24 * 3600);
                    response.addCookie(cookie);
                }
                session.setAttribute("panier", new ArrayList<LigneCommande>(){});
                session.setAttribute("login", login);
                request.getRequestDispatcher("/WEB-INF/saisimenu.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Email ou mot de passe est incorrect");
                request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
            }


        }

        if (action.equals("inscription")) {
            String nom = request.getParameter("nom");
            String prenom = request.getParameter("prenom");
            String email = request.getParameter("email");
            String pass = request.getParameter("password");

            Client c = new Client();
            c.setPrenom(prenom);
            c.setNom(nom);
            c.setEmail(email);
            c.setPassword(pass);
            if (metier.addClient(c)) {
                request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
                return;
            }
            request.getRequestDispatcher("/WEB-INF/insciption.jsp").forward(request, response);
        }

        if (action.equals("Enregistrer categorie")) {
            String nomcat = request.getParameter("nomcat");

            Categorie c = new Categorie();
            c.setTitre(nomcat);
            metier.addCategorie(c);
            if(metier.getAllCategories()!=null)
                request.setAttribute("categories", metier.getAllCategories());
            request.getRequestDispatcher("/WEB-INF/saisimenu.jsp").forward(request, response);
        }

        if (action.equals("Enregistrer le menu")) {
            String titre = request.getParameter("titre");
            String description = request.getParameter("description");
            String prix = request.getParameter("prix");
            String cat = request.getParameter("cat");
            double prixc = 0;
            try {
                prixc = Double.parseDouble(prix);
            } catch (Exception e) {
                // TODO: handle exception
            }

            String fullPath = "";
            String fileName = "";
            String file_image = "";
            for (Part part : request.getParts()) {
                fileName = getFileName(part);
                if (!fileName.equals("Default.file")) {
                    fullPath = uploadPath + File.separator + fileName;
                    part.write(fullPath);
                    file_image = fileName;
                }

            }

            Menu menu = new Menu(titre, metier.getCategorie(Long.parseLong(cat)), prixc, file_image, description);
            metier.addMenu(menu);
            model.setMenus(metier.getAllMenus());
            request.setAttribute("model", model);
            request.getRequestDispatcher("/WEB-INF/affichemenu.jsp").forward(request, response);

        }

        if (action.equals("search")) {
            String search = request.getParameter("search");
            model.setMenus(metier.searchMenusByTitle(search));
            request.setAttribute("model", model);
            request.getRequestDispatcher("/WEB-INF/affichemenu.jsp").forward(request, response);

        }

        if (action.equals("Ajouter au panier")) {
            HttpSession session = request.getSession();

            Long idMenu=0L;
            int quantite = 0;
            try{
                idMenu = Long.parseLong(request.getParameter("menu_id"));
                quantite = Integer.parseInt(request.getParameter("quantite"));
            }catch(Exception ex){}
            LigneCommande ligne = new LigneCommande();
            System.out.println("Ids : "+ idMenu + " qty " + quantite);
            ligne.setMenu(metier.getMenu(idMenu));
            ligne.setQuantite(quantite);
            LocalPanier.lignePanier = (List<LigneCommande>) session.getAttribute("panier");
            if(LocalPanier.lignePanier==null){
                LocalPanier.lignePanier = new ArrayList<LigneCommande>();
                session.setAttribute("panier", LocalPanier.lignePanier);
            }
            LocalPanier.lignePanier.add(ligne);
            System.out.println(LocalPanier.lignePanier.size());
            session.setAttribute("panier",LocalPanier.lignePanier);
            model.setMenus(metier.getAllMenus());
            request.setAttribute("model", model);
            request.getRequestDispatcher("/WEB-INF/affichemenu.jsp").forward(request, response);
        }

        if (action.equals("Passer la commande")) {
            HttpSession session = request.getSession();
            LocalPanier.lignePanier = (List<LigneCommande>) session.getAttribute("panier");
            Commande c = new Commande();
            c.setClient(metier.getClientByEmail((String) session.getAttribute("login")));
            c.setCommandes(LocalPanier.lignePanier);
            c.setLibelle("Email Client : "+session.getAttribute("login"));
            metier.addCommande(c);
            request.setAttribute("model", model);
            request.getRequestDispatcher("/WEB-INF/affichemenu.jsp").forward(request, response);
        }


    }

    private String getFileName(Part part) {
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename"))
                return content.substring(content.indexOf("=") + 2, content.length() - 1);
        }
        return "Default.file";
    }

}
