//
//  PesquisarViewController.swift
//  Cervejaria do Chuk
//
//  Created by Kovaltchuk, Fernando Cesar on 17/01/21.
//

import UIKit

class PesquisarViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate,UICollectionViewDelegate {
    @IBOutlet weak var tabelaCervejas: UITableView!
    @IBOutlet weak var pesquisarCervejas: UISearchBar!
    
    var listaCervejas:Array<Cerveja> = []
    let cervejaDAO = CervejaDAO()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cervejaDAO.retornaTodasAsCervejas(controller: self)
        self.tabelaCervejas.dataSource = self
        self.tabelaCervejas.delegate = self
        self.pesquisarCervejas.delegate = self
    }
    
    func updateCervejas() {
        listaCervejas = cervejaDAO.listaCerveja
        tabelaCervejas.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaCervejas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          
        let celula = tableView.dequeueReusableCell(withIdentifier: "celula", for: indexPath) as! CervejaTableViewCell
        let cervejaAtual = listaCervejas[indexPath.row]
        
        celula.labelNome.text = cervejaAtual.nome
        celula.labelSlogan.text = cervejaAtual.slogan
        let montaImagem = MontaImagem(caminhoDaImagem: cervejaAtual.caminhoDaImagem)
        celula.imagemCerveja.image = montaImagem.montaImagem()
        
        return celula
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    @IBAction func buttonBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        listaCervejas = cervejaDAO.listaCerveja
        if searchText != "" {
            listaCervejas = listaCervejas.filter({ $0.nome.contains(searchText) })
        }
        
        tabelaCervejas.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cerveja = listaCervejas[indexPath.item]
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard?.instantiateViewController(withIdentifier: "DetalhesCervejas") as! DetalhesCervejasViewController
        controller.cervejaSelecionada = cerveja
        self.present(controller, animated: true, completion: nil)
        
    }
       
}

