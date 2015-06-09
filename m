From: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Subject: [PATCH v7 0/8] mfd: cros_ec: Add multi EC and proto v3 support
Date: Tue,  9 Jun 2015 13:04:41 +0200
Message-ID: <1433847889-7220-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Bill Richardson <wfrichar-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Simon Glass <sjg-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Gwendal Grignou <gwendal-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Stephen Barber <smbarber-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Filipe Brandenburger <filbranden-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Todd Broch <tbroch-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Alexandru M Stan <amstan-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hello,

This is a v7 of a series that adds support for multiple EC in a system
and also for the protocol version 3 that is used on newer ECs.

Most patches were taken from the downstream ChromiumOS v3.14 tree with
fixes squashed, split to minimise the cross subsystem churn and changes
for mainline inclusion but were not modified functionality wise.

This version addresses issues pointed out by Lee Jones on the v6 posted
before [0] and also adds the Acked-by tags of all the needed maintainers.

The patches are based on top of "[PATCH 0/2] mfd: cros_ec: Small cleanups"
[1] that were posted before and already picked by Lee Jones.

Testing was done on some Chromebooks that have a single EC and support
protocol v2 such as the Exynos5250 Snow, Exynos5420 Peach Pit and Exynos5800
Peach Pi to be sure that no regressions were introduced for these machines.

The series were tested using a modified ectool [2] that supports the new
cros_ec IOCTL API. They were also tested on a x86 Pixel Chromebook 2 (Samus)
that uses the new protocol v3 and has 2 EC (cros_ec and cros_pd). But for
testing on Samus, also the posted "[PATCH 0/3] platform/chrome: Changes for
cros_ec_lpc and cros_ec_dev" series [3] are needed.

The series is composed of the following patches:

Alexandru M Stan (2):
  mfd: cros_ec: spi: Add a DT property to delay asserting the CS
  mfd: cros_ec: spi: Add delay for asserting CS

Gwendal Grignou (1):
  mfd: cros_ec: Support multiple EC in a system

Javier Martinez Canillas (2):
  mfd: cros_ec: Use a zero-length array for command data
  mfd: cros_ec: Move protocol helpers out of the MFD driver

Stephen Barber (3):
  mfd: cros_ec: rev cros_ec_commands.h
  mfd: cros_ec: add proto v3 skeleton
  mfd: cros_ec: add bus-specific proto v3 code

 Documentation/devicetree/bindings/mfd/cros-ec.txt |   4 +
 drivers/i2c/busses/Kconfig                        |   2 +-
 drivers/i2c/busses/i2c-cros-ec-tunnel.c           |  45 ++-
 drivers/input/keyboard/Kconfig                    |   2 +-
 drivers/input/keyboard/cros_ec_keyb.c             |  31 +-
 drivers/mfd/Kconfig                               |   6 +-
 drivers/mfd/cros_ec.c                             | 151 +++-----
 drivers/mfd/cros_ec_i2c.c                         | 169 ++++++++-
 drivers/mfd/cros_ec_spi.c                         | 407 +++++++++++++++++++---
 drivers/platform/chrome/Kconfig                   |   9 +-
 drivers/platform/chrome/Makefile                  |   1 +
 drivers/platform/chrome/cros_ec_dev.c             | 189 ++++++----
 drivers/platform/chrome/cros_ec_dev.h             |   7 -
 drivers/platform/chrome/cros_ec_lightbar.c        | 217 +++++++-----
 drivers/platform/chrome/cros_ec_lpc.c             |  84 ++++-
 drivers/platform/chrome/cros_ec_proto.c           | 382 ++++++++++++++++++++
 drivers/platform/chrome/cros_ec_sysfs.c           | 178 ++++++----
 include/linux/mfd/cros_ec.h                       |  84 ++++-
 include/linux/mfd/cros_ec_commands.h              | 277 +++++++++++++--
 19 files changed, 1796 insertions(+), 449 deletions(-)
 create mode 100644 drivers/platform/chrome/cros_ec_proto.c

Patch #1 modifies the struct cros_ec_command to use a zero-length array for
the buffer used for EC input and output data.

Patch #2 synchronises the cros_ec_commands.h with a newer version of the
file in the EC firmware repository.

Patch #3 moves the EC communication protocol helper functions out of the MFD
driver.

Patch #4 adds the EC host command protocol v3 support to the cros_ec driver
and patch #5 adds the bus specific proto v3 support for I2C, SPI and LPC.

Patch #6 adds support to make multiple EC have a different device id and
also exposing a per EC character device interface.

Patch #7 adds a DT property to the cros_ec DT binding to specify a delay
before receiving SPI transfers to make sure that the EC has already waked
up and patch #8 implements it in the cros_ec_spi driver.

Since the changes are quite intrusive and affects all ChromeOS EC related
drivers, the patches should be merged through the MFD subsystem tree. The
drivers/platform/chrome maintainer has already acked the patches so these
can be merged now.

Best regards,
Javier

[0]: https://lkml.org/lkml/2015/6/4/144
[1]: https://lkml.org/lkml/2015/5/20/235
[2]: http://cgit.collabora.com/git/user/javier/ec.git/log/?h=mainline-ioctl-zero-length
[3]: https://lkml.org/lkml/2015/5/20/184

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
