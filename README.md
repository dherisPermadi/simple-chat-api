# simple-chat-api

## Installation : ##
1. run **'bundle install'**
2. create **'.env'** file in the root apps
3. assign ENV values to **'.env'** based on **'database.yml'** file ENV attributes
4. run **'rake db:create'**
5. run **'rake db:migrate'**
6. run **'rake db:seed'** to build the doorkeeper application and default users and user-contacs
7. running the apps by run **'rails s'**

## Testing : ##
1. go to **'https://www.postman.com/planetary-desert-155889/workspace/simple-chat/environment/18529314-3a307b18-37c8-4437-b75d-24c1f35a8203'**
2. set the current value of the simple_chat_client_id and the simple_chat_client_secret with the value of the Doorkeeper that has been build
3. go to **'https://www.postman.com/planetary-desert-155889/workspace/simple-chat/collection/18529314-fbb02c74-abdb-4452-b588-45b3a7c4b001?ctx=documentation'**
4. here is the list API on the postman that can be test accordingly :
   - Log In
   - Log Out
   - Contacts Managemet
   - List Conversation
   - List Message
   - Create Message
   - Read one Message
   - Read all Message
   - Delete Conversation
   - Delete Message
   - View User data
