From: Xia Kaixu <kaixu.xia@linaro.org>
Subject: [PATCH 03/15] ASoC: SMDK_WM8580_PCM needs REGMAP_I2C
Date: Tue, 29 Apr 2014 19:18:24 +0800
Message-ID: <1398770316-19715-4-git-send-email-kaixu.xia@linaro.org>
References: <1398770316-19715-1-git-send-email-kaixu.xia@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1398770316-19715-1-git-send-email-kaixu.xia@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linaro-kernel@lists.linaro.org, arnd@arndb.de, kaixu.xia@linaro.org, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org
List-Id: linux-samsung-soc@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

This adds a missing dependency for SND_SOC_SMDK_WM8580_PCM to
require REGMAP_I2C to be enabled, avoiding possible build
erorrs.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Xia Kaixu <kaixu.xia@linaro.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Ben Dooks <ben-linux@fluff.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: alsa-devel@alsa-project.org
---
 sound/soc/samsung/Kconfig |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/samsung/Kconfig b/sound/soc/samsung/Kconfig
index 14568be..0c5e9e2 100644
--- a/sound/soc/samsung/Kconfig
+++ b/sound/soc/samsung/Kconfig
@@ -64,6 +64,7 @@ config SND_SOC_SAMSUNG_JIVE_WM8750
 config SND_SOC_SAMSUNG_SMDK_WM8580
 	tristate "SoC I2S Audio support for WM8580 on SMDK"
 	depends on SND_SOC_SAMSUNG && (MACH_SMDK6410 || MACH_SMDKC100 || MACH_SMDK6440 || MACH_SMDK6450 || MACH_SMDKV210 || MACH_SMDKC110)
+	depends on REGMAP_I2C
 	select SND_SOC_WM8580
 	select SND_SAMSUNG_I2S
 	help
@@ -178,6 +179,7 @@ config SND_SOC_SAMSUNG_SMDK_SPDIF
 config SND_SOC_SMDK_WM8580_PCM
 	tristate "SoC PCM Audio support for WM8580 on SMDK"
 	depends on SND_SOC_SAMSUNG && (MACH_SMDK6450 || MACH_SMDKV210 || MACH_SMDKC110)
+	depends on REGMAP_I2C
 	select SND_SOC_WM8580
 	select SND_SAMSUNG_PCM
 	help
-- 
1.7.9.5
