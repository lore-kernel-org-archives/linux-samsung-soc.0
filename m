From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH] ASoC: bells: Hookup DMICs for Bells
Date: Mon, 27 May 2013 09:46:53 +0100
Message-ID: <1369644413-25597-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:55562 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751463Ab3E0I6J (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 27 May 2013 04:58:09 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@kernel.org, kgene.kim@samsung.com
Cc: ben-linux@fluff.org, lgirdwood@gmail.com, tiwai@suse.de, perex@perex.cz, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, patches@opensource.wolfsonmicro.com, Charles Keepax <ckeepax@opensource.wolfsonmicro.com>

Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
---
 sound/soc/samsung/bells.c |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/sound/soc/samsung/bells.c b/sound/soc/samsung/bells.c
index ceed466..29e2468 100644
--- a/sound/soc/samsung/bells.c
+++ b/sound/soc/samsung/bells.c
@@ -350,8 +350,16 @@ static struct snd_soc_codec_conf bells_codec_conf[] = {
 	},
 };
 
+static struct snd_soc_dapm_widget bells_widgets[] = {
+	SND_SOC_DAPM_MIC("DMIC", NULL),
+};
+
 static struct snd_soc_dapm_route bells_routes[] = {
 	{ "Sub CLK_SYS", NULL, "OPCLK" },
+
+	{ "DMIC", NULL, "MICBIAS2" },
+	{ "IN2L", NULL, "DMIC" },
+	{ "IN2R", NULL, "DMIC" },
 };
 
 static struct snd_soc_card bells_cards[] = {
@@ -365,6 +373,8 @@ static struct snd_soc_card bells_cards[] = {
 
 		.late_probe = bells_late_probe,
 
+		.dapm_widgets = bells_widgets,
+		.num_dapm_widgets = ARRAY_SIZE(bells_widgets),
 		.dapm_routes = bells_routes,
 		.num_dapm_routes = ARRAY_SIZE(bells_routes),
 
@@ -383,6 +393,8 @@ static struct snd_soc_card bells_cards[] = {
 
 		.late_probe = bells_late_probe,
 
+		.dapm_widgets = bells_widgets,
+		.num_dapm_widgets = ARRAY_SIZE(bells_widgets),
 		.dapm_routes = bells_routes,
 		.num_dapm_routes = ARRAY_SIZE(bells_routes),
 
@@ -401,6 +413,8 @@ static struct snd_soc_card bells_cards[] = {
 
 		.late_probe = bells_late_probe,
 
+		.dapm_widgets = bells_widgets,
+		.num_dapm_widgets = ARRAY_SIZE(bells_widgets),
 		.dapm_routes = bells_routes,
 		.num_dapm_routes = ARRAY_SIZE(bells_routes),
 
-- 
1.7.2.5
