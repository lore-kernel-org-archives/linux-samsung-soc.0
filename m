Return-Path: <SRS0=sIcv=X3=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8E18C35280
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  2 Oct 2019 10:57:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7EA4C21783
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  2 Oct 2019 10:57:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="RYd4qBpK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727987AbfJBK5O (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 2 Oct 2019 06:57:14 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:52020 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726157AbfJBK5O (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 2 Oct 2019 06:57:14 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20191002105712euoutp02aca6da75e1b373fef7250523f8098884~Jz0MX7Crm2169821698euoutp02Z
        for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Oct 2019 10:57:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20191002105712euoutp02aca6da75e1b373fef7250523f8098884~Jz0MX7Crm2169821698euoutp02Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1570013832;
        bh=JKUgJmIBdrp6LGKbDKmIjCJNaR3zlarn3qoVxpc53Xs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RYd4qBpKdB69nIY57AffDfLjcT6ttvloxu0DtQAnRsv3hqTj4om22Tf03t/Mmv2DN
         PNsNvW1YGzlvHe5iscv62QThCji//YXVevuCiWRPBjoFiomJ7vcxw99gk6AFlqWajv
         cG7+b/58vMF1Z5ItmuzD93tphPwbSWdxjd7NyBGU=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20191002105711eucas1p1b532f453b23420a69b6070ecae32c799~Jz0MBz19g1834918349eucas1p1b;
        Wed,  2 Oct 2019 10:57:11 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 50.4F.04469.782849D5; Wed,  2
        Oct 2019 11:57:11 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20191002105711eucas1p199322dc928a0ea4724fe0e0f5e6cb156~Jz0LxfDlz1786817868eucas1p1D;
        Wed,  2 Oct 2019 10:57:11 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20191002105711eusmtrp1ad17d5b1849c365a52fc32651664bc0a~Jz0Lw5jtN0038900389eusmtrp1b;
        Wed,  2 Oct 2019 10:57:11 +0000 (GMT)
X-AuditID: cbfec7f2-54fff70000001175-af-5d9482871dd9
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 8F.15.04117.782849D5; Wed,  2
        Oct 2019 11:57:11 +0100 (BST)
Received: from AMDC3061.DIGITAL.local (unknown [106.120.51.75]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20191002105710eusmtip2b1cc63df16db8b23a331c650adc51076~Jz0LPPKeK0236902369eusmtip23;
        Wed,  2 Oct 2019 10:57:10 +0000 (GMT)
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
To:     broonie@kernel.org
Cc:     lgirdwood@gmail.com, ckeepax@opensource.cirrus.com,
        krzk@kernel.org, sbkim73@samsung.com, alsa-devel@alsa-project.org,
        patches@opensource.cirrus.com,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com,
        m.szyprowski@samsung.com,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v4 2/3] ASoC: samsung: arndale: Add support for WM1811 CODEC
Date:   Wed,  2 Oct 2019 12:56:51 +0200
Message-Id: <20191002105652.24821-2-s.nawrocki@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191002105652.24821-1-s.nawrocki@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprLKsWRmVeSWpSXmKPExsWy7djPc7rtTVNiDVa2GlhcuXiIyWLjjPWs
        FlMfPmGzuNK6idHi/PkN7BbfrnQwWWx6fI3VYsb5fUwWa4/cZbf4/H4/q8XhN+2sFhdXfGFy
        4PHY8LmJzWPnrLvsHptWdbJ5bF5S7zF9zn9Gj74tqxg9Pm+SC2CP4rJJSc3JLEst0rdL4Mp4
        tnYbW8Fi44qtk7pZGhjPa3UxcnJICJhIzNl8lrWLkYtDSGAFo8SBnpOsIAkhgS+MEqcmC0Ek
        PjNKHFsxlx2m4/zzhWwQieWMEotWXGWEcIA69txYzAhSxSZgKNF7tA/MFhEQk7g9p5MZxGYW
        OMUk8eSNDYgtLOAjsXLPerB1LAKqEosfnQCr5xWwlrh06ycbxDZ5idUbDoD1cgrYSFzuewW2
        TEJgFbtE15c/jBBFLhKb9u1jgrCFJV4d3wJ1qozE6ck9LBANzYwSPbtvs0M4Exgl7h9fANVt
        LXH4+EWgMziAztOUWL9LH8SUEHCUOHmZE8Lkk7jxVhDifj6JSdumM0OEeSU62oQgZqhI/F41
        HeoCKYnuJ/9ZIGwPiXPXX7BAwqefUeLyjC/sExjlZyHsWsDIuIpRPLW0ODc9tdgwL7Vcrzgx
        t7g0L10vOT93EyMw0Zz+d/zTDsavl5IOMQpwMCrx8N4ImRwrxJpYVlyZe4hRgoNZSYTX5s+k
        WCHelMTKqtSi/Pii0pzU4kOM0hwsSuK81QwPooUE0hNLUrNTUwtSi2CyTBycUg2MArFq55+/
        DUmS/3ryZm2UmirrRKaJzDl623vk93L8CvrHEz+5Xf2NpeaEB+95NKKuLGy+ePXf/MnbJ14I
        0T2t0ydy0c/8XwGDUPDGqbNKtNkttuzKlkvTS85+xnY99O3x7MfKR1reb3lmmmXOXb9oX/jS
        99PDnR5+W7njq3xpuSpvxNJ2tU0ZSizFGYmGWsxFxYkAChSydTADAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrPLMWRmVeSWpSXmKPExsVy+t/xe7rtTVNiDVa+lbO4cvEQk8XGGetZ
        LaY+fMJmcaV1E6PF+fMb2C2+Xelgstj0+BqrxYzz+5gs1h65y27x+f1+VovDb9pZLS6u+MLk
        wOOx4XMTm8fOWXfZPTat6mTz2Lyk3mP6nP+MHn1bVjF6fN4kF8AepWdTlF9akqqQkV9cYqsU
        bWhhpGdoaaFnZGKpZ2hsHmtlZKqkb2eTkpqTWZZapG+XoJfxbO02toLFxhVbJ3WzNDCe1+pi
        5OSQEDCROP98IVsXIxeHkMBSRonWprNMXYwcQAkpifktShA1whJ/rnVB1XxilOi/+JwdJMEm
        YCjRe7SPEcQWERCTuD2nkxmkiFngGpPEplmPWUASwgI+Eiv3rGcFsVkEVCUWPzoB1sArYC1x
        6dZPNogN8hKrNxxgBrE5BWwkLve9AqsRAqpZ9fE66wRGvgWMDKsYRVJLi3PTc4uN9IoTc4tL
        89L1kvNzNzECA3/bsZ9bdjB2vQs+xCjAwajEw9sQNDlWiDWxrLgy9xCjBAezkgivzZ9JsUK8
        KYmVValF+fFFpTmpxYcYTYGOmsgsJZqcD4zKvJJ4Q1NDcwtLQ3Njc2MzCyVx3g6BgzFCAumJ
        JanZqakFqUUwfUwcnFINjJP3PVj6UiiH6/Icu4V/jgmd27FTnWNVaMlnVcMlfYJyTVJ6CXVZ
        Tt5SxtzX7qleVyrofv/sbMlbV67cvAqv9cx3Xm7fdvJtGIP3DzGWs0e6ovtbmv57Xp+85c32
        ggUztxz46v5byX1B/7ffxnJ8gSc/fLeLPXiwn3lK362k8tMTM8sPfXzpeEyJpTgj0VCLuag4
        EQCY5qH2kgIAAA==
X-CMS-MailID: 20191002105711eucas1p199322dc928a0ea4724fe0e0f5e6cb156
X-Msg-Generator: CA
Content-Type: text/plain; charset="UTF-8"
X-RootMTR: 20191002105711eucas1p199322dc928a0ea4724fe0e0f5e6cb156
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191002105711eucas1p199322dc928a0ea4724fe0e0f5e6cb156
References: <20191002105652.24821-1-s.nawrocki@samsung.com>
        <CGME20191002105711eucas1p199322dc928a0ea4724fe0e0f5e6cb156@eucas1p1.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
Message-ID: <20191002105651.pExTuxZRZyVUOKgpyKzuG9q9_uHXDrO4k4p63dUxHs4@z>

The Arndale boards come with different types of the audio daughter
board.  In order to support the WM1811 one we add new definition of
an ASoC card which will be registered when the driver matches on
"samsung,arndale-wm1811" compatible.  There is no runtime detection of
the audio daughter board type at the moment, compatible string of the
audio card needs to be adjusted in DT, e.g. by the bootloader,
depending on actual audio board (CODEC) used.

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
Changes since v3:
 - fixed the MODULE_DEVICE_TABLE entry declaration

Changes since v1:
 - removed unneeded __maybe_used attribute
---
 sound/soc/samsung/Kconfig          |  2 +
 sound/soc/samsung/arndale_rt5631.c | 85 +++++++++++++++++++++++++-----
 2 files changed, 74 insertions(+), 13 deletions(-)

diff --git a/sound/soc/samsung/Kconfig b/sound/soc/samsung/Kconfig
index 638983123d8f..6803cbfa9e46 100644
--- a/sound/soc/samsung/Kconfig
+++ b/sound/soc/samsung/Kconfig
@@ -199,6 +199,8 @@ config SND_SOC_ARNDALE_RT5631_ALC5631
         depends on I2C
         select SND_SAMSUNG_I2S
         select SND_SOC_RT5631
+	select MFD_WM8994
+	select SND_SOC_WM8994
 
 config SND_SOC_SAMSUNG_TM2_WM5110
 	tristate "SoC I2S Audio support for WM5110 on TM2 board"
diff --git a/sound/soc/samsung/arndale_rt5631.c b/sound/soc/samsung/arndale_rt5631.c
index 004c84fafad9..d64602950cbd 100644
--- a/sound/soc/samsung/arndale_rt5631.c
+++ b/sound/soc/samsung/arndale_rt5631.c
@@ -14,10 +14,11 @@
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 
+#include "../codecs/wm8994.h"
 #include "i2s.h"
 
-static int arndale_hw_params(struct snd_pcm_substream *substream,
-	struct snd_pcm_hw_params *params)
+static int arndale_rt5631_hw_params(struct snd_pcm_substream *substream,
+				    struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
@@ -47,13 +48,45 @@ static int arndale_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static struct snd_soc_ops arndale_ops = {
-	.hw_params = arndale_hw_params,
+static struct snd_soc_ops arndale_rt5631_ops = {
+	.hw_params = arndale_rt5631_hw_params,
+};
+
+static int arndale_wm1811_hw_params(struct snd_pcm_substream *substream,
+				    struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	unsigned int rfs, rclk;
+
+	/* Ensure AIF1CLK is >= 3 MHz for optimal performance */
+	if (params_width(params) == 24)
+		rfs = 384;
+	else if (params_rate(params) == 8000 || params_rate(params) == 11025)
+		rfs = 512;
+	else
+		rfs = 256;
+
+	rclk = params_rate(params) * rfs;
+
+	/*
+	 * We add 1 to the frequency value to ensure proper EPLL setting
+	 * for each audio sampling rate (see epll_24mhz_tbl in drivers/clk/
+	 * samsung/clk-exynos5250.c for list of available EPLL rates).
+	 * The CODEC uses clk API and the value will be rounded hence the MCLK1
+	 * clock's frequency will still be exact multiple of the sample rate.
+	 */
+	return snd_soc_dai_set_sysclk(codec_dai, WM8994_SYSCLK_MCLK1,
+					rclk + 1, SND_SOC_CLOCK_IN);
+}
+
+static struct snd_soc_ops arndale_wm1811_ops = {
+	.hw_params = arndale_wm1811_hw_params,
 };
 
 SND_SOC_DAILINK_DEFS(rt5631_hifi,
 	DAILINK_COMP_ARRAY(COMP_EMPTY()),
-	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "rt5631-hifi")),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "rt5631-aif1")),
 	DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
 static struct snd_soc_dai_link arndale_rt5631_dai[] = {
@@ -63,11 +96,28 @@ static struct snd_soc_dai_link arndale_rt5631_dai[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S
 			| SND_SOC_DAIFMT_NB_NF
 			| SND_SOC_DAIFMT_CBS_CFS,
-		.ops = &arndale_ops,
+		.ops = &arndale_rt5631_ops,
 		SND_SOC_DAILINK_REG(rt5631_hifi),
 	},
 };
 
+SND_SOC_DAILINK_DEFS(wm1811_hifi,
+	DAILINK_COMP_ARRAY(COMP_EMPTY()),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "wm8994-aif1")),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+static struct snd_soc_dai_link arndale_wm1811_dai[] = {
+	{
+		.name = "WM1811 HiFi",
+		.stream_name = "Primary",
+		.dai_fmt = SND_SOC_DAIFMT_I2S
+			| SND_SOC_DAIFMT_NB_NF
+			| SND_SOC_DAIFMT_CBM_CFM,
+		.ops = &arndale_wm1811_ops,
+		SND_SOC_DAILINK_REG(wm1811_hifi),
+	},
+};
+
 static struct snd_soc_card arndale_rt5631 = {
 	.name = "Arndale RT5631",
 	.owner = THIS_MODULE,
@@ -75,6 +125,13 @@ static struct snd_soc_card arndale_rt5631 = {
 	.num_links = ARRAY_SIZE(arndale_rt5631_dai),
 };
 
+static struct snd_soc_card arndale_wm1811 = {
+	.name = "Arndale WM1811",
+	.owner = THIS_MODULE,
+	.dai_link = arndale_wm1811_dai,
+	.num_links = ARRAY_SIZE(arndale_wm1811_dai),
+};
+
 static void arndale_put_of_nodes(struct snd_soc_card *card)
 {
 	struct snd_soc_dai_link *dai_link;
@@ -89,10 +146,11 @@ static void arndale_put_of_nodes(struct snd_soc_card *card)
 static int arndale_audio_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
-	struct snd_soc_card *card = &arndale_rt5631;
+	struct snd_soc_card *card;
 	struct snd_soc_dai_link *dai_link;
 	int ret;
 
+	card = (struct snd_soc_card *)of_device_get_match_data(&pdev->dev);
 	card->dev = &pdev->dev;
 	dai_link = card->dai_link;
 
@@ -134,18 +192,19 @@ static int arndale_audio_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static const struct of_device_id samsung_arndale_rt5631_of_match[] __maybe_unused = {
-	{ .compatible = "samsung,arndale-rt5631", },
-	{ .compatible = "samsung,arndale-alc5631", },
+static const struct of_device_id arndale_audio_of_match[] = {
+	{ .compatible = "samsung,arndale-rt5631",  .data = &arndale_rt5631 },
+	{ .compatible = "samsung,arndale-alc5631", .data = &arndale_rt5631 },
+	{ .compatible = "samsung,arndale-wm1811",  .data = &arndale_wm1811 },
 	{},
 };
-MODULE_DEVICE_TABLE(of, samsung_arndale_rt5631_of_match);
+MODULE_DEVICE_TABLE(of, arndale_audio_of_match);
 
 static struct platform_driver arndale_audio_driver = {
 	.driver = {
-		.name   = "arndale-audio",
+		.name = "arndale-audio",
 		.pm = &snd_soc_pm_ops,
-		.of_match_table = of_match_ptr(samsung_arndale_rt5631_of_match),
+		.of_match_table = arndale_audio_of_match,
 	},
 	.probe = arndale_audio_probe,
 	.remove = arndale_audio_remove,
-- 
2.17.1

