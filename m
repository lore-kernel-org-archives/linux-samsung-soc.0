From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 1/2] 2nd Samsung power related updates for v3.17
Date: Fri, 25 Jul 2014 08:29:25 +0900
Message-ID: <53D196D5.3030307@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f43.google.com ([209.85.220.43]:44650 "EHLO
	mail-pa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934568AbaGXX3b (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 24 Jul 2014 19:29:31 -0400
Received: by mail-pa0-f43.google.com with SMTP id lf10so4903969pab.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 24 Jul 2014 16:29:30 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "arm@kernel.org" <arm@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

The following changes since commit 5f534d10d223636b3cd214376471fcfef71baea2:

   Merge branch 'v3.17-next/cpuidle-exynos' into v3.17-next/power-exynos 
(2014-07-23 08:18:15 +0900)

are available in the git repository at:


   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
tags/power-exynos

for you to fetch changes up to 6887d9e5682886b5d9fe81217ff2f1410724cdb9:

   ARM: EXYNOS: Move cpufreq and cpuidle device registration to 
init_machine (2014-07-23 08:20:38 +0900)

----------------------------------------------------------------
Samsung power management related updates for v3.17

- support cluster power off on exynos5420 and exynos5800
   to save power.
- use PMU address via DT to remove PMU static mapping
- remove exynos_cpuidle_init() and exynos_cpufreq_init()

* Note that this is including tags/samsung-cleanup and
tags/exynos-cpuidle are already merged into arm-soc.

----------------------------------------------------------------
Abhilash Kesavan (1):
       ARM: EXYNOS: Support cluster power off on exynos5420/5800

Pankaj Dubey (2):
       ARM: EXYNOS: Refactored code for using PMU address via DT
       ARM: EXYNOS: Move cpufreq and cpuidle device registration to 
init_machine

  arch/arm/mach-exynos/common.h                |  14 +-
  arch/arm/mach-exynos/exynos.c                |  30 +-
  arch/arm/mach-exynos/include/mach/map.h      |   3 -
  arch/arm/mach-exynos/mcpm-exynos.c           |  70 ++--
  arch/arm/mach-exynos/platsmp.c               |   4 +-
  arch/arm/mach-exynos/pm.c                    |  76 ++--
  arch/arm/mach-exynos/pmu.c                   |  40 +-
  arch/arm/mach-exynos/regs-pmu.h              | 524 
+++++++++++++--------------
  arch/arm/plat-samsung/include/plat/map-s5p.h |   1 -
  9 files changed, 374 insertions(+), 388 deletions(-)
