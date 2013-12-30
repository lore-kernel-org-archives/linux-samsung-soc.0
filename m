From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH 7/9] ARM: EXYNOS: Replace inclusion of plat/regs-serial.h header file
Date: Mon, 30 Dec 2013 15:30:38 +0530
Message-ID: <1388397640-720-8-git-send-email-tushar.behera@linaro.org>
References: <1388397640-720-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f41.google.com ([209.85.220.41]:42061 "EHLO
	mail-pa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754424Ab3L3KEh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Dec 2013 05:04:37 -0500
Received: by mail-pa0-f41.google.com with SMTP id lf10so11498717pab.14
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Dec 2013 02:04:36 -0800 (PST)
In-Reply-To: <1388397640-720-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 arch/arm/mach-exynos/common.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
index 09e6898..d585cb6 100644
--- a/arch/arm/mach-exynos/common.c
+++ b/arch/arm/mach-exynos/common.c
@@ -20,6 +20,7 @@
 #include <clocksource/samsung_pwm.h>
 #include <linux/sched.h>
 #include <linux/serial_core.h>
+#include <linux/serial_s3c.h>
 #include <linux/of.h>
 #include <linux/of_fdt.h>
 #include <linux/of_irq.h>
@@ -40,7 +41,6 @@
 
 #include <plat/cpu.h>
 #include <plat/pm.h>
-#include <plat/regs-serial.h>
 
 #include "common.h"
 #include "regs-pmu.h"
-- 
1.7.9.5
