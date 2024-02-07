#!/bin/bash

#--------------------------
# MySQL database credentials
DB_USER="root"
DB_PASSWORD="@G4libteam"
DB_HOST="localhost"
DB_NAME="library"

#---------------------------------------------------------------------------------------------
remove_book(){

  echo "Enter ID of book you want to delete."
  read a
    mysql --user=${DB_USER} --password=${DB_PASSWORD} --host=${DB_HOST} ${DB_NAME} --execute "delete from  books where Sno = $a; commit;"
  echo "Book successfully deleted from the database."
}
#---------------------------------------------------------------------------------------------
remove_member(){
  echo "Enter the member id of the member you want to remove."
  read num
  mysql --user=${DB_USER} --password=${DB_PASSWORD} --host=${DB_HOST} ${DB_NAME} --execute "Delete from members where member_id = $num; commit;"
  echo "Member successfully deleted from the database."
}

#---------------------------------------------------------------------------------------------
cleaner(){
  mysql --user=${DB_USER} --password=${DB_PASSWORD} --host=${DB_HOST} ${DB_NAME} --execute "delete from books where Sno IS NULL;delete from members where member_id IS NULL; commit;"
}
#---------------------------------------------------------------------------------------------
view_members(){
mysql --user=${DB_USER} --password=${DB_PASSWORD} --host=${DB_HOST} ${DB_NAME} --execute "Select * from members;"
}
#---------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------
add_book() {
  echo "Enter the Book Id:"
  read Sno
  echo "Enter the Title:"
  read book_name
  echo "Enter the Author:"
  read author
  echo "Enter the publisher"
  read publisher
  echo "Enter the Genre"
  read genre

  mysql --user=${DB_USER} --password=${DB_PASSWORD} --host=${DB_HOST} ${DB_NAME} --execute "insert into books values($Sno, $book_name, $author, $publisher, $genre); commit;"
  echo "Book successfully added to the database."
}
#--------------------------------------------------------------------------------------------
add_member(){
  echo "Enter the Member ID:"
  read id
  echo "Enter Member Name:"
  read name
  echo "Enter member Roll nnumber:"
  read rollno
  echo "Enter Contact number:"
  read contactno
  echo "Enter Email Id:"
  read em
  
    mysql --user=${DB_USER} --password=${DB_PASSWORD} --host=${DB_HOST} ${DB_NAME} --execute "insert into members values($id, $name, $rollno, $contactno, $em); commit;"
  echo "Member successfully added to the database."
}
#--------------------------------------------------------------------------------------------
view_books(){
mysql --user=${DB_USER} --password=${DB_PASSWORD} --host=${DB_HOST} ${DB_NAME} --execute "Select * from books" 
}
#----------------------------------------------------------
while true; do
  echo ""
  echo "Library Management System"
  echo "-------------------------"
  echo "1. Add Book"
  echo "2. Remove Book"
  echo "3. Add Member"
  echo "4. Remove Member"
  echo "5. View all books"
  echo "6. View all Members"
  echo "7. Cleaner"
  echo "8. Exit"
  echo ""
  read -p "Enter your choice [1-8]: " choice
  case $choice in
    1) add_book;;
    2) remove_book;;
    3) add_member;;
    4) remove_member;;
    5) view_books;;
    6) view_members;;
    7) cleaner;;
    8) exit;;
    *) echo "Invalid choice. Please try again.";;
  esac
done

