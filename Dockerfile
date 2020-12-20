FROM debian
RUN apt update
RUN apt upgrade
ENV DEBIAN_FRONTEND=noninteractive
RUN ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime
RUN apt install git libtool automake autoconf gettext bison flex unixodbc pkg-config gawk g++ build-essential -y
WORKDIR /src/tools/
RUN git clone https://github.com/mdbtools/mdbtools.git
WORKDIR /src/tools/mdbtools/
RUN autoreconf -i -f
RUN ./configure 
RUN make
RUN make install
RUN ldconfig