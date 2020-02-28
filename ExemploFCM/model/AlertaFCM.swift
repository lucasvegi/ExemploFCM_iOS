//
//  AlertaFCM.swift
//  ExemploFCM
//
//  Created by Lucas Vegi on 28/02/20.
//  Copyright © 2020 Lucas Vegi. All rights reserved.
//

import Foundation

struct AlertaFCM: Codable {
    var body: String!
    var title: String!
    
    // MAPEAMENTO VARIAVEL/CHAVE
    enum CodingKeys: String, CodingKey {
        // case <variavel> = "<chave do JSON>"
        case body = "body"
        case title = "title"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.body = try values.decode(String.self, forKey: .body)
        self.title = try values.decode(String.self, forKey: .title)
        
    }
    
}
