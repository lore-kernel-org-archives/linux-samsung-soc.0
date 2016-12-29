From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 4/5] ASoC: samsung: i2s: Let runtime PM operations to control
 op_clk too
Date: Thu, 29 Dec 2016 12:34:06 +0100
Message-ID: <1483011247-21613-5-git-send-email-m.szyprowski@samsung.com>
References: <1483011247-21613-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20161229113427eucas1p20e91adee0da640e2a5847d53f3c6e443@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:53688 "EHLO
        mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752120AbcL2Lec (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 29 Dec 2016 06:34:32 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OIY00CKE2THJE00@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 29 Dec 2016 11:34:29 +0000 (GMT)
In-reply-to: <1483011247-21613-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Mark Brown <broonie@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Inki Dae <inki.dae@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>

This patch adds handling of parent operational clock to runtime PM
callbacks. This way it is ensured that when I2S module is in runtime
suspended state, all its parent clocks are disabled and unprepared.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 sound/soc/samsung/i2s.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 47a5650aaa66..07728b93f56e 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -546,6 +546,7 @@ static int i2s_set_sysclk(struct snd_soc_dai *dai,
 
 			if (WARN_ON(IS_ERR(i2s->op_clk))) {
 				ret = PTR_ERR(i2s->op_clk);
+				i2s->op_clk = NULL;
 				goto err;
 			}
 
@@ -1121,6 +1122,8 @@ static int i2s_runtime_suspend(struct device *dev)
 	i2s->suspend_i2scon = readl(i2s->addr + I2SCON);
 	i2s->suspend_i2spsr = readl(i2s->addr + I2SPSR);
 
+	if (i2s->op_clk)
+		clk_disable_unprepare(i2s->op_clk);
 	clk_disable_unprepare(i2s->clk);
 
 	return 0;
@@ -1131,6 +1134,8 @@ static int i2s_runtime_resume(struct device *dev)
 	struct i2s_dai *i2s = dev_get_drvdata(dev);
 
 	clk_prepare_enable(i2s->clk);
+	if (i2s->op_clk)
+		clk_prepare_enable(i2s->op_clk);
 
 	writel(i2s->suspend_i2scon, i2s->addr + I2SCON);
 	writel(i2s->suspend_i2smod, i2s->addr + I2SMOD);
-- 
1.9.1
