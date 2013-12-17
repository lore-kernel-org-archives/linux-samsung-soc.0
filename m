From: kgene@kernel.org
Subject: [PATCH 00/11] ARM: EXYNOS: cleanup <mach/regs-xxx.h>
Date: Tue, 17 Dec 2013 20:58:57 +0900
Message-ID: <116a01cefb1f$5d841be0$188c53a0$@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:65501 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751369Ab3LQL66 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Dec 2013 06:58:58 -0500
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MXY0003T9A9P160@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 17 Dec 2013 20:58:57 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

This is cleanup for <mach/regs-xxx.h>.

My e-mail client is used for submitting them instead of git send-email
because of firewall :-( so looks strange format...sorry about that but it
should be fine when I take them :-)

Kukjin Kim (11):
      ARM: EXYNOS: cleanup <mach/regs-pmu.h>
      ARM: EXYNOS: remove inclusion <mach/regs-pmu.h> into another headers
      ARM: EXYNOS: local regs-pmu.h header file
      ARM: EXYNOS: cleanup <mach/regs-irq.h>
      ARM: EXYNOS: cleanup <mach/regs-clock.h>
      PM / devfreq: move definitions for exynos4_bus into drivers/devfreq
      ARM: EXYNOS: local definitions for pm.c into mach-exynos dir
      cpufreq: exynos: move definitions for exynos-cpufreq into
drivers/cpufreq/
      ARM: EXYNOS: local definitions for cpuidle.c into mach-exynos dir
      ARM: EXYNOS: remove <mach/regs-clock.h> for exynos
      PM / devfreq: use inclusion <mach/map.h> instead of <plat/map-s5p.h>

 arch/arm/mach-exynos/common.c                      |    5 +-
 arch/arm/mach-exynos/cpuidle.c                     |   25 +++++-
 arch/arm/mach-exynos/hotplug.c                     |    2 +-
 arch/arm/mach-exynos/include/mach/pm-core.h        |    5 +-
 arch/arm/mach-exynos/include/mach/regs-clock.h     |  372
----------------------------------------------------------------------------
-
 arch/arm/mach-exynos/include/mach/regs-irq.h       |   19 ----
 arch/arm/mach-exynos/mach-exynos5-dt.c             |    2 +-
 arch/arm/mach-exynos/platsmp.c                     |    3 +-
 arch/arm/mach-exynos/pm.c                          |   29 +++++-
 arch/arm/mach-exynos/pm_domains.c                  |    3 +-
 arch/arm/mach-exynos/pmu.c                         |    3 +-
 arch/arm/mach-exynos/{include/mach => }/regs-pmu.h |   53 -----------
 arch/arm/plat-samsung/pm.c                         |    2 +
 arch/arm/plat-samsung/s5p-irq-pm.c                 |    3 +
 drivers/cpufreq/exynos-cpufreq.h                   |   22 +++++
 drivers/cpufreq/exynos4210-cpufreq.c               |    2 -
 drivers/cpufreq/exynos4x12-cpufreq.c               |    2 -
 drivers/cpufreq/exynos5250-cpufreq.c               |    1 -
 drivers/devfreq/exynos/exynos4_bus.c               |    4 +-
 drivers/devfreq/exynos/exynos4_bus.h               |  110
+++++++++++++++++++++++
 20 files changed, 201 insertions(+), 466 deletions(-)
 delete mode 100644 arch/arm/mach-exynos/include/mach/regs-clock.h
 delete mode 100644 arch/arm/mach-exynos/include/mach/regs-irq.h
 rename arch/arm/mach-exynos/{include/mach => }/regs-pmu.h (88%)
 create mode 100644 drivers/devfreq/exynos/exynos4_bus.h

Thanks.
K-Gene.
