//
//  PageMetadata++.swift
//  Server
//
//  Created by Zaid Rahhawi on 15/09/2024.
//

import Vapor
import Fluent

public extension HTTPHeaders.Name {
    static let totalCount: HTTPHeaders.Name = "X-Total-Count"
    static let totalPages: HTTPHeaders.Name = "X-Total-Pages"
    static let recordsPerPage: HTTPHeaders.Name = "X-Limit"
    static let currentPage: HTTPHeaders.Name = "X-Page"
}

public extension PageMetadata {
    var headers: HTTPHeaders {
        let headersDictionary: [HTTPHeaders.Name : Int] = [
            .totalCount : total,
            .totalPages : pageCount,
            .recordsPerPage : per,
            .currentPage : page
        ]
        
        return headersDictionary.reduce(into: HTTPHeaders()) { headers, element in
            headers.add(name: element.key, value: String(element.value))
        }
    }
}
