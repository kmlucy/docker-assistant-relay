# docker-assistant-relay

### Note: This is based on Assistant Relay V2, not the newer V3. I have no intentions of supporting V3 at this time, but you are welcome to fork this repository if you would like.

First time setup:

Follow the instructions to setup Assistant Relay [here](https://github.com/greghesp/assistant-relay/blob/master/readMe.md) until you get to the section for running the relay. Then run:
```
docker run --rm -it \
    -v /path/to/host/folder/secrets:/assistant-relay/server/configurations/secrets \
    -v /path/to/host/folder/tokens:/assistant-relay/server/configurations/tokens \
    ghcr.io/kmlucy/docker-assistant-relay
```
Copy the url and paste it into a browser. Follow the steps online until it presents you with a code. Paste that code into the terminal and press enter. You should get a message that Assistant Relay is running.

If you want to modify the configuration, copy out the config file:
```
docker cp assistant-relay:/assistant-relay/server/configurations/config.json /path/to/host/folder/config.json
```
You can now close the container.

After setup, you can run it with:
```
docker run --rm -d \
    --name assistant-relay -p 3000:3000
    -v /path/to/host/folder/secrets:/assistant-relay/server/configurations/secrets:ro \
    -v /path/to/host/folder/tokens:/assistant-relay/server/configurations/tokens:ro \
    -v /path/to/host/folder/config.json:/assistant-relay/server/configurations/config.json \
    -e TZ=America/New_York \
    ghcr.io/kmlucy/docker-assistant-relay
```

If you are using it in Home Assistant, you can set up noficiation agents as follows:
```
# Notifications
notify:
  - name: Google Home
    platform: rest
    resource: !secret relay_url
    method: POST_JSON
    message_param_name: command
    data:
      user: !secret relay_user
      broadcast: true
  - name: Google Home Command
    platform: rest
    resource: !secret relay_url
    method: POST_JSON
    message_param_name: command
    data:
      user: !secret relay_user
```

Based on [greghesp/assistant-relay V2](https://github.com/greghesp/assistant-relay/tree/master)
