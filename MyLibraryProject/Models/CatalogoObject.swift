//
//  CatalogoObject.swift
//  MyLibraryProject
//
//  Created by Adriana Limon on 2/7/22.
//

import Foundation
import UIKit


class MenuObject{
    var categorias : [Categoria]?
    var title : String?
    
    
    init(categorias : [Categoria], title : String){
        self.categorias = categorias
        self.title = title
    }
        
}

class Categoria{
    var nombre : String?
    var productos : [Producto]?
    
    init(nombre : String, productos : [Producto]){
        self.nombre = nombre
        self.productos = productos
    }
}

class Producto{
    var nombre : String?
    var descripcion : String?
    var precio : Float?
    var imagen : String?
    var peso : Float?
    var calorias : Int?
    var autor: String?
    var categoria : String?
    var biografia : String?
    
    
    init(nombre : String, descripcion : String, precio : Float, imagen : String, peso : Float, calorias : Int, autor : String, categoria : String, biografia : String){
        self.nombre = nombre
        self.descripcion = descripcion
        self.precio = precio
        self.imagen = imagen
        self.peso = peso
        self.calorias = calorias
        self.autor = autor
        self.categoria = categoria
        self.biografia = biografia
    }
    
}
