import SwiftUI

struct ThirdView: View {
    @State private var coinArray: [ModelCoin] = []
    @State private var isLoading: Bool = false
    
    var body: some View {
        VStack {
            if isLoading {
                ProgressView("Loading")
            } else {
                if !coinArray.isEmpty {
                    if #available(iOS 16.0, *) {
                        Text("TOP 10")
                            .foregroundStyle(.black)
                            .bold()
                            .font(.largeTitle)
                            .padding()
                    } else {
                        Text("TOP 10")
                            .foregroundColor(.black)
                            .bold()
                            .font(.largeTitle)
                            .padding()
                    }
                    VStack {
                        if #available(iOS 17.0, *) {
                            Text("\(coinArray[0].name ?? "")")
                                .font(Font.custom("Inter", size: 23))
                                .foregroundStyle(.black)
                            Text("\(coinArray[0].priceUsd?.description ?? "")")
                                .font(Font.custom("Inter", size: 18))
                                .foregroundStyle(.black)
                                .bold()
                            + Text("$")
                                .foregroundStyle(.black)
                                .bold()
                        } else {
                            Text("\(coinArray[0].name ?? "")")
                                .font(Font.custom("Inter", size: 23))
                                .foregroundColor(.black)
                            Text("\(coinArray[0].priceUsd?.description ?? "")")
                                .font(Font.custom("Inter", size: 18))
                                .foregroundColor(.black)
                                .bold()
                            + Text("$")
                                .foregroundColor(.black)
                                .bold()
                        }
                        
                        if #available(iOS 16.0, *) {
                            Image(systemName: "medal.fill")
                                .resizable()
                                .shadow(radius: 10)
                                .foregroundStyle(Color("medalGold"))
                                .scaledToFill()
                                .frame(width: 80, height: 80)
                                .padding()
                        } else {
                            Image(systemName: "rosette")
                                .resizable()
                                .shadow(radius: 10)
                                .foregroundColor(Color("medalGold"))
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .padding()
                        }
                        HStack {
                            Spacer()
                            VStack {
                                if #available(iOS 17.0, *) {
                                    Text("\(coinArray[1].name ?? "")")
                                        .font(Font.custom("Inter", size: 23))
                                        .foregroundStyle(.black)
                                    Text("\(coinArray[1].priceUsd?.description ?? "")")
                                        .font(Font.custom("Inter", size: 18))
                                        .foregroundStyle(.black)
                                        .bold()
                                    + Text("$")
                                        .foregroundStyle(.black)
                                        .bold()
                                } else {
                                    Text("\(coinArray[1].name ?? "")")
                                        .font(Font.custom("Inter", size: 23))
                                        .foregroundColor(.black)
                                    Text("\(coinArray[1].priceUsd?.description ?? "")")
                                        .font(Font.custom("Inter", size: 18))
                                        .foregroundColor(.black)
                                        .bold()
                                    + Text("$")
                                        .foregroundColor(.black)
                                        .bold()
                                }
                                if #available(iOS 16.0, *) {
                                    Image(systemName: "medal.fill")
                                        .resizable()
                                        .shadow(radius: 10)
                                        .foregroundStyle(Color("medalSilver"))
                                        .scaledToFit()
                                        .frame(width: 80, height: 80)
                                        .padding()
                                } else {
                                    Image(systemName: "rosette")
                                        .resizable()
                                        .shadow(radius: 10)
                                        .foregroundColor(Color("medalSilver"))
                                        .scaledToFit()
                                        .frame(width: 80, height: 80)
                                        .padding()
                                }
                            }
                            Spacer()
                            VStack {
                                if #available(iOS 17.0, *) {
                                    Text("\(coinArray[2].name ?? "")")
                                        .font(Font.custom("Inter", size: 23))
                                        .foregroundStyle(.black)
                                    Text("\(coinArray[2].priceUsd?.description ?? "")")
                                        .font(Font.custom("Inter", size: 18))
                                        .foregroundStyle(.black)
                                        .bold()
                                    + Text("$")
                                        .foregroundStyle(.black)
                                        .bold()
                                } else {
                                    Text("\(coinArray[2].name ?? "")")
                                        .font(Font.custom("Inter", size: 23))
                                        .foregroundColor(.black)
                                    Text("\(coinArray[2].priceUsd?.description ?? "")")
                                        .font(Font.custom("Inter", size: 18))
                                        .foregroundColor(.black)
                                        .bold()
                                    + Text("$")
                                        .foregroundColor(.black)
                                        .bold()
                                }
                                if #available(iOS 16.0, *) {
                                    Image(systemName: "medal.fill")
                                        .resizable()
                                        .shadow(radius: 10)
                                        .foregroundStyle(Color("medalBronza"))
                                        .scaledToFit()
                                        .frame(width: 80, height: 80)
                                        .padding()
                                } else {
                                    Image(systemName: "rosette")
                                        .resizable()
                                        .shadow(radius: 10)
                                        .foregroundColor(Color("medalBronza"))
                                        .scaledToFit()
                                        .frame(width: 80, height: 80)
                                        .padding()
                                }
                            }
                            Spacer()
                        }
                    }
                    List {
                        ForEach(coinArray.dropFirst(3).prefix(7), id: \.id) { coin in
                            HStack {
                                if #available(iOS 17.0, *) {
                                    Text(coin.name ?? "")
                                        .foregroundStyle(.black)
                                    Spacer()
                                    Text("\(coin.priceUsd?.description ?? "") $")
                                        .foregroundStyle(.black)
                                } else {
                                    Text(coin.name ?? "")
                                        .foregroundColor(.black)
                                    Spacer()
                                    Text("\(coin.priceUsd?.description ?? "") $")
                                        .foregroundColor(.black)
                                }
                                
                            }
                            .listRowBackground(Color("backgroudTableView"))
                        }
                    }
                    .listStyle(PlainListStyle())
                    .background(Color("backgroudTableView"))
                } else {
                    Color("backgroudTableView").edgesIgnoringSafeArea(.all)
                    ProgressView("Loading")
                    Color("backgroudTableView").edgesIgnoringSafeArea(.all)
                }
            }
        }
        .background(Color("backgroudTableView").edgesIgnoringSafeArea(.all))
        .onAppear {
            isLoading = true
            NetworkManager.instance.getAssets { result in
                switch result {
                case .success(let coin):
                    coinArray.append(contentsOf: coin)
                    coinArray.sort { ($0.priceUsd ?? 0) > ($1.priceUsd ?? 0) }
                    print(coinArray)
                case .failure(let error):
                    print("Error fetching assets: \(error.localizedDescription)")
                }
            }
            isLoading = false
        }
        .onDisappear {
            coinArray.removeAll()
        }
    }
}


#Preview {
    ThirdView()
}
