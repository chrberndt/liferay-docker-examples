# Use an official Liferay image as a parent image
#FROM liferay/dxp:7.2.10-dxp-12-d1.5.6-20210412115818
FROM liferay/dxp:7.2.10-ga1-d1.5.6-20210412103940

# Copy the license key to the container ($LIFERAY_HOME is defined in the parent image)
COPY --chown=liferay:liferay activation-key-dxpdevelopment-7.2-developeractivationkeys.xml $LIFERAY_HOME/deploy

# Copy custom portal configuration to the container
COPY --chown=liferay:liferay ./portal-ext.properties $LIFERAY_HOME/portal-ext.properties
