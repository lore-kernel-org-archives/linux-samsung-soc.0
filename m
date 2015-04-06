From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [RESEND PATCH 0/8] cros_ec: Add multiple EC and protocol v3 support
Date: Mon,  6 Apr 2015 18:14:58 +0200
Message-ID: <1428336906-14906-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Lee Jones <lee.jones@linaro.org>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Stephen Barber <smbarber@chromium.org>, Filipe Brandenburger <filbranden@google.com>, Todd Broch <tbroch@chromium.org>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>
List-Id: linux-samsung-soc@vger.kernel.org

Hello,

Newer Chromebooks have more than one Embedded Controller (EC) in the
system. These additional ECs are connected through I2C with a host EC
which is the one that is connected to the Application Processor (AP)
through I2C, SPI or LPC.

So on these platforms, sub-processors are chained to each other:

AP <--> Host EC <--> Power Delivery (PD) EC

The AP sends commands to the additional EC through the host EC using
a set of passthru commands and the host redirects to the correct EC.

This series adds support for multiple EC in a system and also for the
protocol version 3 that is used on newer ECs.

Most patches were taken from the downstream ChromiumOS v3.14 tree with
fixes squashed, split to minimise the cross subsystem churn and changes
for mainline inclusion but were not modified functionality wise.

The series depend on "platform/chrome: Add user-space dev inferface support"
[0] that is already merged in the chrome-platform tree so probably these
patches should also go through that tree once the mfd patches are acked.

The series is a resend of a patch-set posted a month ago [1]. The only big
change besides cleanups and bugfixes is a rework of the cros_ec IOCTL API
as suggested by Gwendal Grignou to use a zero-length for the data buffer to
make the API both 64-bit safe and flexible for variable commands lengths.

The patches were tested on an Exynos5250 Snow, Exynos5420 Peach Pit,
Exynos5800 Peach Pi and x86 Pixel Chromebook using a modified ectool [2]
that uses the new API and no regressions were found.

I don't have access neither to a Chromebook with more than one EC nor one
that supports the protocol version 3 though, so testing on those systems
will be highly appreciated.

The series is composed of the following patches:

Gwendal Grignou (2):
  mfd: cros ec: Remove parent field
  mfd: cros-ec: Support multiple EC in a system

Javier Martinez Canillas (2):
  platform/chrome: cros_ec_lpc - Use existing function to check EC
    result
  mfd: cros_ec: Use a zero-length array for command data

Stephen Barber (3):
  mfd: cros_ec: rev cros_ec_commands.h
  mfd: cros_ec: add proto v3 skeleton
  mfd: cros_ec: add bus-specific proto v3 code

Todd Broch (1):
  mfd: cros_ec: Instantiate sub-devices from device tree

 drivers/i2c/busses/i2c-cros-ec-tunnel.c    |  44 ++--
 drivers/input/keyboard/cros_ec_keyb.c      |  27 +-
 drivers/mfd/cros_ec.c                      | 386 ++++++++++++++++++++++++----
 drivers/mfd/cros_ec_i2c.c                  | 169 ++++++++++++-
 drivers/mfd/cros_ec_spi.c                  | 390 ++++++++++++++++++++++++-----
 drivers/platform/chrome/cros_ec_dev.c      |  53 ++--
 drivers/platform/chrome/cros_ec_lightbar.c | 165 +++++++-----
 drivers/platform/chrome/cros_ec_lpc.c      |  98 ++++++--
 drivers/platform/chrome/cros_ec_sysfs.c    | 149 ++++++-----
 include/linux/mfd/cros_ec.h                |  36 ++-
 include/linux/mfd/cros_ec_commands.h       | 277 ++++++++++++++++++--
 11 files changed, 1477 insertions(+), 317 deletions(-)

Patches #1 and #2 are just small cleanups.

Patch #3 allows the driver to instantiate sub-devices defined in DT instead
of using a fixed list of mfd cells.

Patch #4 modifies the struct cros_ec_command to use a zero-length array for
the buffer used for EC input and output data.

Patch #5 adds support to make multiple EC have a different device id and
also exposing a per EC character device interface.

Patch #6 synchronises the cros_ec_commands.h with a newer version of the
file in the EC firmware repository.

Patch #7 adds the EC host command protocol v3 support to the cros_ec driver
and patch #8 adds the bus specific proto v3 support for I2C, SPI and LPC.

Best regards,
Javier

[0]: https://lkml.org/lkml/2015/2/2/214
[1]: https://lkml.org/lkml/2015/3/12/621
[2]: http://cgit.collabora.com/git/user/javier/ec.git/log/?h=mainline-ioctl-zero-length
