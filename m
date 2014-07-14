From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH 0/2] ARM: EXYNOS: Fix builds with PM_SLEEP=n
Date: Mon, 14 Jul 2014 16:43:58 +0200
Message-ID: <1405349040-5265-1-git-send-email-b.zolnierkie@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:59256 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754847AbaGNOoV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Jul 2014 10:44:21 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sachin Kamat <sachin.kamat@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Olof Johansson <olof@lixom.net>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, b.zolnierkie@samsung.com

Hi,

This patch series fixes builds with CONFIG_PM_SLEEP config option
disabled.

They are on top of:
- next-20140714 +
- "[PATCH 5/6] ARM: EXYNOS: Fix suspend/resume sequencies" +
  (http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg32809.html)
- "[PATCH v2] ARM: EXYNOS: Fix build with PM_SLEEP=n"
  (http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg34007.html)

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

Bartlomiej Zolnierkiewicz (2):
  ARM: EXYNOS: Fix build with PM_SLEEP=n part #2
  ARM: EXYNOS: Fix build with PM_SLEEP=n and ARM_EXYNOS_CPUIDLE=y

 arch/arm/mach-exynos/Kconfig   |   5 +
 arch/arm/mach-exynos/Makefile  |   3 +-
 arch/arm/mach-exynos/common.h  |   7 ++
 arch/arm/mach-exynos/exynos.c  |   2 +
 arch/arm/mach-exynos/pm.c      | 178 +-----------------------------------
 arch/arm/mach-exynos/suspend.c | 203 +++++++++++++++++++++++++++++++++++++++++
 arch/arm/plat-samsung/Makefile |   1 +
 7 files changed, 224 insertions(+), 175 deletions(-)
 create mode 100644 arch/arm/mach-exynos/suspend.c

-- 
1.8.2.3
