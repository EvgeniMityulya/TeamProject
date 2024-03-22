import SwiftUI

struct FirstViewController: View {
    
    // MARK: - PROPERTIES
    @State private var users: [User] = []
    
    //MARK: - VIEW
    var body: some View {
        NavigationView {
            
            //CUSTOM NAVIGATION BAR
            VStack {
                HStack {
                    Text("Users")
                        .font(Font.custom("Inter", size: 22))
                        .padding(.horizontal)
                        .padding(.top , -25)
                        .foregroundColor(Color("colorName"))
                        .onTapGesture {
                            print("Users tapped")
                        }
                    Spacer()
                    NavigationLink(destination: AddScreenViewController()) {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 20 , height: 20)
                            .foregroundColor(Color("colorName"))
                            .padding(.horizontal)
                            .padding(.top , -18)
                    }
                }
                .foregroundColor(.white)
                .padding(.top , 50)
                .padding(.horizontal)
                
                //LIST (TABLEVIEW)
                ScrollView {
                    LazyVGrid(columns: [GridItem(), GridItem()], spacing: 25) {
                        ForEach(users, id: \.self) { user in
                            ZStack {
                                RoundedRectangle(cornerRadius: 30)
                                    .frame(width: 150, height: 200)
                                    .foregroundColor(Color("backgroudCell"))
                                    .onTapGesture {
                                        print("Item \(user) tapped")
                                    }
                                VStack {
                                    
                                    //IMAGE
                                    if let imageData = user.image, let uiImage = UIImage(data: imageData) {
                                        Image(uiImage: uiImage)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 60, height: 60)
                                            .clipShape(Circle())
                                            .padding(.bottom, 10)
                                    } else {
                                        Image(systemName: "person")
                                            .resizable()
                                            .frame(width: 60, height: 60)
                                            .clipShape(Circle())
                                            .padding(.bottom, 10)
                                    }
                                    
                                    //NAME
                                    Text(user.name ?? "")
                                        .font(Font.custom("Inter", size: 15))
                                        .foregroundColor(Color("colorName"))
                                    
                                    //COUNTRY
                                    Text(user.country ?? "")
                                        .font(Font.custom("Inter", size: 12))
                                        .foregroundColor(.gray)
                                        .padding(.bottom , 10)
                                    
                                    //CRYPTO
                                    HStack {
                                        Circle()
                                            .frame(width: 30 , height: 30)
                                            .foregroundColor(Color("backgroudTableView"))
                                            .overlay(
                                                Image(uiImage: UIImage(named: cryptocurrencyIcons[user.currency ?? ""] ?? "questionmark") ?? UIImage())
                                                    .resizable()
                                                    .scaledToFill()
                                                    .frame(width: 25 , height: 25)
                                            )
                                            .padding(.leading , 5)
                                        Text(user.currency ?? "")
                                            .font(Font.custom("Inter", size: 14))
                                            .foregroundColor(Color("colorName"))
                                            .padding(.trailing , 5)
                                    }
                                }
                            }
                        }
                    }
                    .padding(.horizontal , 20)
                    .padding(.top , 15)
                }
                .background(Color("backgroudTableView").edgesIgnoringSafeArea(.all))
            }
            .background(Color("backgroudTableView").edgesIgnoringSafeArea(.all))
            .navigationBarHidden(true)
            .onAppear {
                if case let .success(users) = CoreDataManager.instance.getUsers() {
                    self.users = users
                }
            }
        }
    }
}

#Preview {
    FirstViewController()
}
