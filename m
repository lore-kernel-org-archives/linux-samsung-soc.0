From: juergen@kreuzholzen.de
Subject: (unknown)
Date: Sun, 16 Nov 2014 18:29:35 +0100
Message-ID: <E1Xq3dn-0006lG-62@sslproxy02.your-server.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from www291.your-server.de ([78.46.156.197]:51629 "EHLO
	www291.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755372AbaKPR3l (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 16 Nov 2014 12:29:41 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

>From 6b429d8fd28c6ebd6600a120ccba5cafd6bd07e4 Mon Sep 17 00:00:00 2001
Message-Id: <cover.1416158605.git.juergen@kreuzholzen.de>
From: Juergen Borleis <juergen@kreuzholzen.de>
Date: Sun, 16 Nov 2014 18:23:25 +0100
Subject: [RFC][PATCH 0/8] ARM/Samsung/S3C64XX add more features for devicetree configuration
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org

Hi,

following some trivial changes to make some already existing devices work again
for S3C6410 based systems which are now use devicetrees for their configuration.

Less trivial is the addition of the USB 2.0 phy driver for this SoC. The
S5P210's USB 2.0 phy is nearly the same, but only nearly. The S3C6410's unit
needs external power supplies to be switched on in order to make the phy work.
At least the Mini6410 platform makes use of it (don't know what the other
platforms do). So I added a gpio regulator to the driver. There seems already
one which can be used in the devicetree, but since this phy provides two phys
(one for the OTG and a second one for the OHCI) using the generic supply spits
out runtime error messages because it tries to create two instances of the same
name in one directory. Is there a better solution than touching the
phy-samsung-usb2.c's samsung_usb2_phy_probe function?

jbe

Juergen Borleis (8):
  ARM/Mini6410: enable watchdog support
  ARM/DTS/S3C64XX: add syscon driver
  ARM/DTS/S3C64XX: add RTC device
  ARM/Mini6410: enable real time clock support
  Samsung/S3C6410/OTG-phy: add S3C6410 support
  ARM/DTS/S3C64XX: add an OTG phy driver for the S3C6410 SoC
  ARM/DTS/S3C64XX: add OHCI support
  ARM/Mini6410: enable USB OHCI support

 .../devicetree/bindings/phy/samsung-phy.txt        |   2 +
 arch/arm/boot/dts/s3c6410-mini6410.dts             |  58 ++++
 arch/arm/boot/dts/s3c6410.dtsi                     |   8 +
 arch/arm/boot/dts/s3c64xx.dtsi                     |  40 +++
 arch/arm/mach-s3c64xx/Kconfig                      |   1 +
 drivers/phy/Kconfig                                |   9 +
 drivers/phy/Makefile                               |   1 +
 drivers/phy/phy-s3c6410-usb2.c                     | 346 +++++++++++++++++++++
 drivers/phy/phy-samsung-usb2.c                     |  12 +
 drivers/phy/phy-samsung-usb2.h                     |   3 +
 drivers/usb/host/Kconfig                           |   2 +-
 11 files changed, 481 insertions(+), 1 deletion(-)
 create mode 100644 drivers/phy/phy-s3c6410-usb2.c

-- 
1.8.1
