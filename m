From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH/RFC 11/14] ASoC: samsung: odroidx2: Handle I2S CDCLK clock
 conditionally
Date: Thu, 11 Dec 2014 18:45:49 +0100
Message-ID: <1418319952-10163-12-git-send-email-s.nawrocki@samsung.com>
References: <1418319952-10163-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:42925 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932412AbaLKRq5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Dec 2014 12:46:57 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NGF00K6UIQ8WC50@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 12 Dec 2014 02:46:56 +0900 (KST)
In-reply-to: <1418319952-10163-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org
Cc: broonie@kernel.org, padma.v@samsung.com, drake@endlessm.com, sbkim73@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>

If the codec control it's master clock provider by the I2S module
we should not be touching it with set_sysclk() calls.
So skip the set_sysclk() call in the machine driver if "clocks"
property is found in the codec device node.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 sound/soc/samsung/odroidx2_max98090.c |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/samsung/odroidx2_max98090.c b/sound/soc/samsung/odroidx2_max98090.c
index 3c8f604..ca94938 100644
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
