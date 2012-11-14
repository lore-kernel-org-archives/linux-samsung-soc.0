From: Jing Wang <windsdaemon@gmail.com>
Subject: [PATCH] SOC/SAMSUNG: use PTR_ERR to fix the value of return
Date: Wed, 14 Nov 2012 14:52:48 +0800
Message-ID: <1352875968-23319-1-git-send-email-windsdaemon@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:53889 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754221Ab2KNGxr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Nov 2012 01:53:47 -0500
Received: by mail-pa0-f46.google.com with SMTP id hz1so94919pad.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Nov 2012 22:53:46 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Jing Wang <windsdaemon@gmail.com>

From: Jing Wang <windsdaemon@gmail.com>

This patch use the macro PTR_ERR to fix the value of the return and change KERN_WARNING to KERN_ERR

Signed-off-by: Jing Wang <windsdaemon@gmail.com>
---
 sound/soc/samsung/smdk_spdif.c |   24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/sound/soc/samsung/smdk_spdif.c b/sound/soc/samsung/smdk_spdif.c
index beaa9c1..4000a63 100644
--- a/sound/soc/samsung/smdk_spdif.c
+++ b/sound/soc/samsung/smdk_spdif.c
@@ -28,32 +28,28 @@ static int set_audio_clock_heirachy(struct platform_device *pdev)
 
 	fout_epll = clk_get(NULL, "fout_epll");
 	if (IS_ERR(fout_epll)) {
-		printk(KERN_WARNING "%s: Cannot find fout_epll.\n",
-				__func__);
-		return -EINVAL;
+		printk(KERN_ERR "%s: Cannot find fout_epll.\n", __func__);
+		return PTR_ERR(fout_epll);
 	}
 
 	mout_epll = clk_get(NULL, "mout_epll");
 	if (IS_ERR(mout_epll)) {
-		printk(KERN_WARNING "%s: Cannot find mout_epll.\n",
-				__func__);
-		ret = -EINVAL;
+		printk(KERN_ERR "%s: Cannot find mout_epll.\n", __func__);
+		ret = PTR_ERR(mout_epll);
 		goto out1;
 	}
 
 	sclk_audio0 = clk_get(&pdev->dev, "sclk_audio");
 	if (IS_ERR(sclk_audio0)) {
-		printk(KERN_WARNING "%s: Cannot find sclk_audio.\n",
-				__func__);
-		ret = -EINVAL;
+		printk(KERN_ERR "%s: Cannot find sclk_audio.\n", __func__);
+		ret = PTR_ERR(sclk_audio0);
 		goto out2;
 	}
 
 	sclk_spdif = clk_get(NULL, "sclk_spdif");
 	if (IS_ERR(sclk_spdif)) {
-		printk(KERN_WARNING "%s: Cannot find sclk_spdif.\n",
-				__func__);
-		ret = -EINVAL;
+		printk(KERN_ERR "%s: Cannot find sclk_spdif.\n", __func__);
+		ret = PTR_ERR(sclk_spdif);
 		goto out3;
 	}
 
@@ -85,7 +81,7 @@ static int set_audio_clock_rate(unsigned long epll_rate,
 	fout_epll = clk_get(NULL, "fout_epll");
 	if (IS_ERR(fout_epll)) {
 		printk(KERN_ERR "%s: failed to get fout_epll\n", __func__);
-		return -ENOENT;
+		return PTR_ERR(fout_epll);
 	}
 
 	clk_set_rate(fout_epll, epll_rate);
@@ -94,7 +90,7 @@ static int set_audio_clock_rate(unsigned long epll_rate,
 	sclk_spdif = clk_get(NULL, "sclk_spdif");
 	if (IS_ERR(sclk_spdif)) {
 		printk(KERN_ERR "%s: failed to get sclk_spdif\n", __func__);
-		return -ENOENT;
+		return PTR_ERR(sclk_spdif);
 	}
 
 	clk_set_rate(sclk_spdif, audio_rate);
-- 
1.7.9.5
