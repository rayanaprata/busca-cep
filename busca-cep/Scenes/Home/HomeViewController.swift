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
    }
    
    // MARK: Methods
    private func setupUI() {
        
    }

}
