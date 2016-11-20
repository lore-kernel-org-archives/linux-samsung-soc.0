From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2 1/5] ASoC: samsung: Remove non-existing MACH dependencies
Date: Sun, 20 Nov 2016 21:24:51 +0200
Message-ID: <1479669895-19124-2-git-send-email-krzk@kernel.org>
References: <1479669895-19124-1-git-send-email-krzk@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:55002 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751559AbcKTTZQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 20 Nov 2016 14:25:16 -0500
In-Reply-To: <1479669895-19124-1-git-send-email-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Sangbeom Kim <sbkim73@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org
Cc: Lars-Peter Clausen <lars@metafoo.de>

MACH_SMDKC100 was removed in commit b8529ec1c1b0 ("ARM: S5PC100: no more
support S5PC100 SoC"). MACH_SMDKV210 and MACH_SMDKC110 in commit
28c8331d386 ("ARM: S5PV210: Remove support for board files").

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 sound/soc/samsung/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/samsung/Kconfig b/sound/soc/samsung/Kconfig
index 79ae6a7c93ff..ea0fa9971a0c 100644
--- a/sound/soc/samsung/Kconfig
+++ b/sound/soc/samsung/Kconfig
@@ -49,7 +49,7 @@ config SND_SOC_SAMSUNG_JIVE_WM8750
 
 config SND_SOC_SAMSUNG_SMDK_WM8580
 	tristate "SoC I2S Audio support for WM8580 on SMDK"
-	depends on MACH_SMDK6410 || MACH_SMDKC100 || MACH_SMDKV210 || MACH_SMDKC110
+	depends on MACH_SMDK6410
 	depends on I2C
 	select SND_SOC_WM8580
 	select SND_SAMSUNG_I2S
-- 
2.7.4
