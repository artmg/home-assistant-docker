This stack is designed with a 'web' layer 
that is a simple reverse proxy using nginx. 
Note that this reverse proxy is something different than 
any 'proxy settings' that you might need 
to connect from your internal network to browse the public internet.

The prime use is to allow HTTPS certification

```
-- PC or mobile --            -------    Home Assistant Docker   ------        
     Browser                  nginx rev-proxy         Home Assistant
   HTTP request      ---->    Add HTTPS certs  --->  Serve HTTP content
```

But you might find other reasons to change the 'web appearance' 
of your Home Assistant instance.

As HA increased security, you now need to explicitly define any reverse-proxies 
in your configuration. The example given here is in [../hass/configuration.yaml](../hass/configuration.yaml), which defaults to 

```
http:
  use_x_forwarded_for: true
  trusted_proxies:
    - 172.20.0.0/24
```

Based on a typical out of the box Docker network, this should work ok, 
but if you have any issues like a `400: Bad Request` response when you 
first try to connect to your Home Assistant, then check the logs, 

```
./view-logs.sh
```

and where you get the error 

```
ERROR (MainThread) [homeassistant.components.http.forwarded] A request from a reverse proxy was received from 172.10.0.2, but your HTTP integration is not set-up for reverse proxies
```

use the first three octets of **that IP address** (e.g. 172.10.0.) 
in your own local `configuration.yaml`.
