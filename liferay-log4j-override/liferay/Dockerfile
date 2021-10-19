# Use an official Liferay image as parent image
FROM liferay/dxp:7.3.10-dxp-1-d1.5.9-20210518123623

# Copy the license key to the container ($LIFERAY_HOME is defined in the parent image)
COPY --chown=liferay:liferay activation-key-digitalenterprisedevelopment-7.3-liferaycom.xml $LIFERAY_HOME/deploy

# Copy custom portal configuration to the container
COPY --chown=liferay:liferay ./portal-ext.properties $LIFERAY_HOME/

# Copy custom log4 configuration to the container
COPY --chown=liferay:liferay ./portal-log4j-ext.xml $LIFERAY_HOME/tomcat/webapps/ROOT/WEB-INF/classes/META-INF/
