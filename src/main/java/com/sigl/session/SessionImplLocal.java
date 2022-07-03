package com.sigl.session;

import com.sigl.entities.*;

import javax.ejb.Local;
import java.util.List;

@Local
public interface SessionImplLocal {

	//Menu :
	void addMenu(Menu m);
	Menu getMenu(Long id);
	List<Menu> getAllMenus();
	void deleteMenu(Long id);
	List<Menu> searchMenusByTitle(String critere);
	List<Menu> searchMenusByCategorie(long id_categorie);
	Menu updateMenu(Long id,Menu m);

	//Categorie :
	void addCategorie(Categorie c);
	void deleteCategorie(long id_categorie);
	Categorie getCategorie(Long id);
	List<Categorie> getAllCategories();

	//Commandes
	List<Commande> getCommandesByIdClient(long id);
	List<Commande> getAllCommandes();
	void addCommande(Commande c);
	Commande getLignesCommande(long id);

	//Client
	Client getClientById(long id);
	Client getClientByEmail(String email);
	boolean addClient(Client c);
	Client updateClient(Long id, Client c);
	Client login(String userName, String password);
}
