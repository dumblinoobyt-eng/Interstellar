FROM node:20-slim
WORKDIR /app

# Install pnpm globally
RUN npm install -g pnpm

# Copy repository configuration files
COPY package.json pnpm-lock.yaml* ./

# Copy everything else (including vendor folders if they exist)
COPY . .

# Install dependencies and skip optional native build steps to prevent crashes
RUN pnpm install --frozen-lockfile --prod || pnpm install --prod

EXPOSE 8080

CMD ["pnpm", "start"]
