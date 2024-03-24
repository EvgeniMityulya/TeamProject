import SwiftUI

struct AddScreenViewController: View {
    
    // MARK: - PROPERTIES:
    
    @State private var name: String = ""
    @State private var selectedCountryIndex = 0
    @State private var selectedCurrencyIndex = 0
    @State private var image: UIImage?
    @State private var currency: String = ""
    @State private var country: String = ""
    @State private var isNameEmpty = false
    @State private var isCountryEmpty = false
    @State private var isCurrencyEmpty = false
    @State private var isImageEmpty = false
    @Environment(\.presentationMode) var presentationMode
    
    let presenter = AddScreenPresenter()
    
    //MARK: VIEW
    var body: some View {
    //MARK: - BACKGROUND
        ZStack {
            Color("backgroudTableView").edgesIgnoringSafeArea(.all)
            
    //MARK: COMPONENTS
            VStack {
                Spacer()
                
                //IMAGE CIRCLE
                ZStack {
                    if let selectedImage = image {
                            Image(uiImage: selectedImage)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                    } else {
                        Circle()
                            .frame(width: 100,height: 100)
                            .foregroundColor(Color(UIColor(named: "backgroudCell") ?? .black))
                            .onTapGesture {
                                presenter.editButtonTapped()
                            }
                        Image(systemName: "person")
                            .resizable()
                            .frame(width: 50 , height: 50)
                            .foregroundColor(Color(UIColor.systemGray))
                            .opacity(0.6)
                    }
                }
                .padding(.bottom , 30)
                
                //USERNAME TEXTFIELD
                TextField("Enter username...", text: $name , onEditingChanged: { editing in
                })
                    .padding()
                    .foregroundColor(.black)
                    .background(Color(UIColor(named: "backgroudCell") ?? .black))
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .padding(.bottom , 4)
                
                //IMAGE TEXTFIELD
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: 55)
                        .padding(.horizontal)
                        .foregroundColor(Color(UIColor(named: "backgroudCell") ?? .black))
                    HStack {
                        if let selectedImage = image {
                            Text("Image Selected")
                                .padding(.leading, 30)
                                .foregroundColor(Color(UIColor.systemGray))
                                .opacity(0.6)
                        } else {
                            Text("Select your image:")
                                .padding(.leading, 30)
                                .foregroundColor(Color(UIColor.systemGray))
                                .opacity(0.6)
                        }
                        Spacer()
                        Button(action: { presenter.editButtonTapped() }, label: {
                            Text("Edit...")
                                .foregroundColor(Color(UIColor(named: "colorName") ?? .blue))
                                .font(Font.custom("Inter", size: 16))
                        })
                        .padding(.trailing , 30)
                    }
                }
                
                //COUNTRY TEXTFIELD
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: 55)
                        .padding(.horizontal)
                        .foregroundColor(Color(UIColor(named: "backgroudCell") ?? .black))
                    HStack {
                        Text("Choose your country:")
                            .padding(.leading, 30)
                            .foregroundColor(Color(UIColor.systemGray))
                            .opacity(0.6)
                        Spacer()
                        Picker(selection: $selectedCountryIndex, label: Text("")) {
                            ForEach(0..<countries.count) { index in
                                Text(countries[index]).tag(index)
                                    .font(Font.custom("Inter", size: 16))
                            }
                        }
                        .onChange(of: selectedCountryIndex) { index in
                            country = countries[index]
                        }
                        .accentColor(Color(UIColor(named: "colorName") ?? .blue))
                        .padding(.trailing )
                        .pickerStyle(MenuPickerStyle())
                    }
                }
                
                //CRYPTO TEXTFIELD
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: 55)
                        .padding(.horizontal)
                        .foregroundColor(Color(UIColor(named: "backgroudCell") ?? .black))
                    HStack {
                        Text("Your favourite crypto:")
                            .padding(.leading, 30)
                            .foregroundColor(Color(UIColor.systemGray))
                            .opacity(0.6)
                        Spacer()
                        Picker(selection: $selectedCurrencyIndex, label: Text("")) {
                            ForEach(0..<cryptoCurrencies.count) { index in
                                Text(cryptoCurrencies[index]).tag(index)
                                    .font(Font.custom("Inter", size: 16))
                            }
                        }
                        .onChange(of: selectedCurrencyIndex) { index in
                            currency = cryptoCurrencies[index]
                        }
                        .accentColor(Color(UIColor(named: "colorName") ?? .blue))
                        .padding(.trailing )
                        .pickerStyle(MenuPickerStyle())
                    }
                }
                
                //SAVE BUTTON
                Button(action: {
                    if name.isEmpty || country.isEmpty || currency.isEmpty || image == nil {
                        isNameEmpty = name.isEmpty
                        isCountryEmpty = country.isEmpty
                        isCurrencyEmpty = currency.isEmpty
                        isImageEmpty = image == nil
                    } else {
                        switch CoreDataManager.instance.saveUser(name: name, country: country, currency: currency, image: image!) {
                        case .success:
                            print("Success")
                            presentationMode.wrappedValue.dismiss()
                        case .failure(let error):
                            print(error)
                        }
                    }
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 100,height: 50)
                            .foregroundColor(Color(UIColor(named: "colorName") ?? .black))
                        Text("Save")
                            .foregroundColor(Color(UIColor(named: "backgroudCell") ?? .black))
                    }
                })
                .padding(.top , 30)
                if isNameEmpty || isCountryEmpty || isCurrencyEmpty || isImageEmpty {
                    Text("Complete all fields!")
                        .foregroundColor(.red)
                }
                Spacer()
            }
            Spacer()
        }
        .onAppear {
            presenter.didSelectImage = { selectedImage in
                image = selectedImage
            }
        }
    }
}
#Preview {
    AddScreenViewController()
}
