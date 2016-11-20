From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2 3/5] ASoC: samsung: Enable COMPILE_TEST for SmartQ and WM8580
Date: Sun, 20 Nov 2016 21:24:53 +0200
Message-ID: <1479669895-19124-4-git-send-email-krzk@kernel.org>
References: <1479669895-19124-1-git-send-email-krzk@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:55142 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752782AbcKTTZ0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 20 Nov 2016 14:25:26 -0500
In-Reply-To: <1479669895-19124-1-git-send-email-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Sangbeom Kim <sbkim73@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org
Cc: Lars-Peter Clausen <lars@metafoo.de>

The I2S sound drivers for SmartQ board and WM8580 codec can be compile
tested to increase build coverage.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 sound/soc/samsung/Kconfig | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/samsung/Kconfig b/sound/soc/samsung/Kconfig
index ea0fa9971a0c..426ef1c7b265 100644
--- a/sound/soc/samsung/Kconfig
+++ b/sound/soc/samsung/Kconfig
@@ -49,7 +49,7 @@ config SND_SOC_SAMSUNG_JIVE_WM8750
 
 config SND_SOC_SAMSUNG_SMDK_WM8580
 	tristate "SoC I2S Audio support for WM8580 on SMDK"
-	depends on MACH_SMDK6410
+	depends on MACH_SMDK6410 || COMPILE_TEST
 	depends on I2C
 	select SND_SOC_WM8580
 	select SND_SAMSUNG_I2S
@@ -109,7 +109,8 @@ config SND_SOC_SAMSUNG_RX1950_UDA1380
 
 config SND_SOC_SMARTQ
 	tristate "SoC I2S Audio support for SmartQ board"
-	depends on MACH_SMARTQ && I2C
+	depends on MACH_SMARTQ || COMPILE_TEST
+	depends on I2C
 	select SND_SAMSUNG_I2S
 	select SND_SOC_WM8750
 
-- 
2.7.4
