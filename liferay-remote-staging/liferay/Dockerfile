# Use an official Liferay image as a parent image
FROM liferay/dxp:7.3.10-dxp-1-d1.5.9-20210518123623

# Copy the license key to the container ($LIFERAY_HOME is defined in the parent image)
COPY --chown=liferay:liferay activation-key-dxpdevelopment-7.3-developeractivationkeys.xml $LIFERAY_HOME/deploy
# COPY --chown=liferay:liferay activation-key-dxpdevelopment-7.3-liferaycom.xml $LIFERAY_HOME/deploy

# TODO: copy the TunnelAuthVerifierConfiguration only to the liferay-live image 
# Configure liferay-live to accept tunnel connections from liferay-staging
COPY --chown=liferay:liferay ./com.liferay.portal.security.auth.verifier.internal.tunnel.configuration.TunnelAuthVerifierConfiguration-default.config $LIFERAY_HOME/osgi/configs/

# Copy custom portal configuration to the container
COPY --chown=liferay:liferay ./portal-ext.properties $LIFERAY_HOME/portal-ext.properties
