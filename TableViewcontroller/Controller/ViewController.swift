//
//  ViewController.swift
//  TableViewcontroller
//
//  Created by undhad kaushik on 06/01/23.
//



import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var arrFoodItems: [FoodItem] = []
    
    var arrMobileItems: [MobileItem] = []
    
    var selectedIndex: Int = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    private func setup(){
        configuretableViewNibRegister()
        loadFoodItems()
    }
    private func configuretableViewNibRegister(){
        tableView.register(UINib(nibName: "FoodItemTableViewCell", bundle: nil), forCellReuseIdentifier: "FoodItemTableViewCell")
        tableView.separatorStyle = .none
        
        
    }
    
    private func loadFoodItems(){
        
        let pitzza: FoodItem = FoodItem(id: 1, name: "Pitzza", price: 240, discountPrice: 50)
        let burgur: FoodItem = FoodItem(id: 2, name: "Burgur", price: 50, discountPrice: 10)
        let dosha: FoodItem = FoodItem(id: 3, name: "Dosha", price: 120, discountPrice: 20)
        let dabeli: FoodItem = FoodItem(id: 4, name: "Dabeli", price: 15, discountPrice: 5)
        let meggi: FoodItem = FoodItem(id: 5, name: "Meggi", price: 30, discountPrice: 5)
        let pasta: FoodItem = FoodItem(id: 6, name: "Pasta", price: 25, discountPrice: 7)
       
       arrFoodItems = [pitzza,burgur,dosha,dabeli,meggi,pasta,pitzza,burgur,dosha,dabeli,meggi,pasta,pitzza,burgur,dosha,dabeli,meggi,pasta]
        
    }
}

extension ViewController: UITableViewDelegate , UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? arrFoodItems.count : arrMobileItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell()
        cell.textLabel?.text  = arrFoodItems[indexPath.row].name
        return cell
        
        if indexPath.section == 0{
            let cell: FoodItemTableViewCell = tableView.dequeueReusableCell(withIdentifier: "FoodItemTableViewCell") as! FoodItemTableViewCell
            let foodItem:FoodItem = arrFoodItems[indexPath.row]
            cell.nameLabel.text = foodItem.name
            cell.priceLabel.text = "\(foodItem.price)"
            cell.quantityLabel.text = String(foodItem.quantity)
            cell.plusButton.addTarget(self, action: #selector(plusButtonClicked(_:)), for: .touchUpInside)
            cell.minusButton.addTarget(self, action: #selector(minusButtonClicked(_:)), for: .touchUpInside)
            cell.plusButton.tag = indexPath.row
            cell.minusButton.tag = indexPath.row
            
        } else {
            let cell: UITableViewCell = UITableViewCell()
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.text = "sdfghjkjhsqdhjvhavhjvcvahgcvjavcvjavcvjvcjgvavcjavjv"
            return cell
        }
    }
    
    @objc
    func plusButtonClicked(_ sender: UIButton){
        print("Plus Button click")
        arrFoodItems[sender.tag].quantity = arrFoodItems[sender.tag].quantity + 1
        tableView.reloadData()
    }
    
    @objc func minusButtonClicked(_ sender: UIButton){
        print("Minus Button click")
        if arrFoodItems[sender.tag].quantity > 0{
            arrFoodItems[sender.tag].quantity = arrFoodItems[sender.tag].quantity - 1
        }
        tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "Food Items Header" : "Mobile Items Header"
    }
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return section == 0 ? "Food Items Header" : "Mobile Items Header"

    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 16
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 16
    }
    
    
}
