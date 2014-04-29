From: Xia Kaixu <kaixu.xia@linaro.org>
Subject: [PATCH 07/15] ASoC: UDA1380 needs I2C
Date: Tue, 29 Apr 2014 19:18:28 +0800
Message-ID: <1398770316-19715-8-git-send-email-kaixu.xia@linaro.org>
References: <1398770316-19715-1-git-send-email-kaixu.xia@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1398770316-19715-1-git-send-email-kaixu.xia@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-kernel@vger.kernel.org
Cc: alsa-devel@alsa-project.org, linaro-kernel@lists.linaro.org, arnd@arndb.de, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-samsung-soc@vger.kernel.org, Mark Brown <broonie@kernel.org>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, kaixu.xia@linaro.org
List-Id: linux-samsung-soc@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

The UDA1380 driver needs I2C to be enabled, so 
SND_SOC_SAMSUNG_H1940_UDA1380 and 
SND_SOC_SAMSUNG_RX1950_UDA1380 also 
require this.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Xia Kaixu <kaixu.xia@linaro.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Ben Dooks <ben-linux@fluff.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>
Cc: alsa-devel@alsa-project.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
---
 sound/soc/samsung/Kconfig |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/samsung/Kconfig b/sound/soc/samsung/Kconfig
index 0c5e9e2..b09b5a4 100644
--- a/sound/soc/samsung/Kconfig
+++ b/sound/soc/samsung/Kconfig
@@ -130,7 +130,7 @@ config SND_SOC_SAMSUNG_SIMTEC_HERMES
 
 config SND_SOC_SAMSUNG_H1940_UDA1380
 	tristate "Audio support for the HP iPAQ H1940"
-	depends on SND_SOC_SAMSUNG && ARCH_H1940
+	depends on SND_SOC_SAMSUNG && ARCH_H1940 && I2C
 	select SND_S3C24XX_I2S
 	select SND_SOC_UDA1380
 	help
@@ -138,7 +138,7 @@ config SND_SOC_SAMSUNG_H1940_UDA1380
 
 config SND_SOC_SAMSUNG_RX1950_UDA1380
 	tristate "Audio support for the HP iPAQ RX1950"
-	depends on SND_SOC_SAMSUNG && MACH_RX1950
+	depends on SND_SOC_SAMSUNG && MACH_RX1950 && I2C
 	select SND_S3C24XX_I2S
 	select SND_SOC_UDA1380
 	help
-- 
1.7.9.5
