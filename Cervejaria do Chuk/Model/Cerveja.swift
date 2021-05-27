//
//  Cerveja.swift
//  Cervejaria do Chuk
//
//  Created by Kovaltchuk, Fernando Cesar on 17/01/21.
//

import UIKit

class Cerveja: NSObject {
    
    // MARK: - Atributos
    
    let nome: String
    let slogan: String
    let descricao: String
    let caminhoDaImagem: String
    
    // MARK: - Init
    
    init(nome: String, slogan: String, descricao: String, caminhoDaImagem: String) {
        self.nome = nome
        self.slogan = slogan
        self.descricao = descricao
        self.caminhoDaImagem = caminhoDaImagem
    }

}
    
