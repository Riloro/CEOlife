//
//  Perfil.swift
//  CEOlife
//
//  Created by Alejandro on 20/04/18.
//  Copyright © 2018 Ricardo. All rights reserved.
//

import UIKit
import FirebaseDatabase

class Perfil: UIViewController, UITableViewDelegate, UITableViewDataSource{
    var arr = ["Nombre:", "Edad:", "Sexo:", "Profesión:", "Altura:", "Peso:", "País:"]
     var appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    var nombreS:String = ""
    var edadS:String = ""
    var profesionS:String = ""
    var alturaS:String = ""
    var pesoS:String = ""
    var historias:String = ""
    var sexos:String = ""
    var paises:String = ""
    
    @IBOutlet weak var historia: UITextView!
    
    @IBOutlet weak var table: UITableView!
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.backgroundColor = UIColor.black
        cell.detailTextLabel?.textColor = UIColor.white
        cell.textLabel?.text = self.arr[indexPath.row]
        cell.textLabel?.textColor = UIColor.white
        cell.isUserInteractionEnabled = false
        
        switch indexPath.row {
        case 0:
            cell.detailTextLabel?.text = self.nombreS
            break
        case 1:
            cell.detailTextLabel?.text = self.edadS + " años"
            
            break
            
        case 2:
            cell.detailTextLabel?.text = self.sexos
            
            break
        case 3:
            cell.detailTextLabel?.text = self.profesionS
            
            break
        case 4:
            cell.detailTextLabel?.text = self.alturaS + " m."
            
            break
            
        case 5:
            cell.detailTextLabel?.text = self.pesoS + " Kg."
            break
        case 6:
            cell.detailTextLabel?.text = self.paises
    
        default:
            break
            
        }
       
        
        return cell
        
    }
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.historia.text = self.historias
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = UIColor.black
       
    }
    override func viewWillAppear(_ animated: Bool) {
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        
        
        appDelegate?.window = UIWindow()
        appDelegate?.window?.makeKeyAndVisible()
        
        //        let randomViewController = UIViewController()
        //        randomViewController.view.backgroundColor = .purple
        
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let swipingController = SwipingController(collectionViewLayout: layout)
        appDelegate?.window?.rootViewController = swipingController
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
