From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>
Subject: [PATCH v2 4/4] ARM: SAMSUNG: set s3c24xx_dma_filter for s3c64xx-spi0 device
Date: Wed, 14 Aug 2013 14:01:22 +0200
Message-ID: <201308141401.22989.heiko@sntech.de>
References: <201308141359.13872.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201308141359.13872.heiko@sntech.de>
Sender: linux-kernel-owner@vger.kernel.org
To: kgene.kim@samsung.com
Cc: Dan Williams <djbw@fb.com>, Vinod Koul <vinod.koul@intel.com>, linus.walleij@linaro.org, Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

The spi-s3c64xx device is also used on the s3c2416 and s3c2443 SoCs.
The driver also already uses only generic dma-engine operations.

Therefore add another elif to set the s3c24xx filter.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm/plat-samsung/devs.c |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/plat-samsung/devs.c b/arch/arm/plat-samsung/devs.c
index 0f9c3f4..fab458f 100644
--- a/arch/arm/plat-samsung/devs.c
+++ b/arch/arm/plat-samsung/devs.c
@@ -32,6 +32,7 @@
 #include <linux/ioport.h>
 #include <linux/platform_data/s3c-hsudc.h>
 #include <linux/platform_data/s3c-hsotg.h>
+#include <linux/platform_data/dma-s3c24xx.h>
 
 #include <media/s5p_hdmi.h>
 
@@ -1513,8 +1514,10 @@ void __init s3c64xx_spi0_set_platdata(int (*cfg_gpio)(void), int src_clk_nr,
 	pd.num_cs = num_cs;
 	pd.src_clk_nr = src_clk_nr;
 	pd.cfg_gpio = (cfg_gpio) ? cfg_gpio : s3c64xx_spi0_cfg_gpio;
-#ifdef CONFIG_PL330_DMA
+#if defined(CONFIG_PL330_DMA)
 	pd.filter = pl330_filter;
+#elif defined(CONFIG_S3C24XX_DMAC)
+	pd.filter = s3c24xx_dma_filter;
 #endif
 
 	s3c_set_platdata(&pd, sizeof(pd), &s3c64xx_device_spi0);
-- 
1.7.10.4
