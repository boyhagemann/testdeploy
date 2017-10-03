# You should always specify a full version here to ensure all of your developers
# are running the same version of Node.
FROM node:6.9.5-alpine

# The base node image sets a very verbose log level.
ENV NPM_CONFIG_LOGLEVEL warn

# Install all dependencies of the current project.
COPY package.json package.json

# Build for production.
#RUN npm run build --production
RUN npm install -g -s --no-progress yarn && \
yarn --production && \
yarn build --production

# Copy all local files into the image.
COPY . .

# Install `serve` to run the application.
RUN yarn install -g serve

# Set the command to start the node server.
CMD serve -s build

# Tell Docker about the port we'll run on.
EXPOSE 5000
