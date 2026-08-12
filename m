Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED80B361961
	for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Aug 2026 07:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786520690; cv=none; b=GkwNngs/JKCkk0Ur5s06hRTh3KC294IfDKXoQjz2uGlSf5TNraU56jmQmvM6Q1zG9WWb7kfrEyESRCkSXlElXXXKMbT7NR5/vIH3+YdK3UPRjFiQOTNRvckUYVqXz/zZ1bfYrVJNhIAunBriCEwCRwsGpW/EvO3HsxJnmmVOKx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786520690; c=relaxed/simple;
	bh=vO4h3w7pd2slyBEBZdONppT0Ub1XSCQ+7xhZm8z64m0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=EuTO4izAVf5Yg11v+xqKQSRtxQMauaHT3tr/Y6u3n2YnxQtE1RyjKokkWSmlZrSLZSNKOFt77GAKFy801EWgaZV/P4WKi0l00ejFp5OGgw0jUg9+yQB9uwXYMi8mDP6gszchoXXecXq0+j/0Ttjkyjkc9eUXzux/rjd6N+5M+6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=aXLuaGhD; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="aXLuaGhD"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260812074446euoutp028b090588be85e9b7a6c3558aafa7b527~K-xk74Zjl1339513395euoutp02q
	for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Aug 2026 07:44:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260812074446euoutp028b090588be85e9b7a6c3558aafa7b527~K-xk74Zjl1339513395euoutp02q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1786520686;
	bh=6o9TiwHdK1+YNJTG0IZ9rVkj2Lx26ci5YXXB18DtBKc=;
	h=From:To:Cc:Subject:Date:References:From;
	b=aXLuaGhDqXl2iOZNXwSigttErFqergoYlB+FFs/mPtVZojYqGaNNp79YZBi8JwARc
	 fyEVdT+CTqNNz0L5feyl87kaTC1gKSWYv+t9O8j16RP29d1Sb3Ivp2U29MLoSafbr7
	 ifLZxHloMasnf7GoV7EcvO0t/L3w5mcIxXe8rnfU=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260812074445eucas1p2a90873f2cab6887b9359d6c7ec26b6e8~K-xkJe7MA0999909999eucas1p2s;
	Wed, 12 Aug 2026 07:44:45 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260812074444eusmtip17285a8c6de6c001a897a806c27f34de8~K-xjoItRV1972319723eusmtip1E;
	Wed, 12 Aug 2026 07:44:44 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-sound@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin
	<peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH] ASoC: samsung: i2s: drop secondary DAI for i2sv7 hardware
 variant
Date: Wed, 12 Aug 2026 09:44:37 +0200
Message-ID: <20260812074438.3225001-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260812074445eucas1p2a90873f2cab6887b9359d6c7ec26b6e8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260812074445eucas1p2a90873f2cab6887b9359d6c7ec26b6e8
X-EPHeader: CA
X-CMS-RootMailID: 20260812074445eucas1p2a90873f2cab6887b9359d6c7ec26b6e8
References: <CGME20260812074445eucas1p2a90873f2cab6887b9359d6c7ec26b6e8@eucas1p2.samsung.com>

Commit 9167f260477b ("ASoC: soc-generic-dmaengine: Handle DMA channel
request failures correctly") started reporting DMA channel request
failures during probe instead of silently ignoring them. This exposed a
bug in the Samsung I2S driver: it always registered a second DAI and its
associated "tx-sec" DMA channel, even for hardware variants that don't
actually support it, such as i2sv7 used on Exynos5433. As a result,
sound card probing on Exynos5433-based boards started failing, whereas
previously it worked only because the channel request failure was
ignored.

Drop the QUIRK_SEC_DAI flag from i2sv7, since this variant does not have
a secondary DAI and register "Secondary Playback" DAPM route only for
variants with such interface.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 sound/soc/samsung/i2s.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 81d5dd36a246..3e76cb81462f 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -1116,15 +1116,31 @@ static const struct snd_soc_dapm_widget samsung_i2s_widgets[] = {
 
 static const struct snd_soc_dapm_route samsung_i2s_dapm_routes[] = {
 	{ "Playback Mixer", NULL, "Primary Playback" },
-	{ "Playback Mixer", NULL, "Secondary Playback" },
-
 	{ "Mixer DAI TX", NULL, "Playback Mixer" },
 	{ "Primary Capture", NULL, "Mixer DAI RX" },
 };
 
+static const struct snd_soc_dapm_route samsung_i2s_dapm_routes_sec_play[] = {
+	{ "Playback Mixer", NULL, "Secondary Playback" },
+};
+
+static int samsung_i2s_component_probe(struct snd_soc_component *component)
+{
+	struct samsung_i2s_priv *priv = snd_soc_component_get_drvdata(component);
+
+	if (priv->quirks & QUIRK_SEC_DAI)
+		snd_soc_dapm_add_routes(snd_soc_component_to_dapm(component),
+					samsung_i2s_dapm_routes_sec_play,
+					ARRAY_SIZE(samsung_i2s_dapm_routes_sec_play));
+
+	return 0;
+}
+
 static const struct snd_soc_component_driver samsung_i2s_component = {
 	.name = "samsung-i2s",
 
+	.probe = samsung_i2s_component_probe,
+
 	.dapm_widgets = samsung_i2s_widgets,
 	.num_dapm_widgets = ARRAY_SIZE(samsung_i2s_widgets),
 
@@ -1650,8 +1666,7 @@ static const struct samsung_i2s_dai_data i2sv6_dai_type __maybe_unused = {
 };
 
 static const struct samsung_i2s_dai_data i2sv7_dai_type __maybe_unused = {
-	.quirks = QUIRK_PRI_6CHAN | QUIRK_SEC_DAI | QUIRK_NEED_RSTCLR |
-			QUIRK_SUPPORTS_TDM,
+	.quirks = QUIRK_PRI_6CHAN | QUIRK_NEED_RSTCLR | QUIRK_SUPPORTS_TDM,
 	.pcm_rates = SNDRV_PCM_RATE_8000_192000,
 	.i2s_variant_regs = &i2sv7_regs,
 };
-- 
2.43.0

