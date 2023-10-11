//
//  CommandProtocol.swift
//  knowgit Watch App
//
//  Created by Jose Manuel Ortiz Sanchez on 11/10/23.
//

import Foundation

protocol CommandProtocol: Identifiable, Hashable {
    var command: [String] { get }
    var description: String { get }
}
