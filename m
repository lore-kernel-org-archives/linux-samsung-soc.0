From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: [PATCH 0/6] S3C24XX: Add support for HSSPI on S3C2416/S3C2443
Date: Sun, 4 Mar 2012 19:02:38 +0100
Message-ID: <201203041902.38318.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from s15407518.onlinehome-server.info ([82.165.136.167]:40301 "EHLO
	s15407518.onlinehome-server.info" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754633Ab2CDSCq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 4 Mar 2012 13:02:46 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: ben-linux@fluff.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

The S3C2416/S3C2443/S3C2450 SoCs contain HSSPI controllers compatible
with the ones in the S3C64xx and later.

The second patch modifying the dma selection depends on the series
enabling the dma support on the S3C2416, but as the whole s3c64xx-spi
driver needs dma support this should be ok.

Tested on an Asus DR-900 ebook reader with a Marvell MR8686 using the
libertas driver.

Heiko Stuebner (6):
  ARM: S3C24XX: Add forgotten clock lookup table to S3C2443
  ARM: S3C24XX: claim spi channels for hsspi in dma-s3c2443
  ARM: S3C24XX: Add map entries needed by the s3c64xx-spi devices
  ARM: S3C24XX: Add clock-lookup entries required by s3c64xx-spi
  ARM: S3C24XX: Add HSSPI setup callback for s3c64xx-spi driver
  spi/s3c64xx: Allow usage for ARCH_S3C24XX

 arch/arm/mach-s3c24xx/Kconfig            |    5 ++++
 arch/arm/mach-s3c24xx/Makefile           |    1 +
 arch/arm/mach-s3c24xx/clock-s3c2416.c    |    1 +
 arch/arm/mach-s3c24xx/clock-s3c2443.c    |    6 ++++
 arch/arm/mach-s3c24xx/common-s3c2443.c   |   15 +++++++----
 arch/arm/mach-s3c24xx/dma-s3c2443.c      |   16 +++++++++---
 arch/arm/mach-s3c24xx/include/mach/dma.h |    4 +++
 arch/arm/mach-s3c24xx/include/mach/map.h |    5 ++++
 arch/arm/mach-s3c24xx/setup-spi.c        |   39 ++++++++++++++++++++++++++++++
 drivers/spi/Kconfig                      |    2 +-
 10 files changed, 84 insertions(+), 10 deletions(-)
 create mode 100644 arch/arm/mach-s3c24xx/setup-spi.c

-- 
1.7.2.3
