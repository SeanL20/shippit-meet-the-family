# shippit-meet-the-family
This Repository for the coding test given by shippit. that would be similar to the coding problem artefact in this [Link](https://github.com/geektrust/coding-problem-artefacts)

# Data
The Data containing the family tree is in the family_tree_data csv file in the data folder.
The importing functionality is in the family_tree model where it would generate the members class data and put into the family_tree.

# Creation Process
There will be 4 model classes:
- The member class is to create individual members of the family.
- The family tree class is to have the members in an array to be able to be searched, it also contain the find by name function where it would return the member.
- The input function class contain functionality for adding child and get relation function.
- The relation function class contain the functionalities to retrieve members for the relation.

# Testing
The main testing file are in the test folder where it would test the creation of the family tree and member classes.

To run the test do enter the following commands:
```
ruby test/member_test.rb
ruby test/family_tree_test.rb
```

# Running
There is no need for any setup as long as the data csv file is in the data folder.
The command to run the file would be the following:
```
ruby meet_the_family.rb [input text file]
```