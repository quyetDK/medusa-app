# Development Dockerfile for Medusa
FROM node:20-alpine

# Set working directory
WORKDIR /server

# Copy package files and yarn config
COPY package.json yarn.lock .yarnrc.yml ./

# Install all dependencies using yarn
RUN yarn install

# Copy source code
COPY . .

# Fix line endings for start.sh and make it executable
# Use tr to remove carriage returns (works better in Alpine)
RUN tr -d '\r' < ./start.sh > ./start.sh.tmp && mv ./start.sh.tmp ./start.sh && chmod +x ./start.sh

# Expose the port Medusa runs on
EXPOSE 9000

# Start with migrations and then the development server
# Explicitly use sh to run the script
CMD ["sh", "./start.sh"]