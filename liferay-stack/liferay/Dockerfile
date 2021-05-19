# Use an official Liferay image as a parent image
FROM liferay/dxp:7.3.10-ga1-d1.2.1-20201005160536

# Copy the license key to the container ($LIFERAY_HOME is defined in the parent image)
COPY --chown=liferay:liferay activation-key-digitalenterprisedevelopment-7.3-liferaycom.xml $LIFERAY_HOME/deploy

# Copy custom portal configuration to the container
COPY --chown=liferay:liferay ./portal-ext.properties $LIFERAY_HOME/portal-ext.properties

# Configure Liferay to point to an external Elasticsearch container for production use
COPY --chown=liferay:liferay ./com.liferay.portal.search.elasticsearch7.configuration.ElasticsearchConfiguration.config $LIFERAY_HOME/osgi/configs/

# Copy helper script to check whether the mysql service already has been started
ADD --chown=liferay:liferay https://raw.githubusercontent.com/vishnubob/wait-for-it/81b1373f17855a4dc21156cfe1694c31d7d1792e/wait-for-it.sh /usr/local/bin/
#COPY --chown=liferay:liferay ./wait-for-it.sh /usr/local/bin/wait-for-it.sh

# Make the script executable
RUN chmod +x /usr/local/bin/wait-for-it.sh

# Start Tomcat when the MySQL server has been started (override the ENTRYPOINT configured in the parent image)
ENTRYPOINT /usr/local/bin/wait-for-it.sh -s -t 60 mysql:3306 -- $LIFERAY_HOME/tomcat/bin/catalina.sh run