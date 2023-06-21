# Use an official Node.js runtime as the base image
FROM node:14

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install npm dependencies
RUN npm install

# Copy the rest of the project files to the container
COPY . .

# Build the npm project
RUN npm run build

# Set the command to run when the container starts
CMD [ "npm", "start" ]
