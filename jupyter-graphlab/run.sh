
print_success() {
  echo -e "\e[32m$@"
  tput sgr0
}

print_error() {
  echo -e "\e[31m$@"
  tput sgr0
}

print_warning() {
  echo -e "\e[33m$@"
  tput sgr0
}

print_normal() {
  echo "$@"
  tput sgr0
}

verify_username() {
  PAT="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
  if [[ $DATO_USERNAME =~ $PAT ]]; then
    return 0
  else
    return 1
  fi
}

verify_product_key() {
  PAT="^([a-zA-Z0-9]{4}-){7}[a-zA-Z0-9]{4}$"
  if [[ $DATO_PRODUCT_KEY =~ $PAT ]]; then
    return 0
  else
    return 1
  fi
}

get_verify_message_username() {
  if verify_username; then
    print_success "DATO_USERNAME is valid"
  else
    print_error "DATO_USERNAME is invalid"
  fi
}

get_verify_message_product_key() {
  if verify_product_key; then
    print_success "DATO_PRODUCT_KEY is valid"
  else
    print_error "DATO_PRODUCT_KEY is invalid"
  fi
}

print_verify_message() {
  get_verify_message_username
  get_verify_message_product_key
}

verify_license() {
  print_normal "Verifying GraphLab Create username and product key"
  print_verify_message
  if  verify_username && verify_product_key; then
    print_success "Verification successful"
    return 0
  else
    print_error "Veriication failed"
    return 1
  fi
}

generate_url() {
  echo "https://get.graphLab.com/GraphLab-Create/1.8.5/$DATO_USERNAME/$DATO_PRODUCT_KEY/GraphLab-Create-License.tar.gz"
}

install_graphlab() {
  print_normal "Preparing to install GraphLab-Create"
  if verify_license; then
    print_normal "Installing GraphLab-Create"
    python -m pip install --upgrade --no-cache-dir $(generate_url)
  else
    print_warning "Not installing GraphLab-Create"
  fi
}

check_install() {
  if [[ -z $(python -m pip list | grep GraphLab) ]]; then
    return 0
  else
    return 1
  fi
}

check_graphlab() {
  print_normal "Checking GraphLab installation"
  if check_install; then
    print_warning "GraphLab not installed"
    install_graphlab
  else
    print_normal "GraphLab installed, skipping installation"
  fi
}

start_jupyter(){
  print_normal "Starting jupyter notebook"
  jupyter notebook $@
}

main(){
  check_graphlab
  start_jupyter
}

main
