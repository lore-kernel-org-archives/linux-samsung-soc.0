From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: [PATCH V2 0/7] Add device tree based discovery support for drm-fimd
Date: Wed, 18 Jul 2012 11:27:26 +0530
Message-ID: <1342591053-7092-1-git-send-email-l.krishna@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:34361 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752589Ab2GRFnD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Jul 2012 01:43:03 -0400
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M7C00IWUD7M5640@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 18 Jul 2012 14:43:01 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M7C000CUD7GD990@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 18 Jul 2012 14:43:01 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, grant.likely@secretlab.ca, olofj@google.com, thomas.ab@samsung.com, kgene.kim@samsung.com, joshi@samsung.com, jg1.han@samsung.com

The patches are created against "for-next" branch of Kukjin Kim's tree at:
 git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git

This patch set adds Backlight, LCD support and device tree based discovery
support for drm-fimd.

This patchset has been tested on smdk5250 board and seen the bootup logo on LCD.

The documentation for bindings has been posted to mainline. Please refer to the
link http://www.spinics.net/lists/dri-devel/msg24862.html 

Changes since V1:
	- Removed unwanted empty lines for below patches
  	ARM: EXYNOS5: add machine specific support for backlight
  	ARM: EXYNOS5: add machine specific support for LCD
  	ARM: EXYNOS5: Set parent clock to fimd

Leela Krishna Amudala (7):
  ARM: SAMSUNG: add additional registers and SFR definitions for
    writeback
  ARM: EXYNOS5: add machine specific support for backlight
  ARM: EXYNOS5: add machine specific support for LCD
  ARM: EXYNOS: Adding DRM platform device
  ARM: EXYNOS: add device tree based discovery support for FIMD
  ARM: EXYNOS5: Add the bus clock for FIMD
  ARM: EXYNOS5: Set parent clock to fimd

 arch/arm/boot/dts/exynos5250-smdk5250.dts       |   16 +++
 arch/arm/boot/dts/exynos5250.dtsi               |    7 ++
 arch/arm/mach-exynos/Kconfig                    |    1 +
 arch/arm/mach-exynos/clock-exynos5.c            |   30 ++++--
 arch/arm/mach-exynos/include/mach/map.h         |    1 +
 arch/arm/mach-exynos/mach-exynos5-dt.c          |  123 +++++++++++++++++++++++
 arch/arm/plat-samsung/include/plat/clock.h      |    2 +
 arch/arm/plat-samsung/include/plat/regs-fb-v4.h |   10 ++
 arch/arm/plat-samsung/include/plat/regs-fb.h    |   51 ++++++++++
 drivers/video/Kconfig                           |    6 +
 10 files changed, 237 insertions(+), 10 deletions(-)
