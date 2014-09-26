From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v5 RESEND 1/3] ARM: EXYNOS: Move code from hotplug.c to platsmp.c
Date: Fri, 26 Sep 2014 23:13:26 +0200
Message-ID: <201409262313.26272.arnd@arndb.de>
References: <1409920495-16533-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.24]:56301 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756247AbaIZVNv convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 26 Sep 2014 17:13:51 -0400
In-Reply-To: <1409920495-16533-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Sachin Kamat <sachin.kamat@linaro.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>

On Friday 05 September 2014, Krzysztof Kozlowski wrote:
> The commit only moves code around with one additional observable change:
> the hotplug.c was compiled with custom CFLAGS (-march=armv7-a). These
> CFLAGS are not necessary any more.

This turns out to be wrong, and your change broke 'allmodconfig' builds
in linux-next. Please apply this patch on top.

	Arnd

8<----------
>From 4ba6bf8806caec386e35930314dbad071284c837 Mon Sep 17 00:00:00 2001
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 26 Sep 2014 23:09:38 +0200
Subject: [PATCH] ARM: EXYNOS: fix build error in platsmp.c

/tmp/ccYeWL3V.s: Assembler messages:
/tmp/ccYeWL3V.s:659: Error: selected processor does not support ARM mode `isb '
/tmp/ccYeWL3V.s:664: Error: selected processor does not support ARM mode `isb '
/tmp/ccYeWL3V.s:665: Error: selected processor does not support ARM mode `dsb '
make[3]: *** [arch/arm/mach-exynos/platsmp.o] Error 1

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Fixes: 17342534e1d932 ("ARM: EXYNOS: Move code from hotplug.c to platsmp.c")

diff --git a/arch/arm/mach-exynos/Makefile b/arch/arm/mach-exynos/Makefile
index 4e49d4efb264..64324bf5edb4 100644
--- a/arch/arm/mach-exynos/Makefile
+++ b/arch/arm/mach-exynos/Makefile
@@ -21,6 +21,7 @@ obj-$(CONFIG_PM_SLEEP)		+= suspend.o
 obj-$(CONFIG_PM_GENERIC_DOMAINS) += pm_domains.o
 
 obj-$(CONFIG_SMP)		+= platsmp.o headsmp.o
+CFLAGS_platsmp.o		:= -march=armv7-a
 
 plus_sec := $(call as-instr,.arch_extension sec,+sec)
 AFLAGS_exynos-smc.o		:=-Wa,-march=armv7-a$(plus_sec)
