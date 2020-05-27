//
//  CategoriesTableViewController.swift
//  MoviesLib
//
//  Created by Eric Alves Brito on 26/05/20.
//  Copyright © 2020 DevVenture. All rights reserved.
//

import UIKit
import CoreData

protocol CategoriesDelegate: class {
    func setSelectedCategories(_ categories: Set<Category>)
}

class CategoriesTableViewController: UITableViewController {
    
    // MARK: - IBOutlets
    
    // MARK: - Properties
    var categories: [Category] = []
    var selectedCategories: Set<Category> = [] {
        didSet {
            delegate?.setSelectedCategories(selectedCategories)
        }
    }
    weak var delegate: CategoriesDelegate?
    
    // MARK: - Super Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCategories()
    }
    
    // MARK: - IBActions
    @IBAction func add(_ sender: UIBarButtonItem) {
        showCategoryAlert()
    }
    
    // MARK: - Methods
    private func showCategoryAlert(for category: Category? = nil) {
        let title = category == nil ? "Adicionar" : "Editar"
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Nome da categoria"
            if let name = category?.name {
                textField.text = name
            }
        }
        let addEditAction = UIAlertAction(title: title, style: .default) { (_) in
            let category = category ?? Category(context: self.context)
            category.name = alert.textFields?.first?.text
            
            do {
                try self.context.save()
                self.loadCategories()
            } catch {
                print(error)
            }
        }
        alert.addAction(addEditAction)
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    
    private func loadCategories() {
        let fetchRequest: NSFetchRequest<Category> = Category.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        do {
            categories = try context.fetch(fetchRequest)
            tableView.reloadData()
        } catch {
            print(error)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let category = categories[indexPath.row]
        cell.textLabel?.text = category.name
        
        if selectedCategories.contains(category) {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Excluir") { (action, indexPath) in
            let category = self.categories[indexPath.row]
            self.context.delete(category)
            try! self.context.save()
            self.categories.remove(at: indexPath.row)
            self.selectedCategories.remove(category)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        let editAction = UITableViewRowAction(style: .default, title: "Editar") { (action, indexPath) in
            let category = self.categories[indexPath.row]
            tableView.setEditing(false, animated: true)
            self.showCategoryAlert(for: category)
        }
        editAction.backgroundColor = .systemBlue
        
        return [editAction, deleteAction]
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = categories[indexPath.row]
        let cell = tableView.cellForRow(at: indexPath)
        
        if cell?.accessoryType == UITableViewCell.AccessoryType.none {
            cell?.accessoryType = .checkmark
            selectedCategories.insert(category)
        } else {
            cell?.accessoryType = .none
            selectedCategories.remove(category)
        }
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
