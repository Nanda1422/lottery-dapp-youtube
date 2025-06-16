# Use an official Node.js image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package.json and lock file
COPY package.json yarn.lock ./

# Install dependencies
RUN yarn install

# Copy the rest of the code
COPY . .

# Build the app
RUN yarn build

# Expose port 3000
EXPOSE 3000

# Start the app
CMD ["yarn", "start"]
