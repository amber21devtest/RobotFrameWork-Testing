###############################################
#Author : Ambarish Majee
#Date Created : 07/21/2018
#Date Modified : 07/21/2018
#Modifications
#Created the login fucntionality test case
###############################################

*** Settings ***
Documentation    This Suite is to Test Product Checkout functionality  
Resource    ../../Resources/objAmazonLogin.robot
Resource    ../../Resources/objPageAmazonHome.robot

*** Test Cases ***
This is to test the Log in
  Open Browser to Log in
  Enter the User Name and Password
  