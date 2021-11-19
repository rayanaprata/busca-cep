//
//  HomeViewController.swift
//  busca-cep
//
//  Created by Rayana Prata Neves on 23/09/21.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: Properties
    
    // MARK: Outlets
    @IBOutlet weak var textFieldCEP: UITextField!
    
    // MARK: Initialization
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // MARK: Actions
    @IBAction func handlerButtonSearch(_ sender: Any) {
        if let textCep = textFieldCEP.text, textCep.count == 8 {
            print(textCep)
            findAddressFrom(cep: textCep)
        } else {
            // TODO: Exibir alert informando que o cep é inválido
        }
    }
    
    
//    https://viacep.com.br/ws/89040115/json/
    
    // MARK: Methods
    private func setupUI() {
        
    }
    
    func findAddressFrom(cep: String) {
        
        let urlString = "https://viacep.com.br/ws/\(cep)/json/"
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            // error vai conter o tipo de erro da requisicao
            // response vai conter infos a respeito da requisicao como cabecalho, statusCode
            // o data vai conter o payload de retorno
            
            guard let data = data else { return }
            
            do {
                let model = try JSONDecoder().decode(AddressModel.self, from: data)
                DispatchQueue.main.async {
                    self.openFormAddress(model: model)
                }
            } catch {
                print("deu erro no parse do modelo!")
            }
            
        }
        
        task.resume()
    }
    
    private func openFormAddress(model: AddressModel) {
        let viewController = FormAddressViewController(addressModel: model)
        navigationController?.pushViewController(viewController, animated: true)
    }

}
