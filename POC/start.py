import pika
import sys

connection = pika.BlockingConnection(
    pika.ConnectionParameters(host='localhost'))
channel = connection.channel()

channel.exchange_declare(exchange='logs', exchange_type='fanout')

message = 'start!'
channel.basic_publish(exchange='logs', routing_key='', body=message)

connection.close()
