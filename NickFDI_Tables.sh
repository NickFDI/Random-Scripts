#!/bin/bash
# This bash script is brought to you by NickFDI. Github.com/nickfdi
# If you are reading this you are either on the Github repo, or you are
# one of the smarter people on the planet. Thanks for reading before executing.
# This is just one of many random scripts I've made to ease my troubles.
# This really is more just boredom and skill touch-up than anything else
#
#
# Enjoy.
checkstatus()
        {
                opt_checkstatus=1
        while [$opt_checkstatus != 7 ]
                do
                 clear
        echo -e "\nSelect an option from the below menu!\n"
        echo -e "\n\t MAKE SURE TO SAVE YOUR CURRENT TABLES\n"
        echo -e "
                        1. Save Current IpTables\n
                        2. Check Current Status of IpTables\n
                        3. Stop the IpTables Service\n
                        4. Start the IpTables Service\n
                        5. Restart the IpTables Service\n
                        6. Flush current IpTables [This Will delete all current Table rules!]\n
                        7. Check Current UFW Status\n
                        8. Check Current UFW Status Numbered\n
                        9. Delete UFW Table [This will delete all current UFW Rules.!!]\n
                        10. Set UFW default rules to DROP\n
                        11. Let yourself know just how good a Linux user you are\n
                        12. Head back to the main menu"
                read opt_checkstatus
                case $opt_checkstatus in
                        1) echo -e "-------------------------------------------------"
                                                /etc/init.d/iptables save
                           echo -e "-------------------------------------------------"
                          echo -e "Press return to continue..."
                          read temp;;
                        2) echo -e "-------------------------------------------------"
                                                /etc/init.d/iptables status
                           echo -e "-------------------------------------------------"
                          echo -e "Press return to continue..."
                          read temp;;
                        3) echo -e "-------------------------------------------------"
                                                /etc/init.d/iptables stop
                           echo -e "-------------------------------------------------"
                          echo -e "Press return to continue..."
                          read temp;;
                        4) echo -e "-------------------------------------------------"
                                                /etc/init.d/iptables start
                           echo -e "-------------------------------------------------"
                          echo -e "Press return to continue..."
                          read temp;;
                        5) echo -e "-------------------------------------------------"
                                                /etc/init.d/iptables restart
                           echo -e "-------------------------------------------------"
                          echo -e "Press return to continue..."
                          read temp;;
                        6) iptables -F
                           echo -e "-------------------------------------------------"
                           echo -e "All the Rules from your IpTables were flushed!!!!"
                           echo -e "-------------------------------------------------"
                          echo -e "Press return to continue..."
                          read temp;;
                        7) echo -e "-------------------------------------------------"
                                                sudo ufw status
                           echo -e "-------------------------------------------------"
                          echo -e "Press return to continue..."
                          read temp;;
                        8) echo -e "-------------------------------------------------"
                                                sudo ufw status numbered
                           echo -e "-------------------------------------------------"
                          echo -e "Press return to continue..."
                          read temp;;
                        9) echo -e "-------------------------------------------------"
                                                sudo ufw reset
                           echo -e "-------------------------------------------------"
                          echo -e "Press return to continue..."
                          read temp;;
                        10) echo -e "------------------------------------------------"
                                                iptables --policy INPUT DROP
                                                iptables --policy OUTPUT DROP
                                                iptables --policy FORWARD DROP
                           echo -e "-------------------------------------------------"
                          echo -e "Press return to continue..."
                          read temp;;
                        11) echo -e "-----------------------------------------------------"
                                echo -e "Who's a good little vim user.. that's right! YOU ARE!"
                            echo -e "-----------------------------------------------------"
                          echo -e "Press return to continue..."
                          read temp;;
                        12) main;;
                        *) echo -e "Wrong option was selected, please try again!"
                       esac
     		    done
	}
# The actual program begins here. If you would like to modify anything, go ahead.
# Make sure when you are making modifications you understand that which is being modified.
# It's imperative that you understand what you are looking at before changing something.
# I'm not going to be responsible if you lock yourself out of a machine due to poor knowledge.
buildfirewall()
        {
                                # Chain for Filter Table
                echo -e "Let's build a chain. Which rule would you like to use?\n
                                 1. INPUT
                                 2. OUTPUT
                                 3. FORWARD"
                                 read opt_ch
                                 case $opt_ch in
                                        1) chain="INPUT" ;;
                                        2) chain="OUTPUT" ;;
                                        3) chain="FORWARD" ;;
                                        *) echo -e "You selected the wrong option!"
                                esac
                # Here we are going to set the source addresses. This is 127.0.0.1/24 Format.
                echo -e "
                1. Set Firewall using a single source IP\n
                2. Firewall using a Subnet as the source\n
                3. Firewall using no filtering rules\n"
                read opt_ip

                case $opt_ip in
                        1) echo -e "\nEnter the IP Address of the Source [ HOSTNAMES not accepted ]"
                                read ip_source ;;
                        2) echo -e "\nEnter the IP AND SUBNET you wish to use as a source [ex. 127.0.0.1/24]"
                                read ip_source ;;
                        3) ip_source = "NULL" ;;
                        *) echo -e "You selected the wrong option!"
                esac
                # Here we are going to configure the destination addresses. Same formatting concept.. 127.0.0.1/24
                echo -e "
                        1. Set up firewall using a single Destination IP address\n
                        2. Set up firewall using a single Subnet\n
                        3. Set up firewall with no filtering rules\n"

                read opt_ip
                        case $opt_ip in
                        1) echo -e "\nEnter the IP of the Destination"
                                                        read ip_dest ;;
                        2) echo -e "\nEnter the destination Subnet [ex. 127.0.0.1/24]"
                                                        read ip_dest ;;
                        3) ip_dest = "0/0" ;;
                        4) ip_dest = "NULL" ;;
                        *) echo -e "You selected the wrong address!"
                esac
                # Here we are going to establish the protocol
                echo -e "
                                 1. Block all UDP traffic
                                 2. Block specific Services
                                 3. Block specific PORTS
                                 4. Use no filtering"
                                 read proto_ch
                                 case $proto_ch in
                                        1) proto=UDP ;;
                                        2) echo -e "Enter the specific service you would like to block [ USE CAPS ]"
                                                read proto ;;
                                        3) echo -e "Enter the port you would like to block [ ex. 80, 4443, 443, 8080 ]"
                                                read proto ;;
                                        4) proto="NULL" ;;
                                        *) echo -e "You selected the wrong option!"
                                esac
                echo -e "
                                 1. Block all TCP traffic
                                 2. Block specific Services
                                 3. Block specific PORTS
                                 4. Use no filtering"
                                 read proto_ch
                                 case $proto_ch in
                                        1) proto=TCP ;;
                                        2) echo -e "Enter the specific service you would like to block [ USE CAPS ]"
                                                read proto ;;
                                        3) echo -e "Enter the port you would like to block [ ex. 80, 4443, 443, 8080 ]"
                                                read proto ;;
                                        4) proto="NULL" ;;
                                        *) echo -e "You selected the wrong option!"
                                esac
                # Lets make something out of what we just entered shall we?
                echo -e "What shall we do with our previous entries?
                                 1. Accept the Packets
                                 2. Reject the Packets
                                 3. Drop the Packet
                                 4. Creating Logging"
                                 read rule_ch
                                 case $rule_ch in
                                        1) rule="ACCEPT" ;;
                                        2) rule="REJECT" ;;
                                        3) rule="DROP" ;;
                                        4) rule="LOG" ;;
                                esac 
                # Generating rules with what we have come up with
                echo -e "\n\tPress return to start generating the ruleset"
                read temp
                echo -e "The new generated rule is \n"
                if [ $proto == "NULL" ]; then
                        echo -e "\niptables -A $chain -s $ip_source -d $ip_dest -j $rule\n"
 gen=1
else
 echo -e "\niptables -A $chain -s $ip_source -d $ip_dest -p $proto -j $rule\n"
 gen=2
fi
                echo -e "\n\tDo you wish to enter the generated rule to your IPTables? Yes=1, No=2"
                read yesno
                if [ $yesno == 1 ] && [ $gen == 1 ]; then
 iptables -A $chain -s $ip_source -d $ip_dest -j $rule
else if [ $yesno == 1 ] && [ $gen == 2 ]; then
 iptables -A $chain -s $ip_source -d $ip_dest -p $proto -j $rule
else if [ $yesno == 2 ]; then

        main
fi
fi
fi
}

main()
{
 ROOT_UID=0
 if [ $UID == $ROOT_UID ];
 then
 clear
 opt_main=1
 while [ $opt_main != 4 ]
 do
echo -e "-----------------------------------------------\n"
# Lets check if user is root and if so check the IPTables
echo -e "\tIPTABLE Menu\n
                1. Check the package for IPTables\n
                2. Check IPTables services\n
                3. Build the firewall\n
                4. Exit the Menu"
                read opt_main
                case $opt_main in
                1) echo -e "-------------------------------------"
                  rpm -q iptables
                   echo -e "-------------------------------------" ;;
                2) checkstatus ;;
                3) buildfirewall ;;
                4) exit 0 ;;
                *) echo -e "You selected the wrong option!"
                esac
           done
        else
                echo -e "YOU ARE NOT ROOT!"
        fi
}
main
exit 0
