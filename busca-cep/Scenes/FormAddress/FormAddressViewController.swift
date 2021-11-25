//
//  FormAddressViewController.swift
//  busca-cep
//
//  Created by Rayana Prata Neves on 17/11/21.
//

import UIKit

class FormAddressViewController: UIViewController {

    // MARK: Properties
    private var addressModel: AddressModel
    
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
        
        if let number = textFieldNumber.text, number.count > 0 {
            addressModel.number = number
            addressModel.complemento = textFieldComplement.text ?? ""
            let viewController = AddressViewController(addressTag: getAddressTag())
            navigationController?.pushViewController(viewController, animated: true)
        } else {
            let alert = UIAlertController(title: "Alerta", message: "O campo número é obrigatório", preferredStyle: .alert)
            let actionOk = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(actionOk)
            present(alert, animated: true, completion: nil)
        }

    }
    
    // MARK: Methods
    private func setupUI() {
        textFieldCEP.text = addressModel.cep
        textFieldLogradouro.text = addressModel.logradouro
        textFieldNeighborhood.text = addressModel.bairro
        textFieldCity.text = addressModel.localidade
        textFieldUF.text = addressModel.uf
        textFieldComplement.text = addressModel.complemento
        
        // verifica se já existe algum complemento
        let isEnableComplement = addressModel.complemento.count == 0
        textFieldComplement.isEnabled = isEnableComplement
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapViewMain))
        view.addGestureRecognizer(tap)
    }

    @objc func tapViewMain() {
        view.endEditing(true)
    }
    
    private func getAddressTag() -> String {
        let number = addressModel.number ?? ""
        
        return """
            Destinatário:
            \(addressModel.logradouro), \(number)
            \(addressModel.bairro),
            \(addressModel.localidade)-\(addressModel.uf)
            CEP: \(addressModel.cep)
            \(addressModel.complemento)
        """
    }
    
}
