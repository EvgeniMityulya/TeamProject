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
                    Text("TOP 10")
                        .bold()
                        .font(.largeTitle)
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
                if #available(iOS 16.0, *) {
                    Text("Bitcoin")
                        .foregroundStyle(.black)
                        .font(Font.custom("Inter", size: 23))
                } else {
                    Text("Bitcoin")
                        .foregroundColor(.black)
                        .font(Font.custom("Inter", size: 23))
                }
                if #available(iOS 16.0, *) {
                    Text("50000 $")
                        .foregroundStyle(.black)
                        .font(Font.custom("Inter", size: 18))
                } else {
                    Text("50000 $")
                    .foregroundColor(.black)
                    .font(Font.custom("Inter", size: 18))
                }
                if #available(iOS 16.0, *) {
                    Image(systemName: "medal.fill")
                        .resizable()
                        .shadow(radius: 10)
                        .foregroundStyle(Color("medalGold"))
                        .scaledToFill()
                        .frame(width: 80, height: 80)
                        .padding()
                    VStack {
                        Text("\(coinArray[0].name ?? "")")
                            .font(Font.custom("Inter", size: 23))
                        Text("\(coinArray[0].priceUsd?.description ?? "")")
                            .font(Font.custom("Inter", size: 18))
                            + Text("$")
                            .bold()
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
                                Text("\(coinArray[1].name ?? "")")
                                    .font(Font.custom("Inter", size: 23))
                                Text("\(coinArray[1].priceUsd?.description ?? "")")
                                    .font(Font.custom("Inter", size: 18))
                                    + Text("$")
                                    .bold()
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
                                Text("\(coinArray[2].name ?? "")")
                                    .font(Font.custom("Inter", size: 23))
                                Text("\(coinArray[2].priceUsd?.description ?? "")")
                                    .font(Font.custom("Inter", size: 18))
                                    + Text("$")
                                    .bold()
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
                                Text(coin.name ?? "")
                                Spacer()
                                Text(String(coin.priceUsd?.description ?? ""))
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
                        if #available(iOS 16.0, *) {
                            Text("Bitcoin")
                                .foregroundStyle(.black)
                                .font(Font.custom("Inter", size: 23))
                        } else {
                            Text("Bitcoin")
                                .foregroundColor(.black)
                                .font(Font.custom("Inter", size: 23))
                        }
                        if #available(iOS 16.0, *) {
                            Text("50000 $")
                                .foregroundStyle(.black)
                                .font(Font.custom("Inter", size: 18))
                        } else {
                            Text("50000 $")
                                .foregroundColor(.black)
                                .font(Font.custom("Inter", size: 18))
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
                        if #available(iOS 16.0, *) {
                            Text("Bitcoin")
                                .foregroundStyle(.black)
                                .font(Font.custom("Inter", size: 23))
                        } else {
                            Text("Bitcoin")
                                .foregroundColor(.black)
                                .font(Font.custom("Inter", size: 23))
                        }
                        if #available(iOS 16.0, *) {
                            Text("50000 $")
                                .foregroundStyle(.black)
                                .font(Font.custom("Inter", size: 18))
                        } else {
                            Text("50000 $")
                                .foregroundColor(.black)
                                .font(Font.custom("Inter", size: 18))
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
