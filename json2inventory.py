import json

def json_to_ansible_inventory(json_file_path):
    # Load JSON data from file
    with open(json_file_path, 'r') as json_file:
        data = json.load(json_file)

    # Initialize inventory dictionary
    inventory = {'Linux': [], 'Windows': []}

    # Process each entry in JSON data
    for entry in data:
        host = entry.get('hostname', 'null')
        os_type = entry.get('OS_Type', 'null')
        location = entry.get('location', 'null').upper()  # Convert location to uppercase
        
        # Debugging: Print values
        print(f"Processing entry: Host={host}, OS_Type={os_type}, Location={location}")

        if os_type.lower() == 'linux':
            inventory['Linux'].append((host, location))
        elif os_type.lower() == 'windows':
            inventory['Windows'].append((host, location))
        else:
            print(f"Ignoring entry with unknown OS_Type: Host={host}, OS_Type={os_type}, Location={location}")

    return inventory

def write_inventory_file(inventory, filename):
    with open(filename, 'w') as f:
        for os_type, hosts in inventory.items():
            f.write(f'[{os_type}]\n')
            for host, location in hosts:
                f.write(f'{host} Location={location} OS={os_type}\n')
            f.write('\n')

def main():
    json_file_path = 'inventory1.json'  # Replace with your JSON file path
    ansible_inventory_file = 'ansible_inventory1.ini'  # Replace with desired inventory file path

    # Convert JSON data to Ansible inventory format
    ansible_inventory = json_to_ansible_inventory(json_file_path)

    # Write Ansible inventory to file
    write_inventory_file(ansible_inventory, ansible_inventory_file)

if __name__ == "__main__":
    main()
