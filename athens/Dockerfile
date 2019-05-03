FROM alpine
RUN apk --no-cache add nodejs npm unzip git
RUN npm install -g heroku
ADD go.mod /staging/
ADD hello.go /staging/
ADD go.sum /staging/
ADD deploy.sh /staging/
ADD local.sh /staging/
ADD run.sh /staging/
ADD athens/athens /staging/
WORKDIR /staging/
RUN chmod +x *.sh
RUN ./local.sh
