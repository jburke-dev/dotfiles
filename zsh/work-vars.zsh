safely_add_to_path "$HOME/.dotnet/tools"

export TestEmail=jburke@milesit.com
export ASPNETCORE_ENVIRONMENT=Development

load_keys ~/Work/local-infra/.env

safely_add_to_path "/opt/mssql-tools18/bin"

alias db_publish="dotnet publish src/SQL.Build/SQL.Build.csproj /p:TargetServerName=localhost /p:TargetUser=$MSSQL_SA_USERNAME /p:TargetPassword=$MSSQL_SA_PASSWORD"
alias model_scaffold="breck-cli model scaffold --server localhost --dbUser $MSSQL_SA_USERNAME --dbPassword $MSSQL_SA_PASSWORD --trustServerCertificate"
alias run_api="(cd src/API && dotnet run)"

run_job() {
    (cd "src/$1" && dotnet run)
}
