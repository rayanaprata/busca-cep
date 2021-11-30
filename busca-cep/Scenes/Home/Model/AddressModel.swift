//
//  AddressModel.swift
//  busca-cep
//
//  Created by Rayana Prata Neves on 24/10/21.
//

import Foundation

struct AddressModel: Decodable {
    let cep: String
    let logradouro: String
    let bairro: String
    let localidade: String
    let uf: String
    var complemento: String
    var number: String?
    
    func getAddressFormatted() -> String {
        let number = number ?? ""
        
        return """
            Destinatário:
            \(logradouro), \(number)
            \(bairro),
            \(localidade)-\(uf)
            CEP: \(cep)
            \(complemento)
        """
    }
    
}
