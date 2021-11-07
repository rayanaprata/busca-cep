//
//  AddressModel.swift
//  busca-cep
//
//  Created by Rayana Prata Neves on 24/10/21.
//

import Foundation

struct AddressModel: Decodable {
    let cep: String
    let logradour: String
    let bairro: String
    let localidade: String
    let uf: String
    let complemento: String
}
