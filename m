From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH v2 00/10] mfd: cros_ec: Add multi EC and proto v3 support
Date: Sat,  9 May 2015 12:10:31 +0200
Message-ID: <1431166241-15775-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Stephen Barber <smbarber@chromium.org>, Filipe Brandenburger <filbranden@google.com>, Todd Broch <tbroch@chromium.org>, Alexandru M Stan <amstan@chromium.org>, Heiko Stuebner <heiko@sntech.de>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>
List-Id: linux-samsung-soc@vger.kernel.org

Hello,

Newer Chromebooks have more than one Embedded Controller (EC) in the
system. These additional ECs are connected through I2C with a host EC
which is the one that is connected to the Application Processor (AP)
through different transports (I2C, SPI or LPC).

So on these platforms, sub-processors are chained to each other:

AP <--> Host EC <--> Power Delivery (PD) EC

The AP sends commands to the additional EC through the host EC using
a set of passthru commands and the host redirects to the correct EC.

This is a v2 of a series that adds support for multiple EC in a system
and also for the protocol version 3 that is used on newer ECs.

Most patches were taken from the downstream ChromiumOS v3.14 tree with
fixes squashed, split to minimise the cross subsystem churn and changes
for mainline inclusion but were not modified functionality wise.

This version addresses a lot of issues pointed out by Gwendal Grignou
and Heiko Stuebner on the v1 posted before [0].

The patches were tested on a x86 Pixel Chromebook 2 (Samus) that uses the
new protocol v3 and has 2 EC (cros_ec and cros_pd) using a modified ectool
[1] that supports the new cros_ec IOCTL API.

Also, testing was done on some Chromebooks that have a single EC and support
protocol v2 such as the Exynos5250 Snow, Exynos5420 Peach Pit and Exynos5800
Peach Pi to be sure that no regressions were introduced for these machines.

Gwendal Grignou and Heiko Stuebner tested the first version of the series
but I did not carry their Tested-by tags for the patches that had not trivial
changes. So testing on more platforms will be highly appreciated.

The series is composed of the following patches:

Alexandru M Stan (1):
  mfd: cros_ec: spi: Add delay for asserting CS

Gwendal Grignou (2):
  mfd: cros_ec: Remove parent field
  mfd: cros_ec: Support multiple EC in a system

Javier Martinez Canillas (3):
  platform/chrome: cros_ec_lpc - Use existing function to check EC
    result
  mfd: cros_ec: Use a zero-length array for command data
  platform/chrome: cros_ec_lpc - Add support for Google Pixel 2

Stephen Barber (3):
  mfd: cros_ec: rev cros_ec_commands.h
  mfd: cros_ec: add proto v3 skeleton
  mfd: cros_ec: add bus-specific proto v3 code

Todd Broch (1):
  mfd: cros_ec: Instantiate sub-devices from device tree

 Documentation/devicetree/bindings/mfd/cros-ec.txt |   4 +
 drivers/i2c/busses/i2c-cros-ec-tunnel.c           |  59 ++-
 drivers/input/keyboard/cros_ec_keyb.c             |  21 +-
 drivers/mfd/cros_ec.c                             | 442 +++++++++++++++++++---
 drivers/mfd/cros_ec_i2c.c                         | 170 ++++++++-
 drivers/mfd/cros_ec_spi.c                         | 408 +++++++++++++++++---
 drivers/platform/chrome/cros_ec_dev.c             | 190 +++++++---
 drivers/platform/chrome/cros_ec_dev.h             |   7 -
 drivers/platform/chrome/cros_ec_lightbar.c        | 217 +++++++----
 drivers/platform/chrome/cros_ec_lpc.c             | 106 +++++-
 drivers/platform/chrome/cros_ec_sysfs.c           | 116 +++---
 include/linux/mfd/cros_ec.h                       |  78 +++-
 include/linux/mfd/cros_ec_commands.h              | 277 ++++++++++++--
 13 files changed, 1696 insertions(+), 399 deletions(-)

Patches #1 and #2 are just small cleanups.

Patch #3 allows the driver to instantiate sub-devices defined in DT instead
of using a fixed list of mfd cells.

Patch #4 modifies the struct cros_ec_command to use a zero-length array for
the buffer used for EC input and output data.

Patch #5 synchronises the cros_ec_commands.h with a newer version of the
file in the EC firmware repository.

Patch #6 adds the EC host command protocol v3 support to the cros_ec driver
and patch #7 adds the bus specific proto v3 support for I2C, SPI and LPC.

Patch #8 adds support to make multiple EC have a different device id and
also exposing a per EC character device interface.

Patch #9 adds support to the cros_ec_lpc transport driver to be probed on
the Pixel 2 Chromebook.

Patch #10 adds support to the cros_ec_spi driver to specify a delay before
receiving SPI transfers to make sure that the EC has already waked up.

Since the changes are quite intrusive and affects all ChromeOS EC related
drivers, I didn't find a way to split the patches per subsystem so all the
patches should be merged through the MFD subsystem tree.

Best regards,
Javier

[0]: https://lkml.org/lkml/2015/4/6/150
[1]: http://cgit.collabora.com/git/user/javier/ec.git/log/?h=mainline-ioctl-zero-length
