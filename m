From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 04/36] usb: gadget: s3c-hsudc: remove platform header
 dependency
Date: Thu, 10 Oct 2019 22:29:48 +0200
Message-ID: <20191010203043.1241612-4-arnd@arndb.de>
References: <20191010202802.1132272-1-arnd@arndb.de>
 <20191010203043.1241612-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20191010203043.1241612-1-arnd@arndb.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-samsung-soc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linus.walleij@linaro.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

There is no real phy driver, so s3c-hsudc just pokes the registers
itself. Improve this a little by making it a platform data callback
like we do for gpios.

There is only one board using this driver, and it's unlikely
that another would be added, so this is a minimal workaround.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 .../include/mach/regs-s3c2443-clock.h         | 49 +++++++++++++++++
 arch/arm/plat-samsung/devs.c                  |  3 +
 drivers/usb/gadget/udc/s3c-hsudc.c            | 55 ++-----------------
 include/linux/platform_data/s3c-hsudc.h       |  2 +
 4 files changed, 58 insertions(+), 51 deletions(-)

diff --git a/arch/arm/mach-s3c24xx/include/mach/regs-s3c2443-clock.h b/arch/arm/mach-s3c24xx/include/mach/regs-s3c2443-clock.h
index 6bf924612b06..682759549e63 100644
--- a/arch/arm/mach-s3c24xx/include/mach/regs-s3c2443-clock.h
+++ b/arch/arm/mach-s3c24xx/include/mach/regs-s3c2443-clock.h
@@ -10,6 +10,8 @@
 #ifndef __ASM_ARM_REGS_S3C2443_CLOCK
 #define __ASM_ARM_REGS_S3C2443_CLOCK
 
+#include <linux/delay.h>
+
 #define S3C2443_CLKREG(x)		((x) + S3C24XX_VA_CLKPWR)
 
 #define S3C2443_PLLCON_MDIVSHIFT	16
@@ -184,5 +186,52 @@ s3c2443_get_epll(unsigned int pllval, unsigned int baseclk)
 	return (unsigned int)fvco;
 }
 
+static inline void s3c_hsudc_init_phy(void)
+{
+	u32 cfg;
+
+	cfg = readl(S3C2443_PWRCFG) | S3C2443_PWRCFG_USBPHY;
+	writel(cfg, S3C2443_PWRCFG);
+
+	cfg = readl(S3C2443_URSTCON);
+	cfg |= (S3C2443_URSTCON_FUNCRST | S3C2443_URSTCON_PHYRST);
+	writel(cfg, S3C2443_URSTCON);
+	mdelay(1);
+
+	cfg = readl(S3C2443_URSTCON);
+	cfg &= ~(S3C2443_URSTCON_FUNCRST | S3C2443_URSTCON_PHYRST);
+	writel(cfg, S3C2443_URSTCON);
+
+	cfg = readl(S3C2443_PHYCTRL);
+	cfg &= ~(S3C2443_PHYCTRL_CLKSEL | S3C2443_PHYCTRL_DSPORT);
+	cfg |= (S3C2443_PHYCTRL_EXTCLK | S3C2443_PHYCTRL_PLLSEL);
+	writel(cfg, S3C2443_PHYCTRL);
+
+	cfg = readl(S3C2443_PHYPWR);
+	cfg &= ~(S3C2443_PHYPWR_FSUSPEND | S3C2443_PHYPWR_PLL_PWRDN |
+		S3C2443_PHYPWR_XO_ON | S3C2443_PHYPWR_PLL_REFCLK |
+		S3C2443_PHYPWR_ANALOG_PD);
+	cfg |= S3C2443_PHYPWR_COMMON_ON;
+	writel(cfg, S3C2443_PHYPWR);
+
+	cfg = readl(S3C2443_UCLKCON);
+	cfg |= (S3C2443_UCLKCON_DETECT_VBUS | S3C2443_UCLKCON_FUNC_CLKEN |
+		S3C2443_UCLKCON_TCLKEN);
+	writel(cfg, S3C2443_UCLKCON);
+}
+
+static inline void s3c_hsudc_uninit_phy(void)
+{
+	u32 cfg;
+
+	cfg = readl(S3C2443_PWRCFG) & ~S3C2443_PWRCFG_USBPHY;
+	writel(cfg, S3C2443_PWRCFG);
+
+	writel(S3C2443_PHYPWR_FSUSPEND, S3C2443_PHYPWR);
+
+	cfg = readl(S3C2443_UCLKCON) & ~S3C2443_UCLKCON_FUNC_CLKEN;
+	writel(cfg, S3C2443_UCLKCON);
+}
+
 #endif /*  __ASM_ARM_REGS_S3C2443_CLOCK */
 
diff --git a/arch/arm/plat-samsung/devs.c b/arch/arm/plat-samsung/devs.c
index 1d1fa068d228..6e4c1cb07104 100644
--- a/arch/arm/plat-samsung/devs.c
+++ b/arch/arm/plat-samsung/devs.c
@@ -40,6 +40,7 @@
 #include <mach/dma.h>
 #include <mach/irqs.h>
 #include <mach/map.h>
+#include <mach/regs-s3c2443-clock.h>
 
 #include <plat/cpu.h>
 #include <plat/devs.h>
@@ -1038,6 +1039,8 @@ struct platform_device s3c_device_usb_hsudc = {
 void __init s3c24xx_hsudc_set_platdata(struct s3c24xx_hsudc_platdata *pd)
 {
 	s3c_set_platdata(pd, sizeof(*pd), &s3c_device_usb_hsudc);
+	pd->phy_init = s3c_hsudc_init_phy;
+	pd->phy_uninit = s3c_hsudc_uninit_phy;
 }
 #endif /* CONFIG_PLAT_S3C24XX */
 
diff --git a/drivers/usb/gadget/udc/s3c-hsudc.c b/drivers/usb/gadget/udc/s3c-hsudc.c
index 858993c73442..d482cbb4bb4d 100644
--- a/drivers/usb/gadget/udc/s3c-hsudc.c
+++ b/drivers/usb/gadget/udc/s3c-hsudc.c
@@ -30,8 +30,6 @@
 #include <linux/regulator/consumer.h>
 #include <linux/pm_runtime.h>
 
-#include <mach/regs-s3c2443-clock.h>
-
 #define S3C_HSUDC_REG(x)	(x)
 
 /* Non-Indexed Registers */
@@ -186,53 +184,6 @@ static inline void __orr32(void __iomem *ptr, u32 val)
 	writel(readl(ptr) | val, ptr);
 }
 
-static void s3c_hsudc_init_phy(void)
-{
-	u32 cfg;
-
-	cfg = readl(S3C2443_PWRCFG) | S3C2443_PWRCFG_USBPHY;
-	writel(cfg, S3C2443_PWRCFG);
-
-	cfg = readl(S3C2443_URSTCON);
-	cfg |= (S3C2443_URSTCON_FUNCRST | S3C2443_URSTCON_PHYRST);
-	writel(cfg, S3C2443_URSTCON);
-	mdelay(1);
-
-	cfg = readl(S3C2443_URSTCON);
-	cfg &= ~(S3C2443_URSTCON_FUNCRST | S3C2443_URSTCON_PHYRST);
-	writel(cfg, S3C2443_URSTCON);
-
-	cfg = readl(S3C2443_PHYCTRL);
-	cfg &= ~(S3C2443_PHYCTRL_CLKSEL | S3C2443_PHYCTRL_DSPORT);
-	cfg |= (S3C2443_PHYCTRL_EXTCLK | S3C2443_PHYCTRL_PLLSEL);
-	writel(cfg, S3C2443_PHYCTRL);
-
-	cfg = readl(S3C2443_PHYPWR);
-	cfg &= ~(S3C2443_PHYPWR_FSUSPEND | S3C2443_PHYPWR_PLL_PWRDN |
-		S3C2443_PHYPWR_XO_ON | S3C2443_PHYPWR_PLL_REFCLK |
-		S3C2443_PHYPWR_ANALOG_PD);
-	cfg |= S3C2443_PHYPWR_COMMON_ON;
-	writel(cfg, S3C2443_PHYPWR);
-
-	cfg = readl(S3C2443_UCLKCON);
-	cfg |= (S3C2443_UCLKCON_DETECT_VBUS | S3C2443_UCLKCON_FUNC_CLKEN |
-		S3C2443_UCLKCON_TCLKEN);
-	writel(cfg, S3C2443_UCLKCON);
-}
-
-static void s3c_hsudc_uninit_phy(void)
-{
-	u32 cfg;
-
-	cfg = readl(S3C2443_PWRCFG) & ~S3C2443_PWRCFG_USBPHY;
-	writel(cfg, S3C2443_PWRCFG);
-
-	writel(S3C2443_PHYPWR_FSUSPEND, S3C2443_PHYPWR);
-
-	cfg = readl(S3C2443_UCLKCON) & ~S3C2443_UCLKCON_FUNC_CLKEN;
-	writel(cfg, S3C2443_UCLKCON);
-}
-
 /**
  * s3c_hsudc_complete_request - Complete a transfer request.
  * @hsep: Endpoint to which the request belongs.
@@ -1188,7 +1139,8 @@ static int s3c_hsudc_start(struct usb_gadget *gadget,
 
 	pm_runtime_get_sync(hsudc->dev);
 
-	s3c_hsudc_init_phy();
+	if (hsudc->pd->phy_init)
+		hsudc->pd->gpio_init();
 	if (hsudc->pd->gpio_init)
 		hsudc->pd->gpio_init();
 
@@ -1210,7 +1162,8 @@ static int s3c_hsudc_stop(struct usb_gadget *gadget)
 
 	spin_lock_irqsave(&hsudc->lock, flags);
 	hsudc->gadget.speed = USB_SPEED_UNKNOWN;
-	s3c_hsudc_uninit_phy();
+	if (hsudc->pd->phy_uninit)
+		hsudc->pd->phy_uninit();
 
 	pm_runtime_put(hsudc->dev);
 
diff --git a/include/linux/platform_data/s3c-hsudc.h b/include/linux/platform_data/s3c-hsudc.h
index 4dc9b8760166..a170939832d5 100644
--- a/include/linux/platform_data/s3c-hsudc.h
+++ b/include/linux/platform_data/s3c-hsudc.h
@@ -26,6 +26,8 @@ struct s3c24xx_hsudc_platdata {
 	unsigned int	epnum;
 	void		(*gpio_init)(void);
 	void		(*gpio_uninit)(void);
+	void		(*phy_init)(void);
+	void		(*phy_uninit)(void);
 };
 
 #endif	/* __LINUX_USB_S3C_HSUDC_H */
-- 
2.20.0
