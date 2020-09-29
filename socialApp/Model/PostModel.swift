//
//  PostModel.swift
//  socialApp
//
//  Created by Gerard Mata Carrera on 29/09/2020.
//

import SwiftUI

struct PostModel: Identifiable {
    var id: String
    var title: String
    var pic: String
    var time: Date
    var user: UserModel
}
