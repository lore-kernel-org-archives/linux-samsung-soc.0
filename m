From: Abhilash Kesavan <a.kesavan@samsung.com>
Subject: [PATCH] arm: exynos: Fix "allmodconfig" build errors in mcpm and
 hotplug
Date: Mon, 26 May 2014 11:24:56 +0530
Message-ID: <1401083696-25702-1-git-send-email-a.kesavan@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:33499 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750951AbaEZFx0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 May 2014 01:53:26 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N66001SR311RWE0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 26 May 2014 14:53:25 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, t.figa@samsung.com
Cc: Abhilash Kesavan <a.kesavan@samsung.com>

This fixes the following build errors:

/tmp/ccRbZlaA.s: Assembler messages:
/tmp/ccRbZlaA.s:69: Error: selected processor does not support ARM mode `isb '
/tmp/ccRbZlaA.s:75: Error: selected processor does not support ARM mode `isb '
/tmp/ccRbZlaA.s:76: Error: selected processor does not support ARM mode `dsb '
make[1]: *** [arch/arm/mach-exynos/hotplug.o] Error 1

/tmp/ccJEg4jw.s: Assembler messages:
/tmp/ccJEg4jw.s:454: Error: selected processor does not support ARM mode `isb'
/tmp/ccJEg4jw.s:455: Error: selected processor does not support ARM mode `dsb'
/tmp/ccJEg4jw.s:465: Error: selected processor does not support ARM mode `isb'
/tmp/ccJEg4jw.s:474: Error: selected processor does not support ARM mode `isb'
/tmp/ccJEg4jw.s:475: Error: selected processor does not support ARM mode `dsb'
/tmp/ccJEg4jw.s:516: Error: selected processor does not support ARM mode `isb'
/tmp/ccJEg4jw.s:525: Error: selected processor does not support ARM mode `isb'
/tmp/ccJEg4jw.s:526: Error: selected processor does not support ARM mode `dsb'
make[1]: *** [arch/arm/mach-exynos/mcpm-exynos.o] Error 1

Reported-by: Sachin Kamat <sachin.kamat@linaro.org>
Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
---
 arch/arm/mach-exynos/Makefile |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mach-exynos/Makefile b/arch/arm/mach-exynos/Makefile
index 6f36086..788f26d 100644
--- a/arch/arm/mach-exynos/Makefile
+++ b/arch/arm/mach-exynos/Makefile
@@ -22,8 +22,10 @@ obj-$(CONFIG_PM_GENERIC_DOMAINS) += pm_domains.o
 obj-$(CONFIG_SMP)		+= platsmp.o headsmp.o
 
 obj-$(CONFIG_HOTPLUG_CPU)	+= hotplug.o
+CFLAGS_hotplug.o		+= -march=armv7-a
 
 plus_sec := $(call as-instr,.arch_extension sec,+sec)
 AFLAGS_exynos-smc.o		:=-Wa,-march=armv7-a$(plus_sec)
 
 obj-$(CONFIG_EXYNOS5420_MCPM)	+= mcpm-exynos.o
+CFLAGS_mcpm-exynos.o		+= -march=armv7-a
-- 
1.7.9.5
