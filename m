From: Huisung Kang <hs1218.kang@samsung.com>
Subject: [PATCH] ARM: SAMSUNG: Change clock gating method feature of pwm
Date: Fri, 10 Feb 2012 21:11:45 +0900
Message-ID: <016e01cce7ed$28972040$79c560c0$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ks_c_5601-1987
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:56472 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753924Ab2BJMLr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Feb 2012 07:11:47 -0500
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LZ600FVDF7MZ6W0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Feb 2012 21:11:46 +0900 (KST)
Received: from NOHS1218KAN01 ([12.23.118.150])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LZ600H29F7M9950@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Fri, 10 Feb 2012 21:11:46 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: =?ks_c_5601-1987?B?seixucH4?= <kgene.kim@samsung.com>


We don't need to enable the clock for pwm everytime after
probing. So, this patch moves its clock enabling/disabling
into the pwm_{enable,disable}().

Signed-off-by: Huisung Kang <hs1218.kang@samsung.com>
---
 arch/arm/plat-samsung/pwm.c |   36 +++++++++++++++++++++++++++---------
 1 files changed, 27 insertions(+), 9 deletions(-)

diff --git a/arch/arm/plat-samsung/pwm.c b/arch/arm/plat-samsung/pwm.c
index c559d84..3a604ca 100644
--- a/arch/arm/plat-samsung/pwm.c
+++ b/arch/arm/plat-samsung/pwm.c
@@ -110,13 +110,19 @@ int pwm_enable(struct pwm_device *pwm)
 
 	local_irq_save(flags);
 
-	tcon = __raw_readl(S3C2410_TCON);
-	tcon |= pwm_tcon_start(pwm);
-	__raw_writel(tcon, S3C2410_TCON);
+	if (!pwm->running) {
+		clk_enable(pwm->clk);
+		clk_enable(pwm->clk_div);
+
+		tcon = __raw_readl(S3C2410_TCON);
+		tcon |= pwm_tcon_start(pwm);
+		__raw_writel(tcon, S3C2410_TCON);
+
+		pwm->running = 1;
+	}
 
 	local_irq_restore(flags);
 
-	pwm->running = 1;
 	return 0;
 }
 
@@ -129,13 +135,17 @@ void pwm_disable(struct pwm_device *pwm)
 
 	local_irq_save(flags);
 
-	tcon = __raw_readl(S3C2410_TCON);
-	tcon &= ~pwm_tcon_start(pwm);
-	__raw_writel(tcon, S3C2410_TCON);
+	if (pwm->running) {
+		tcon = __raw_readl(S3C2410_TCON);
+		tcon &= ~pwm_tcon_start(pwm);
+		__raw_writel(tcon, S3C2410_TCON);
 
-	local_irq_restore(flags);
+		clk_disable(pwm->clk);
+		clk_disable(pwm->clk_div);
+		pwm->running = 0;
+	}
 
-	pwm->running = 0;
+	local_irq_restore(flags);
 }
 
 EXPORT_SYMBOL(pwm_disable);
@@ -185,6 +195,9 @@ int pwm_config(struct pwm_device *pwm, int duty_ns, int period_ns)
 	/* The TCMP and TCNT can be read without a lock, they're not
 	 * shared between the timers. */
 
+	clk_enable(pwm->clk);
+	clk_enable(pwm->clk_div);
+
 	tcmp = __raw_readl(S3C2410_TCMPB(pwm->pwm_id));
 	tcnt = __raw_readl(S3C2410_TCNTB(pwm->pwm_id));
 
@@ -242,6 +255,9 @@ int pwm_config(struct pwm_device *pwm, int duty_ns, int period_ns)
 
 	local_irq_restore(flags);
 
+	clk_disable(pwm->clk);
+	clk_disable(pwm->clk_div);
+
 	return 0;
 }
 
@@ -310,6 +326,8 @@ static int s3c_pwm_probe(struct platform_device *pdev)
 
 	local_irq_restore(flags);
 
+	clk_disable(pwm->clk);
+	clk_disable(pwm->clk_div);
 
 	ret = pwm_register(pwm);
 	if (ret) {
-- 
1.7.1
