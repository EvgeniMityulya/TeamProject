import SwiftUI

struct ThirdView: View {
    var body: some View {
        VStack {
            Text("TOP 10")
                .bold()
                .font(.largeTitle)
                .padding()
            VStack {
                Text("Bitcoin")
                    .font(Font.custom("Inter", size: 23))
                Text("50000 $")
                    .font(Font.custom("Inter", size: 18))
                if #available(iOS 15.0, *) {
                    Image(systemName: "medal.fill")
                        .resizable()
                        .shadow(radius: 10)
                        .foregroundStyle(Color("medalGold"))
                        .scaledToFill()
                        .frame(width: 80, height: 80)
                        .padding()
                } else {
                    Image(systemName: "medal.fill")
                        .resizable()
                        .foregroundColor(.yellow)
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .padding()
                }
                HStack {
                    Spacer()
                    VStack {
                        Text("Bitcoin")
                            .font(Font.custom("Inter", size: 23))
                        Text("50000 $")
                            .font(Font.custom("Inter", size: 18))
                        if #available(iOS 15.0, *) {
                            Image(systemName: "medal.fill")
                                .resizable()
                                .shadow(radius: 10)
                                .foregroundStyle(Color("medalSilver"))
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .padding()
                        } else {
                            Image(systemName: "medal.fill")
                                .resizable()
                                .foregroundColor(.yellow)
                                .scaledToFill()
                                .frame(width: 80, height: 80)
                                .padding()
                        }
                    }
                    Spacer()
                    VStack {
                        Text("Bitcoin")
                            .font(Font.custom("Inter", size: 23))
                        Text("50000 $")
                            .font(Font.custom("Inter", size: 18))
                        if #available(iOS 15.0, *) {
                            Image(systemName: "medal.fill")
                                .resizable()
                                .shadow(radius: 10)
                                .foregroundStyle(Color("medalBronza"))
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .padding()
                        } else {
                            Image(systemName: "medal.fill")
                                .resizable()
                                .foregroundColor(.yellow)
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
