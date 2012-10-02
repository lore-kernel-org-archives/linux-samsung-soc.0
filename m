From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH] ASoC: SAMSUNG: ac97: use clk_prepare_enable and clk_disable_unprepare
Date: Wed,  3 Oct 2012 08:46:01 +0900
Message-ID: <1349221561-2896-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:53061 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756730Ab2JBXsw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 2 Oct 2012 19:48:52 -0400
Received: by padhz1 with SMTP id hz1so5726012pad.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 02 Oct 2012 16:48:51 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: alsa-devel@alsa-project.org
Cc: lrg@ti.com, broonie@opensource.wolfsonmicro.com, jassisinghbrar@gmail.com, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org

Convert clk_enable/clk_disable to clk_prepare_enable/clk_disable_unprepare
calls as required by common clock framework.

Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
---
 sound/soc/samsung/ac97.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/samsung/ac97.c b/sound/soc/samsung/ac97.c
index 14fbcd3..386bab1 100644
--- a/sound/soc/samsung/ac97.c
+++ b/sound/soc/samsung/ac97.c
@@ -442,7 +442,7 @@ static __devinit int s3c_ac97_probe(struct platform_device *pdev)
 		ret = -ENODEV;
 		goto err2;
 	}
-	clk_enable(s3c_ac97.ac97_clk);
+	clk_prepare_enable(s3c_ac97.ac97_clk);
 
 	if (ac97_pdata->cfg_gpio(pdev)) {
 		dev_err(&pdev->dev, "Unable to configure gpio\n");
@@ -468,7 +468,7 @@ err5:
 	free_irq(irq_res->start, NULL);
 err4:
 err3:
-	clk_disable(s3c_ac97.ac97_clk);
+	clk_disable_unprepare(s3c_ac97.ac97_clk);
 	clk_put(s3c_ac97.ac97_clk);
 err2:
 	iounmap(s3c_ac97.regs);
@@ -488,7 +488,7 @@ static __devexit int s3c_ac97_remove(struct platform_device *pdev)
 	if (irq_res)
 		free_irq(irq_res->start, NULL);
 
-	clk_disable(s3c_ac97.ac97_clk);
+	clk_disable_unprepare(s3c_ac97.ac97_clk);
 	clk_put(s3c_ac97.ac97_clk);
 
 	iounmap(s3c_ac97.regs);
-- 
1.7.4.1
