# docker-spark-standalone-cluster
This application allows to deploy multi-nodes standalone cluster with spark 2.4.3.

### Build spark image
- Clone the repo 
- Run `docker build -t spark-2.4.3 .`

### Run  
- Change the host_ip with with your machine ip inside docker-compose.yml
- Run `docker-compose up`

### Run spark applications on cluster : 
- spark-shell : `spark-shell --master spark://host_ip:7077  --deploy-mode client`
- spark : `spark-submit --master spark://host_ip:7077 --deploy-mode client/cluster --class your_main_class application.jar

### Monitoring 
- Access to spark Master Web UI : <host ip>:8080
- Access to application Web UI : <host ip>:4040
