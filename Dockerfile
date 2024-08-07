FROM node:20
WORKDIR /app
COPY package.json yarn.lock ./
RUN yarn
COPY . .
RUN npx prisma generate
RUN npx prisma db push
RUN yarn build
EXPOSE 4200
CMD ["yarn", "start:prod"]

