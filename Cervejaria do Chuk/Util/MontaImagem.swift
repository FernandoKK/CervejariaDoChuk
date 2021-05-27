//
//  MontaImagem.swift
//  Cervejaria do Chuk
//
//  Created by Kovaltchuk, Fernando Cesar on 21/01/21.
//

import UIKit

class MontaImagem: NSObject {
    
    let caminhoDaImagem: String
    
    init(caminhoDaImagem: String) {
        self.caminhoDaImagem = caminhoDaImagem
    }
    
    // MARK: - Metodos
    
    func montaImagem() -> UIImage {
        
        //pega a imagem
        let imagePath = self.caminhoDaImagem
        //Criar a URL
        let urlImage = URL(string: imagePath)
        //Fazer o download dos bytes da imagem
        let bytes = try? Data(contentsOf: urlImage!)
        //Criar a imagem a partir dos bytes lidos
        let image = UIImage(data: bytes!)!
        
        return image
    }
}
