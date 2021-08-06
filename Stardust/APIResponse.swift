//
//  APIResponse.swift
//  APIResponse
//
//  Created by Ally Rilling on 7/30/21.
//

import Foundation

struct APIResponse: Decodable {
    var results: TimeData
    var status: String
}

