//
//  FormAddressViewController.swift
//  busca-cep
//
//  Created by Rayana Prata Neves on 17/11/21.
//

import UIKit

class FormAddressViewController: UIViewController {

    // MARK: Properties
    private let addressModel: AddressModel
    
    // MARK: Outlets
    @IBOutlet weak var textFieldCEP: UITextField!
    @IBOutlet weak var textFieldLogradouro: UITextField!
    @IBOutlet weak var textFieldNumber: UITextField!
    @IBOutlet weak var textFieldNeighborhood: UITextField!
    @IBOutlet weak var textFieldCity: UITextField!
    @IBOutlet weak var textFieldUF: UITextField!
    @IBOutlet weak var textFieldComplement: UITextField!
    
    // MARK: Initialization
    init(addressModel: AddressModel) {
        self.addressModel = addressModel
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
    @IBAction func handlerButtonGenerateTag(_ sender: Any) {
    }
    
    // MARK: Methods
    private func setupUI() {
        textFieldCEP.text = addressModel.cep
        textFieldLogradouro.text = addressModel.logradouro
        textFieldNeighborhood.text = addressModel.bairro
        textFieldCity.text = addressModel.localidade
        textFieldUF.text = addressModel.uf
        textFieldComplement.text = addressModel.complemento
        
    }

}
