FROM registry.redhat.io/ubi8/ubi
ADD /libbsd-0.8.3-1.fc25.ppc64le.rpm /libbsd-0.8.3-1.fc25.ppc64le.rpm
RUN yum localinstall -y libbsd-0.8.3-1.fc25.ppc64le.rpm
ADD /stress-ng-0.07.29-1.fc25.ppc64le.rpm /stress-ng-0.07.29-1.fc25.ppc64le.rpm
RUN yum localinstall -y stress-ng-0.07.29-1.fc25.ppc64le.rpm
RUN dnf install -y procps-ng
CMD stress-ng  --cpu 36 --cpu-load 50 ; while true; do ps -ef | grep stress-ng | grep -v grep; sleep 500; done

