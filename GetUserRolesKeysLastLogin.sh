#!/bin/bash
# This script grabs all users, roles, keys and the list time that key was

for user in $(aws iam list-users |grep -i UserName|sed -e 's/.*: \"//' -e 's/\",//'); 
        do echo USER: $user; 
    
    for role in $(aws iam list-groups-for-user --user-name $user --output text|awk {'print $5'}); echo ROLE: $role;
    
    for key in $(aws iam list-access-keys --user-name $user --output text | awk {'print $2'}); 
        do echo KEY: $key; 
        
    for lastused in $(aws iam get-access-key-last-used --access-key-id $key --output text | awk {'print $2'}); 
        do echo LASTUSED: $lastused; echo "\n"; 
    done; done; done