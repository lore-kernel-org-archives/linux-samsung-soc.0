Return-Path: <SRS0=5wrF=X2=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55CFAECE587
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  1 Oct 2019 12:36:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 24F9F21A4A
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  1 Oct 2019 12:36:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="GE3FSZJ0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387837AbfJAMgn (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 1 Oct 2019 08:36:43 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:58232 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732921AbfJAMgm (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 1 Oct 2019 08:36:42 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20191001123640euoutp0245ea71ad05277087ed6845ef2a9df88e~JhhwWOutE1376613766euoutp02c
        for <linux-samsung-soc@vger.kernel.org>; Tue,  1 Oct 2019 12:36:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20191001123640euoutp0245ea71ad05277087ed6845ef2a9df88e~JhhwWOutE1376613766euoutp02c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1569933400;
        bh=fCiCWDJV6hWzdPW9ipEdQhbwyGKQwzSf6QI+SV7DvCc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GE3FSZJ0qz1StqLogNI9kq8AxJlKoF81tszRC23ihkCRxsEZ9vG8K8ns1XpAvX1yP
         iTW0pimlHItT9MvPcLuk6Ofoym9F1skhX6FDcivNHv/flmbwjcJWMuSsqbYMzwBYdX
         0q8OkOUHkOdP+HBG/AeUlRA9cripst9+Kf9A9DnE=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20191001123639eucas1p2863ecda3f268cb7ac9af1ceb0a361647~Jhhv6Qvrm2036020360eucas1p2z;
        Tue,  1 Oct 2019 12:36:39 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id F6.34.04469.758439D5; Tue,  1
        Oct 2019 13:36:39 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20191001123639eucas1p2b15309e0b0008b2627b8630082d69f41~Jhhvcxwil2871028710eucas1p2D;
        Tue,  1 Oct 2019 12:36:39 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20191001123639eusmtrp18dd6256ce969a8955cc442c85f1530d5~JhhvcH4l_0390803908eusmtrp1O;
        Tue,  1 Oct 2019 12:36:39 +0000 (GMT)
X-AuditID: cbfec7f2-54fff70000001175-7d-5d934857b521
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 2E.33.04117.758439D5; Tue,  1
        Oct 2019 13:36:39 +0100 (BST)
Received: from AMDC3061.DIGITAL.local (unknown [106.120.51.75]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20191001123638eusmtip2789263881057d4881d8e654111c6f0e5~Jhhu2Rlgr1272012720eusmtip2h;
        Tue,  1 Oct 2019 12:36:38 +0000 (GMT)
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
To:     broonie@kernel.org, krzk@kernel.org
Cc:     lgirdwood@gmail.com, ckeepax@opensource.cirrus.com,
        sbkim73@samsung.com, alsa-devel@alsa-project.org,
        patches@opensource.cirrus.com,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com,
        m.szyprowski@samsung.com,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v3 RESEND 2/3] ASoC: samsung: arndale: Add support for
 WM1811 CODEC
Date:   Tue,  1 Oct 2019 14:36:24 +0200
Message-Id: <20191001123625.19370-2-s.nawrocki@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191001123625.19370-1-s.nawrocki@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0VSf0hTURjt7r239zacPKfoRSPZKMxIbRD0QIkCiQdC7R8JlDGnvlTSKZvz
        R0IOzVzqzDbSZRJmZTYNdS5Tw6xZDrNayjRTxDQrEqV0KmqpOZ/Wf+ec75zvfFwugQjvYP5E
        ijKTUSkVqWIuH23vW3OEnKeNsmOuwqOUc9DGoVpNzRh1c2qGSzmLLIByOFpwasWp41CWLyMY
        ZXI851CPX03glOtnD0b1zhVj1GDDEueUB93iKuDSndUTOG0xX+PSbffz6aqaLUCXW82AdlkO
        SPEYfkQik5qSxajCTsbxk8fblBnfJDm9q42oFpiDSwCPgORx2LE4xSkBfEJINgC4tmXAWLIE
        YP8tHcISF4C2hjl8L7Lww4Szg4cAavs38X8Rm6sYdbu4pATqX5cDN/Yhg+CkqWBnL0J2cuD0
        8OSOyZuMhnWWzR0TSh6C1v6ZHSwgw+FQqwtj6wJhY8uL7TsIgkdGQJ2Z594DyXocVuqbENYT
        CZd6FnbP84azdusu3g8HjGUoGygEsOzZOM6SCgAn7bWAdYXDXvsg5m5AyGDY3BXGyqfhsPUe
        7pYh6QlH573cMrINDe1VCCsLoO6qkHUfhL/NVRwW+8PSmS2UxTRcf9O1+6bXAdzoXgEVILD6
        f1ktAGbgx2jUaUmMWqJkskPVijS1RpkUmpCeZgHbv2Zg077YAZaH4m2AJIDYQ0B9vyETYoos
        dW6aDUACEfsIIv4YZEJBoiL3EqNKl6s0qYzaBgIIVOwnyNv3OVZIJikymYsMk8Go9qYcguev
        BSI0+1ec33xkpehM+pr0dvzbR9PvL2/orzQV15WG5Mlnv3rkzs4HjWmLAj6cE+mHmrt5TzT5
        ffRy0bI8X1ZhzRDRSe9KhAljBSOumFFctC58ejgsyvAyIEqc5VnWeyJHb/xk1UuN0TUxlrvR
        H33rpasPvHwvyM9uhCUmOA2xQIyqkxWSI4hKrfgLzwtGxDEDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrLLMWRmVeSWpSXmKPExsVy+t/xe7rhHpNjDc6/4bW4cvEQk8XGGetZ
        LaY+fMJmcaV1E6PF+fMb2C2+Xelgstj0+BqrxYzz+5gs1h65y27x+f1+VovDb9pZLS6u+MLk
        wOOx4XMTm8fOWXfZPTat6mTz2Lyk3mP6nP+MHn1bVjF6fN4kF8AepWdTlF9akqqQkV9cYqsU
        bWhhpGdoaaFnZGKpZ2hsHmtlZKqkb2eTkpqTWZZapG+XoJdxe3NewTPDisM/VrM0MK7S7GLk
        5JAQMJH4+HIGexcjF4eQwFJGid4H/axdjBxACSmJ+S1KEDXCEn+udbFB1HxilFh57iALSIJN
        wFCi92gfI4gtIqAp0THvNitIEbPAYSaJxR0QRcICwRIHb85hA7FZBFQltpx8AtbAK2AtcWnj
        Z1aIDfISqzccYAZZzClgI9GxihMkLARU0vJ1DeMERr4FjAyrGEVSS4tz03OLjfSKE3OLS/PS
        9ZLzczcxAoN+27GfW3Ywdr0LPsQowMGoxMNr8XxirBBrYllxZe4hRgkOZiURXps/k2KFeFMS
        K6tSi/Lji0pzUosPMZoC3TSRWUo0OR8YkXkl8YamhuYWlobmxubGZhZK4rwdAgdjhATSE0tS
        s1NTC1KLYPqYODilGhjXCj6MFIz+UHFikqtZvMX2o0dz7W4ub6xaa7DuUOG7//f2Sj+9GGkX
        tKrdNdJ33u0iH8aPHCIPp/1LVLk55ejpDTYsvnc82vW3TjsasS2B/clmrt5nfbqlKlET9WL5
        vq2a5FHxYtqtIgneVzf4+p+EMZyNWxl8bnI9m/D2vBN3+BJ+LE2vCdmmxFKckWioxVxUnAgA
        +FRj1JACAAA=
X-CMS-MailID: 20191001123639eucas1p2b15309e0b0008b2627b8630082d69f41
X-Msg-Generator: CA
Content-Type: text/plain; charset="UTF-8"
X-RootMTR: 20191001123639eucas1p2b15309e0b0008b2627b8630082d69f41
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191001123639eucas1p2b15309e0b0008b2627b8630082d69f41
References: <20191001123625.19370-1-s.nawrocki@samsung.com>
        <CGME20191001123639eucas1p2b15309e0b0008b2627b8630082d69f41@eucas1p2.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
Message-ID: <20191001123624.3zbKBH8z1KoDnhhwDQvPYmN_LBhMt1ri2d0kdXWJnpo@z>

The Arndale boards come with different types of the audio daughter
board.  In order to support the WM1811 one we add new definition of
an ASoC card which will be registered when the driver matches on
"samsung,arndale-wm1811" compatible.  There is no runtime detection of
the audio daughter board type at the moment, compatible string of the
audio card needs to be adjusted in DT, e.g. by the bootloader,
depending on actual audio board (CODEC) used.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
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
index 004c84fafad9..1e8badb1b8f9 100644
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
+MODULE_DEVICE_TABLE(of, arndale_of_match);
 
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

