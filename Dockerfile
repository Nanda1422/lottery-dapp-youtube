# Use official Node.js image
FROM node:18-alpine

# Set working directory inside container
WORKDIR /app

# Copy package and lock files first (for better caching)
COPY package.json npm.lock ./

# Install dependencies
RUN npm install

# Copy rest of the app files
COPY . .

# Build the production version of the app
RUN npm build

# Set environment variables
ENV NODE_ENV=production
ENV PORT=80


EXPOSE 80


CMD ["npm", "start"]
