FROM python:3.9

WORKDIR /backend

# Copy the requirements file
COPY requirements.txt .

# Install the Python packages
RUN pip install --no-cache-dir -r requirements.txt

# Install wait-for-it script
ADD https://github.com/vishnubob/wait-for-it/raw/master/wait-for-it.sh /usr/local/bin/wait-for-it
RUN chmod +x /usr/local/bin/wait-for-it

# Copy the rest of the application
COPY ./app /backend/app

# Set Python path
ENV PYTHONPATH=/backend

# Command to run the application
CMD ["sh", "-c", "wait-for-it db:3306 -- uvicorn app.main:app --host 0.0.0.0 --port 8000 --reload"]