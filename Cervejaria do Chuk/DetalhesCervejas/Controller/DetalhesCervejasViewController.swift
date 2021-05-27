//
//  DetalhesCervejasViewController.swift
//  Cervejaria do Chuk
//
//  Created by Kovaltchuk, Fernando Cesar on 18/01/21.
//

import UIKit

class DetalhesCervejasViewController: UIViewController {

    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var imagemCerveja: UIImageView!
    @IBOutlet weak var labelSlogan: UILabel!
    @IBOutlet weak var labelDescricao: UILabel!
    @IBOutlet weak var labelPreco: UILabel!
    
    var cervejaSelecionada:Cerveja? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let cerveja = cervejaSelecionada {

            let montaImagem = MontaImagem(caminhoDaImagem: cervejaSelecionada!.caminhoDaImagem)
            self.imagemCerveja.image = montaImagem.montaImagem()
            self.labelTitulo.text = cervejaSelecionada!.nome
            self.labelSlogan.text = cervejaSelecionada!.slogan
            self.labelDescricao.text = cervejaSelecionada!.descricao
        }
    }
    
    @IBAction func buttonVoltar(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
