From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH 0/7]: ARM: SAMSUNG: Add SPI clkdev support
Date: Fri, 23 Sep 2011 17:23:40 +0530
Message-ID: <1316778827-24694-1-git-send-email-padma.v@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:16578 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752240Ab1IWLr0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Sep 2011 07:47:26 -0400
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LRZ0026A4R0XMQ0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 23 Sep 2011 20:47:24 +0900 (KST)
Received: from padma-linuxpc.sisodomain.com ([107.108.83.35])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LRZ009KD4QTUT@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 23 Sep 2011 20:47:24 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: padma.v@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: grant.likely@secretlab.ca, jassisinghbrar@gmail.com, ben-linux@fluff.org, kgene.kim@samsung.com, s.nawrocki@samsung.com

This patchset modifies the existing clkdev to make SPI driver
independent of the clock names send from platform data. This
patches enables the SPI driver to request SPI bus clocks
using generic connection ID.

The patches are created against "for-next" branch of Kukjin Kim's tree at:
git://github.com/kgene/linux-samsung.git

Due to the issue with the GPIO in the latest commits of for-next branch,
following patches are tested against the following commit: 
9eb1e9aeec6f6f68d83a463446d1b30cb8ffcc65
ARM: S5PV210: enable TV support on GONI board

Padmavathi Venna (7):
  SPI: S3C64XX: Use bus clocks created using clkdev
  ARM: SAMSUNG: Add CLK Macro for clkdev support
  ARM: S3C64XX: Add SPI clkdev support
  ARM: S5PC100: Add SPI clkdev support
  ARM: S5P64X0: Add SPI clkdev support
  ARM: S5PV210: Add SPI clkdev support
  ARM: SAMSUNG: Remove SPI bus clocks from platform data

 arch/arm/mach-s3c64xx/clock.c                    |   98 +++++++++++-----
 arch/arm/mach-s3c64xx/dev-spi.c                  |    7 -
 arch/arm/mach-s5p64x0/clock-s5p6440.c            |   57 ++++++----
 arch/arm/mach-s5p64x0/clock-s5p6450.c            |   57 ++++++----
 arch/arm/mach-s5p64x0/dev-spi.c                  |    6 -
 arch/arm/mach-s5pc100/clock.c                    |  132 +++++++++++++---------
 arch/arm/mach-s5pc100/dev-spi.c                  |    7 -
 arch/arm/mach-s5pv210/clock.c                    |   58 ++++++----
 arch/arm/mach-s5pv210/dev-spi.c                  |    6 -
 arch/arm/plat-samsung/include/plat/clock.h       |    7 +
 arch/arm/plat-samsung/include/plat/s3c64xx-spi.h |    2 -
 drivers/spi/spi-s3c64xx.c                        |   14 +--
 12 files changed, 271 insertions(+), 180 deletions(-)

-- 
1.7.4.4
