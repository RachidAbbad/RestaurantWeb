package com.sigl.entities;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * Entity implementation class for Entity: Adresse
 *
 */
@Entity
public class Commande implements Serializable {

	   
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String libelle;

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="id_client",referencedColumnName = "id")
	private Client client;
	@OneToMany(fetch = FetchType.EAGER,mappedBy = "commande")
	private List<LigneCommande> commandes=new ArrayList<LigneCommande>();
	public Commande() {
		super();
	}   
	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}   
	public String getLibelle() {
		return this.libelle;
	}

	public void setLibelle(String libelle) {
		this.libelle = libelle;
	}

	public Client getClient() {
		return client;
	}

	public void setClient(Client client) {
		this.client = client;
	}

	public List<LigneCommande> getCommandes() {
		return commandes;
	}

	public void setCommandes(List<LigneCommande> commandes) {
		this.commandes = commandes;
	}


}
