###############################################
#Author : Ambarish Majee
#Date Created : 07/21/2018
#Date Modified : 07/21/2018
#Modifications
#Test the Checkout fucntionality test case
###############################################
*** Settings ***
Resource  ../../Resources/PageObjects/objAmazonLogin.robot
Resource  ../../Resources/PageObjects/objPageAmazonHome.robot

*** Test Cases ***
Log into the Application with valid id and password
  Open Browser to Log in
  Enter the User Name and Password
  
Purchase the product required
    Enter the Product to be purchesed
    