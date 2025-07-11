#!/bin/bash
set -e

# Reinitialize SDKMAN environment
source "$HOME/.sdkman/bin/sdkman-init.sh"

# Set Java and Maven
sdk use java 8.0.382-tem
sdk use maven 3.8.8

# Show versions for confirmation
java -version
mvn -version
