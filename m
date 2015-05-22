From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH v3 0/7] mfd: cros_ec: Add multi EC and proto v3 support
Date: Fri, 22 May 2015 17:42:13 +0200
Message-ID: <1432309340-13688-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:56942 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757714AbbEVPmn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 22 May 2015 11:42:43 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Stephen Barber <smbarber@chromium.org>, Filipe Brandenburger <filbranden@google.com>, Todd Broch <tbroch@chromium.org>, Alexandru M Stan <amstan@chromium.org>, Heiko Stuebner <heiko@sntech.de>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Hello,

Newer Chromebooks have more than one Embedded Controller (EC) in the
system. These additional ECs are connected through I2C with a host EC
which is the one that is connected to the Application Processor (AP)
through different transports (I2C, SPI or LPC).

So on these platforms, sub-processors are chained to each other:

AP <--> Host EC <--> Power Delivery (PD) EC

The AP sends commands to the additional EC through the host EC using
a set of passthru commands and the host redirects to the correct EC.

This is a v3 of a series that adds support for multiple EC in a system
and also for the protocol version 3 that is used on newer ECs.

Most patches were taken from the downstream ChromiumOS v3.14 tree with
fixes squashed, split to minimise the cross subsystem churn and changes
for mainline inclusion but were not modified functionality wise.

This version addresses a lot of issues pointed out by Lee Jones on the v2
posted before [0].

The patches are based on top of "[PATCH 0/2] mfd: cros_ec: Small cleanups"
[1] that were posted before and was already picked by Lee Jones.

Testing was done on some Chromebooks that have a single EC and support
protocol v2 such as the Exynos5250 Snow, Exynos5420 Peach Pit and Exynos5800
Peach Pi to be sure that no regressions were introduced for these machines.

The series were tested using a modified ectool [2] that supports the new
cros_ec IOCTL API. They were also tested on a x86 Pixel Chromebook 2 (Samus)
that uses the new protocol v3 and has 2 EC (cros_ec and cros_pd). But for
testing on Samus, also the posted "[PATCH 0/3] platform/chrome: Changes for
cros_ec_lpc and cros_ec_dev" series [3] are needed.

Gwendal Grignou and Heiko Stuebner tested the first versions of the series
but I did not carry their Tested-by tags for the patches that had not trivial
changes. So testing on more platforms will be highly appreciated.

The series is composed of the following patches:

Alexandru M Stan (1):
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
 drivers/mfd/Kconfig                               |   5 +-
 drivers/mfd/cros_ec.c                             | 163 ++++-----
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
 19 files changed, 1808 insertions(+), 448 deletions(-)
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

Patch #7 adds support to the cros_ec_spi driver to specify a delay before
receiving SPI transfers to make sure that the EC has already waked up.

Since the changes are quite intrusive and affects all ChromeOS EC related
drivers, the patches should be merged through the MFD subsystem tree.

Best regards,
Javier

[0]: https://lkml.org/lkml/2015/5/9/73
[1]: https://lkml.org/lkml/2015/5/20/235
[2]: http://cgit.collabora.com/git/user/javier/ec.git/log/?h=mainline-ioctl-zero-length
[3]: https://lkml.org/lkml/2015/5/20/184
