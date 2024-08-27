FROM --platform=linux/arm64 node:18-alpine

WORKDIR /app

COPY package*.json ./

# Just try to run a simple command to check if it's an architecture issue
RUN echo "Test" > /test.txt && cat /test.txt

# Proceed with the rest if above steps work
RUN npm install

COPY . .

RUN chmod +x node_modules/.bin/next

RUN npm run build

EXPOSE 3000

CMD ["npm", "run", "start"]
