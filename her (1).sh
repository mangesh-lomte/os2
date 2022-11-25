create()
{
echo "enter book name"
read ab
res='ls | grep $ab } wc -wc'

if ( $res -gt 0);
then 
     echo "error"
else 
     touch $ab
     echo "ab created"
fi     
}
Insert()
{
            clear
           
            eno=$1           
            echo "Enter Employee No: $eno"
           
            echo "Enter Employee Name: \c"
            read enm

            echo "Enter Employee Address: \c"
            read eadd
           


           
            echo "$eno,$enm,$eadd,true" >> Employee.txt 

            echo "                 Insert Sucessfully                           "

}
Display()
{
            clear
            echo "__________________________________________________"                       
            echo "                              Employee Details "
            echo "__________________________________________________"                       
            echo "__________________________________________________"                       
 
        
            for j in `cat Employee.txt `
            do
                        eno=$(echo "$j" | cut -d "," -f 1)
                        enm=$(echo "$j" | cut -d "," -f 2)
                        eadd=$(echo "$j" | cut -d "," -f 3)
                      tfval=$(echo "$j" | cut -d "," -f 4)
                        if [ $tfval = "true" ]
                        then
                                  echo "___________________________________________"
                                  echo "$eno \t $enm \t\t $eadd"
                        fi
            done   
            echo
}
Delete()
{
            clear
            f=0
            echo "Enter Employee NO: \c"
            read no

            for j in `cat Employee.txt`
            do
                        eno=$(echo "$j" | cut -d "," -f 1)
                        enm=$(echo "$j" | cut -d "," -f 2)
                        eadd=$(echo "$j" | cut -d "," -f 3)
                        
                        if [ $no -eq $eno ]
                        then
                                    f=1                              
                                    line=$(echo "$eno,$enm,$eadd,false")
                                    fnm=`cat Employee.txt`
                                    d=$(echo "$fnm" | sed s/$j/$line/g )
                                    echo $d > Employee.txt          
                                    echo "                 Delete Successfully                           "
                        fi
            done
            if [ f = 0 ]
            then
                          echo "               No Record Found              "
            fi
}

            
while [ true ]
do 
echo "1.create"
echo "2.insert"
echo "3.Display"
echo "4.Delete"
echo "5.exit"
echo "enter "
read ch

case $ch in
            1)create;;
            2)nxtSrNo=$(AutoNumber)
               Insert $nxtSrNo
               ;;
            3) Display ;;
            4) Delete ;;
            5) break ;;
            *) echo " Wrong Choice "
esac
done
