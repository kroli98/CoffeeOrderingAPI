
import Fluent
import Vapor

final class Order: Model, Content{
    
    static let schema = "orders"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "name")
    var name: String
    
    @Field(key: "size")
    var size: String
    
    @Field(key: "coffeeName")
    var coffeeName: String
    
    @Field(key: "total")
    var total: Double
    
    init() {
        
    }
    init(id: UUID? = nil, name: String, size: String, coffeeName: String, total: Double) {
        self.id = id
        self.name = name
        self.size = size
        self.coffeeName = coffeeName
        self.total = total
    }

}
