# Use the official Node.js 18 image as the base image
FROM node:16

# Set environment variable for legacy OpenSSL
# ENV NODE_OPTIONS=--openssl-legacy-provider
#

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and yarn.lock files to the container
COPY package.json yarn.lock ./

# Install dependencies
RUN yarn install

# Copy the rest of the application code to the container
COPY . .

# Build the Next.js application
RUN yarn build

# Expose the port the app runs on
EXPOSE 3000

# Start the application
CMD ["yarn", "start"]
