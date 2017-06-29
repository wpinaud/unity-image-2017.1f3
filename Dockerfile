FROM unity-base-image
ENV UNITY_INSTALLER_URL http://beta.unity3d.com/download/6a86e542cf5c/unity-editor_amd64-5.6.1xf1Linux.deb
# ------------------------------------------------------
# --- Install required tools
RUN apt-get update -qq && apt-get clean
# ------------------------------------------------------
# --- Unity 5.6.1f1
RUN wget -q ${UNITY_INSTALLER_URL} -O unity.deb && \
    apt-get install -y ./unity.deb && \
    rm unity.deb && \
    (/opt/Unity/Editor/Unity -logfile -nographics -force-opengl -batchmode &) ; sleep 15 ; sudo killall Unity

CMD bitrise -version
