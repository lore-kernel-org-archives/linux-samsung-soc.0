From: Huisung Kang <hs1218.kang@samsung.com>
Subject: [PATCH 2/2] ARM: SAMSUNG: Use spin_lock_irq{save/restore} instead of
 local_irq_{save/restore}
Date: Fri, 10 Feb 2012 21:13:33 +0900
Message-ID: <016f01cce7ed$68871390$39953ab0$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ks_c_5601-1987
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:49414 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753924Ab2BJMNe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Feb 2012 07:13:34 -0500
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LZ600A21FALY2W0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Feb 2012 21:13:33 +0900 (KST)
Received: from NOHS1218KAN01 ([12.23.118.150])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LZ600HZ6FALL620@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Fri, 10 Feb 2012 21:13:33 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: =?ks_c_5601-1987?B?seixucH4L1MvVyBTb2x1dGlvbrCzud/GwChTLkxTSSkvUw==?= =?ks_c_5601-1987?B?NSjDpcDTKS+777y6wPzA2g==?= <kgene.kim@samsung.com>


Using spin_lock_irq{save/restore} is more stable on smp environment.

Signed-off-by: Huisung Kang <hs1218.kang@samsung.com>
---
 arch/arm/plat-samsung/pwm.c |   17 +++++++++--------
 1 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/arm/plat-samsung/pwm.c b/arch/arm/plat-samsung/pwm.c
index 3a604ca..7e24754 100644
--- a/arch/arm/plat-samsung/pwm.c
+++ b/arch/arm/plat-samsung/pwm.c
@@ -44,6 +44,7 @@ struct pwm_device {
 #define pwm_dbg(_pwm, msg...) dev_dbg(&(_pwm)->pdev->dev, msg)
 
 static struct clk *clk_scaler[2];
+static DEFINE_SPINLOCK(pwm_spin_lock);
 
 static inline int pwm_is_tdiv(struct pwm_device *pwm)
 {
@@ -108,7 +109,7 @@ int pwm_enable(struct pwm_device *pwm)
 	unsigned long flags;
 	unsigned long tcon;
 
-	local_irq_save(flags);
+	spin_lock_irqsave(&pwm_spin_lock, flags);
 
 	if (!pwm->running) {
 		clk_enable(pwm->clk);
@@ -121,7 +122,7 @@ int pwm_enable(struct pwm_device *pwm)
 		pwm->running = 1;
 	}
 
-	local_irq_restore(flags);
+	spin_unlock_irqrestore(&pwm_spin_lock, flags);
 
 	return 0;
 }
@@ -133,7 +134,7 @@ void pwm_disable(struct pwm_device *pwm)
 	unsigned long flags;
 	unsigned long tcon;
 
-	local_irq_save(flags);
+	spin_lock_irqsave(&pwm_spin_lock, flags);
 
 	if (pwm->running) {
 		tcon = __raw_readl(S3C2410_TCON);
@@ -145,7 +146,7 @@ void pwm_disable(struct pwm_device *pwm)
 		pwm->running = 0;
 	}
 
-	local_irq_restore(flags);
+	spin_unlock_irqrestore(&pwm_spin_lock, flags);
 }
 
 EXPORT_SYMBOL(pwm_disable);
@@ -240,7 +241,7 @@ int pwm_config(struct pwm_device *pwm, int duty_ns, int period_ns)
 
 	/* Update the PWM register block. */
 
-	local_irq_save(flags);
+	spin_lock_irqsave(&pwm_spin_lock, flags);
 
 	__raw_writel(tcmp, S3C2410_TCMPB(pwm->pwm_id));
 	__raw_writel(tcnt, S3C2410_TCNTB(pwm->pwm_id));
@@ -253,7 +254,7 @@ int pwm_config(struct pwm_device *pwm, int duty_ns, int period_ns)
 	tcon &= ~pwm_tcon_manulupdate(pwm);
 	__raw_writel(tcon, S3C2410_TCON);
 
-	local_irq_restore(flags);
+	spin_unlock_irqrestore(&pwm_spin_lock, flags);
 
 	clk_disable(pwm->clk);
 	clk_disable(pwm->clk_div);
@@ -318,13 +319,13 @@ static int s3c_pwm_probe(struct platform_device *pdev)
 	clk_enable(pwm->clk);
 	clk_enable(pwm->clk_div);
 
-	local_irq_save(flags);
+	spin_lock_irqsave(&pwm_spin_lock, flags);
 
 	tcon = __raw_readl(S3C2410_TCON);
 	tcon |= pwm_tcon_invert(pwm);
 	__raw_writel(tcon, S3C2410_TCON);
 
-	local_irq_restore(flags);
+	spin_unlock_irqrestore(&pwm_spin_lock, flags);
 
 	clk_disable(pwm->clk);
 	clk_disable(pwm->clk_div);
-- 
1.7.1
