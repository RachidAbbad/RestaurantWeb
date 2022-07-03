package com.sigl.session;

import com.sigl.entities.*;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.ws.rs.ApplicationPath;
import java.util.List;

@Stateless
@LocalBean
@ApplicationPath("/")
public class SessionImpl implements SessionImplRemote, SessionImplLocal {
	@PersistenceContext(unitName = "AppRestaurant")
	EntityManager em;

    public SessionImpl() {
        
    }




	@Override
	public void addMenu(Menu m) {
		em.persist(m);
	}
	@Override
	public void addCategorie(Categorie c) {
		em.persist(c);
	}
	@Override
	public void deleteCategorie(long id_categorie) {
		Categorie categorie=em.find(Categorie.class, id_categorie);
		em.remove(categorie);
	}
	@Override
	public Categorie getCategorie(Long id) {
		
		return em.find(Categorie.class, id);
	}
	@Override
	public List<Categorie> getAllCategories() {
		Query req=em.createQuery("select c from Categorie c");
		return req.getResultList();
	}
	@Override
	public List<Commande> getCommandesByIdClient(long id) {
		Query req=em.createQuery("select c from Commande c where c.client.id = :id");
		req.setParameter("id", id);
		return req.getResultList();
	}
	@Override
	public List<Commande> getAllCommandes() {
		Query req=em.createQuery("select m from Commande m");
		return req.getResultList();
	}
	@Override
	public void addCommande(Commande c) {
    	c.setClient(getClientById(c.getClient().getId()));
		em.persist(c);
		for (LigneCommande l : c.getCommandes()) {
			l.setMenu(getMenu(l.getMenu().getId()));
			l.setCommande(c);
			CommandeKey key = new CommandeKey();
			key.setIdcommande(c.getId());
			key.setIdmenu(l.getMenu().getId());
			l.setIdkey(key);
			em.persist(l);
			/*l.getIdkey().setId_menu(l.getMenu().getId());
			l.getIdkey().setId_commande(c.getId());*/
		}
		em.merge(c);
	}
	@Override
	public Commande getLignesCommande(long id) {
    	return em.find(Commande.class,id);
	}
	@Override
	public Client getClientById(long id) {
		return em.find(Client.class,id);
	}

	@Override
	public Client getClientByEmail(String email) {
		Query req = em.createQuery("select c from Client c where c.email = :email");
		req.setParameter("email",email);
		List<Client> client = req.getResultList();
		if(client.size()==0)
			return null;
		return client.get(0);
	}

	@Override
	public boolean addClient(Client c) {
    	try{
			em.persist(c);
			return true;
		}catch(Exception ex){
			return false;
		}
	}

	@Override
	public Client updateClient(Long id, Client c) {
		Client client=em.find(Client.class, id);
		client.setNom(c.getNom());
		client.setPrenom(c.getPrenom());
		em.merge(c);
		return c;
	}

	@Override
	public Client login(String userName, String password) {
		Query req = em.createQuery("select c from Client c where c.password = :password and c.email = :email");
		req.setParameter("password",password);
		req.setParameter("email",userName);
		List<Client> client = req.getResultList();
		if(client.size()==0)
			return null;
		return client.get(0);
	}

	@Override
	public Menu getMenu(Long id) {
		return em.find(Menu.class, id);
	}

	@Override
	public List<Menu> getAllMenus() {
		Query req=em.createQuery("select m from Menu m");
		return req.getResultList();
	}
	@Override
	public void deleteMenu(Long id) {
		Menu menu=em.find(Menu.class, id);
		em.remove(menu);
	}

	@Override
	public List<Menu> searchMenusByTitle(String critere) {
		String newcritere="%"+critere+"%";
		Query req=em.createQuery("select m from Menu m where m.titre like :titre");
		req.setParameter("titre", newcritere);
		return req.getResultList();
	}

	@Override
	public List<Menu> searchMenusByCategorie(long id_categorie) {
		Query req=em.createQuery("select m from Menu m where m.categorie.id = :id_categorie");
		req.setParameter("id_categorie", id_categorie);

		return req.getResultList();
	}

	@Override
	public Menu updateMenu(Long id, Menu m) {
		Menu menu=em.find(Menu.class, id);
		menu.setTitre(m.getTitre());
		menu.setDescription(m.getDescription());
		menu.setPrix(m.getPrix());
		menu.setCategorie(getCategorie(m.getCategorie().getId()));
		em.merge(menu);
		return menu;
	}

}