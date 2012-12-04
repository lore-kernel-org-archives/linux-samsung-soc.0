From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH -next] ARM: EXYNOS: remove duplicated include from mach-exynos5-dt.c
Date: Tue, 4 Dec 2012 03:29:14 -0500
Message-ID: <CAPgLHd9_QOV0GA3b2h7dTXQS7P17cP0mw2iD_KsEZYpPtwu8RA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f174.google.com ([209.85.216.174]:34252 "EHLO
	mail-qc0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751723Ab2LDI3P (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 Dec 2012 03:29:15 -0500
Received: by mail-qc0-f174.google.com with SMTP id o22so1989034qcr.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 04 Dec 2012 00:29:14 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, linux@arm.linux.org.uk
Cc: yongjun_wei@trendmicro.com.cn, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Remove duplicated include.

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 arch/arm/mach-exynos/mach-exynos5-dt.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/mach-exynos/mach-exynos5-dt.c b/arch/arm/mach-exynos/mach-exynos5-dt.c
index 45988fd..087f2df 100644
--- a/arch/arm/mach-exynos/mach-exynos5-dt.c
+++ b/arch/arm/mach-exynos/mach-exynos5-dt.c
@@ -14,7 +14,6 @@
 #include <linux/serial_core.h>
 #include <linux/io.h>
 #include <linux/memblock.h>
-#include <linux/of_fdt.h>
 
 #include <asm/mach/arch.h>
 #include <asm/hardware/gic.h>
