#!/bin/bash
#!/usr/bin/expect
# A menu driven Shell script which has following options
#
# Change Password
# See the disk space
# Login to other box using ssh
# Show all Service running
# Show all ports opened
# Show all java apps running
# Facility to kill an app
# Exit
#
# As per option selected by the user, the script will do the specific job
# -----------------------------------------------------------------------

log_file ="neha_task.log"
touch $log_file

while true
do
echo -n "*********************   MAIN MENU     *****************************"
echo "1. Change password \n"
echo "2. See the disk space \n"
echo "3. Login to other box using ssh \n"
echo "4. Show all running services \n"
echo "5. Show all opened ports \n"
echo "6. Show all java apps running"
echo "7. Kill an application" \n
echo "8. Exit \n"
echo "*******************************************************************"
echo -n "Please enter your option [1-8]"
read option
case $option in

1) echo "Enter username whose password is to be changed"
   read user
   if [ "$user" ]; then
   passwd >> $log_file 2>&1
   else
   echo "Invalid User"
   fi;;
   
   
2) df -h;;

3) echo "Login to another box"
   echo "Enter IP address of box to login in"
   read IP
   if [ "$IP" ]; then
   echo "Enter Username to be login in "
   read Username
   if [ "Username" ]; then
   echo "Enter Password "
   read Password
   if [ "$Password" ];
   then
            `pwd`/login.sh $Username $IP $Password
   else
   echo "Invalid Password"
   fi
   else
  echo "Invalid Username"
   fi
   else echo "Invalid IP"
   fi;;
4) ps -aux;;
5) ss -l;;
6) ps -aux | grep -i java;;
7) echo "Enter the process or application name which needs to be terminated"
   read processname
   if [ "$processname" ]; then
   	kill `ps -ef|grep -i $processname | awk '{print $3}'`
   else
   	echo "Invalid processname"
   fi ;;
8) exit 0;;
*) echo "Invalid option. Please select option between 1-8 only"
   echo "Press [enter] key to continue....."
   read;;
esac
done
