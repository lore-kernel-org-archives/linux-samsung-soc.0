From: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Subject: [PATCH 2/4] ASoC: bt-sco: Constify platform_device_id
Date: Sat,  2 May 2015 01:00:12 +0900
Message-ID: <1430496014-32309-2-git-send-email-k.kozlowski.k@gmail.com>
References: <1430496014-32309-1-git-send-email-k.kozlowski.k@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f45.google.com ([209.85.220.45]:32911 "EHLO
	mail-pa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753918AbbEAQAc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 May 2015 12:00:32 -0400
In-Reply-To: <1430496014-32309-1-git-send-email-k.kozlowski.k@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, Timur Tabi <timur@tabi.org>, Nicolin Chen <nicoleotsuka@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Kukjin Kim <kgene@kernel.org>, Sangbeom Kim <sbkim73@samsung.com>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>

The platform_device_id is not modified by the driver and core uses it as
const.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
---
 sound/soc/codecs/bt-sco.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/bt-sco.c b/sound/soc/codecs/bt-sco.c
index e7238b8904bc..9d0b794d3005 100644
--- a/sound/soc/codecs/bt-sco.c
+++ b/sound/soc/codecs/bt-sco.c
@@ -63,7 +63,7 @@ static int bt_sco_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static struct platform_device_id bt_sco_driver_ids[] = {
+static const struct platform_device_id bt_sco_driver_ids[] = {
 	{
 		.name		= "dfbmcs320",
 	},
-- 
2.1.4
