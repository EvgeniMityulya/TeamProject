import Foundation

struct ModelCoin: Codable, Identifiable {
    var id = UUID()
    let name: String?
    let priceUsd: Double?
    
    enum CodingKeys: String, CodingKey {
        case name
        case priceUsd = "price_usd"
    }
    
}

