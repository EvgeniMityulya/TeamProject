import SwiftUI

struct ThirdView: View {
    var body: some View {
        VStack {
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
            List {
                HStack {
                    Text("Efirium")
                    Spacer()
                    Text("50000 $")
                }
                .listRowBackground(Color("backgroudTableView"))
                HStack {
                    Text("Efirium")
                    Spacer()
                    Text("50000 $")
                }
                .listRowBackground(Color("backgroudTableView"))
                HStack {
                    Text("Efirium")
                    Spacer()
                    Text("50000 $")
                }
                .listRowBackground(Color("backgroudTableView"))
                HStack {
                    Text("Efirium")
                    Spacer()
                    Text("50000 $")
                }
                .listRowBackground(Color("backgroudTableView"))
            }
            .listStyle(PlainListStyle())
            .background(Color("backgroudTableView"))
        }
        .background(Color("backgroudTableView").edgesIgnoringSafeArea(.all))
    }
}


#Preview {
    ThirdView()
}
