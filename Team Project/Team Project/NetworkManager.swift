import Foundation
import Alamofire

enum RequestError: Error {
    case ErrorRequest
}

final class NetworkManager {
    
    // MARK: - SINGLETON NETWORK MANAGER:
    static let instance = NetworkManager()
    
    private init() {}
    
    enum Constanse {
        static let coinBaseURL = "https://rest.coinapi.io/v1"
    }
    
    enum CoinEndPoint {
        static let assets = "/assets"
    }
    
    // MARK: - API KEY:
    
    let header: HTTPHeaders = [
        "X-CoinAPI-Key": "42EB1E49-A8DA-44FF-90DB-FAB9D31A9A1F",
        "Accept": "application/json"
    ]
    
    // MARK: - NETWORK REQUEST:
    
    func getAssets(completion: @escaping(Result<[ModelCoin], RequestError>) -> Void) {
        AF.request(Constanse.coinBaseURL + CoinEndPoint.assets, headers: header).responseDecodable(of: [ModelCoin].self) { response in
            switch response.result {
            case .success(let coin):
                completion(.success(coin))
            case .failure:
                if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                    print("Response data: \(utf8Text)")
                }
                completion(.failure(.ErrorRequest))
            }
        }
    }
}
