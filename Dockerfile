
#   Copyright 2021 AltShiftZero
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.


FROM alpine:latest

LABEL maintainer="github.com/altshiftzero"

ENV TXADMIN_VERSION="7.3.2" \
    FIVEM_ARTIFACT="5265-dae83f643b2ea1e2488e1a57b3b1d53988a2128d"

EXPOSE 40120
EXPOSE 30120
EXPOSE 30110

RUN apk add --no-cache libgcc libstdc++ curl ca-certificates npm unzip wget git
RUN mkdir /opt/FiveM
RUN curl https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/10488-7fb0285f8c175fceb3603268d97151655e5992af/fx.tar.xz | tar xJ -C /opt/FiveM
RUN git clone https://github.com/citizenfx/cfx-server-data.git /opt/FiveM/server-data

ENTRYPOINT ["sh", "/opt/FiveM/run.sh"]

