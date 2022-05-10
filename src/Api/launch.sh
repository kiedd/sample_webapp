#!/bin/bash

cp /run/secrets/appsettings.Production.json .
dotnet Api.dll
