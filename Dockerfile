FROM hulud/guerillarender:2.0.1 

RUN apt-get update &&  \
    apt-get install -y \ 
 			libglu1 \ 	
 			libgtk2.0-0 \ 
			imagemagick \	
			wget \	
      			xvfb \	
			xterm \ 
			inotify-tools \
 && apt-get autoremove -y 

# DL entrypoint script (change if uploaded to official repo)
RUN wget https://raw.githubusercontent.com/Hugogerva/guerilla-docker/master/entrypoint.sh
RUN mv entrypoint.sh /usr/local/bin/ep.sh
RUN chmod +x /usr/local/bin/ep.sh

ENTRYPOINT ["/usr/local/bin/ep.sh"]
