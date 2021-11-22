# Use an official Liferay image as parent image
FROM liferay/portal:7.4.3.4-ga4-d2.0.4-20211022144100

# Configure glowroot version 
ENV GLOWROOT_VERSION=0.13.6
ENV GLOWROOT_DIST_ZIP=glowroot-${GLOWROOT_VERSION}-dist.zip

# For DXP: Copy the license key to the container ($LIFERAY_HOME is defined in the parent image)
#COPY --chown=liferay:liferay activation-key-digitalenterprisedevelopment-7.3-liferaycom.xml $LIFERAY_HOME/deploy

# Install and download as root
USER root

# Download and unpack glowroot
RUN apt-get update && apt-get install -y wget \
    && wget https://github.com/glowroot/glowroot/releases/download/v${GLOWROOT_VERSION}/${GLOWROOT_DIST_ZIP} -O /tmp/${GLOWROOT_DIST_ZIP} \
    && unzip /tmp/${GLOWROOT_DIST_ZIP} \
    && mv glowroot /opt/ \
    && chown liferay:liferay /opt/glowroot \
    && rm -rf /tmp/${GLOWROOT_DIST_ZIP}

# Glowroot configuration 
COPY --chown=liferay:liferay glowroot/admin.json /opt/glowroot/ 

# Run image as liferay
USER liferay
