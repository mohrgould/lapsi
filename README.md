## Lapsi collects time-lapse images

Lapsi acquires, archives, and publishes time-lapsed images from a 
Raspberry Pi.  It's really a disorganized suite I wrote in 2014 to
make videos of sunsets.

Lapsi consists of two modules running on an acquisition (camquire)
and archive/publication (publicam) node.

## camquire runs on a Pi with a camera

The acquisition node is a Raspberry Pi with a camera module running
Python 2.7 scripts located in the `acquire` directory.  It requires
`picamera` and `pyephem` modules installed.

## publicam is a Rails app handling archival and publication

The publish/archive node is a Rails app for authenticated submission of
time-lapse frames from the acquisition node. It provides a web interface
to monitor the camera output.
