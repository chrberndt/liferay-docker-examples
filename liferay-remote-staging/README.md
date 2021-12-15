# Manual configuration steps

## Documentation

see: [https://learn.liferay.com/dxp/latest/en/site-building/publishing-tools/staging/configuring-remote-live-staging.html](https://learn.liferay.com/dxp/latest/en/site-building/publishing-tools/staging/configuring-remote-live-staging.html)

## Manual Configuration Steps

1. Login to your live system (localhost:8081) and determine the default site's Site ID, e.g. 20121
1. Enable Remote Live staging on the staging system (localhost:8080) with the following settings: 
  * Remote Host/IP: 172.16.238.11
  * Remote Port: 8080
  * Remote Path Context: <empty> (default)
  * Remote Site ID: The site id obtained in the previous step (e.g. 20121)
  
