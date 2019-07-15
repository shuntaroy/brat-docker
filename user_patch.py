import json
import re

with open("config.py", "r") as fh:
    config = fh.read()

with open("users.json", "r") as f:
    usr_json = json.load(f)

users = ",\n".join([f"'{{{u}}}': '{{{p}}}'" for u, p in usr_json.items()])

usr_str = f"{users}"

new_config = re.sub(r"USER_PASSWORD = \{([^}]+)\}",
                    r"USER_PASSWORD = {\g<1>%s\n}" % usr_str,
                    config)

with open('config.py', 'w') as fh:
    fh.write(new_config)
