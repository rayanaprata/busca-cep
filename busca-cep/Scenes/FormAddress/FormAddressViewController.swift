//
//  FormAddressViewController.swift
//  busca-cep
//
//  Created by Rayana Prata Neves on 17/11/21.
//

import UIKit

class FormAddressViewController: UIViewController {

    // MARK: Properties
    
    // MARK: Outlets
    
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
    
    // MARK: Methods
    private func setupUI() {
        
    }

}
