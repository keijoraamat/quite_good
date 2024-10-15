FROM python:3.9-slim

RUN apt-get update && apt-get upgrade -y \
    && apt-get clean

# Set the working directory in the container
WORKDIR /app

# Copy only the necessary files to the container
COPY app.py /app/
COPY requirements.txt /app/

# Install the required Python packages
RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8089

CMD ["python", "app.py"]