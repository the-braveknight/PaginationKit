//
//  QueryBuilder+Pagination.swift
//  Server
//
//  Created by Zaid Rahhawi on 15/09/2024.
//

import Vapor
import Fluent

public extension QueryBuilder where Model : Content {
    func paginate(request: Request) async throws -> Page<Model> {
        let page = try await paginate(for: request)
        return Page(items: page.items, metadata: page.metadata)
    }
}
