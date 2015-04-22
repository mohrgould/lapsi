#!/usr/bin/env python

import io
import picamera

class Camera:
  def __init__(self, invert=False):
    cam = picamera.PiCamera()
    cam.meter_mode = 'matrix'
    cam.resolution = (1024, 768)
    cam.quality = 90
    if invert:
      cam.hflip = True
      cam.vflip = True
    self.cam = cam

  def adjust(self, low_light):
    if low_light:
      self.cam.framerate = (1, 6)
      self.cam.ISO = 200
      self.cam.shutter_speed = 6000000
    else:
      self.cam.framerate = 30
      self.cam.ISO = 100
      self.cam.shutter_speed = 0

  def take(self):
    stream = io.BytesIO()
    self.cam.capture(stream, format='jpeg')
    return stream.getvalue()
