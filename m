From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH 0/2] Add initial support of PMU and CMU for exynos5260
Date: Wed, 11 Dec 2013 16:25:14 +0545
Message-ID: <1386758416-31065-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f42.google.com ([209.85.160.42]:43004 "EHLO
	mail-pb0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750864Ab3LKKk0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Dec 2013 05:40:26 -0500
Received: by mail-pb0-f42.google.com with SMTP id uo5so9752272pbc.29
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Dec 2013 02:40:26 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, t.figa@samsung.com, patches@linaro.org, linaro-kernel@lists.linaro.org, linux-arm-kernel@lists.infradead.org, joshi@samsung.com

1) Added initial PMU support for exynos5260

2) Added exynos5260_iodesc for mapping 5260 specific SFRs. We modified
exynos5_map_io so that in case of exynos5260 only exynos5260_iodesc can
be initialized.

3) Added new macros for WAKEUP MASK for 5260, and modified exynos_pm_drvinit
accordingly.

4) Adds CMU virtual addresses for exynos5260.

rebased on kgene tree for-next branch
https://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git/log/?h=for-next
and on top of rahul's patches for basic support of exynos5260
http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg24573.html

Vikas Sajjan (1):
  ARM: EXYNOS: Add initial support of PMU for Exynos5260

Young-Gun Jang (1):
  ARM: EXYNOS: Add CMU virtual addresses for exynos5260

 arch/arm/mach-exynos/common.c                  | 154 ++++++++++++++++-
 arch/arm/mach-exynos/common.h                  |   5 +
 arch/arm/mach-exynos/include/mach/map.h        |  31 ++++
 arch/arm/mach-exynos/include/mach/regs-clock.h |  17 ++
 arch/arm/mach-exynos/include/mach/regs-pmu.h   | 221 +++++++++++++++++++++++++
 arch/arm/mach-exynos/pm.c                      |  33 +++-
 arch/arm/mach-exynos/pmu.c                     | 140 ++++++++++++++++
 arch/arm/plat-samsung/include/plat/map-s5p.h   |  30 ++++
 8 files changed, 620 insertions(+), 11 deletions(-)

-- 
1.7.12.4
