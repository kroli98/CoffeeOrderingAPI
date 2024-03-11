

import Fluent
import Vapor

struct OrderController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let orders = routes.grouped("orders")
        orders.get(use: index)
        orders.post(use: create)
    }
    
    func index(req: Request) throws -> EventLoopFuture<[Order]> {
        return Order.query(on: req.db).all()
    }
    
    func create(req: Request) throws -> EventLoopFuture<HTTPStatus>
    {
        let order = try req.content.decode(Order.self)
        return order.save(on: req.db).transform(to: .ok)
    }
}
