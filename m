From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v2 11/16] ASoC: samsung: odroidx2: Handle I2S CDCLK clock
 conditionally
Date: Fri, 19 Dec 2014 14:55:31 +0100
Message-ID: <1418997336-17777-12-git-send-email-s.nawrocki@samsung.com>
References: <1418997336-17777-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:40040 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752596AbaLSN7V (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 19 Dec 2014 08:59:21 -0500
In-reply-to: <1418997336-17777-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@kernel.org, kgene@kernel.org, alsa-devel@alsa-project.org
Cc: padma.v@samsung.com, drake@endlessm.com, sbkim73@samsung.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

In order to support old DTs we check the codec device node if it
contains "clocks" property and only if it doesn't (which indicates
an old DT) we proceed with enabling the CDCLK clock by means of
the set_sysclk() callback.  For new DTs which use the common clock
bindings for CDCLK that clock is supposed to be handled outside
the sound machine driver.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 sound/soc/samsung/odroidx2_max98090.c |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/samsung/odroidx2_max98090.c b/sound/soc/samsung/odroidx2_max98090.c
index d7640e7..5a87794 100644
--- a/sound/soc/samsung/odroidx2_max98090.c
+++ b/sound/soc/samsung/odroidx2_max98090.c
@@ -21,6 +21,8 @@ struct odroidx2_drv_data {
 /* The I2S CDCLK output clock frequency for the MAX98090 codec */
 #define MAX98090_MCLK 19200000
 
+static struct snd_soc_dai_link odroidx2_dai[];
+
 static int odroidx2_late_probe(struct snd_soc_card *card)
 {
 	struct snd_soc_dai *codec_dai = card->rtd[0].codec_dai;
@@ -29,7 +31,9 @@ static int odroidx2_late_probe(struct snd_soc_card *card)
 
 	ret = snd_soc_dai_set_sysclk(codec_dai, 0, MAX98090_MCLK,
 						SND_SOC_CLOCK_IN);
-	if (ret < 0)
+
+	if (ret < 0 || of_find_property(odroidx2_dai[0].codec_of_node,
+					"clocks", NULL))
 		return ret;
 
 	/* Set the cpu DAI configuration in order to use CDCLK */
-- 
1.7.9.5
