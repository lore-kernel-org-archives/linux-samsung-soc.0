From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2 4/5] ASoC: samsung: Enable COMPILE_TEST for entire Samsung ASoc
Date: Sun, 20 Nov 2016 21:24:54 +0200
Message-ID: <1479669895-19124-5-git-send-email-krzk@kernel.org>
References: <1479669895-19124-1-git-send-email-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1479669895-19124-1-git-send-email-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Sangbeom Kim <sbkim73@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org
Cc: Lars-Peter Clausen <lars@metafoo.de>
List-Id: linux-samsung-soc@vger.kernel.org

Instead of build time, Samsung ASoC drivers have rather runtime
dependency on Exynos or other Samsung platforms.  For building they
require Common Clock Framework.  If it is provided they could be compile
tested to increase build coverage.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 sound/soc/samsung/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/samsung/Kconfig b/sound/soc/samsung/Kconfig
index 426ef1c7b265..a6cc6ca93fa7 100644
--- a/sound/soc/samsung/Kconfig
+++ b/sound/soc/samsung/Kconfig
@@ -1,6 +1,7 @@
 menuconfig SND_SOC_SAMSUNG
 	tristate "ASoC support for Samsung"
-	depends on (PLAT_SAMSUNG || ARCH_EXYNOS)
+	depends on PLAT_SAMSUNG || ARCH_EXYNOS || COMPILE_TEST
+	depends on COMMON_CLK
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 	---help---
 	  Say Y or M if you want to add support for codecs attached to
-- 
2.7.4
