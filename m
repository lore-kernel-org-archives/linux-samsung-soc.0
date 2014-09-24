From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH v3 0/1] ARM: EXYNOS: Fix builds with PM_SLEEP=n
Date: Wed, 24 Sep 2014 16:20:01 +0200
Message-ID: <1411568402-24561-1-git-send-email-b.zolnierkie@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:23099 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751281AbaIXOUO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Sep 2014 10:20:14 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sachin Kamat <sachin.kamat@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Olof Johansson <olof@lixom.net>, Russell King <rmk+kernel@arm.linux.org.uk>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, b.zolnierkie@samsung.com

Hi,

This patch fixes builds with CONFIG_PM_SLEEP config option disabled.
It has been runtime tested on Exynos4210 based Origen board.

Depends on:
- for-next branch of linux-samsung.git kernel tree
- [PATCH v7 0/5] ARM: EXYNOS: cpuidle: fix AFTR mode on boards with secure
  firmware enabled
  (http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg37073.html)

Changes since v2:
(http://www.mail-archive.com/linux-samsung-soc%40vger.kernel.org/msg35430.html)
- rebased on top of for-next branch of linux-samsung.git kernel tree +
  [PATCH v7 0/5] ARM: EXYNOS: cpuidle: fix AFTR mode on boards with secure
  firmware enabled
  (http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg37073.html)

Changes since v1:
(http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg34079.html)
- rebased on top of next-20140811
- fixed OOPS on the first try to enter cpuidle AFTR mode
  (config with CONFIG_PM_SLEEP=n and CONFIG_ARM_EXYNOS_CPUIDLE=y)

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics


Bartlomiej Zolnierkiewicz (1):
  ARM: EXYNOS: Fix build with PM_SLEEP=n and ARM_EXYNOS_CPUIDLE=y

 arch/arm/mach-exynos/Kconfig   |   5 +
 arch/arm/mach-exynos/Makefile  |   5 +-
 arch/arm/mach-exynos/common.h  |   4 +
 arch/arm/mach-exynos/pm.c      | 338 +-------------------------------------
 arch/arm/mach-exynos/suspend.c | 356 +++++++++++++++++++++++++++++++++++++++++
 arch/arm/plat-samsung/Makefile |   1 +
 6 files changed, 374 insertions(+), 335 deletions(-)
 create mode 100644 arch/arm/mach-exynos/suspend.c

-- 
1.8.2.3
