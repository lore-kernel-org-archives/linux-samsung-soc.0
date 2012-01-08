From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: [PATCH 0/3] s3c-hsudc powerdomain using generic power domains
Date: Sun, 8 Jan 2012 21:56:43 +0100
Message-ID: <201201082156.44142.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from s15407518.onlinehome-server.info ([82.165.136.167]:44700 "EHLO
	s15407518.onlinehome-server.info" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754492Ab2AHU44 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 8 Jan 2012 15:56:56 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, Felipe Balbi <balbi@ti.com>
Cc: 'Ben Dooks' <ben-linux@fluff.org>, Linux USB Mailing List <linux-usb@vger.kernel.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>

The S3C2443/S3C2416/S3C2450 contain a power domain for the usb phy.
Up until now the s3c-hsudc was writing directly to the PWRCFG register
in the (un)init_phy functions to control it.

This patchset introduces a power domain for the usbphy and hooks the
hsudc-device to it. The new runtime_pm calls then handle the enabling
and disabling of the power domain on udc start and stop.

As a result another arch dependency is gone from the driver.

This set applies cleanly to linux-next from 2012-01-06 and is
tested on S3C2416 hardware.

Heiko Stuebner (3):
  s3c-hsudc: Use helper functions instead of generic container_of
  s3c-hsudc: add basic runtime_pm calls
  S3C2443: add power domain for usb phy

 arch/arm/mach-s3c2416/Kconfig             |    1 +
 arch/arm/mach-s3c2443/Kconfig             |    1 +
 arch/arm/plat-s3c24xx/Kconfig             |    7 +++
 arch/arm/plat-s3c24xx/Makefile            |    1 +
 arch/arm/plat-s3c24xx/s3c2443-pm-common.c |   65 +++++++++++++++++++++++++++++
 drivers/usb/gadget/s3c-hsudc.c            |   25 ++++++-----
 6 files changed, 89 insertions(+), 11 deletions(-)
 create mode 100644 arch/arm/plat-s3c24xx/s3c2443-pm-common.c

-- 
1.7.2.3
