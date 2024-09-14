//
//  Page.swift
//  Server
//
//  Created by Zaid Rahhawi on 15/09/2024.
//

import Vapor
import Fluent

public struct Page<Item>: ResponseEncodable, AsyncResponseEncodable where Item: Content {
    public let items: [Item]
    public let metadata: PageMetadata
    
    public init(items: [Item], metadata: PageMetadata) {
        self.items = items
        self.metadata = metadata
    }
    
    public func encodeResponse(for request: Request) -> EventLoopFuture<Response> {
        items.encodeResponse(status: .ok, headers: metadata.headers, for: request)
    }
    
    public func encodeResponse(for request: Request) async throws -> Response {
        try await items.encodeResponse(status: .ok, headers: metadata.headers, for: request)
    }
}
