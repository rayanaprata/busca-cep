//
//  AddressViewController.swift
//  busca-cep
//
//  Created by Rayana Prata Neves on 24/11/21.
//

import UIKit

class AddressViewController: UIViewController {

    // MARK: Properties
    private let addressTag: String
    
    // MARK: Outlets
    @IBOutlet weak var labelAddressTag: UILabel!
    
    // MARK: Initialization
    init(addressTag: String) {
        self.addressTag = addressTag
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
    @IBAction func handlerButtonStart(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    // MARK: Methods
    private func setupUI() {
        labelAddressTag.text = addressTag
    }
    


}
