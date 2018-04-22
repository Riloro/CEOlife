//
//  ViewController.swift
//  CEOlife
//
//  Created by Alejandro on 20/04/18.
//  Copyright © 2018 Ricardo. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var jugar: UIButton!
    var nombreS:String = ""
    var edadS:String = ""
    var profesionS:String = ""
    var alturaS:String = ""
    var pesoS:String = ""
    var historias:String = ""
    var sexos:String = ""
    var paises:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var data = Database.database().reference()
        var numero = Int(arc4random_uniform(3))
        data.child("Perfiles").child(String(numero)).observeSingleEvent(of: .value, with:
            {
                snapshot in
                let value = snapshot.value as? NSDictionary
                let username = value?["Nombre"] as? String ?? ""
                self.nombreS = username
                let sexo = value?["Sexo"] as? String ?? ""
                self.sexos = sexo
                let edad = value?["Edad"] as? String ?? ""
                self.edadS = edad
                let peso = value?["Peso"] as? String ?? ""
                self.pesoS = peso
                let altura = value?["Altura"] as? String ?? ""
                self.alturaS = altura
                let pais = value?["Pais"] as? String ?? ""
                self.paises = pais
                
                let historia = value?["Historia"] as? String ?? ""
                
                let profesion = value?["Profesion"] as? String ?? ""
                self.profesionS = profesion
                self.historias = historia
                
                
        }
        )

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "siguiente"
        {
            let cc = segue.destination as! Perfil
            cc.alturaS = self.alturaS
            cc.pesoS = self.pesoS
            cc.profesionS = self.profesionS
            cc.sexos = self.sexos
            cc.paises = self.paises
            cc.historias = self.historias
            cc.nombreS = self.nombreS
            cc.edadS = self.edadS
            
        }
    }

}

