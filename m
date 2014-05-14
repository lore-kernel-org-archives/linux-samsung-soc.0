From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH] ASoC: samsung: Add missing pm ops for Snow sound card driver
Date: Wed, 14 May 2014 08:49:06 +0530
Message-ID: <1400037546-20395-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f47.google.com ([209.85.220.47]:52180 "EHLO
	mail-pa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752507AbaENDVD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 May 2014 23:21:03 -0400
Received: by mail-pa0-f47.google.com with SMTP id lf10so1086468pab.20
        for <linux-samsung-soc@vger.kernel.org>; Tue, 13 May 2014 20:21:02 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org
Cc: broonie@kernel.org

Adding missing pm ops so that audio playback works across
suspend and resume cycle.

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 sound/soc/samsung/snow.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/samsung/snow.c b/sound/soc/samsung/snow.c
index 0fa89a4..014c177 100644
--- a/sound/soc/samsung/snow.c
+++ b/sound/soc/samsung/snow.c
@@ -111,6 +111,7 @@ static struct platform_driver snow_driver = {
 	.driver = {
 		.name = "snow-audio",
 		.owner = THIS_MODULE,
+		.pm = &snd_soc_pm_ops,
 		.of_match_table = snow_of_match,
 	},
 	.probe = snow_probe,
-- 
1.7.9.5
