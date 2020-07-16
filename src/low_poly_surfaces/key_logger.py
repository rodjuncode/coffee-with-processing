from pynput.keyboard import Listener
import logging as log

log.basicConfig(
	filename = 'key_log.txt',
	level = log.DEBUG,
	format = '%(asctime)s - %(message)s'
)

def onPressed(key):
	log.info(str('#'))

with Listener(on_press = onPressed) as listener:
	listener.join()

