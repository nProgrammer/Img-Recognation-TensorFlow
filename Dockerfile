# Made by Norbert Wagner
# Using course on YT: https://www.youtube.com/watch?v=P8MZ1Z2LHrw
# Thank you "package main"

FROM ctava/tfcgo

RUN mkdir -p /model && \
  curl -o /model/inception5h.zip -s "http://download.tensorflow.org/models/inception5h.zip" && \
  unzip /model/inception5h.zip -d /model

WORKDIR /go/src/imgrecognition
COPY . .
RUN go build
ENTRYPOINT [ "/go/src/imgrecognition/imgrecognition" ]