# Stage 1: Build the Vite app
FROM node:22-alpine AS builder

ARG NODE_ENV=production

WORKDIR /app

# Copy package.json and package-lock.json (or yarn.lock)
COPY package*.json ./

# Install dependencies
RUN npm install


# Copy source code
COPY . .

ARG VITE_APP_ID
ENV VITE_APP_ID=$VITE_APP_ID

# Build the Vite app
RUN npm run build


# Expose port 80 for the container
EXPOSE 3000

# Serve the app
CMD ["npm", "run", "start"]
