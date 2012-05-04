From: Lukasz Majewski <l.majewski@samsung.com>
Subject: [PATCH 0/4] ARM: EXYNOS: Add s3c-hsotg support for Exynos4210 and
 S5PV210 boards
Date: Fri, 04 May 2012 17:57:53 +0200
Message-ID: <1336147077-16137-1-git-send-email-l.majewski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:60731 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753912Ab2EDP6D (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 May 2012 11:58:03 -0400
Received: from euspt2 (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0M3I0064D9OJSI@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 04 May 2012 16:57:55 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0M3I00HVO9OMGD@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 04 May 2012 16:57:59 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Lukasz Majewski <l.majewski@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

This patch series adds support for Exynos4210 and S5PV210 based targets; namely Universal_C210,
Nuri and GONI.

Tested HW:
- Exynos4210 NURI target rev.1
- Exynos4210 Universal_C210 target rev.0
- S5PV210 GONI target

Dependencies:
- usb:hsotg:samsung USB S3C-HSOTG driver fixes and code cleanup 
  patches, which have been already pulled to usb for-next branch.

http://permalink.gmane.org/gmane.linux.usb.general/62101	
	
Those patches are enabling this UDC driver on GONI, NURI and Universal_C210 targets
	
Joonyoung Shim (1):
  ARM: EXYNOS: Add s3c-hsotg device support for NURI board

Lukasz Majewski (3):
  ARM: EXYNOS: Add usb otg phy control for EXYNOS4210
  ARM: EXYNOS: Add s3c-hsotg device support for GONI board
  ARM: EXYNOS: Add s3c-hsotg device support for Universal C210 board

 arch/arm/mach-exynos/Kconfig                 |    3 +
 arch/arm/mach-exynos/include/mach/irqs.h     |    1 +
 arch/arm/mach-exynos/include/mach/map.h      |    3 +
 arch/arm/mach-exynos/include/mach/regs-pmu.h |    3 +
 arch/arm/mach-exynos/mach-nuri.c             |    8 ++-
 arch/arm/mach-exynos/mach-universal_c210.c   |   12 +++
 arch/arm/mach-exynos/setup-usb-phy.c         |   95 +++++++++++++++++++-------
 arch/arm/mach-s5pv210/Kconfig                |    1 +
 arch/arm/mach-s5pv210/mach-goni.c            |    5 ++
 9 files changed, 105 insertions(+), 26 deletions(-)

-- 
1.7.2.3
