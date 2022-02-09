# Use an official Liferay image as parent image
FROM liferay/dxp:7.3.10-dxp-1-d2.0.15-20220207214414
#FROM liferay/dxp:7.3.10-ga1-d1.2.1-20201005160536

# Copy the license key into the container at $LIFERAY_HOME/deploy
COPY --chown=liferay:liferay activation-key-digitalenterprisedevelopment-7.3-liferaycom.xml $LIFERAY_HOME/deploy

