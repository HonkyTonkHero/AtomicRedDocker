# Copyright (C) Jason Barbier
# Licensed under the MIT License.

# Docker image file that describes an Ubuntu20.04 image with PowerShell installed from Microsoft APT Repo
FROM mcr.microsoft.com/powershell:ubuntu-20.04
# Give all user execute permissions and remove write permissions for others
RUN /opt/microsoft/powershell/7/pwsh \
        -Command " \
          \$ErrorActionPreference = 'Stop' ; \
          \$ProgressPreference = 'SilentlyContinue' ; \
          IEX (IWR 'https://raw.githubusercontent.com/redcanaryco/invoke-atomicredteam/master/install-atomicredteam.ps1' -UseBasicParsing) ; \
          Install-AtomicRedTeam -getAtomics -InstallPath '/opt/microsoft/powershell/7/Modules'; \
          mv /opt/microsoft/powershell/7/Modules/invoke-atomicredteam /opt/microsoft/powershell/7/Modules/Invoke-AtomicRedTeam;"

# Use PowerShell as the default shell
# Use array to avoid Docker prepending /bin/sh -c
CMD [ "pwsh" ]
