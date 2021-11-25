//
//  HomeViewModel.swift
//  busca-cep
//
//  Created by Rayana Prata Neves on 25/11/21.
//

import Foundation

class HomeViewModel {
    
    var didSuccess: ((AddressModel) -> Void)?
    
    // MARK: Methods
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
                self.didSuccess?(model)
            } catch {
                print("deu erro no parse do modelo!")
            }
            
        }
        
        task.resume()
    }
    
}
