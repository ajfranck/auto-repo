require 'date'

# Path of the directory to push
directory_path = "/Users/1amaj/Desktop/Github/auto-repo/auto-repo"

# Name of the file to modify
file_path = "#{directory_path}/example#{Date.today}.txt"

# Obtaining the current date
current_date = Date.today.strftime("%Y-%m-%d")

# New content to add to the file
new_content = "Date of the day: #{current_date}"

# Modifying the file
File.open(file_path, "wb") { |file| file.puts(new_content) }


# Git commands using the personal access token
add_command = "git -C #{directory_path} add ."
commit_command = "git -C #{directory_path} commit -m 'Automatic modification'"
push_command = "git -C #{directory_path} push origin main"

# Define your GitHub username and personal access token
username = "ajfranck"  # <===== CHANGE HERE
access_token = "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"  # <===== CHANGE HERE

# Configuring authentication for Git commands
auth_command = "git -C #{directory_path} config credential.helper 'store --file=.git/credentials' && echo 'https://#{username}:#{access_token}@github.com' >> .git/credentials"

# Executing the authentication command
system(auth_command)

# Executing the Git commands
system(add_command)
system(commit_command)
system(push_command)
