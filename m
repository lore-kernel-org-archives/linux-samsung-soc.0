From: Wang Jing <windsdaemon@gmail.com>
Subject: [PATCH] sound: use PTR_ERR to fix the value of the return
Date: Tue, 13 Nov 2012 20:19:00 +0800
Message-ID: <1352809140-4214-1-git-send-email-windsdaemon@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:43168 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751828Ab2KMMTW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 Nov 2012 07:19:22 -0500
Received: by mail-pb0-f46.google.com with SMTP id rr4so5074836pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Nov 2012 04:19:21 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org

From: wangjing <wangjing@wangjing.(none)>

This patch use the macro PTR_ERR to modify the value of the return

Signed-off-by: wangjing <wangjing@wangjing.(none)>
---
 sound/soc/samsung/smdk_spdif.c |   30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/sound/soc/samsung/smdk_spdif.c b/sound/soc/samsung/smdk_spdif.c
index beaa9c1..8f78482 100644
--- a/sound/soc/samsung/smdk_spdif.c
+++ b/sound/soc/samsung/smdk_spdif.c
@@ -28,32 +28,29 @@ static int set_audio_clock_heirachy(struct platform_device *pdev)
 
 	fout_epll = clk_get(NULL, "fout_epll");
 	if (IS_ERR(fout_epll)) {
-		printk(KERN_WARNING "%s: Cannot find fout_epll.\n",
-				__func__);
-		return -EINVAL;
+		printk(KERN_ERR "%s: Cannot find fout_epll.\n", __func__);
+		ret = PTR_ERR(fout_epll);
+		return ret;
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
 
@@ -81,11 +78,13 @@ static int set_audio_clock_rate(unsigned long epll_rate,
 				unsigned long audio_rate)
 {
 	struct clk *fout_epll, *sclk_spdif;
+	int ret = 0;
 
 	fout_epll = clk_get(NULL, "fout_epll");
 	if (IS_ERR(fout_epll)) {
 		printk(KERN_ERR "%s: failed to get fout_epll\n", __func__);
-		return -ENOENT;
+		ret = PTR_ERR(fout_epll);
+		return ret;
 	}
 
 	clk_set_rate(fout_epll, epll_rate);
@@ -94,13 +93,14 @@ static int set_audio_clock_rate(unsigned long epll_rate,
 	sclk_spdif = clk_get(NULL, "sclk_spdif");
 	if (IS_ERR(sclk_spdif)) {
 		printk(KERN_ERR "%s: failed to get sclk_spdif\n", __func__);
-		return -ENOENT;
+		ret = PTR_ERR(sclk_spdif);
+		return ret;
 	}
 
 	clk_set_rate(sclk_spdif, audio_rate);
 	clk_put(sclk_spdif);
 
-	return 0;
+	return ret;
 }
 
 static int smdk_hw_params(struct snd_pcm_substream *substream,
-- 
1.7.9.5
