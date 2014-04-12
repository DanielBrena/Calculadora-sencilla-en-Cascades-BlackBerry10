/*
 * Copyright (c) 2011-2013 BlackBerry Limited.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import bb.cascades 1.0
	import "funciones.js" as Funciones


Page {
    titleBar: TitleBar {
    	title: "Calculadora"
    }

    Container {
    id: root
    
       property string operando;
       property string operador;
       property bool  nuevaOperacion:true;
       
       //operaciones
       function setNuevaOperacion(n){
           root.nuevaOperacion = n;
       }
       function getNuevaOperacion(){
           return root.nuevaOperacion;
       }
       
       //Numeros
       function setOperando(o){
           root.operando = o;
       }
       
       function getOperando(){
           return root.operando;
       }
       function numeroPulsado(numero){
           if(resultadoTexto.text == "0" || root.nuevaOperacion){
               resultadoTexto.text = numero;
           }else{
               resultadoTexto.text += numero;
           }
           root.setNuevaOperacion(false);
       }
       
       function limpiar(){
           resultadoTexto.text = "0";
           root.setOperando("0");
       }
       
       //Simbolos
       function setOperador(o){
           root.operador = o;
       }
       function getOperador(){
           return root.operador;
       }
       
       function setTexto(r){
           
           resultadoTexto.text += r;
           
           
       }
       
       function operacionPresionada(){
           
               calcularResultado();
           
       }
       function calcularResultado(){
           var res = 0.0;
           if(getOperador() == "+"){
               res = parseFloat(root.getOperando()) + parseFloat(resultadoTexto.text);
           }else if(getOperador() == "-"){
               res = parseFloat(root.getOperando()) - parseFloat(resultadoTexto.text);
           }else if(getOperador() == "*"){
               res = parseFloat(root.getOperando()) * parseFloat(resultadoTexto.text);
           }else if(getOperador() == "/"){
               res = parseFloat(root.getOperando()) / parseFloat(resultadoTexto.text);
           }else{
               res = 0.0;
           }
           console.log(typeof(res) + " " +res);
           if(isNaN(res)){
               resultadoTexto.text ="Error";
               root.setOperando("0");
               root.limpiar();
           }else{
	           resultadoTexto.text = res.toString();
	           root.operando = "";
           }
       }
        
        
        Divider {
            
        }
        TextField {
            
            id: resultadoTexto
            text: "0"
            hintText: "0"
            preferredWidth: 700
            horizontalAlignment: HorizontalAlignment.Center
            textStyle.textAlign: TextAlign.Right
            textStyle.color: Color.DarkBlue
            textStyle.fontSize: FontSize.Medium
            inputMode: TextFieldInputMode.NumbersAndPunctuation
           

        }
        Divider {
            
        }
        Container {
            layout: StackLayout {
                orientation: LayoutOrientation.LeftToRight
            
            }
            
            leftPadding: 20.0
            rightPadding: 20.0
            topPadding: 20.0
            Button {
                
                id: uno
                text: "1"
                onClicked: {
                    
                    root.numeroPulsado("1");
                }
                layoutProperties: StackLayoutProperties {
                    spaceQuota: 1.0
                
                }
                leftMargin: 10.0
                rightMargin: 10.0
                
            
            }
            Button {
                id: dos
                text: "2"
                onClicked: {
                    root.numeroPulsado("2")
                }
                layoutProperties: StackLayoutProperties {
                    spaceQuota: 1.0
                
                }
            }
            
            Button {
                id: tres
                text: "3"
                onClicked: {
                    root.numeroPulsado("3");
                }
                layoutProperties: StackLayoutProperties {
                    spaceQuota: 1.0
                
                }
            }
            Button {
                id: suma
                text: "+"
                onClicked: {
                    root.setOperando(parseFloat(resultadoTexto.text));
                    root.setOperador("+");
                    resultadoTexto.text ="";
                }
                layoutProperties: StackLayoutProperties {
                    spaceQuota: 1.0
                
                }
                rightMargin: 10.0
            
            }
            
            
            
        }
        
        Container {
            layout: StackLayout {
                orientation: LayoutOrientation.LeftToRight
            
            }
            
            leftPadding: 20.0
            rightPadding: 20.0
            topPadding: 20.0
            Button {
                
                id: cuatro
                text: "4"
                onClicked: {
                    root.numeroPulsado("4")
                }
                layoutProperties: StackLayoutProperties {
                    spaceQuota: 1.0
                
                }
                leftMargin: 10.0
                rightMargin: 10.0
            
            
            }
            Button {
                id: cinco
                text: "5"
                onClicked: {
                    root.numeroPulsado("5");
                }
                layoutProperties: StackLayoutProperties {
                    spaceQuota: 1.0
                
                }
            }
            
            Button {
                id: seis
                text: "6"
                onClicked: {
                    root.numeroPulsado("6");
                }
                layoutProperties: StackLayoutProperties {
                    spaceQuota: 1.0
                
                }
            }
            Button {
                id: resta
                text: "-"
                onClicked: {
                  	//root.operacionPresionada();
                    root.setOperando(parseFloat(resultadoTexto.text));
                    root.setOperador("-");
                    resultadoTexto.text ="";
                }
                layoutProperties: StackLayoutProperties {
                    spaceQuota: 1.0
                
                }
                rightMargin: 10.0
            
            }
        
       
       }
        
       Container {
           layout: StackLayout {
               orientation: LayoutOrientation.LeftToRight
           
           }
           
           leftPadding: 20.0
           rightPadding: 20.0
           topPadding: 20.0
           Button {
               
               id: siete
               text: "7"
               onClicked: {
                   root.numeroPulsado("7")
               }
               layoutProperties: StackLayoutProperties {
                   spaceQuota: 1.0
               
               }
               leftMargin: 10.0
               rightMargin: 10.0
           
           
           }
           Button {
               id: ocho
               text: "8"
               onClicked: {
                   root.numeroPulsado("8");
               }
               layoutProperties: StackLayoutProperties {
                   spaceQuota: 1.0
               
               }
           }
           
           Button {
               id: nueve
               text: "9"
               onClicked: {
                   root.numeroPulsado("9");
               }
               layoutProperties: StackLayoutProperties {
                   spaceQuota: 1.0
               
               }
           }
           Button {
               id: multiplicacion
               text: "*"
               onClicked: {
                   root.setOperando(parseFloat(resultadoTexto.text));
                   root.setOperador("*");
                   resultadoTexto.text ="";
               }
               layoutProperties: StackLayoutProperties {
                   spaceQuota: 1.0
               
               }
               rightMargin: 10.0
           
           }
       
       
       }
       
       Container {
           layout: StackLayout {
               orientation: LayoutOrientation.LeftToRight
           
           }
           
           leftPadding: 20.0
           rightPadding: 20.0
           topPadding: 20.0
           Button {
               
               id: cero
               text: "0"
               onClicked: {
                   root.numeroPulsado("0")
               }
               layoutProperties: StackLayoutProperties {
                   spaceQuota: 1.0
               
               }
               leftMargin: 10.0
               rightMargin: 10.0
           
           
           }
           Button {
               id: punto
               text: "."
               onClicked: {
                   root.numeroPulsado(".");
               }
               layoutProperties: StackLayoutProperties {
                   spaceQuota: 1.0
               
               }
           }
           
           Button {
               id: c
               text: "c"
               onClicked: {
                  // root.numeroPulsado("=");
                  root.limpiar();
               }
               layoutProperties: StackLayoutProperties {
                   spaceQuota: 1.0
               
               }
           }
           Button {
               id: division
               text: "/"
               onClicked: {
                   root.setOperando(parseFloat(resultadoTexto.text));
                   root.setOperador("/");
                   resultadoTexto.text ="";
               }
               layoutProperties: StackLayoutProperties {
                   spaceQuota: 1.0
               
               }
               rightMargin: 10.0
           
           }
       
       
       }
       
       
       Container {
           layout: StackLayout {
               orientation: LayoutOrientation.LeftToRight
           
           }
           
           leftPadding: 20.0
           rightPadding: 20.0
           topPadding: 20.0
           Button {
               
               id: igual
               text: "="
               onClicked: {
                   root.operacionPresionada();
               }
               layoutProperties: StackLayoutProperties {
                   spaceQuota: 4.0
               
               }
               leftMargin: 10.0
               rightMargin: 10.0
           
           
           }
       }
    }
}
