FROM hulud/guerillarender:2.0.1 

RUN apt-get update &&  \
    apt-get install -y \ 
 			libglu1 \
 			libgtk2.0-0 \ 
			curl \
      			xvfb \
			xterm \ 
 && apt-get autoremove -y 

ENV DISPLAY :0
 
COPY ./entrypoint.sh /usr/local/bin/ep.sh
RUN chmod +x /usr/local/bin/ep.sh

# ENTRYPOINT ["/usr/local/bin/ep.sh"]
 
