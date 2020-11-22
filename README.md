# RemoteinfoPwrshell
This is a script that can pull computer information remotely from computers on your network using Powershell. Designed to be run against Windows.


The script is designed to be run from a single computer. You need to add the computers that you want to pull info from into a varible in the .ps1 file. See example below.

Example:
  $Computernames = 'Computername0' , 'Computername1'
  
  The script outputs a CSV file for every computer that you input into the $Computernames varible. The CSVs containing the computer info will be saved to your C drive in the public documents.
  
  Script is posted as is and probably won't receive any updates from me.
