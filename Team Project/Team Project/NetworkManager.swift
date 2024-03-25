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
        "X-CoinAPI-Key": "E8C8042C-DA07-4794-9474-190969493BB3",
        "Accept": "application/json"
    ]
    
    // MARK: - NETWORK REQUEST:
    
    func getAssets(completion: @escaping(Result<[ModelCoin], RequestError>) -> Void) {
        AF.request(Constanse.coinBaseURL + CoinEndPoint.assets, headers: header).responseDecodable(of: [ModelCoin].self) { response in
            switch response.result {
            case .success(let coin):
                completion(.success(coin))
            case .failure:
                completion(.failure(.ErrorRequest))
            }
        }
    }
}
