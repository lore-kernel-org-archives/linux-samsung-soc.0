From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: [PATCH 0/7] Add device tree based discovery support for drm-fimd
Date: Wed, 11 Jul 2012 14:54:34 +0530
Message-ID: <1341998681-1888-1-git-send-email-l.krishna@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:43995 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751460Ab2GKJKp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Jul 2012 05:10:45 -0400
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M6Z00MGRO45VN40@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 11 Jul 2012 18:10:44 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M6Z008NXO5HIZ50@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 11 Jul 2012 18:10:43 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, prashanth.g@samsung.com, Leela Krishna <l.krishna@samsung.com>

From: Leela Krishna <l.krishna@samsung.com>

The patches are created against "for-next" branch of Kukjin Kim's tree at:
 git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git

This patch set adds Backlight, LCD support and device tree based discovery 
support for drm-fimd

Leela Krishna (3):
  ARM: EXYNOS5: add device tree based discovery support for FIMD
  ARM: EXYNOS5: Add the bus clock for FIMD
  ARM: EXYNOS5: Set parent clock to fimd

Leela Krishna Amudala (4):
  ARM: SAMSUNG: add additional registers and SFR definitions for
    writeback
  ARM: EXYNOS5: add machine specific support for backlight
  ARM: EXYNOS5: add machine specific support for LCD
  ARM: EXYNOS: Adding DRM platform device

 arch/arm/boot/dts/exynos5250-smdk5250.dts       |   16 +++
 arch/arm/boot/dts/exynos5250.dtsi               |    7 ++
 arch/arm/mach-exynos/Kconfig                    |    1 +
 arch/arm/mach-exynos/clock-exynos5.c            |   30 ++++--
 arch/arm/mach-exynos/include/mach/map.h         |    1 +
 arch/arm/mach-exynos/mach-exynos5-dt.c          |  125 +++++++++++++++++++++++
 arch/arm/plat-samsung/include/plat/clock.h      |    2 +
 arch/arm/plat-samsung/include/plat/regs-fb-v4.h |   10 ++
 arch/arm/plat-samsung/include/plat/regs-fb.h    |   51 +++++++++
 drivers/video/Kconfig                           |    6 +
 10 files changed, 239 insertions(+), 10 deletions(-)
