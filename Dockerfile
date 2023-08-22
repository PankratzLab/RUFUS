#
# A Dockerfile to get RUFUS running
#

# GCC 4.9 only available up to 16.04
FROM ubuntu:16.04

ARG DEBIAN_FRONTEND=noninteractive 

COPY . /RUFUS

RUN set -ex; \
# Dependencies
	BUILD_DEPS="cmake build-essential g++-4.9 zlib1g-dev libbz2-dev libbz2-dev liblzma-dev libncurses5-dev"; \
	apt-get update; \
	apt-get install -y software-properties-common; \
	add-apt-repository ppa:ubuntu-toolchain-r/test; \
	apt-get install -y python wget git bc libgomp1 $BUILD_DEPS; \
# Build
	mkdir -p /RUFUS/bin; \
	cd /RUFUS/bin; \
	cmake ../ -DCMAKE_C_COMPILER=$(which gcc) -DCMAKE_CXX_COMPILER=$(which g++); \
	make; \
# Cleanup
	apt-get purge -y --auto-remove $BUILD_DEPS; \
	apt-get clean; \
	echo done
	
# Runtime tools

# Setup samtools 1.11
RUN set -ex; \
	BUILD_DEPS="build-essential libncurses5-dev zlib1g-dev libbz2-dev libbz2-dev liblzma-dev"; \
	apt-get install -y $BUILD_DEPS; \
 	# Get newer version of cmake for building bamtools
  	wget https://github.com/Kitware/CMake/releases/download/v3.24.1/cmake-3.24.1-Linux-x86_64.sh -q -O /tmp/cmake-install.sh; \
	chmod u+x /tmp/cmake-install.sh; \
        mkdir /opt/cmake-3.24.1; \
        /tmp/cmake-install.sh --skip-license --prefix=/opt/cmake-3.24.1; \
        rm /tmp/cmake-install.sh; \
        ln -s /opt/cmake-3.24.1/bin/* /usr/local/bin; \
# Get samtools and build it
	cd /; \
	wget https://github.com/samtools/samtools/releases/download/1.11/samtools-1.11.tar.bz2; \
	tar -xjf samtools-1.11.tar.bz2; \
	cd samtools*; \
	./configure; \
	make; \
	make install; \
	cd /; \
	rm -rf samtools*; \
 # Get htslib for bgzip
 	wget https://github.com/samtools/htslib/releases/download/1.9/htslib-1.9.tar.bz2; \
	tar -xjf htslib-1.18.tar.bz2; \
	cd htslib*; \
	./configure; \
	make; \
	make install; \
	cd /; \
	rm -rf htslib*; \
 # Get bedtools
 	wget https://github.com/arq5x/bedtools2/releases/download/v2.30.0/bedtools.static.binary; \
	mv bedtools.static.binary /usr/local/bin/bedtools; \
	chmod a+x /usr/local/bin/bedtools; \
 # Get bamtools
    	git clone https://github.com/pezmaster31/bamtools; \
     	cd bamtools; \
      	mkdir build; \
  	cd build; \
  	cmake ..; \
   	make; \
    	make install; \
   	cd /; \
# Cleanup
	apt-get purge -y --auto-remove $BUILD_DEPS; \
	apt-get clean; \
	echo done

CMD ["/bin/bash"]
