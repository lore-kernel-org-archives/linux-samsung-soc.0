From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH] ASoC: samsung: odroid: Fix EPLL frequency values
Date: Fri, 21 Jul 2017 18:29:20 +0200
Message-ID: <1500654560-29516-1-git-send-email-s.nawrocki@samsung.com>
References: <CGME20170721162931epcas1p3e72f1448e81b4f282f5495c9c6ae0d53@epcas1p3.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:11577 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751504AbdGUQ3e (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 21 Jul 2017 12:29:34 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@kernel.org, lgirdwood@gmail.com
Cc: krzk@kernel.org, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, alsa-devel@alsa-project.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

To prevent incorrect setting of the EPLL the clock frequency
values are changed to exact values as possible to obtain on
the EPLL output with given PLL coefficients.
This patch is required after recent change of the EPLL rate
table by patch
"clk: samsung: exynos5420: The EPLL rate table corrections".

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
It would be good to apply this patch for 4.13-rc, I plan to
get applied corresponding clk patch also to v4.13-rc.
---
 sound/soc/samsung/odroid.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/samsung/odroid.c b/sound/soc/samsung/odroid.c
index 0c0b00e..0834319 100644
--- a/sound/soc/samsung/odroid.c
+++ b/sound/soc/samsung/odroid.c
@@ -42,17 +42,17 @@ static int odroid_card_hw_params(struct snd_pcm_substream *substream,
 	switch (params_rate(params)) {
 	case 32000:
 	case 64000:
-		pll_freq = 131072000U;
+		pll_freq = 131072006U;
 		break;
 	case 44100:
 	case 88200:
 	case 176400:
-		pll_freq = 180633600U;
+		pll_freq = 180633609U;
 		break;
 	case 48000:
 	case 96000:
 	case 192000:
-		pll_freq = 196608000U;
+		pll_freq = 196608001U;
 		break;
 	default:
 		return -EINVAL;
-- 
1.9.1
