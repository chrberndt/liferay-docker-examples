# Use an official Liferay image as parent image
FROM liferay/dxp:7.4.13-u78-d5.0.36-20230525022540
#FROM liferay/portal:7.4.3.4-ga4-d2.0.5-20211110052627

# Copy the license key to the container ($LIFERAY_HOME is defined in the parent image)
#COPY --chown=liferay:liferay activation-key-digitalenterprisedevelopment-7.3-liferaycom.xml $LIFERAY_HOME/deploy

# Copy custom server.xml (with access log enabled) 
COPY --chown=liferay:liferay server.xml $LIFERAY_HOME/tomcat/conf/
