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
                Text("50000 $")
                Image("test")
                    .resizable()
                    .frame(width: 100, height: 150)
                HStack {
                    Spacer()
                    VStack {
                        Text("Bitcoin")
                        Text("50000 $")
                        Image("test")
                            .resizable()
                            .frame(width: 100, height: 150)
                    }
                    Spacer()
                    VStack {
                        Text("Bitcoin")
                        Text("50000 $")
                        Image("test")
                            .resizable()
                            .frame(width: 100, height: 150)
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
                HStack {
                    Text("Efirium")
                    Spacer()
                    Text("50000 $")
                }
                HStack {
                    Text("Efirium")
                    Spacer()
                    Text("50000 $")
                }
                HStack {
                    Text("Efirium")
                    Spacer()
                    Text("50000 $")
                }
            }
        }
        .background(Color("Background").edgesIgnoringSafeArea(.all))
    }
}












#Preview {
    ThirdView()
}
