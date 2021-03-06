#!/bin/sh
#
# Copyright (c) .NET Foundation and contributors. All rights reserved.
# Licensed under the MIT license. See LICENSE file in the project root for full license information.
#
echo "This software may collect information about you and your use of the software, and send that to Microsoft."
echo "Please visit http://aka.ms/dotnet-cli-eula for more information."

# Run 'dotnet new' as the user to trigger the first time experience to initialize the cache
echo "Welcome to .NET!
---------------------
Learn more about .NET: https://aka.ms/dotnet-docs
Use 'dotnet --help' to see available commands or visit: https://aka.ms/dotnet-cli-docs

Telemetry
---------
The .NET tools collect usage data in order to help us improve your experience. The data is anonymous and doesn't include command-line arguments. The data is collected by Microsoft and shared with the community. You can opt-out of telemetry by setting the DOTNET_CLI_TELEMETRY_OPTOUT environment variable to '1' or 'true' using your favorite shell.

Read more about .NET CLI Tools telemetry: https://aka.ms/dotnet-cli-telemetry

Configuring...
--------------
A command is running to populate your local package cache to improve restore speed and enable offline access. This command takes up to one minute to complete and only runs once."

first_run() {
    /usr/share/dotnet/dotnet exec /usr/share/dotnet/sdk/%SDK_VERSION%/dotnet.dll internal-reportinstallsuccess "rpmpackage" > /dev/null 2>&1 || true
}

INSTALL_TEMP_HOME=/tmp/dotnet-installer
[ -d $INSTALL_TEMP_HOME ] || mkdir $INSTALL_TEMP_HOME
HOME=$INSTALL_TEMP_HOME first_run
