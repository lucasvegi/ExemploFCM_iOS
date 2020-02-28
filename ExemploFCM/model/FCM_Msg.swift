//
//  FCM_Msg.swift
//  ExemploFCM
//
//  Created by Lucas Vegi on 28/02/20.
//  Copyright © 2020 Lucas Vegi. All rights reserved.
//

import Foundation

struct FCM_Msg: Codable {
    var alert: AlertaFCM!
    
    
    // MAPEAMENTO VARIAVEL/CHAVE
    enum CodingKeys: String, CodingKey {
        // case <variavel> = "<chave do JSON>"
        case alert = "alert"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.alert = try values.decode(AlertaFCM.self, forKey: .alert)
    }
}
