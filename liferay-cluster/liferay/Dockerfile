# Use an official Liferay image as parent image
FROM liferay/dxp:7.3.10-u20-d5.0.11-20230201165127
#FROM liferay/dxp:7.3.10-dxp-1-d2.0.15-20220207214414

# Copy the license key to the container ($LIFERAY_HOME is defined in the parent image)
COPY --chown=liferay:liferay cluster-key.xml $LIFERAY_HOME/deploy
#COPY --chown=liferay:liferay activation-key-dxpdevelopment-7.4-developeractivationkeys.xml $LIFERAY_HOME/deploy

# Use a custom setenv.sh (in this case to reproduce an error due to user.timezone setting deviating from GMT
#COPY --chown=liferay:liferay setenv.sh $LIFERAY_HOME/tomcat/bin/

# Configure Liferay to point to an external Elasticsearch container for production use
COPY --chown=liferay:liferay ./com.liferay.portal.search.elasticsearch7.configuration.ElasticsearchConfiguration.config $LIFERAY_HOME/osgi/configs/

# Copy helper script to check whether the mysql service already has been started
ADD --chown=liferay:liferay https://raw.githubusercontent.com/vishnubob/wait-for-it/81b1373f17855a4dc21156cfe1694c31d7d1792e/wait-for-it.sh /usr/local/bin/

# Make the script executable
RUN chmod +x /usr/local/bin/wait-for-it.sh

# Start Tomcat when the MySQL server has been started (override the ENTRYPOINT configured in the parent image)
ENTRYPOINT /usr/local/bin/wait-for-it.sh -s -t 60 mysql:3306 -- $LIFERAY_HOME/tomcat/bin/catalina.sh run
