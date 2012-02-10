From: Lukasz Majewski <l.majewski@samsung.com>
Subject: [PATCH 0/6] ARM: EXYNOS: USB OTG support for Universal C210
Date: Fri, 10 Feb 2012 11:35:40 +0100
Message-ID: <1328870146-20312-1-git-send-email-l.majewski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:33219 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758839Ab2BJKfw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Feb 2012 05:35:52 -0500
Received: from euspt1 (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LZ6006MWARRVA@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Feb 2012 10:35:51 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LZ6000ZOARRHB@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Feb 2012 10:35:51 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Lukasz Majewski <l.majewski@samsung.com>

Those patches add support for S3C-HSOTG driver for Universal C210 on the
platform part.

Patches done by Joonyoung Shim have been included to this patch series, since
those patches are necessary for further fixes. Unfortunately they haven't been 
included to mainline yet.

Joonyoung Shim (4):
  ARM: S3C64XX: Add usb otg phy control
  ARM: SAMSUNG: Fix memory size for hsotg
  ARM: EXYNOS: Add usb otg phy control for EXYNOS4210
  ARM: EXYNOS: Add hsotg device for NURI board

Lukasz Majewski (2):
  ARM: EXYNOS: select EXYNOS4_SETUP_USB_PHY at Universal_C210
  ARM: EXYNOS: USB OTG support for Universal C210

 arch/arm/mach-exynos/Kconfig                       |    1 +
 arch/arm/mach-exynos/include/mach/map.h            |    2 +
 arch/arm/mach-exynos/include/mach/regs-pmu.h       |    3 +
 arch/arm/mach-exynos/mach-nuri.c                   |    9 ++-
 arch/arm/mach-exynos/mach-universal_c210.c         |    5 +
 arch/arm/mach-exynos/setup-usb-phy.c               |   95 ++++++++++++++-----
 arch/arm/mach-s3c64xx/Kconfig                      |    8 ++
 arch/arm/mach-s3c64xx/Makefile                     |    1 +
 arch/arm/mach-s3c64xx/mach-crag6410.c              |    4 +
 arch/arm/mach-s3c64xx/mach-smartq.c                |    3 +
 arch/arm/mach-s3c64xx/mach-smdk6410.c              |    4 +
 arch/arm/mach-s3c64xx/setup-usb-phy.c              |   90 ++++++++++++++++++
 arch/arm/plat-samsung/devs.c                       |   16 +++-
 .../plat-samsung/include/plat/regs-usb-hsotg-phy.h |    7 +-
 arch/arm/plat-samsung/include/plat/udc-hs.h        |    5 +
 15 files changed, 223 insertions(+), 30 deletions(-)
 create mode 100644 arch/arm/mach-s3c64xx/setup-usb-phy.c

---
Dependences:
- (original Joonyoung Shim patches - before rebase):
http://comments.gmane.org/gmane.linux.usb.general/56341

-- 
1.7.2.3
