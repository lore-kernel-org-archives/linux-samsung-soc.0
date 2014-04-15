From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH v2 0/6] Further cleanup and enable multiplat build
Date: Tue, 15 Apr 2014 14:58:48 +0530
Message-ID: <1397554134-11827-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:33353 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750909AbaDOJ3q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Apr 2014 05:29:46 -0400
Received: by mail-pb0-f46.google.com with SMTP id rq2so9226879pbb.5
        for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Apr 2014 02:29:45 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, arnd@arndb.de, sachin.kamat@linaro.org

This series is based on latest linux-next and depends on the
following patch:
ARM: EXYNOS: Consolidate Kconfig entries
http://article.gmane.org/gmane.linux.kernel.samsung-soc/28642

Changes since v2:
Replaced patch 2, "ARM: EXYNOS: Staticize exynos_subsys"
with "ARM: EXYNOS: Remove exynos_subsys registration" as that
code is no more used.

Tested on Exynos4210, 4412, 5250 and 5420 based boards.

Arnd Bergmann (1):
  ARM: EXYNOS: Enable multi-platform build support

Sachin Kamat (5):
  ARM: EXYNOS: Remove duplicate lines in Makefile
  ARM: EXYNOS: Remove exynos_subsys registration
  ARM: EXYNOS: Migrate Exynos specific macros from plat to mach
  ARM: EXYNOS: Remove unnecessary inclusion of cpu.h
  ARM: multi_v7_defconfig: Enable Exynos platform

 arch/arm/Kconfig                         |   27 ++---------
 arch/arm/configs/exynos_defconfig        |    2 +-
 arch/arm/configs/multi_v7_defconfig      |   10 +++++
 arch/arm/mach-exynos/Kconfig             |   27 +++++++++++
 arch/arm/mach-exynos/Makefile            |    9 ++--
 arch/arm/mach-exynos/common.h            |   72 ++++++++++++++++++++++++++++++
 arch/arm/mach-exynos/cpuidle.c           |    1 -
 arch/arm/mach-exynos/exynos.c            |   13 ------
 arch/arm/mach-exynos/hotplug.c           |    2 -
 arch/arm/mach-exynos/platsmp.c           |    2 -
 arch/arm/mach-exynos/pm.c                |    1 -
 arch/arm/mach-exynos/pmu.c               |    2 -
 arch/arm/plat-samsung/Makefile           |    3 ++
 arch/arm/plat-samsung/include/plat/cpu.h |   61 -------------------------
 14 files changed, 119 insertions(+), 113 deletions(-)

-- 
1.7.9.5
