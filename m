From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v7 0/8] mfd: cros_ec: Add multi EC and proto v3 support
Date: Mon, 15 Jun 2015 13:29:30 +0100
Message-ID: <20150615122930.GA32321@x1>
References: <1433847889-7220-1-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f170.google.com ([209.85.212.170]:38047 "EHLO
	mail-wi0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753953AbbFOM3s (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Jun 2015 08:29:48 -0400
Received: by wibdq8 with SMTP id dq8so76509631wib.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Jun 2015 05:29:47 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1433847889-7220-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Stephen Barber <smbarber@chromium.org>, Filipe Brandenburger <filbranden@google.com>, Todd Broch <tbroch@chromium.org>, Alexandru M Stan <amstan@chromium.org>, Heiko Stuebner <heiko@sntech.de>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org

Wolfram, Dmitry, Olof,

Enjoy!

The following changes since commit 5ebe6afaf0057ac3eaeb98defd5456894b44=
6d22:

  Linux 4.1-rc2 (2015-05-03 19:22:23 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git ib-mfd-i2c-=
input-chrome-4.2

for you to fetch changes up to ff4378f4b813d5aa26bbf814a9060638dab1fbbf=
:

  mfd: cros_ec: spi: Add delay for asserting CS (2015-06-15 13:18:24 +0=
100)

----------------------------------------------------------------
Alexandru M Stan (2):
      mfd: cros_ec: spi: Add a DT property to delay asserting the CS
      mfd: cros_ec: spi: Add delay for asserting CS

Gwendal Grignou (2):
      mfd: cros_ec: Remove parent field
      mfd: cros_ec: Support multiple EC in a system

Javier Martinez Canillas (2):
      mfd: cros_ec: Use a zero-length array for command data
      mfd: cros_ec: Move protocol helpers out of the MFD driver

Stephen Barber (3):
      mfd: cros_ec: rev cros_ec_commands.h
      mfd: cros_ec: add proto v3 skeleton
      mfd: cros_ec: add bus-specific proto v3 code

Todd Broch (1):
      mfd: cros_ec: Instantiate sub-devices from device tree

 Documentation/devicetree/bindings/mfd/cros-ec.txt |   4 +
 drivers/i2c/busses/Kconfig                        |   2 +-
 drivers/i2c/busses/i2c-cros-ec-tunnel.c           |  45 ++-
 drivers/input/keyboard/Kconfig                    |   2 +-
 drivers/input/keyboard/cros_ec_keyb.c             |  31 +-
 drivers/mfd/Kconfig                               |   6 +-
 drivers/mfd/cros_ec.c                             | 173 ++++-----
 drivers/mfd/cros_ec_i2c.c                         | 170 ++++++++-
 drivers/mfd/cros_ec_spi.c                         | 408 ++++++++++++++=
+++++---
 drivers/platform/chrome/Kconfig                   |   9 +-
 drivers/platform/chrome/Makefile                  |   1 +
 drivers/platform/chrome/cros_ec_dev.c             | 189 ++++++----
 drivers/platform/chrome/cros_ec_dev.h             |   7 -
 drivers/platform/chrome/cros_ec_lightbar.c        | 217 +++++++-----
 drivers/platform/chrome/cros_ec_lpc.c             |  85 ++++-
 drivers/platform/chrome/cros_ec_proto.c           | 382 ++++++++++++++=
++++++
 drivers/platform/chrome/cros_ec_sysfs.c           | 178 ++++++----
 include/linux/mfd/cros_ec.h                       |  86 ++++-
 include/linux/mfd/cros_ec_commands.h              | 277 +++++++++++++-=
-
 19 files changed, 1808 insertions(+), 464 deletions(-)
 create mode 100644 drivers/platform/chrome/cros_ec_proto.c

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
