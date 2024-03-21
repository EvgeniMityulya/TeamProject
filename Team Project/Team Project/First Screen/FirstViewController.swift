import SwiftUI

struct FirstViewController: View {
    
    let items = (1...20).map { "Item \($0)" }
    
    var body: some View {
        VStack {
            HStack {
                Text("Users")
                    .font(.title2)
                    .padding(.horizontal)
                    .padding(.top , -30)
                    .onTapGesture {
                        print("Item tapped")
                    }
                Spacer()
                Button(action: { print("Hello")}) {
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 20 , height: 20)
                        .padding(.horizontal)
                        .padding(.top , -27)
                }
            }
            .foregroundColor(.white)
            .padding(.top , 50)
            .padding(.horizontal)
            
            ScrollView {
                LazyVGrid(columns: [GridItem(), GridItem()], spacing: 25) {
                    ForEach(items, id: \.self) { item in
                        ZStack {
                            RoundedRectangle(cornerRadius: 30)
                                .frame(width: 150, height: 200)
                                .foregroundColor(.white)
                                .onTapGesture {
                                    print("Item \(item) tapped")
                                }
                            VStack {
                                Image("test")
                                    .resizable()
                                    .frame(width: 60, height: 60)
                                    .clipShape(Circle())
                                    .foregroundColor(.white)
                                Text("Tom Holland")
                                    .font(.system(size: 15)).bold()
                                HStack {
                                    Text("France")
                                        .font(.system(size: 12))
                                        .foregroundColor(.gray)
                                    Text("🏳️‍🌈")
                                        .padding(.leading , -8)
                                }
                                .padding(.bottom , 10)
                                HStack {
                                    Circle()
                                        .frame(width: 30 , height: 30)
                                        .foregroundColor(Color("Background"))
                                        .overlay(
                                            Image(systemName: "cat")
                                                .resizable()
                                                .frame(width: 15 , height: 15)
                                        )
                                        .padding(.leading , 5)
                                    Text("Barbos")
                                        .font(.system(size: 14).bold())
                                        .foregroundColor(.black)
                                        .padding(.trailing , 5)
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal , 20)
                .padding(.top , 15)
            }
            .background(Color("Background").edgesIgnoringSafeArea(.all))
        }
        .background(Color("Background").edgesIgnoringSafeArea(.all))
        .navigationBarHidden(true)
    }
}

#Preview {
    FirstViewController()
}
