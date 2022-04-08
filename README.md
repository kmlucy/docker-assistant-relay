# docker-assistant-relay

### Note: This is based on Assistant Relay V2, not the newer versions. I have no intentions of supporting V3 or V4 at this time, but you are welcome to fork this repository if you would like. New users should use the current version, I'm leaving this up for current users of V2.

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
