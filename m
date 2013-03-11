From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH -next] ARM: EXYNOS: remove duplicated include from common.c
Date: Mon, 11 Mar 2013 22:12:53 +0800
Message-ID: <CAPgLHd9eSiAne_f_8ctbXt8x+ET3v_1o=-gdO1D_11kxx2jo3g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:65430 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752041Ab3CKOMy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Mar 2013 10:12:54 -0400
Received: by mail-bk0-f46.google.com with SMTP id j5so1737365bkw.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Mar 2013 07:12:53 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, linux@arm.linux.org.uk
Cc: yongjun_wei@trendmicro.com.cn, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Remove duplicated include.

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 arch/arm/mach-exynos/common.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
index d63d399..01e4089 100644
--- a/arch/arm/mach-exynos/common.c
+++ b/arch/arm/mach-exynos/common.c
@@ -23,7 +23,6 @@
 #include <linux/of_irq.h>
 #include <linux/export.h>
 #include <linux/irqdomain.h>
-#include <linux/irqchip.h>
 #include <linux/of_address.h>
 #include <linux/irqchip/arm-gic.h>
 
