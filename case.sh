#!/bin/bash
if [  $# -ne 1 ]
then
  echo "Invalid number of arguments provided"
  exit 1
fi   

my_cnf_location="$(find / -name "my.cnf" | grep -v "alternatives")"
port_number="$(cat $(find / -name "mysqld.cnf") | grep  "# port" | cut -d "=" -f 2)"              
data_directory="$(cat $(find / -name "mysqld.cnf") | grep  "datadir" | cut -d "=" -f 2)"

case "$1" in
    config)
      echo "
  my.cnf location:: $my_cnf_location
  port number:: $port_number
  data directory:: $data_directory
        "
      ;;
    start)
      if sudo service mysql status | grep -q "active (running)"; then
          echo "MySQL service is already running."
      else
          echo "Starting MySQL service..."
          if sudo service mysql start; then
              echo "MySQL service started."
          else
              echo "Failed to start MySQL service."
          fi
      fi
      ;;
    stop)
      if sudo service mysql status | grep -q "active (running)"; then
          echo "Stopping MySQL service..."
          if sudo service mysql stop; then
              echo "MySQL service stopped."
          else
              echo "Failed to stop MySQL service."
          fi
      else
          echo "MySQL service is already stopped."
      fi
      ;;
    restart)
      echo "mysql is restarting"
      if sudo service mysql restart; then
          echo "service mysql restarted"
      else
          echo "Failed to restart mysql service."
      fi
      ;;
    *)
      echo "usage for $0 is config, start, stop, restart"
      exit 1
esac

        