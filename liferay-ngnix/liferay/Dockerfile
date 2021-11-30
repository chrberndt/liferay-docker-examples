# Use an official Liferay image as parent image
FROM liferay/dxp:7.2.10-dxp-16-d2.0.5-20211119073315
#FROM liferay/dxp:7.4.13-ga1-d2.0.4-20211022143534

# Copy the license key to the container ($LIFERAY_HOME is defined in the parent image)
COPY --chown=liferay:liferay activation-key-digitalenterprisedevelopment-7.3-liferaycom.xml $LIFERAY_HOME/deploy

# Copy custom server.xml (with access log enabled) 
COPY --chown=liferay:liferay server.xml $LIFERAY_HOME/tomcat/conf/
