From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH 0/3] ARM: EXYNOS: Trivial cleanup in mach-exynos
Date: Mon, 22 Feb 2016 15:33:13 +0530
Message-ID: <1456135396-17767-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:52940 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751825AbcBVKCG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Feb 2016 05:02:06 -0500
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0O2Y02BWA17F0Y50@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 22 Feb 2016 19:02:03 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, k.kozlowski@samsung.com, b.zolnierkie@samsung.com, daniel.lezcano@linaro.org, thomas.ab@samsung.com, linux@arm.linux.org.uk, Pankaj Dubey <pankaj.dubey@samsung.com>

This patch series cleans up mach-exynos files with resepct to unused header file inclusion,
leftover redundant register offset definition. Also corrects comment section at few places.

Pankaj Dubey (3):
  ARM: EXYNOS: correct header comment in Kconfig file
  ARM: EXYNOS: remove unused register offset definition
  ARM: EXYNOS: cleanup header files inclusion

 arch/arm/mach-exynos/Kconfig            | 2 +-
 arch/arm/mach-exynos/common.h           | 1 -
 arch/arm/mach-exynos/exynos.c           | 5 -----
 arch/arm/mach-exynos/firmware.c         | 2 --
 arch/arm/mach-exynos/include/mach/map.h | 9 +--------
 arch/arm/mach-exynos/platsmp.c          | 1 -
 arch/arm/mach-exynos/pm.c               | 4 +---
 arch/arm/mach-exynos/s5p-dev-mfc.c      | 1 -
 8 files changed, 3 insertions(+), 22 deletions(-)

-- 
2.4.5
