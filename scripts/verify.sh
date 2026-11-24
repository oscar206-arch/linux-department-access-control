#!/bin/bash

echo "Checking department directories..."

ls -ld /company/*

echo "Checking group memberships..."

for user in john mary alex susan linda peter jane ceo manager
do
    groups "$user"
done
