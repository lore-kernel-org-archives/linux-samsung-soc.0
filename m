From: Tomasz Figa <t.figa@samsung.com>
Subject: linux-next build failures with ARCH_EXYNOS
Date: Wed, 27 Mar 2013 14:10:08 +0100
Message-ID: <1531058.rMXo5ayaeE@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:13558 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751972Ab3C0NKT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Mar 2013 09:10:19 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MKB008BTLWUB6S0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 27 Mar 2013 22:10:17 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, kyungmin.park@samsung.com, m.szyprowski@samsung.com, thomas.abraham@linaro.org

Hi,

I'm experiencing several kernel build failures when building linux-next 
(next-20130327) for ARCH_EXYNOS.

Using unmodified exynos_defconfig:

  CC      drivers/clocksource/exynos_mct.o
drivers/clocksource/exynos_mct.c:557:1: warning: comparison of distinct 
pointer types lacks a cast
drivers/clocksource/exynos_mct.c:558:1: error: expected ',' or ';' before 
'static'
make[2]: *** [drivers/clocksource/exynos_mct.o] Error 1
make[1]: *** [drivers/clocksource] Error 2
make: *** [drivers] Error 2

Mentioned lines are introduced by commit 9fbf0c85a1 .

In addition, after enabling CONFIG_ARM_EXYNOS_CPUFREQ I'm getting following 
compilation errors:

  CC      drivers/cpufreq/exynos5250-cpufreq.o
drivers/cpufreq/exynos5250-cpufreq.c: In function 'set_clkdiv':
drivers/cpufreq/exynos5250-cpufreq.c:91:20: error: 'EXYNOS5_CLKDIV_CPU0' 
undeclared (first use in this function)
drivers/cpufreq/exynos5250-cpufreq.c:91:20: note: each undeclared identifier is 
reported only once for each function it appears in
drivers/cpufreq/exynos5250-cpufreq.c:93:21: error: 'EXYNOS5_CLKDIV_STATCPU0' 
undeclared (first use in this function)
drivers/cpufreq/exynos5250-cpufreq.c:99:20: error: 'EXYNOS5_CLKDIV_CPU1' 
undeclared (first use in this function)
drivers/cpufreq/exynos5250-cpufreq.c:101:21: error: 'EXYNOS5_CLKDIV_STATCPU1' 
undeclared (first use in this function)
drivers/cpufreq/exynos5250-cpufreq.c: In function 'set_apll':
drivers/cpufreq/exynos5250-cpufreq.c:115:22: error: 'EXYNOS5_CLKMUX_STATCPU' 
undeclared (first use in this function)
drivers/cpufreq/exynos5250-cpufreq.c:122:29: error: 'EXYNOS5_APLL_LOCK' 
undeclared (first use in this function)
drivers/cpufreq/exynos5250-cpufreq.c:125:20: error: 'EXYNOS5_APLL_CON0' 
undeclared (first use in this function)
drivers/cpufreq/exynos5250-cpufreq.c: In function 'exynos5250_set_frequency':
drivers/cpufreq/exynos5250-cpufreq.c:165:22: error: 'EXYNOS5_APLL_CON0' 
undeclared (first use in this function)
make[2]: *** [drivers/cpufreq/exynos5250-cpufreq.o] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [drivers/cpufreq] Error 2
make: *** [drivers] Error 2

This seems to be caused by commit 6e6aac7590 removing definitions of mentioned 
registers from arch/arm/mach-exynos/include/mach/regs-clock.h header.

Best regards,
-- 
Tomasz Figa
Samsung Poland R&D Center
SW Solution Development, Kernel and System Framework
