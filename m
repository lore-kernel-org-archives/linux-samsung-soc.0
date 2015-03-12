From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH 0/8] cros_ec: Add multiple EC and protocol v3 support
Date: Thu, 12 Mar 2015 18:02:40 +0100
Message-ID: <1426179768-27482-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:46837 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754845AbbCLRDZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Mar 2015 13:03:25 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Lee Jones <lee.jones@linaro.org>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Stephen Barber <smbarber@chromium.org>, Todd Broch <tbroch@chromium.org>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Hello,

Newer Chromebooks have more than one Embedded Controller (EC) in the
system. These additional ECs are connected through I2C with a host EC
which is the one that is connected to the Application Processor (AP)
through I2C, SPI or LPC.

So, on these platforms sub-processors are chained to each other, i.e:

AP <--> Host EC <--> Power Delivery (PD) EC

The AP sends commands to the additional EC through the host EC using
a set of passthru commands and the host redirects to the correct EC.

This series adds support for multiple EC in a system and also for the
protocol version 3 that is used on newer ECs.

The patches were tested on an Exynos5250 Snow, Exynos5420 Peach Pit,
Exynos5800 Peach Pi and x86 Pixel Chromebook with no regressions found.

Most patches were taken from the downstream ChromiumOS v3.14 tree with
fixes squashed, split to minimise the cross subsystem churn and changes
for mainline inclusion but were not modified functionality wise.

I don't have access neither to a Chromebook with more than one EC nor one
that supports the protocol version 3 though, so testing on those systems
will be highly appreciated.

The series depend on "platform/chrome: Add user-space dev inferface support"
[0] that is already merged in the chrome-platform tree so probably these
patches should also go through that tree once the mfd patches are acked.

The series is composed of the following patches:

Gwendal Grignou (2):
  mfd: cros ec: Remove parent field
  mfd: cros-ec: Support multiple EC in a system

Javier Martinez Canillas (2):
  mfd: cros_ec: Sanity check in and out sizes
  platform/chrome: cros_ec_lpc - Use existing function to check EC
    result

Stephen Barber (3):
  mfd: cros_ec: rev cros_ec_commands.h
  mfd: cros_ec: add proto v3 skeleton
  mfd: cros_ec: add bus-specific proto v3 code

Todd Broch (1):
  mfd: cros_ec: Instantiate sub-devices from device tree

 drivers/mfd/cros_ec.c                      | 359 ++++++++++++++++++++++----
 drivers/mfd/cros_ec_i2c.c                  | 165 +++++++++++-
 drivers/mfd/cros_ec_spi.c                  | 401 +++++++++++++++++++++++++----
 drivers/platform/chrome/cros_ec_dev.c      |   4 +-
 drivers/platform/chrome/cros_ec_lightbar.c |  14 +-
 drivers/platform/chrome/cros_ec_lpc.c      |  90 ++++++-
 include/linux/mfd/cros_ec.h                |  30 ++-
 include/linux/mfd/cros_ec_commands.h       | 277 ++++++++++++++++++--
 8 files changed, 1183 insertions(+), 157 deletions(-)

Patches #1, #2 and #3 are just small fixes or cleanups.

Patch #4 allows the driver to instantiate sub-devices defined in DT instead
of using a fixed list of mfd cells.

Patch #5 adds support to make multiple EC have a different device id and
also exposing a per EC character device interface.

Patch #6 synchronises the cros_ec_commands.h with a newer version of the
file in the EC firmware repository.

Patch #7 adds the EC host command protocol v3 support to the cros_ec driver
and patch #8 adds the bus specific proto v3 support for I2C, SPI and LPC.

Best regards,
Javier

[0]: https://lkml.org/lkml/2015/2/2/214
