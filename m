From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH v2 0/3] ARM: EXYNOS: Fix builds with PM_SLEEP=n
Date: Tue, 12 Aug 2014 17:11:54 +0200
Message-ID: <1407856317-2457-1-git-send-email-b.zolnierkie@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:35894 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752134AbaHLPMY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Aug 2014 11:12:24 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sachin Kamat <sachin.kamat@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Olof Johansson <olof@lixom.net>, Russell King <rmk+kernel@arm.linux.org.uk>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, b.zolnierkie@samsung.com

Hi,

This patch series fixes builds with CONFIG_PM_SLEEP config option
disabled.  It has been runtime tested on Exynos4210 based Origen
board.

Depends on:
- next-20140811 branch of linux-next kernel

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


Bartlomiej Zolnierkiewicz (3):
  ARM: EXYNOS: Fix build with PM_SLEEP=n and ARM_EXYNOS_CPUIDLE=n
  ARM: mm: Fix ifdef around cpu_*_do_[suspend,resume] ops
  ARM: EXYNOS: Fix build with PM_SLEEP=n and ARM_EXYNOS_CPUIDLE=y

 arch/arm/mach-exynos/Kconfig   |   5 +
 arch/arm/mach-exynos/Makefile  |   3 +-
 arch/arm/mach-exynos/common.h  |   4 +
 arch/arm/mach-exynos/exynos.c  |   2 +
 arch/arm/mach-exynos/pm.c      | 262 +-------------------------------------
 arch/arm/mach-exynos/suspend.c | 279 +++++++++++++++++++++++++++++++++++++++++
 arch/arm/mm/proc-macros.S      |   2 +-
 arch/arm/plat-samsung/Makefile |   1 +
 8 files changed, 299 insertions(+), 259 deletions(-)
 create mode 100644 arch/arm/mach-exynos/suspend.c

-- 
1.8.2.3
