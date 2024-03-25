struct ModelCoin: Codable {
    let name: String?
    let priceUsd: Double?
    
    enum CodingKeys: String, CodingKey {
        case name
        case priceUsd = "price_usd"
    }
    
}

