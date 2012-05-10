From: Lukasz Majewski <l.majewski@samsung.com>
Subject: [PATCH RESEND 0/4] ARM: EXYNOS: Add s3c-hsotg support for Exynos4210
 and S5PV210 boards
Date: Thu, 10 May 2012 15:16:54 +0200
Message-ID: <1336655818-15136-1-git-send-email-l.majewski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:14160 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755610Ab2EJNRO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 May 2012 09:17:14 -0400
Received: from euspt1 (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0M3T005UO68FKG@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 10 May 2012 14:17:03 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0M3T007FV68NOZ@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 10 May 2012 14:17:11 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Lukasz Majewski <l.majewski@samsung.com>, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>

This patch series adds S3C-HSOTG UDC support for Exynos4210 and S5PV210 based targets; namely
 Universal_C210, Nuri and GONI.

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
 arch/arm/mach-exynos/include/mach/map.h      |    4 +
 arch/arm/mach-exynos/include/mach/regs-pmu.h |    3 +
 arch/arm/mach-exynos/mach-nuri.c             |    9 ++-
 arch/arm/mach-exynos/mach-universal_c210.c   |   10 +++
 arch/arm/mach-exynos/setup-usb-phy.c         |   95 +++++++++++++++++++-------
 arch/arm/mach-s5pv210/Kconfig                |    1 +
 arch/arm/mach-s5pv210/mach-goni.c            |    5 ++
 9 files changed, 105 insertions(+), 26 deletions(-)

-- 
1.7.2.3
