Return-Path: <SRS0=5wrF=X2=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFA1BECE589
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  1 Oct 2019 11:41:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 77D40222C6
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  1 Oct 2019 11:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1569930062;
	bh=lvxcegut0ElPFAKCjiZrhB1KyuXVOZegb8VvW/sL9CQ=;
	h=From:To:Cc:Subject:In-Reply-To:Date:List-ID:From;
	b=xDQ9aO97DBJLl3CKkkLvNlZc/I0IqDTVy5ldJopo0f83s1eqRuPqr0EzYG8w4KlXt
	 G2RbdBzr/Qy9lVSP2EDrCqNuaaN5RIZRrAVmYj9TsV3I3+hVAESHPE0HJPn+lm7La2
	 tFa8kF/rsrS8kWC0fFOkhVO2+uWxJ7B0NQkeTXfk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387507AbfJALlA (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 1 Oct 2019 07:41:00 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:40570 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387475AbfJALk7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 1 Oct 2019 07:40:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
        Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
        List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
        List-Archive; bh=4nVIwZwFM2LIqAXV3X3T6j5cLisqtjJSRcfDfbB4nV8=; b=Tp5tZchLyYys
        4zreiMd8U4NGGg+VAzjNxe8eD/ZH3it1545/9ZA3FDwO6/c7ahTc5jV36phIaa5JW+fNMcZFIwTQl
        WTefkg6TTrHCdQMNI1mK0cuVcpeRhN8z9YNCJFrL0kcGUcT9vhVKw1TdCNdDX17G4k8CXjNGEQ3u0
        ZaHOs=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iFGWR-0004Uh-7A; Tue, 01 Oct 2019 11:40:51 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 9CC842742A10; Tue,  1 Oct 2019 12:40:50 +0100 (BST)
From:   Mark Brown <broonie@kernel.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     alsa-devel@alsa-project.org, broonie@kernel.org,
        b.zolnierkie@samsung.com,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        ckeepax@opensource.cirrus.com, devicetree@vger.kernel.org,
        krzk@kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        lgirdwood@gmail.com, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        m.szyprowski@samsung.com, patches@opensource.cirrus.com,
        robh+dt@kernel.org, sbkim73@samsung.com
Subject: Applied "ASoC: wm8994: Add support for MCLKn clock gating" to the asoc tree
In-Reply-To: <20190920130218.32690-5-s.nawrocki@samsung.com>
X-Patchwork-Hint: ignore
Message-Id: <20191001114050.9CC842742A10@ypsilon.sirena.org.uk>
Date:   Tue,  1 Oct 2019 12:40:50 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20191001114050.JNki2a1wJyvv6aTZoE1ybnw4BpgEkp-xt9NzFyLgZUU@z>

The patch

   ASoC: wm8994: Add support for MCLKn clock gating

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

From 001b83d395ab2acfddc46b73376f8dbdece89af7 Mon Sep 17 00:00:00 2001
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Date: Fri, 20 Sep 2019 15:02:13 +0200
Subject: [PATCH] ASoC: wm8994: Add support for MCLKn clock gating

As an intermediate step before covering the clocking subsystem
of the CODEC entirely by the clk API add handling of external CODEC's
master clocks in DAPM events when the AIFn clocks are sourced directly
from MCLKn; when FLLn are used we enable/disable respective MCLKn
before/after FLLn is enabled/disabled.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Link: https://lore.kernel.org/r/20190920130218.32690-5-s.nawrocki@samsung.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm8994.c | 108 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 104 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
index 35fbaa0138bf..b633093afb9d 100644
--- a/sound/soc/codecs/wm8994.c
+++ b/sound/soc/codecs/wm8994.c
@@ -1033,6 +1033,45 @@ static bool wm8994_check_class_w_digital(struct snd_soc_component *component)
 	return true;
 }
 
+static int aif_mclk_set(struct snd_soc_component *component, int aif, bool enable)
+{
+	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
+	unsigned int offset, val, clk_idx;
+	int ret;
+
+	if (aif)
+		offset = 4;
+	else
+		offset = 0;
+
+	val = snd_soc_component_read32(component, WM8994_AIF1_CLOCKING_1 + offset);
+	val &= WM8994_AIF1CLK_SRC_MASK;
+
+	switch (val) {
+	case 0:
+		clk_idx = WM8994_MCLK1;
+		break;
+	case 1:
+		clk_idx = WM8994_MCLK2;
+		break;
+	default:
+		return 0;
+	}
+
+	if (enable) {
+		ret = clk_prepare_enable(wm8994->mclk[clk_idx].clk);
+		if (ret < 0) {
+			dev_err(component->dev,	"Failed to enable MCLK%d\n",
+				clk_idx);
+			return ret;
+		}
+	} else {
+		clk_disable_unprepare(wm8994->mclk[clk_idx].clk);
+	}
+
+	return 0;
+}
+
 static int aif1clk_ev(struct snd_soc_dapm_widget *w,
 		      struct snd_kcontrol *kcontrol, int event)
 {
@@ -1040,7 +1079,7 @@ static int aif1clk_ev(struct snd_soc_dapm_widget *w,
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
 	struct wm8994 *control = wm8994->wm8994;
 	int mask = WM8994_AIF1DAC1L_ENA | WM8994_AIF1DAC1R_ENA;
-	int i;
+	int ret, i;
 	int dac;
 	int adc;
 	int val;
@@ -1056,6 +1095,10 @@ static int aif1clk_ev(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
+		ret = aif_mclk_set(component, 0, true);
+		if (ret < 0)
+			return ret;
+
 		/* Don't enable timeslot 2 if not in use */
 		if (wm8994->channels[0] <= 2)
 			mask &= ~(WM8994_AIF1DAC2L_ENA | WM8994_AIF1DAC2R_ENA);
@@ -1128,6 +1171,12 @@ static int aif1clk_ev(struct snd_soc_dapm_widget *w,
 		break;
 	}
 
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMD:
+		aif_mclk_set(component, 0, false);
+		break;
+	}
+
 	return 0;
 }
 
@@ -1135,13 +1184,17 @@ static int aif2clk_ev(struct snd_soc_dapm_widget *w,
 		      struct snd_kcontrol *kcontrol, int event)
 {
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
-	int i;
+	int ret, i;
 	int dac;
 	int adc;
 	int val;
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
+		ret = aif_mclk_set(component, 1, true);
+		if (ret < 0)
+			return ret;
+
 		val = snd_soc_component_read32(component, WM8994_AIF2_CONTROL_1);
 		if ((val & WM8994_AIF2ADCL_SRC) &&
 		    (val & WM8994_AIF2ADCR_SRC))
@@ -1213,6 +1266,12 @@ static int aif2clk_ev(struct snd_soc_dapm_widget *w,
 		break;
 	}
 
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMD:
+		aif_mclk_set(component, 1, false);
+		break;
+	}
+
 	return 0;
 }
 
@@ -1618,10 +1677,10 @@ SND_SOC_DAPM_POST("Late Disable PGA", late_disable_ev)
 static const struct snd_soc_dapm_widget wm8994_lateclk_widgets[] = {
 SND_SOC_DAPM_SUPPLY("AIF1CLK", WM8994_AIF1_CLOCKING_1, 0, 0, aif1clk_ev,
 		    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
-		    SND_SOC_DAPM_PRE_PMD),
+		    SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
 SND_SOC_DAPM_SUPPLY("AIF2CLK", WM8994_AIF2_CLOCKING_1, 0, 0, aif2clk_ev,
 		    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
-		    SND_SOC_DAPM_PRE_PMD),
+		    SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
 SND_SOC_DAPM_PGA("Direct Voice", SND_SOC_NOPM, 0, 0, NULL, 0),
 SND_SOC_DAPM_MIXER("SPKL", WM8994_POWER_MANAGEMENT_3, 8, 0,
 		   left_speaker_mixer, ARRAY_SIZE(left_speaker_mixer)),
@@ -2136,6 +2195,7 @@ static int _wm8994_set_fll(struct snd_soc_component *component, int id, int src,
 	u16 reg, clk1, aif_reg, aif_src;
 	unsigned long timeout;
 	bool was_enabled;
+	struct clk *mclk;
 
 	switch (id) {
 	case WM8994_FLL1:
@@ -2211,6 +2271,27 @@ static int _wm8994_set_fll(struct snd_soc_component *component, int id, int src,
 	snd_soc_component_update_bits(component, WM8994_FLL1_CONTROL_1 + reg_offset,
 			    WM8994_FLL1_ENA, 0);
 
+	/* Disable MCLK if needed before we possibly change to new clock parent */
+	if (was_enabled) {
+		reg = snd_soc_component_read32(component, WM8994_FLL1_CONTROL_5
+							+ reg_offset);
+		reg = ((reg & WM8994_FLL1_REFCLK_SRC_MASK)
+			>> WM8994_FLL1_REFCLK_SRC_SHIFT) + 1;
+
+		switch (reg) {
+		case WM8994_FLL_SRC_MCLK1:
+			mclk = wm8994->mclk[WM8994_MCLK1].clk;
+			break;
+		case WM8994_FLL_SRC_MCLK2:
+			mclk = wm8994->mclk[WM8994_MCLK2].clk;
+			break;
+		default:
+			mclk = NULL;
+		}
+
+		clk_disable_unprepare(mclk);
+	}
+
 	if (wm8994->fll_byp && src == WM8994_FLL_SRC_BCLK &&
 	    freq_in == freq_out && freq_out) {
 		dev_dbg(component->dev, "Bypassing FLL%d\n", id + 1);
@@ -2255,10 +2336,29 @@ static int _wm8994_set_fll(struct snd_soc_component *component, int id, int src,
 	/* Clear any pending completion from a previous failure */
 	try_wait_for_completion(&wm8994->fll_locked[id]);
 
+	switch (src) {
+	case WM8994_FLL_SRC_MCLK1:
+		mclk = wm8994->mclk[WM8994_MCLK1].clk;
+		break;
+	case WM8994_FLL_SRC_MCLK2:
+		mclk = wm8994->mclk[WM8994_MCLK2].clk;
+		break;
+	default:
+		mclk = NULL;
+	}
+
 	/* Enable (with fractional mode if required) */
 	if (freq_out) {
+		ret = clk_prepare_enable(mclk);
+		if (ret < 0) {
+			dev_err(component->dev, "Failed to enable MCLK for FLL%d\n",
+				id + 1);
+			return ret;
+		}
+
 		/* Enable VMID if we need it */
 		if (!was_enabled) {
+
 			active_reference(component);
 
 			switch (control->type) {
-- 
2.20.1

