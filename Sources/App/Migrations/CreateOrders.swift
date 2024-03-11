//
//  File.swift
//  
//
//  Created by Kiss Roland on 11/03/2024.
//

import Fluent

struct CreateOrders: Migration{
    func prepare(on database: FluentKit.Database) -> EventLoopFuture<Void> {
        return database.schema("orders")
            .id()
            .field("name",.string,.required)
            .field("size",.string, .required)
            .field("coffeeName",.string,.required)
            .field("total", .double, .required)
            .create()
    }
    
    func revert(on database: FluentKit.Database) -> EventLoopFuture<Void> {
        return database.schema("orders").delete()
    }
    
    
    
}
