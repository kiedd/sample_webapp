FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src

# copy csproj and restore as distinct layers
COPY src/Api/*.csproj ./Api/

RUN dotnet restore Api/Api.csproj

# copy everything else and build app
COPY src/ ./
WORKDIR /src/Api
RUN dotnet publish -c Release -o /app --no-restore

# final stage/image
FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS runtime
WORKDIR /app
COPY --from=build /app ./
RUN chmod +x launch.sh
ENTRYPOINT ["./launch.sh"]
