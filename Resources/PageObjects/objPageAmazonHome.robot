###############################################
#Author : Ambarish Majee
#Date Created : 07/21/2018
#Date Modified : 07/21/2018
#Modifications
#Created the initail version of POM
###############################################

*** Settings ***
Documentation    Page object for Amazon Home Page
Library    Selenium2Library    
Library    BuiltIn  

*** Variables ***
${Search_Product}  car for kids toys
${Tabed_page_title}   Hot Wheels Five Car Gift Pack Assortment, Colors and Designs Might Vary

*** Keywords ***
Enter the Product to be purchesed
    Input Text  xpath=.//*[@id='twotabsearchtextbox']  ${Search_Product}
    Click Element  xpath=.//*[@id='nav-search']/form/div[2]/div/input  
    Click Link  partial link=Wheels Five Car Gift Pack Assortment
    Select Window    NEW    
    Click Element  xpath=.//*[@id='add-to-cart-button']
    Click Element  xpath=.//*[@id='hlb-ptc-btn-native']
    
      

