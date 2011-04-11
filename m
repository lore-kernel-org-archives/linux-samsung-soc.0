From: Tomasz Stanislawski <t.stanislaws@samsung.com>
Subject: [PATCH v3 0/4] TV driver for Samsung Exynos4 platform (platform-part)
Date: Mon, 11 Apr 2011 14:18:51 +0200
Message-ID: <1302524335-29083-1-git-send-email-t.stanislaws@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:38465 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754405Ab1DKMTM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Apr 2011 08:19:12 -0400
Received: from eu_spt1 ([210.118.77.14]) by mailout4.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LJH00JYPM7YP190@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 11 Apr 2011 13:19:10 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LJH0056KM7XIC@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 11 Apr 2011 13:19:10 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, m.szyprowski@samsung.com, t.stanislaws@samsung.com, kyungmin.park@samsung.com

Hello Everyone,
This patchset introduce TV devices to Samsung Exynos4 platform (former
s5pv310). It is dedicated for 2.6.39-rc1 kernel. It is the third version of a
TV driver. The platform part was moved to a separate patchset. Moreover, the
patchset adds following auxiliary entities:
- I2C controller 8 for HDMI physical interface
- power regulators
- TV clocks, include ops for fout_vpll clock
- dependencies between TV and Power Domain devices 

Please refer to post 'TV driver for Samsung Exynos4 platform (media part)' for
sources of the TV driver.  Link missing due to circular dependency between both
posts.

*** BLURB HERE ***

Tomasz Stanislawski (4):
  i2c-s3c2410: fix I2C dedicated for hdmiphy
  exynos4: add i2c controller 8 (HDMIPHY)
  arm: exynos4: add s5p-tv
  arm: exynos4: universal_c210: add s5p-tv

 arch/arm/mach-exynos4/Kconfig                   |    7 +
 arch/arm/mach-exynos4/Makefile                  |    1 +
 arch/arm/mach-exynos4/clock.c                   |  223 ++++++++++++++++++++++-
 arch/arm/mach-exynos4/cpu.c                     |    3 +
 arch/arm/mach-exynos4/dev-tv.c                  |  114 ++++++++++++
 arch/arm/mach-exynos4/include/mach/irqs.h       |    8 +
 arch/arm/mach-exynos4/include/mach/map.h        |   27 +++
 arch/arm/mach-exynos4/include/mach/regs-clock.h |    1 +
 arch/arm/mach-exynos4/include/mach/regs-pmu.h   |    6 +
 arch/arm/mach-exynos4/mach-universal_c210.c     |   81 ++++++++
 arch/arm/plat-samsung/Kconfig                   |    5 +
 arch/arm/plat-samsung/Makefile                  |    1 +
 arch/arm/plat-samsung/dev-i2c8.c                |   68 +++++++
 arch/arm/plat-samsung/include/plat/devs.h       |    6 +
 arch/arm/plat-samsung/include/plat/iic-core.h   |    7 +
 arch/arm/plat-samsung/include/plat/iic.h        |    1 +
 drivers/i2c/busses/i2c-s3c2410.c                |   36 ++++-
 17 files changed, 593 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm/mach-exynos4/dev-tv.c
 create mode 100644 arch/arm/plat-samsung/dev-i2c8.c

-- 
1.7.4.3
