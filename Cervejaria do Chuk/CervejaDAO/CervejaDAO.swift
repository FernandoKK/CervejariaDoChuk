//  CervejaDAO.swift
//  Cervejaria do Chuk
//
//  Created by Kovaltchuk, Fernando Cesar on 18/01/21.
//

import UIKit
import Alamofire
import SwiftyJSON

class CervejaDAO: NSObject {
    
    var listaCerveja:Array<Cerveja> = []
    
    func retornaTodasAsCervejas(controller: PesquisarViewController) {
        
        let url = "https://api.punkapi.com/v2/beers"
        var bytesImagem: Data?
                
        AF.request(url).responseJSON { [self] (response) in
            switch response.result {
            case .success(let value):
             
             let json = JSON(value)
                
             for i in 0...24 //retorna por default do serviço 25 ocorrências
             {
                let cerveja = Cerveja(nome: json[i]["name"].string!, slogan: json[i]["tagline"].string!, descricao: json[i]["description"].string! , caminhoDaImagem: json[i]["image_url"].string!)
                self.listaCerveja.append(cerveja)
             }
             
             DispatchQueue.main.async {
                 controller.updateCervejas()
             }
                
            case .failure(let error):
                print("Erro!!!")
                print(error)
            }
            
        }
             
    }
    
}
