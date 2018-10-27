//
//  ViewController.swift
//  MetaWeatherVolvo
//
//  Created by Zabeehullah Qayumi on 10/26/18.
//  Copyright © 2018 Zabeehullah Qayumi. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {
    
    //https://www.metaweather.com/2459115/

    
    let stockholm = "stockholm"
    let mountainView = "mountain"
    let london = "london"
    let newYork = "2459115"
    let berlin = "berlin"
    let gothenburg = "gothenburg"
    
    @IBOutlet weak var tableView: UITableView!
    var arrOfCities = [DataModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameOfCities()
        
    }
    
    
    func jsonFile(_ citites : String){
        
        let url = URL(string: "https://www.metaweather.com/api/location/search/?query=\(citites)")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            guard let data = data else {return}
            do {
                let json = try JSON(data : data)
                for titleData in json.arrayValue{
                    self.arrOfCities.append(DataModel(json: titleData))
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            catch{
                print(error.localizedDescription)
            }
            
            }.resume()
    }
    
    func nameOfCities(){
        jsonFile(london)
        jsonFile(gothenburg)
        jsonFile(mountainView)
        jsonFile(newYork)
        jsonFile(stockholm)
        jsonFile(berlin)
    }
    
    
}


extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrOfCities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        cell.myLabel.text = arrOfCities[indexPath.row].title
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

}

