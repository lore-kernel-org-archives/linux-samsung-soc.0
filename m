From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 3/5] ASoC: samsung: i2s: Move saving and restoring regs to
 runtime pm operations
Date: Thu, 29 Dec 2016 12:34:05 +0100
Message-ID: <1483011247-21613-4-git-send-email-m.szyprowski@samsung.com>
References: <1483011247-21613-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20161229113427eucas1p166db5239bd7b17ebaba8b248f06cffe8@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:35877 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751839AbcL2Leb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 29 Dec 2016 06:34:31 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OIY00ELZ2TG6400@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 29 Dec 2016 11:34:28 +0000 (GMT)
In-reply-to: <1483011247-21613-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Mark Brown <broonie@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Inki Dae <inki.dae@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>

This patch moves saving and restoring I2S registers to runtime PM
operations, what prepares the driver to operate with audio power domain.
When support for audio power domain is enabled and the domain is being
turned off, the I2S module will loose its context (registers), so runtime
callbacks have to handle it. System sleep suspend/resume operation are
implemented on top of runtime PM operations with generic
pm_runtime_force_suspend/resume helpers.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 sound/soc/samsung/i2s.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 2aa800b99938..47a5650aaa66 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -983,24 +983,12 @@ static int i2s_set_clkdiv(struct snd_soc_dai *dai,
 #ifdef CONFIG_PM
 static int i2s_suspend(struct snd_soc_dai *dai)
 {
-	struct i2s_dai *i2s = to_info(dai);
-
-	i2s->suspend_i2smod = readl(i2s->addr + I2SMOD);
-	i2s->suspend_i2scon = readl(i2s->addr + I2SCON);
-	i2s->suspend_i2spsr = readl(i2s->addr + I2SPSR);
-
-	return 0;
+	return pm_runtime_force_suspend(dai->dev);
 }
 
 static int i2s_resume(struct snd_soc_dai *dai)
 {
-	struct i2s_dai *i2s = to_info(dai);
-
-	writel(i2s->suspend_i2scon, i2s->addr + I2SCON);
-	writel(i2s->suspend_i2smod, i2s->addr + I2SMOD);
-	writel(i2s->suspend_i2spsr, i2s->addr + I2SPSR);
-
-	return 0;
+	return pm_runtime_force_resume(dai->dev);
 }
 #else
 #define i2s_suspend NULL
@@ -1129,6 +1117,10 @@ static int i2s_runtime_suspend(struct device *dev)
 {
 	struct i2s_dai *i2s = dev_get_drvdata(dev);
 
+	i2s->suspend_i2smod = readl(i2s->addr + I2SMOD);
+	i2s->suspend_i2scon = readl(i2s->addr + I2SCON);
+	i2s->suspend_i2spsr = readl(i2s->addr + I2SPSR);
+
 	clk_disable_unprepare(i2s->clk);
 
 	return 0;
@@ -1140,6 +1132,10 @@ static int i2s_runtime_resume(struct device *dev)
 
 	clk_prepare_enable(i2s->clk);
 
+	writel(i2s->suspend_i2scon, i2s->addr + I2SCON);
+	writel(i2s->suspend_i2smod, i2s->addr + I2SMOD);
+	writel(i2s->suspend_i2spsr, i2s->addr + I2SPSR);
+
 	return 0;
 }
 #endif /* CONFIG_PM */
@@ -1516,6 +1512,8 @@ static int samsung_i2s_remove(struct platform_device *pdev)
 static const struct dev_pm_ops samsung_i2s_pm = {
 	SET_RUNTIME_PM_OPS(i2s_runtime_suspend,
 				i2s_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				     pm_runtime_force_resume)
 };
 
 static struct platform_driver samsung_i2s_driver = {
-- 
1.9.1
