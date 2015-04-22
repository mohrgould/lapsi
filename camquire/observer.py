#!/usr/bin/env python

import datetime
import ephem

class Observer:
  def __init__(self, city):
    self.sun = ephem.Sun()
    self.obs = ephem.city(city)

  def is_night_at(self, ts):
    d = datetime.datetime.utcfromtimestamp(ts)
    self.obs.date = d

    if d.hour > 11:
      self.obs.horizon = str(-6)
    else:
      self.obs.horizon = str(-8)

    s = self.sun
    return self.obs.next_rising(s) < self.obs.next_setting(s)
