From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: [PATCH] ARM: SAMSUNG: Add clk enable/disable of pwm
Date: Tue, 25 Oct 2011 10:21:41 +0900
Message-ID: <1319505701-9784-1-git-send-email-jy0922.shim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:40806 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756155Ab1JYBVm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 24 Oct 2011 21:21:42 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LTL004O6L3FF2L0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 25 Oct 2011 10:21:33 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
 by mmp2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTPA id <0LTL00J70L3XSH90@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 25 Oct 2011 10:21:33 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, ben-linux@fluff.org, kyungmin.park@samsung.com

PWM timers use pclk("timers" clk) as parent clk. If this pclk is the
disabled state when PWM driver is probed, then it causes wrong read and
write operation about registers of PWM.

Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/plat-samsung/pwm.c |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/arch/arm/plat-samsung/pwm.c b/arch/arm/plat-samsung/pwm.c
index f37457c..dc1185d 100644
--- a/arch/arm/plat-samsung/pwm.c
+++ b/arch/arm/plat-samsung/pwm.c
@@ -299,6 +299,9 @@ static int s3c_pwm_probe(struct platform_device *pdev)
 		goto err_clk_tin;
 	}
 
+	clk_enable(pwm->clk);
+	clk_enable(pwm->clk_div);
+
 	local_irq_save(flags);
 
 	tcon = __raw_readl(S3C2410_TCON);
@@ -326,6 +329,8 @@ static int s3c_pwm_probe(struct platform_device *pdev)
 	return 0;
 
  err_clk_tdiv:
+	clk_disable(pwm->clk_div);
+	clk_disable(pwm->clk);
 	clk_put(pwm->clk_div);
 
  err_clk_tin:
@@ -340,6 +345,8 @@ static int __devexit s3c_pwm_remove(struct platform_device *pdev)
 {
 	struct pwm_device *pwm = platform_get_drvdata(pdev);
 
+	clk_disable(pwm->clk_div);
+	clk_disable(pwm->clk);
 	clk_put(pwm->clk_div);
 	clk_put(pwm->clk);
 	kfree(pwm);
-- 
1.7.5.4
