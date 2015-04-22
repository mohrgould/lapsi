#!/usr/bin/env python

import datetime
import os
import requests
import threading
import time
import subprocess

class Publisher:
  def __init__(self, archivedir, targeturl):
    self.archivedir = archivedir
    self.target = targeturl
    self.thread = None
    self.pubstart = None  # timestamp to track publication time

  def archive(self, ts, data):
    dirname = os.path.join(self.archivedir, self.__subpath(ts))
    if not os.path.exists(dirname):
      os.makedirs(dirname)

    filename = str(int(ts)) + '.jpg'
    open(os.path.join(dirname, filename), 'wb').write(data)

  def submit(self, ts, data):
    if self.thread == None or self.thread.is_alive() == False:
      self.thread = threading.Thread(target=self.__publish, args=[ts, data])
      self.thread.start()
    else:
      print('Skipping publication; old thread still running')

  def __publish(self, ts, data):
    self.pubstart = time.time()
    requests.post(self.target, data={'ts':ts}, files={'image':data}, timeout=30)
    print('Published in {0} seconds'.format(int(time.time() - self.pubstart)))

  def __subpath(self, ts):
    d = datetime.datetime.fromtimestamp(ts)
    return '{0.year:0>4}{1}{0.month:0>2}{1}{0.day:0>2}{1}{0.hour:0>2}'.format(d, os.sep)
