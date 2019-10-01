Return-Path: <SRS0=5wrF=X2=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7A22C352AA
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  1 Oct 2019 11:42:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AF8CC21855
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  1 Oct 2019 11:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1569930160;
	bh=Z8UaP+FYgk6UJ/p/+/9Ku1ARxGlwDd74D+saNRnNZZg=;
	h=From:To:Cc:Subject:In-Reply-To:Date:List-ID:From;
	b=aNUfHWj/tlGEQAkUhyyndCKPtZTeZYwtxEC/40Eru/0FpVe73gEy5tbtsggVlKsBk
	 GGukDKBmWZ5a+5sNk/uCiAYsNj8b2Ufwjg2kbR/23dgphcmDUyM02rXQCkv2911Y+h
	 nf/GzHwiIaovARNQCop43fDD8y+Oj+zAsA7xQfR8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387531AbfJALlA (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 1 Oct 2019 07:41:00 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:40644 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387507AbfJALk7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 1 Oct 2019 07:40:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
        Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
        List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
        List-Archive; bh=wF9PhMGH+Lj8JE4h4I6EzLCX3sM3u3HxgVYZ38hhRes=; b=uba1xh6IxCh3
        mNCRfDNXG4p3kkva09171A1GXfohYxq+9sSRvGfn+542pH8dR2h9H0hjiJN07JU0+1aK/H5eihoAh
        aFQ7plk/mdhJk498J3sKpffCyYW0lx1XBGMIoyJHDoSSZWj7xhdl5tQuE+Chw1kHVHSnMhh6GO9Yj
        sXO4s=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iFGWR-0004Ur-Ew; Tue, 01 Oct 2019 11:40:51 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id DE1BD2742A30; Tue,  1 Oct 2019 12:40:50 +0100 (BST)
From:   Mark Brown <broonie@kernel.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     alsa-devel@alsa-project.org, broonie@kernel.org,
        b.zolnierkie@samsung.com, ckeepax@opensource.cirrus.com,
        devicetree@vger.kernel.org, krzk@kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>, lgirdwood@gmail.com,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        m.szyprowski@samsung.com, patches@opensource.cirrus.com,
        robh+dt@kernel.org, sbkim73@samsung.com
Subject: Applied "ASoC: wm8994: Add support for setting MCLK clock rate" to the asoc tree
In-Reply-To: <20190920130218.32690-4-s.nawrocki@samsung.com>
X-Patchwork-Hint: ignore
Message-Id: <20191001114050.DE1BD2742A30@ypsilon.sirena.org.uk>
Date:   Tue,  1 Oct 2019 12:40:50 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20191001114050.ymaVqHDhxqh6KXka5VWYeHYgqC5EY8iGSktxDXMgLYI@z>

The patch

   ASoC: wm8994: Add support for setting MCLK clock rate

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 419e2f50833661cec15200d5ee7385daee733667 Mon Sep 17 00:00:00 2001
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Date: Fri, 20 Sep 2019 15:02:12 +0200
Subject: [PATCH] ASoC: wm8994: Add support for setting MCLK clock rate

Extend the set_sysclk() handler so we also set frequency of the MCLK1,
MCLK2 clocks through clk API when those clocks are specified in DT.

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Link: https://lore.kernel.org/r/20190920130218.32690-4-s.nawrocki@samsung.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm8994.c | 48 +++++++++++++++++++++++++++++++++++----
 sound/soc/codecs/wm8994.h | 10 +++++++-
 2 files changed, 52 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
index c3d06e8bc54f..35fbaa0138bf 100644
--- a/sound/soc/codecs/wm8994.c
+++ b/sound/soc/codecs/wm8994.c
@@ -167,12 +167,12 @@ static int configure_aif_clock(struct snd_soc_component *component, int aif)
 
 	switch (wm8994->sysclk[aif]) {
 	case WM8994_SYSCLK_MCLK1:
-		rate = wm8994->mclk[0];
+		rate = wm8994->mclk_rate[0];
 		break;
 
 	case WM8994_SYSCLK_MCLK2:
 		reg1 |= 0x8;
-		rate = wm8994->mclk[1];
+		rate = wm8994->mclk_rate[1];
 		break;
 
 	case WM8994_SYSCLK_FLL1:
@@ -2367,12 +2367,29 @@ static int wm8994_set_fll(struct snd_soc_dai *dai, int id, int src,
 	return _wm8994_set_fll(dai->component, id, src, freq_in, freq_out);
 }
 
+static int wm8994_set_mclk_rate(struct wm8994_priv *wm8994, unsigned int id,
+				unsigned int *freq)
+{
+	int ret;
+
+	if (!wm8994->mclk[id].clk || *freq == wm8994->mclk_rate[id])
+		return 0;
+
+	ret = clk_set_rate(wm8994->mclk[id].clk, *freq);
+	if (ret < 0)
+		return ret;
+
+	*freq = clk_get_rate(wm8994->mclk[id].clk);
+
+	return 0;
+}
+
 static int wm8994_set_dai_sysclk(struct snd_soc_dai *dai,
 		int clk_id, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = dai->component;
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
-	int i;
+	int ret, i;
 
 	switch (dai->id) {
 	case 1:
@@ -2387,7 +2404,12 @@ static int wm8994_set_dai_sysclk(struct snd_soc_dai *dai,
 	switch (clk_id) {
 	case WM8994_SYSCLK_MCLK1:
 		wm8994->sysclk[dai->id - 1] = WM8994_SYSCLK_MCLK1;
-		wm8994->mclk[0] = freq;
+
+		ret = wm8994_set_mclk_rate(wm8994, dai->id - 1, &freq);
+		if (ret < 0)
+			return ret;
+
+		wm8994->mclk_rate[0] = freq;
 		dev_dbg(dai->dev, "AIF%d using MCLK1 at %uHz\n",
 			dai->id, freq);
 		break;
@@ -2395,7 +2417,12 @@ static int wm8994_set_dai_sysclk(struct snd_soc_dai *dai,
 	case WM8994_SYSCLK_MCLK2:
 		/* TODO: Set GPIO AF */
 		wm8994->sysclk[dai->id - 1] = WM8994_SYSCLK_MCLK2;
-		wm8994->mclk[1] = freq;
+
+		ret = wm8994_set_mclk_rate(wm8994, dai->id - 1, &freq);
+		if (ret < 0)
+			return ret;
+
+		wm8994->mclk_rate[1] = freq;
 		dev_dbg(dai->dev, "AIF%d using MCLK2 at %uHz\n",
 			dai->id, freq);
 		break;
@@ -4447,6 +4474,7 @@ static const struct snd_soc_component_driver soc_component_dev_wm8994 = {
 static int wm8994_probe(struct platform_device *pdev)
 {
 	struct wm8994_priv *wm8994;
+	int ret;
 
 	wm8994 = devm_kzalloc(&pdev->dev, sizeof(struct wm8994_priv),
 			      GFP_KERNEL);
@@ -4458,6 +4486,16 @@ static int wm8994_probe(struct platform_device *pdev)
 
 	wm8994->wm8994 = dev_get_drvdata(pdev->dev.parent);
 
+	wm8994->mclk[WM8994_MCLK1].id = "MCLK1";
+	wm8994->mclk[WM8994_MCLK2].id = "MCLK2";
+
+	ret = devm_clk_bulk_get_optional(pdev->dev.parent, ARRAY_SIZE(wm8994->mclk),
+					 wm8994->mclk);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "Failed to get clocks: %d\n", ret);
+		return ret;
+	}
+
 	pm_runtime_enable(&pdev->dev);
 	pm_runtime_idle(&pdev->dev);
 
diff --git a/sound/soc/codecs/wm8994.h b/sound/soc/codecs/wm8994.h
index 1d6f2abe1c11..41c4b126114d 100644
--- a/sound/soc/codecs/wm8994.h
+++ b/sound/soc/codecs/wm8994.h
@@ -6,6 +6,7 @@
 #ifndef _WM8994_H
 #define _WM8994_H
 
+#include <linux/clk.h>
 #include <sound/soc.h>
 #include <linux/firmware.h>
 #include <linux/completion.h>
@@ -14,6 +15,12 @@
 
 #include "wm_hubs.h"
 
+enum {
+	WM8994_MCLK1,
+	WM8994_MCLK2,
+	WM8994_NUM_MCLK
+};
+
 /* Sources for AIF1/2 SYSCLK - use with set_dai_sysclk() */
 #define WM8994_SYSCLK_MCLK1 1
 #define WM8994_SYSCLK_MCLK2 2
@@ -73,9 +80,10 @@ struct wm8994;
 struct wm8994_priv {
 	struct wm_hubs_data hubs;
 	struct wm8994 *wm8994;
+	struct clk_bulk_data mclk[WM8994_NUM_MCLK];
 	int sysclk[2];
 	int sysclk_rate[2];
-	int mclk[2];
+	int mclk_rate[2];
 	int aifclk[2];
 	int aifdiv[2];
 	int channels[2];
-- 
2.20.1

