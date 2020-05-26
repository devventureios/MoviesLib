//
//  UIViewController+Context.swift
//  MoviesLib
//
//  Created by Eric Alves Brito on 25/05/20.
//  Copyright © 2020 DevVenture. All rights reserved.
//

import UIKit
import CoreData

extension UIViewController {
    var context: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
}
