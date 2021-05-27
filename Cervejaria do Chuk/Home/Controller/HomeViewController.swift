//
//  HomeViewController.swift
//  Cervejaria do Chuk
//
//  Created by Kovaltchuk, Fernando Cesar on 17/01/21.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func buttonPesquisar(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard?.instantiateViewController(withIdentifier: "PesquisarViewController") as! PesquisarViewController
        self.present(controller, animated: true, completion: nil)
    
    }
}
