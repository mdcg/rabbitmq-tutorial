import time

import pika

connection = pika.BlockingConnection(
    pika.ConnectionParameters(host='localhost'))
channel = connection.channel()

channel.exchange_declare(exchange='logs', exchange_type='fanout')

result = channel.queue_declare(queue='', exclusive=True)
queue_name = result.method.queue

channel.queue_bind(exchange='logs', queue=queue_name)


def callback(ch, method, properties, body):
    print(f"[p2] receive {body}")
    message = 'type[2]'
    channel.basic_publish(exchange='logs', routing_key='', body=message)
    time.sleep(2)


channel.basic_consume(
    queue=queue_name,
    on_message_callback=callback,
    auto_ack=True
)

channel.start_consuming()
