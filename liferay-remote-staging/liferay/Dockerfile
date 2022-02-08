# Use an official Liferay image as a parent image
#FROM liferay/dxp:7.2.10-ga1-d2.0.10-20211225004005
#FROM liferay/dxp:7.3.10-sp3-d2.0.15-20220207215802
FROM liferay/dxp:7.3.10-dxp-1-d2.0.4-20211022091526

# Copy the license key to the container ($LIFERAY_HOME is defined in the parent image)
COPY --chown=liferay:liferay activation-key-dxpdevelopment-7.3-liferaycom.xml $LIFERAY_HOME/deploy

# TODO: copy the TunnelAuthVerifierConfiguration only to the liferay-live image 
# Configure liferay-live to accept tunnel connections from liferay-staging
COPY --chown=liferay:liferay ./com.liferay.portal.security.auth.verifier.internal.tunnel.configuration.TunnelAuthVerifierConfiguration-default.config $LIFERAY_HOME/osgi/configs/

# Copy custom portal configuration to the container
# TODO: move portal-ext.properties to docker-compose.yml / env.file
COPY --chown=liferay:liferay ./portal-ext.properties $LIFERAY_HOME/portal-ext.properties

# Copy helper script to check whether the mysql service already has been started
ADD --chown=liferay:liferay https://raw.githubusercontent.com/vishnubob/wait-for-it/81b1373f17855a4dc21156cfe1694c31d7d1792e/wait-for-it.sh /usr/local/bin/

# Make the script executable
RUN chmod +x /usr/local/bin/wait-for-it.sh

# Start Tomcat when the MySQL server has been started (override the ENTRYPOINT configured in the parent image)
ENTRYPOINT /usr/local/bin/wait-for-it.sh -s -t 60 mysql:3306 -- $LIFERAY_HOME/tomcat/bin/catalina.sh run
