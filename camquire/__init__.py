#!/usr/bin/env python

import time
from lapsi.camera import Camera
from lapsi.observer import Observer
from lapsi.publisher import Publisher

def publish_to(url,
    archivedir='/var/tmp/cam',
    period=10,
    city='Seattle',
    invert=False):

  camera = Camera(invert=invert)
  observer = Observer(city)
  publisher = Publisher(archivedir=archivedir, targeturl=url)

  while True:
    ts = time.time()
    camera.adjust(low_light=observer.is_night_at(ts))
    jpegdata = camera.take()
    publisher.archive(ts, jpegdata)
    publisher.submit(ts, jpegdata)
    published_ts = time.time()
    duration = published_ts - ts

    print('{0} {1} {2} {3}'.format(ts, 
      camera.cam.ISO, 
      camera.cam.shutter_speed, 
      duration))

    time.sleep(max(0, period-duration))
