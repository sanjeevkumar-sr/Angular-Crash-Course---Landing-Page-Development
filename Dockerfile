# Use an official Node runtime as a parent image
FROM node:14

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install Angular CLI globally with version 14.0.6
RUN npm install -g @angular/cli@14.0.6

# Install project dependencies
RUN npm install

# Build the Angular app
RUN ng build

# Run Angular tests
RUN ng test

# Install pm2 globally
RUN npm install -g pm2

# Expose the port on which the app will run
EXPOSE 4200

# Command to start the application with pm2
CMD ["pm2-runtime", "start", "npm", "--", "run", "ng", "--", "serve", "--host", "0.0.0.0"]

# Uncomment the following line if you want to open the application in the default browser
CMD ["pm2-runtime", "start", "npm", "--", "run", "ng", "--", "serve", "--host", "0.0.0.0", "--open"]
