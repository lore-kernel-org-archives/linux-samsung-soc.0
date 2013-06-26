From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH 0/3] ARM: EXYNOS: cpuidle driver fixes
Date: Wed, 26 Jun 2013 12:13:44 +0200
Message-ID: <1372241627-22695-1-git-send-email-b.zolnierkie@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:15060 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751513Ab3FZKOO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 26 Jun 2013 06:14:14 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, jc.lee@samsung.com, lorenzo.pieralisi@arm.com, amit.kachhap@linaro.org, t.figa@samsung.com, daniel.lezcano@linaro.org, rjw@sisk.pl, kyungmin.park@samsung.com, b.zolnierkie@samsung.com

Hi,

This patchset makes ARM EXYNOS cpuidle driver work on EXYNOS4210,
prepares it for the future ARM multiplatform support and finally
moves the driver to drivers/cpuidle/.

Patches are against v3.10-rc6 (they also apply to next-20130624).

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics


Bartlomiej Zolnierkiewicz (3):
  ARM: EXYNOS: remove non-working AFTR mode support
  ARM: EXYNOS: init cpuidle driver in exynos_init_late()
  ARM: EXYNOS: move cpuidle driver to drivers/cpuidle/

 arch/arm/mach-exynos/Makefile    |   1 -
 arch/arm/mach-exynos/common.c    |   8 +-
 arch/arm/mach-exynos/common.h    |   6 ++
 arch/arm/mach-exynos/cpuidle.c   | 225 ---------------------------------------
 drivers/cpuidle/Makefile         |   3 +
 drivers/cpuidle/cpuidle-exynos.c |  92 ++++++++++++++++
 6 files changed, 105 insertions(+), 230 deletions(-)
 delete mode 100644 arch/arm/mach-exynos/cpuidle.c
 create mode 100644 drivers/cpuidle/cpuidle-exynos.c

-- 
1.8.2.3
