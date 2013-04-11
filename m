From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 18/30] ASoC: samsung: move plat/ headers to
	local directory
Date: Thu, 11 Apr 2013 02:05:00 +0200
Message-ID: <1365638712-1028578-19-git-send-email-arnd@arndb.de>
References: <1365638712-1028578-1-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <1365638712-1028578-1-git-send-email-arnd@arndb.de>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: linux-arm-kernel@lists.infradead.org
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@opensource.wolfsonmicro.com>, linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The plat/iis.h and plat/ac97.h files in the samsung platform are
only needed by the ASoC drivers, so they can be moved into the
same directory, as one more step towards a multiplatform build.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Cc: alsa-devel@alsa-project.org
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>
---
 arch/arm/mach-s3c24xx/dma-s3c2410.c                                   | 2 --
 arch/arm/mach-s3c24xx/dma-s3c2412.c                                   | 2 --
 arch/arm/mach-s3c24xx/dma-s3c2440.c                                   | 2 --
 arch/arm/mach-s3c24xx/dma-s3c2443.c                                   | 2 --
 sound/soc/samsung/ac97.c                                              | 2 +-
 sound/soc/samsung/h1940_uda1380.c                                     | 2 +-
 sound/soc/samsung/neo1973_wm8753.c                                    | 2 +-
 {arch/arm/plat-samsung/include/plat => sound/soc/samsung}/regs-ac97.h | 0
 {arch/arm/plat-samsung/include/plat => sound/soc/samsung}/regs-iis.h  | 0
 sound/soc/samsung/rx1950_uda1380.c                                    | 2 +-
 sound/soc/samsung/s3c24xx-i2s.c                                       | 2 +-
 sound/soc/samsung/s3c24xx_uda134x.c                                   | 2 +-
 12 files changed, 6 insertions(+), 14 deletions(-)
 rename {arch/arm/plat-samsung/include/plat => sound/soc/samsung}/regs-ac97.h (100%)
 rename {arch/arm/plat-samsung/include/plat => sound/soc/samsung}/regs-iis.h (100%)

diff --git a/arch/arm/mach-s3c24xx/dma-s3c2410.c b/arch/arm/mach-s3c24xx/dma-s3c2410.c
index a6c94b8..30aa53f 100644
--- a/arch/arm/mach-s3c24xx/dma-s3c2410.c
+++ b/arch/arm/mach-s3c24xx/dma-s3c2410.c
@@ -25,10 +25,8 @@
 
 #include <plat/regs-serial.h>
 #include <mach/regs-gpio.h>
-#include <plat/regs-ac97.h>
 #include <plat/regs-dma.h>
 #include <mach/regs-lcd.h>
-#include <plat/regs-iis.h>
 #include <plat/regs-spi.h>
 
 static struct s3c24xx_dma_map __initdata s3c2410_dma_mappings[] = {
diff --git a/arch/arm/mach-s3c24xx/dma-s3c2412.c b/arch/arm/mach-s3c24xx/dma-s3c2412.c
index c0e8c3f..ab1700e 100644
--- a/arch/arm/mach-s3c24xx/dma-s3c2412.c
+++ b/arch/arm/mach-s3c24xx/dma-s3c2412.c
@@ -25,10 +25,8 @@
 
 #include <plat/regs-serial.h>
 #include <mach/regs-gpio.h>
-#include <plat/regs-ac97.h>
 #include <plat/regs-dma.h>
 #include <mach/regs-lcd.h>
-#include <plat/regs-iis.h>
 #include <plat/regs-spi.h>
 
 #define MAP(x) { (x)| DMA_CH_VALID, (x)| DMA_CH_VALID, (x)| DMA_CH_VALID, (x)| DMA_CH_VALID }
diff --git a/arch/arm/mach-s3c24xx/dma-s3c2440.c b/arch/arm/mach-s3c24xx/dma-s3c2440.c
index 1c08eccd..cd25de2 100644
--- a/arch/arm/mach-s3c24xx/dma-s3c2440.c
+++ b/arch/arm/mach-s3c24xx/dma-s3c2440.c
@@ -25,10 +25,8 @@
 
 #include <plat/regs-serial.h>
 #include <mach/regs-gpio.h>
-#include <plat/regs-ac97.h>
 #include <plat/regs-dma.h>
 #include <mach/regs-lcd.h>
-#include <plat/regs-iis.h>
 #include <plat/regs-spi.h>
 
 static struct s3c24xx_dma_map __initdata s3c2440_dma_mappings[] = {
diff --git a/arch/arm/mach-s3c24xx/dma-s3c2443.c b/arch/arm/mach-s3c24xx/dma-s3c2443.c
index 000e4c6..5fe3539 100644
--- a/arch/arm/mach-s3c24xx/dma-s3c2443.c
+++ b/arch/arm/mach-s3c24xx/dma-s3c2443.c
@@ -25,10 +25,8 @@
 
 #include <plat/regs-serial.h>
 #include <mach/regs-gpio.h>
-#include <plat/regs-ac97.h>
 #include <plat/regs-dma.h>
 #include <mach/regs-lcd.h>
-#include <plat/regs-iis.h>
 #include <plat/regs-spi.h>
 
 #define MAP(x) { \
diff --git a/sound/soc/samsung/ac97.c b/sound/soc/samsung/ac97.c
index 0df3c56..c76abdf 100644
--- a/sound/soc/samsung/ac97.c
+++ b/sound/soc/samsung/ac97.c
@@ -20,7 +20,7 @@
 #include <sound/soc.h>
 
 #include <mach/dma.h>
-#include <plat/regs-ac97.h>
+#include "regs-ac97.h"
 #include <linux/platform_data/asoc-s3c.h>
 
 #include "dma.h"
diff --git a/sound/soc/samsung/h1940_uda1380.c b/sound/soc/samsung/h1940_uda1380.c
index 15a3817..fa91376 100644
--- a/sound/soc/samsung/h1940_uda1380.c
+++ b/sound/soc/samsung/h1940_uda1380.c
@@ -20,7 +20,7 @@
 #include <sound/soc.h>
 #include <sound/jack.h>
 
-#include <plat/regs-iis.h>
+#include "regs-iis.h"
 #include <asm/mach-types.h>
 
 #include "s3c24xx-i2s.h"
diff --git a/sound/soc/samsung/neo1973_wm8753.c b/sound/soc/samsung/neo1973_wm8753.c
index a301d8c..ccc601d 100644
--- a/sound/soc/samsung/neo1973_wm8753.c
+++ b/sound/soc/samsung/neo1973_wm8753.c
@@ -21,7 +21,7 @@
 #include <sound/soc.h>
 
 #include <asm/mach-types.h>
-#include <plat/regs-iis.h>
+#include "regs-iis.h"
 #include <mach/gta02.h>
 
 #include "../codecs/wm8753.h"
diff --git a/arch/arm/plat-samsung/include/plat/regs-ac97.h b/sound/soc/samsung/regs-ac97.h
similarity index 100%
rename from arch/arm/plat-samsung/include/plat/regs-ac97.h
rename to sound/soc/samsung/regs-ac97.h
diff --git a/arch/arm/plat-samsung/include/plat/regs-iis.h b/sound/soc/samsung/regs-iis.h
similarity index 100%
rename from arch/arm/plat-samsung/include/plat/regs-iis.h
rename to sound/soc/samsung/regs-iis.h
diff --git a/sound/soc/samsung/rx1950_uda1380.c b/sound/soc/samsung/rx1950_uda1380.c
index a5826ea..704460a 100644
--- a/sound/soc/samsung/rx1950_uda1380.c
+++ b/sound/soc/samsung/rx1950_uda1380.c
@@ -24,7 +24,7 @@
 #include <sound/soc.h>
 #include <sound/jack.h>
 
-#include <plat/regs-iis.h>
+#include "regs-iis.h"
 #include <asm/mach-types.h>
 
 #include "s3c24xx-i2s.h"
diff --git a/sound/soc/samsung/s3c24xx-i2s.c b/sound/soc/samsung/s3c24xx-i2s.c
index 13f6dd1..a7b17c1 100644
--- a/sound/soc/samsung/s3c24xx-i2s.c
+++ b/sound/soc/samsung/s3c24xx-i2s.c
@@ -24,7 +24,7 @@
 #include <sound/pcm_params.h>
 
 #include <mach/dma.h>
-#include <plat/regs-iis.h>
+#include "regs-iis.h"
 
 #include "dma.h"
 #include "s3c24xx-i2s.h"
diff --git a/sound/soc/samsung/s3c24xx_uda134x.c b/sound/soc/samsung/s3c24xx_uda134x.c
index 333e1b7..1b7b52b 100644
--- a/sound/soc/samsung/s3c24xx_uda134x.c
+++ b/sound/soc/samsung/s3c24xx_uda134x.c
@@ -18,7 +18,7 @@
 #include <sound/soc.h>
 #include <sound/s3c24xx_uda134x.h>
 
-#include <plat/regs-iis.h>
+#include "regs-iis.h"
 
 #include "s3c24xx-i2s.h"
 
-- 
1.8.1.2
