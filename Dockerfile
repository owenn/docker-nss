FROM centos:7


#RUN \
#        yum -y --disableplugin=fastestmirror install libnss_wrapper

COPY run.sh /run.sh
RUN chmod 755 /run.sh
RUN chmod 777 /etc/passwd /etc/group


USER 1001

#ENV LD_PRELOAD=libnss_wrapper.so
#ENV NSS_WRAPPER_PASSWD=/tmp/myetc/passwd
#ENV NSS_WRAPPER_GROUP=/tmp/myetc/group

ENTRYPOINT [ "/run.sh" ]
CMD [ 'make' ]

