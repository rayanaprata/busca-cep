//
//  HomeViewController.swift
//  busca-cep
//
//  Created by Rayana Prata Neves on 23/09/21.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: Properties
    private var viewModel = HomeViewModel()
    
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

    }
    
    // MARK: Actions
    @IBAction func handlerButtonSearch(_ sender: Any) {
        if let textCep = textFieldCEP.text, textCep.count == 8 {
            print(textCep)
            viewModel.findAddressFrom(cep: textCep)
        } else {
            // TODO: Exibir alert informando que o cep é inválido
        }
    }
    
    
//    https://viacep.com.br/ws/89040115/json/
    
    // MARK: Methods
    
    private func bindEvents() {
        
    }
    
    private func openFormAddress(model: AddressModel) {
        DispatchQueue.main.async {
            let viewController = FormAddressViewController(addressModel: model)
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }

}
