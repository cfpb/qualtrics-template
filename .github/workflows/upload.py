import boto3
import os

s3 = boto3.resource(
    's3',
    aws_access_key_id=os.environ['S3KEY'],
    aws_secret_access_key=os.environ['S3SECRET']
)

def upload_file(file_name):
    s3.meta.client.upload_file(
        f'src/{file_name}',
        'files.consumerfinance.gov',
        f'assets/qualtrics/{file_name}'
    )

[upload_file(f) for f in  os.listdir('src')]
