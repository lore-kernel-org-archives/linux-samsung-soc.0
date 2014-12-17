From: Stefan Hengelein <stefan.hengelein@fau.de>
Subject: [PATCH] ARM: SAMSUNG: remove dead #elif CONFIG_S3C24XX_DMAC
Date: Wed, 17 Dec 2014 16:40:37 +0100
Message-ID: <1418830837-7422-1-git-send-email-stefan.hengelein@fau.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: kgene@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux@arm.linux.org.uk, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Stefan Hengelein <stefan.hengelein@fau.de>, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

The corresponding CPP-block can never be selected since there are
conflicting Kconfig constraints:
- CONFIG_S3C24XX_DMAC has a dependency on ARCH_S3C24XX
- The surrounding CPP-block needs CONFIG_S3C64XX_DEV_SPI0 to be defined.
  - CONFIG_S3C64XX_DEV_SPI0 is only selected by MACH_WLF_CRAGG_6410
  - MACH_WLF_CRAGG_6410 however has a dependency on ARCH_S3C64XX
    (through a surrounding if-statement in Kconfig)
- ARCH_S3C64XX and ARCH_S3C24XX are mutually exclusive since they are
  declared in the same choice and cannot be enabled at the same time.

Hence, the innner block
    "#elif defined(CONFIG_S3C24XX_DMAC)"
cannot be enabled at the same time with the surrounding block
    "#ifdef CONFIG_S3C64XX_DEV_SPI0"
and therefore is dead.

This (logical) defect has been found with the undertaker tool
(https://undertaker.cs.fau.de)

Signed-off-by: Stefan Hengelein <stefan.hengelein@fau.de>
---
 arch/arm/plat-samsung/devs.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/plat-samsung/devs.c b/arch/arm/plat-samsung/devs.c
index 83c7d15..b38b601 100644
--- a/arch/arm/plat-samsung/devs.c
+++ b/arch/arm/plat-samsung/devs.c
@@ -1134,8 +1134,6 @@ void __init s3c64xx_spi0_set_platdata(int (*cfg_gpio)(void), int src_clk_nr,
 	pd.filter = pl330_filter;
 #elif defined(CONFIG_S3C64XX_PL080)
 	pd.filter = pl08x_filter_id;
-#elif defined(CONFIG_S3C24XX_DMAC)
-	pd.filter = s3c24xx_dma_filter;
 #endif
 
 	s3c_set_platdata(&pd, sizeof(pd), &s3c64xx_device_spi0);
-- 
1.9.1
