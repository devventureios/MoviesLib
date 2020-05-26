//
//  AppDelegate.swift
//  MoviesLib
//
//  Created by Eric Alves Brito on 20/05/20.
//  Copyright © 2020 DevVenture. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
//        let standard = UINavigationBarAppearance()
//        standard.configureWithTransparentBackground()
//        UINavigationBar.appearance().standardAppearance = standard
        
        //UINavigationBar.appearance().backgroundColor = .clear
        
        return true
    }
    
    //MARK: CoreData Stack
    //Managed Object Model: Descreve o schema que será utilizado na persistência dos seus dados
    //Persistent Store Coordinator: Gerencia o Persistent Store, que é o objeto que nos dá acesso ao banco de dados (SQLite por padrão)
    //Managed Object Context: É uma área de trabalho em memória utilizada para manipular os dados que serão persistidos na Persistent Store
    //Persistent Container: Objeto que gerencia todos os demais do CoreData Stack

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "MoviesLib")
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error {
                fatalError("Erro ao carregar a Store: \(error.localizedDescription)")
            }
        }
        return container
    }()
    
    
}

