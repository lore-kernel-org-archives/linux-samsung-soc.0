From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: SAMSUNG: Fix the value of tcnt and tcmp for PWM
Date: Wed, 09 May 2012 20:36:34 +0900
Message-ID: <019201cd2dd7$feaf91f0$fc0eb5d0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:65471 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757892Ab2EILhO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 May 2012 07:37:14 -0400
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M3R008ZB6X78M30@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 09 May 2012 20:36:43 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M3R005US6X1XU20@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 09 May 2012 20:36:43 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org


According to PWM hardware spec, the actual period which
has been calculated by period and input clock is same
with (tcnt + 1), so need to down count for tcnt register.
And current PWM HW checks the compare register after
tcmp++ internally in hardware.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/plat-samsung/pwm.c |   23 +++++++++++++++++++----
 1 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/arch/arm/plat-samsung/pwm.c b/arch/arm/plat-samsung/pwm.c
index c559d84..88fdb1c 100644
--- a/arch/arm/plat-samsung/pwm.c
+++ b/arch/arm/plat-samsung/pwm.c
@@ -22,6 +22,7 @@
 
 #include <mach/map.h>
 
+#include <plat/cpu.h>
 #include <plat/regs-timer.h>
 
 struct pwm_device {
@@ -215,10 +216,24 @@ int pwm_config(struct pwm_device *pwm, int duty_ns, int period_ns)
 
 	tcmp = duty_ns / tin_ns;
 	tcmp = tcnt - tcmp;
-	/* the pwm hw only checks the compare register after a decrement,
-	   so the pin never toggles if tcmp = tcnt */
-	if (tcmp == tcnt)
-		tcmp--;
+
+	if (soc_is_s3c24xx()) {
+		/*
+		 * The S3C24XX PWM HW only checks the compare register after
+		 * a decrement, so the pin never toggles if tcmp = tcnt.
+		 */
+		if (tcmp == tcnt)
+			tcmp--;
+	} else {
+		/*
+		 * The other PWM HW checks the compare register after tcmp++
+		 * internally, so needs -2 for tcmp, and the actual period
+		 * which has been calculated by period_ns and tin_ns is same
+		 * with (tcnt + 1), so need to down count for tcnt register.
+		 */
+		tcmp = tcmp - 2;
+		tcnt--;
+	}
 
 	pwm_dbg(pwm, "tin_ns=%lu, tcmp=%ld/%lu\n", tin_ns, tcmp, tcnt);
 
-- 
1.7.1
