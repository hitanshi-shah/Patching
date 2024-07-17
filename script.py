from azure.identity import DefaultAzureCredential
from azure.monitor.query import MetricsQueryClient

def retrieve_update_management_status():
    credential = DefaultAzureCredential()
    client = MetricsQueryClient(credential)

    # Define your query to retrieve update management status
    query = """
    Heartbeat
    | summarize LastHeartbeat = arg_max(TimeGenerated, *) by Computer
    """

    # Execute the query
    result = client.query(workspace_id='72c7f09e-9c03-4210-b826-f2cbb88c6416', query=query)

    # Process the result
    for row in result.tables[0].rows:
        computer_name = row[0]
        last_heartbeat = row[1]
        print(f"Computer: {computer_name}, Last Heartbeat: {last_heartbeat}")

if __name__ == "__main__":
    retrieve_update_management_status()
