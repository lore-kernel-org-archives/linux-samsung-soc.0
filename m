From: Ben Dooks <ben-linux@fluff.org>
Subject: [PATCH 2/6] ARM: S3C2443: Change to using plat-samsung clksrc-clk implementation
Date: Sat, 30 Jan 2010 15:11:29 +0200
Message-ID: <1264857093-4040-3-git-send-email-ben-linux@fluff.org>
References: <1264857093-4040-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from [82.203.205.227] ([82.203.205.227]:7661 "EHLO ben-laptop"
	rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
	id S1753156Ab0A3NXl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 30 Jan 2010 08:23:41 -0500
In-Reply-To: <1264857093-4040-1-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Ben Dooks <ben-linux@fluff.org>

The S3C2443 clock code could easily make use of the clksrc implementation
in plat-samsung for many of the clocks. Make the clocks that easily move
to clksrc-clk over, update any initialisation and remove the old register
definitions from the header file (it is only being used once).

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 .../mach-s3c2410/include/mach/regs-s3c2443-clock.h |   29 +--
 arch/arm/mach-s3c2443/Kconfig                      |    1 +
 arch/arm/mach-s3c2443/clock.c                      |  513 +++++---------------
 arch/arm/plat-samsung/clock-clksrc.c               |    2 +-
 4 files changed, 129 insertions(+), 416 deletions(-)

diff --git a/arch/arm/mach-s3c2410/include/mach/regs-s3c2443-clock.h b/arch/arm/mach-s3c2410/include/mach/regs-s3c2443-clock.h
index 6026d09..64217ca 100644
--- a/arch/arm/mach-s3c2410/include/mach/regs-s3c2443-clock.h
+++ b/arch/arm/mach-s3c2410/include/mach/regs-s3c2443-clock.h
@@ -42,12 +42,6 @@
 
 #define S3C2443_PLLCON_OFF		(1<<24)
 
-#define S3C2443_CLKSRC_I2S_EXT		(1<<14)
-#define S3C2443_CLKSRC_I2S_EPLLDIV	(0<<14)
-#define S3C2443_CLKSRC_I2S_EPLLREF	(2<<14)
-#define S3C2443_CLKSRC_I2S_EPLLREF3	(3<<14)
-#define S3C2443_CLKSRC_I2S_MASK		(3<<14)
-
 #define S3C2443_CLKSRC_EPLLREF_XTAL	(2<<7)
 #define S3C2443_CLKSRC_EPLLREF_EXTCLK	(3<<7)
 #define S3C2443_CLKSRC_EPLLREF_MPLLREF	(0<<7)
@@ -81,28 +75,7 @@
 #define S3C2443_CLKDIV0_ARMDIV_12	(13<<9)
 #define S3C2443_CLKDIV0_ARMDIV_16	(15<<9)
 
-/* S3C2443_CLKDIV1 */
-
-#define S3C2443_CLKDIV1_CAMDIV_MASK	(15<<26)
-#define S3C2443_CLKDIV1_CAMDIV_SHIFT	(26)
-
-#define S3C2443_CLKDIV1_HSSPIDIV_MASK	(3<<24)
-#define S3C2443_CLKDIV1_HSSPIDIV_SHIFT	(24)
-
-#define S3C2443_CLKDIV1_DISPDIV_MASK	(0xff<<16)
-#define S3C2443_CLKDIV1_DISPDIV_SHIFT	(16)
-
-#define S3C2443_CLKDIV1_I2SDIV_MASK	(15<<12)
-#define S3C2443_CLKDIV1_I2SDIV_SHIFT	(12)
-
-#define S3C2443_CLKDIV1_UARTDIV_MASK	(15<<8)
-#define S3C2443_CLKDIV1_UARTDIV_SHIFT	(8)
-
-#define S3C2443_CLKDIV1_HSMMCDIV_MASK	(3<<6)
-#define S3C2443_CLKDIV1_HSMMCDIV_SHIFT	(6)
-
-#define S3C2443_CLKDIV1_USBHOSTDIV_MASK	(3<<4)
-#define S3C2443_CLKDIV1_USBHOSTDIV_SHIFT (4)
+/* S3C2443_CLKDIV1 removed, only used in clock.c code */
 
 #define S3C2443_CLKCON_NAND
 
diff --git a/arch/arm/mach-s3c2443/Kconfig b/arch/arm/mach-s3c2443/Kconfig
index 4314c44..698140a 100644
--- a/arch/arm/mach-s3c2443/Kconfig
+++ b/arch/arm/mach-s3c2443/Kconfig
@@ -7,6 +7,7 @@ config CPU_S3C2443
 	depends on ARCH_S3C2410
 	select S3C2443_DMA if S3C2410_DMA
 	select CPU_LLSERIAL_S3C2440
+	select SAMSUNG_CLKSRC
 	help
 	  Support for the S3C2443 SoC from the S3C24XX line
 
diff --git a/arch/arm/mach-s3c2443/clock.c b/arch/arm/mach-s3c2443/clock.c
index 5d061ea..f89e71f 100644
--- a/arch/arm/mach-s3c2443/clock.c
+++ b/arch/arm/mach-s3c2443/clock.c
@@ -1,6 +1,6 @@
 /* linux/arch/arm/mach-s3c2443/clock.c
  *
- * Copyright (c) 2007 Simtec Electronics
+ * Copyright (c) 2007,2010 Simtec Electronics
  *	Ben Dooks <ben@simtec.co.uk>
  *
  * S3C2443 Clock control support
@@ -42,6 +42,7 @@
 
 #include <plat/s3c2443.h>
 #include <plat/clock.h>
+#include <plat/clock-clksrc.h>
 #include <plat/cpu.h>
 
 /* We currently have to assume that the system is running
@@ -82,45 +83,7 @@ static int s3c2443_clkcon_enable_s(struct clk *clk, int enable)
 	return s3c2443_gate(S3C2443_SCLKCON, clk, enable);
 }
 
-static unsigned long s3c2443_roundrate_clksrc(struct clk *clk,
-					      unsigned long rate,
-					      unsigned int max)
-{
-	unsigned long parent_rate = clk_get_rate(clk->parent);
-	int div;
-
-	if (rate > parent_rate)
-		return parent_rate;
-
-	/* note, we remove the +/- 1 calculations as they cancel out */
-
-	div = (rate / parent_rate);
-
-	if (div < 1)
-		div = 1;
-	else if (div > max)
-		div = max;
-
-	return parent_rate / div;
-}
-
-static unsigned long s3c2443_roundrate_clksrc4(struct clk *clk,
-					       unsigned long rate)
-{
-	return s3c2443_roundrate_clksrc(clk, rate, 4);
-}
-
-static unsigned long s3c2443_roundrate_clksrc16(struct clk *clk,
-						unsigned long rate)
-{
-	return s3c2443_roundrate_clksrc(clk, rate, 16);
-}
-
-static unsigned long s3c2443_roundrate_clksrc256(struct clk *clk,
-						 unsigned long rate)
-{
-	return s3c2443_roundrate_clksrc(clk, rate, 256);
-}
+/* s3c2443_roundate_clksrc is close enough to s3c_roundate_clksrc */
 
 /* clock selections */
 
@@ -143,31 +106,23 @@ static struct clk clk_i2s_ext = {
 	.id		= -1,
 };
 
-static int s3c2443_setparent_epllref(struct clk *clk, struct clk *parent)
-{
-	unsigned long clksrc = __raw_readl(S3C2443_CLKSRC);
-
-	clksrc &= ~S3C2443_CLKSRC_EPLLREF_MASK;
-
-	if (parent == &clk_xtal)
-		clksrc |= S3C2443_CLKSRC_EPLLREF_XTAL;
-	else if (parent == &clk_ext)
-		clksrc |= S3C2443_CLKSRC_EPLLREF_EXTCLK;
-	else if (parent != &clk_mpllref)
-		return -EINVAL;
-
-	__raw_writel(clksrc, S3C2443_CLKSRC);
-	clk->parent = parent;
-
-	return 0;
-}
+static struct clk *clk_epllref_sources[] = {
+	[0] = &clk_mpllref,
+	[1] = &clk_mpllref,
+	[2] = &clk_xtal,
+	[3] = &clk_ext,
+};
 
-static struct clk clk_epllref = {
-	.name		= "epllref",
-	.id		= -1,
-	.ops		= &(struct clk_ops) {
-		.set_parent	= s3c2443_setparent_epllref,
+static struct clksrc_clk clk_epllref = {
+	.clk	= {
+		.name		= "epllref",
+		.id		= -1,
+	},
+	.sources = &(struct clksrc_sources) {
+		.sources = clk_epllref_sources,
+		.nr_sources = ARRAY_SIZE(clk_epllref_sources),
 	},
+	.reg_src = { .reg = S3C2443_CLKSRC, .size = 2, .shift = 7 },
 };
 
 static unsigned long s3c2443_getrate_mdivclk(struct clk *clk)
@@ -273,7 +228,7 @@ static int s3c2443_setparent_esysclk(struct clk *clk, struct clk *parent)
 
 	if (parent == &clk_epll)
 		clksrc |= S3C2443_CLKSRC_ESYSCLK_EPLL;
-	else if (parent == &clk_epllref)
+	else if (parent == &clk_epllref.clk)
 		clksrc &= ~S3C2443_CLKSRC_ESYSCLK_EPLL;
 	else
 		return -EINVAL;
@@ -298,87 +253,30 @@ static struct clk clk_esysclk = {
  * UART baud-rate clock sourced from esysclk via a divisor
 */
 
-static unsigned long s3c2443_getrate_uart(struct clk *clk)
-{
-	unsigned long parent_rate = clk_get_rate(clk->parent);
-	unsigned long div = __raw_readl(S3C2443_CLKDIV1);
-
-	div &= S3C2443_CLKDIV1_UARTDIV_MASK;
-	div >>= S3C2443_CLKDIV1_UARTDIV_SHIFT;
-
-	return parent_rate / (div + 1);
-}
-
-
-static int s3c2443_setrate_uart(struct clk *clk, unsigned long rate)
-{
-	unsigned long parent_rate = clk_get_rate(clk->parent);
-	unsigned long clkdivn = __raw_readl(S3C2443_CLKDIV1);
-
-	rate = s3c2443_roundrate_clksrc16(clk, rate);
-	rate = parent_rate / rate;
-
-	clkdivn &= ~S3C2443_CLKDIV1_UARTDIV_MASK;
-	clkdivn |= (rate - 1) << S3C2443_CLKDIV1_UARTDIV_SHIFT;
-
-	__raw_writel(clkdivn, S3C2443_CLKDIV1);
-	return 0;
-}
-
-static struct clk clk_uart = {
-	.name		= "uartclk",
-	.id		= -1,
-	.parent		= &clk_esysclk,
-	.ops		= &(struct clk_ops) {
-		.get_rate	= s3c2443_getrate_uart,
-		.set_rate	= s3c2443_setrate_uart,
-		.round_rate	= s3c2443_roundrate_clksrc16,
+static struct clksrc_clk clk_uart = {
+	.clk	= {
+		.name		= "uartclk",
+		.id		= -1,
+		.parent		= &clk_esysclk,
 	},
+	.reg_div = { .reg = S3C2443_CLKDIV1, .size = 4, .shift = 8 },
 };
 
+
 /* hsspi
  *
  * high-speed spi clock, sourced from esysclk
 */
 
-static unsigned long s3c2443_getrate_hsspi(struct clk *clk)
-{
-	unsigned long parent_rate = clk_get_rate(clk->parent);
-	unsigned long div = __raw_readl(S3C2443_CLKDIV1);
-
-	div &= S3C2443_CLKDIV1_HSSPIDIV_MASK;
-	div >>= S3C2443_CLKDIV1_HSSPIDIV_SHIFT;
-
-	return parent_rate / (div + 1);
-}
-
-
-static int s3c2443_setrate_hsspi(struct clk *clk, unsigned long rate)
-{
-	unsigned long parent_rate = clk_get_rate(clk->parent);
-	unsigned long clkdivn = __raw_readl(S3C2443_CLKDIV1);
-
-	rate = s3c2443_roundrate_clksrc4(clk, rate);
-	rate = parent_rate / rate;
-
-	clkdivn &= ~S3C2443_CLKDIV1_HSSPIDIV_MASK;
-	clkdivn |= (rate - 1) << S3C2443_CLKDIV1_HSSPIDIV_SHIFT;
-
-	__raw_writel(clkdivn, S3C2443_CLKDIV1);
-	return 0;
-}
-
-static struct clk clk_hsspi = {
-	.name		= "hsspi",
-	.id		= -1,
-	.parent		= &clk_esysclk,
-	.ctrlbit	= S3C2443_SCLKCON_HSSPICLK,
-	.enable		= s3c2443_clkcon_enable_s,
-	.ops		= &(struct clk_ops) {
-		.get_rate	= s3c2443_getrate_hsspi,
-		.set_rate	= s3c2443_setrate_hsspi,
-		.round_rate	= s3c2443_roundrate_clksrc4,
+static struct clksrc_clk clk_hsspi = {
+	.clk	= {
+		.name		= "hsspi",
+		.id		= -1,
+		.parent		= &clk_esysclk,
+		.ctrlbit	= S3C2443_SCLKCON_HSSPICLK,
+		.enable		= s3c2443_clkcon_enable_s,
 	},
+	.reg_div = { .reg = S3C2443_CLKDIV1, .size = 2, .shift = 4 },
 };
 
 /* usbhost
@@ -386,43 +284,15 @@ static struct clk clk_hsspi = {
  * usb host bus-clock, usually 48MHz to provide USB bus clock timing
 */
 
-static unsigned long s3c2443_getrate_usbhost(struct clk *clk)
-{
-	unsigned long parent_rate = clk_get_rate(clk->parent);
-	unsigned long div = __raw_readl(S3C2443_CLKDIV1);
-
-	div &= S3C2443_CLKDIV1_USBHOSTDIV_MASK;
-	div >>= S3C2443_CLKDIV1_USBHOSTDIV_SHIFT;
-
-	return parent_rate / (div + 1);
-}
-
-static int s3c2443_setrate_usbhost(struct clk *clk, unsigned long rate)
-{
-	unsigned long parent_rate = clk_get_rate(clk->parent);
-	unsigned long clkdivn = __raw_readl(S3C2443_CLKDIV1);
-
-	rate = s3c2443_roundrate_clksrc4(clk, rate);
-	rate = parent_rate / rate;
-
-	clkdivn &= ~S3C2443_CLKDIV1_USBHOSTDIV_MASK;
-	clkdivn |= (rate - 1) << S3C2443_CLKDIV1_USBHOSTDIV_SHIFT;
-
-	__raw_writel(clkdivn, S3C2443_CLKDIV1);
-	return 0;
-}
-
-static struct clk clk_usb_bus_host = {
-	.name		= "usb-bus-host-parent",
-	.id		= -1,
-	.parent		= &clk_esysclk,
-	.ctrlbit	= S3C2443_SCLKCON_USBHOST,
-	.enable		= s3c2443_clkcon_enable_s,
-	.ops		= &(struct clk_ops) {
-		.get_rate	= s3c2443_getrate_usbhost,
-		.set_rate	= s3c2443_setrate_usbhost,
-		.round_rate	= s3c2443_roundrate_clksrc4,
+static struct clksrc_clk clk_usb_bus_host = {
+	.clk	= {
+		.name		= "usb-bus-host-parent",
+		.id		= -1,
+		.parent		= &clk_esysclk,
+		.ctrlbit	= S3C2443_SCLKCON_USBHOST,
+		.enable		= s3c2443_clkcon_enable_s,
 	},
+	.reg_div = { .reg = S3C2443_CLKDIV1, .size = 2, .shift = 4 },
 };
 
 /* clk_hsmcc_div
@@ -432,41 +302,13 @@ static struct clk clk_usb_bus_host = {
  * be fed to the hsmmc block
 */
 
-static unsigned long s3c2443_getrate_hsmmc_div(struct clk *clk)
-{
-	unsigned long parent_rate = clk_get_rate(clk->parent);
-	unsigned long div = __raw_readl(S3C2443_CLKDIV1);
-
-	div &= S3C2443_CLKDIV1_HSMMCDIV_MASK;
-	div >>= S3C2443_CLKDIV1_HSMMCDIV_SHIFT;
-
-	return parent_rate / (div + 1);
-}
-
-static int s3c2443_setrate_hsmmc_div(struct clk *clk, unsigned long rate)
-{
-	unsigned long parent_rate = clk_get_rate(clk->parent);
-	unsigned long clkdivn = __raw_readl(S3C2443_CLKDIV1);
-
-	rate = s3c2443_roundrate_clksrc4(clk, rate);
-	rate = parent_rate / rate;
-
-	clkdivn &= ~S3C2443_CLKDIV1_HSMMCDIV_MASK;
-	clkdivn |= (rate - 1) << S3C2443_CLKDIV1_HSMMCDIV_SHIFT;
-
-	__raw_writel(clkdivn, S3C2443_CLKDIV1);
-	return 0;
-}
-
-static struct clk clk_hsmmc_div = {
-	.name		= "hsmmc-div",
-	.id		= -1,
-	.parent		= &clk_esysclk,
-	.ops		= &(struct clk_ops) {
-		.get_rate	= s3c2443_getrate_hsmmc_div,
-		.set_rate	= s3c2443_setrate_hsmmc_div,
-		.round_rate	= s3c2443_roundrate_clksrc4,
+static struct clksrc_clk clk_hsmmc_div = {
+	.clk	= {
+		.name		= "hsmmc-div",
+		.id		= -1,
+		.parent		= &clk_esysclk,
 	},
+	.reg_div = { .reg = S3C2443_CLKDIV1, .size = 2, .shift = 6 },
 };
 
 static int s3c2443_setparent_hsmmc(struct clk *clk, struct clk *parent)
@@ -499,7 +341,7 @@ static int s3c2443_enable_hsmmc(struct clk *clk, int enable)
 static struct clk clk_hsmmc = {
 	.name		= "hsmmc-if",
 	.id		= -1,
-	.parent		= &clk_hsmmc_div,
+	.parent		= &clk_hsmmc_div.clk,
 	.enable		= s3c2443_enable_hsmmc,
 	.ops		= &(struct clk_ops) {
 		.set_parent	= s3c2443_setparent_hsmmc,
@@ -508,79 +350,46 @@ static struct clk clk_hsmmc = {
 
 /* i2s_eplldiv
  *
- * this clock is the output from the i2s divisor of esysclk
+ * This clock is the output from the I2S divisor of ESYSCLK, and is seperate
+ * from the mux that comes after it (cannot merge into one single clock)
 */
 
-static unsigned long s3c2443_getrate_i2s_eplldiv(struct clk *clk)
-{
-	unsigned long parent_rate = clk_get_rate(clk->parent);
-	unsigned long div = __raw_readl(S3C2443_CLKDIV1);
-
-	div &= S3C2443_CLKDIV1_I2SDIV_MASK;
-	div >>= S3C2443_CLKDIV1_I2SDIV_SHIFT;
-
-	return parent_rate / (div + 1);
-}
-
-static int s3c2443_setrate_i2s_eplldiv(struct clk *clk, unsigned long rate)
-{
-	unsigned long parent_rate = clk_get_rate(clk->parent);
-	unsigned long clkdivn = __raw_readl(S3C2443_CLKDIV1);
-
-	rate = s3c2443_roundrate_clksrc16(clk, rate);
-	rate = parent_rate / rate;
-
-	clkdivn &= ~S3C2443_CLKDIV1_I2SDIV_MASK;
-	clkdivn |= (rate - 1) << S3C2443_CLKDIV1_I2SDIV_SHIFT;
-
-	__raw_writel(clkdivn, S3C2443_CLKDIV1);
-	return 0;
-}
-
-static struct clk clk_i2s_eplldiv = {
-	.name		= "i2s-eplldiv",
-	.id		= -1,
-	.parent		= &clk_esysclk,
-	.ops		= &(struct clk_ops) {
-		.get_rate	= s3c2443_getrate_i2s_eplldiv,
-		.set_rate	= s3c2443_setrate_i2s_eplldiv,
-		.round_rate	= s3c2443_roundrate_clksrc16,
+static struct clksrc_clk clk_i2s_eplldiv = {
+	.clk	= {
+		.name		= "i2s-eplldiv",
+		.id		= -1,
+		.parent		= &clk_esysclk,
 	},
+	.reg_div = { .reg = S3C2443_CLKDIV1, .size = 4, .shift = 12, },
 };
 
 /* i2s-ref
  *
  * i2s bus reference clock, selectable from external, esysclk or epllref
+ *
+ * Note, this used to be two clocks, but was compressed into one.
 */
 
-static int s3c2443_setparent_i2s(struct clk *clk, struct clk *parent)
-{
-	unsigned long clksrc = __raw_readl(S3C2443_CLKSRC);
-
-	clksrc &= ~S3C2443_CLKSRC_I2S_MASK;
-
-	if (parent == &clk_epllref)
-		clksrc |= S3C2443_CLKSRC_I2S_EPLLREF;
-	else if (parent == &clk_i2s_ext)
-		clksrc |= S3C2443_CLKSRC_I2S_EXT;
-	else if (parent != &clk_i2s_eplldiv)
-		return -EINVAL;
-
-	clk->parent = parent;
-	__raw_writel(clksrc, S3C2443_CLKSRC);
+struct clk *clk_i2s_srclist[] = {
+	[0] = &clk_i2s_eplldiv.clk,
+	[1] = &clk_i2s_ext,
+	[2] = &clk_epllref.clk,
+	[3] = &clk_epllref.clk,
+};
 
-	return 0;
-}
+static struct clksrc_clk clk_i2s = {
+	.clk	= {
+		.name		= "i2s-if",
+		.id		= -1,
+		.ctrlbit	= S3C2443_SCLKCON_I2SCLK,
+		.enable		= s3c2443_clkcon_enable_s,
 
-static struct clk clk_i2s = {
-	.name		= "i2s-if",
-	.id		= -1,
-	.parent		= &clk_i2s_eplldiv,
-	.ctrlbit	= S3C2443_SCLKCON_I2SCLK,
-	.enable		= s3c2443_clkcon_enable_s,
-	.ops		= &(struct clk_ops) {
-		.set_parent	= s3c2443_setparent_i2s,
 	},
+	.sources = &(struct clksrc_sources) {
+		.sources = clk_i2s_srclist,
+		.nr_sources = ARRAY_SIZE(clk_i2s_srclist),
+	},
+	.reg_src = { .reg = S3C2443_CLKSRC, .size = 2, .shift = 14 },
 };
 
 /* cam-if
@@ -588,43 +397,15 @@ static struct clk clk_i2s = {
  * camera interface bus-clock, divided down from esysclk
 */
 
-static unsigned long s3c2443_getrate_cam(struct clk *clk)
-{
-	unsigned long parent_rate = clk_get_rate(clk->parent);
-	unsigned long div = __raw_readl(S3C2443_CLKDIV1);
-
-	div  &= S3C2443_CLKDIV1_CAMDIV_MASK;
-	div >>= S3C2443_CLKDIV1_CAMDIV_SHIFT;
-
-	return parent_rate / (div + 1);
-}
-
-static int s3c2443_setrate_cam(struct clk *clk, unsigned long rate)
-{
-	unsigned long parent_rate = clk_get_rate(clk->parent);
-	unsigned long clkdiv1 = __raw_readl(S3C2443_CLKDIV1);
-
-	rate = s3c2443_roundrate_clksrc16(clk, rate);
-	rate = parent_rate / rate;
-
-	clkdiv1 &= ~S3C2443_CLKDIV1_CAMDIV_MASK;
-	clkdiv1 |= (rate - 1) << S3C2443_CLKDIV1_CAMDIV_SHIFT;
-
-	__raw_writel(clkdiv1, S3C2443_CLKDIV1);
-	return 0;
-}
-
-static struct clk clk_cam = {
-	.name		= "camif-upll",		/* same as 2440 name */
-	.id		= -1,
-	.parent		= &clk_esysclk,
-	.ctrlbit	= S3C2443_SCLKCON_CAMCLK,
-	.enable		= s3c2443_clkcon_enable_s,
-	.ops		= &(struct clk_ops) {
-		.get_rate	= s3c2443_getrate_cam,
-		.set_rate	= s3c2443_setrate_cam,
-		.round_rate	= s3c2443_roundrate_clksrc16,
+static struct clksrc_clk clk_cam = {
+	.clk	= {
+		.name		= "camif-upll",	/* same as 2440 name */
+		.id		= -1,
+		.parent		= &clk_esysclk,
+		.ctrlbit	= S3C2443_SCLKCON_CAMCLK,
+		.enable		= s3c2443_clkcon_enable_s,
 	},
+	.reg_div = { .reg = S3C2443_CLKDIV1, .size = 4, .shift = 26 },
 };
 
 /* display-if
@@ -632,43 +413,15 @@ static struct clk clk_cam = {
  * display interface clock, divided from esysclk
 */
 
-static unsigned long s3c2443_getrate_display(struct clk *clk)
-{
-	unsigned long parent_rate = clk_get_rate(clk->parent);
-	unsigned long div = __raw_readl(S3C2443_CLKDIV1);
-
-	div &= S3C2443_CLKDIV1_DISPDIV_MASK;
-	div >>= S3C2443_CLKDIV1_DISPDIV_SHIFT;
-
-	return parent_rate / (div + 1);
-}
-
-static int s3c2443_setrate_display(struct clk *clk, unsigned long rate)
-{
-	unsigned long parent_rate = clk_get_rate(clk->parent);
-	unsigned long clkdivn = __raw_readl(S3C2443_CLKDIV1);
-
-	rate = s3c2443_roundrate_clksrc256(clk, rate);
-	rate = parent_rate / rate;
-
-	clkdivn &= ~S3C2443_CLKDIV1_UARTDIV_MASK;
-	clkdivn |= (rate - 1) << S3C2443_CLKDIV1_UARTDIV_SHIFT;
-
-	__raw_writel(clkdivn, S3C2443_CLKDIV1);
-	return 0;
-}
-
-static struct clk clk_display = {
-	.name		= "display-if",
-	.id		= -1,
-	.parent		= &clk_esysclk,
-	.ctrlbit	= S3C2443_SCLKCON_DISPCLK,
-	.enable		= s3c2443_clkcon_enable_s,
-	.ops		= &(struct clk_ops) {
-		.get_rate	= s3c2443_getrate_display,
-		.set_rate	= s3c2443_setrate_display,
-		.round_rate	= s3c2443_roundrate_clksrc256,
+static struct clksrc_clk clk_display = {
+	.clk	= {
+		.name		= "display-if",
+		.id		= -1,
+		.parent		= &clk_esysclk,
+		.ctrlbit	= S3C2443_SCLKCON_DISPCLK,
+		.enable		= s3c2443_clkcon_enable_s,
 	},
+	.reg_div = { .reg = S3C2443_CLKDIV1, .size = 8, .shift = 16 },
 };
 
 /* prediv
@@ -865,7 +618,7 @@ static struct clk init_clocks[] = {
 	}, {
 		.name		= "usb-bus-host",
 		.id		= -1,
-		.parent		= &clk_usb_bus_host,
+		.parent		= &clk_usb_bus_host.clk,
 	}, {
 		.name		= "ac97",
 		.id		= -1,
@@ -887,50 +640,27 @@ static int __init clk_init_set_parent(struct clk *clk, struct clk *parent)
 	return clk_set_parent(clk, parent);
 }
 
+static struct clksrc_clk __initdata *init_list[] = {
+	&clk_epllref, /* should be first */
+	&clk_i2s_eplldiv,
+	&clk_i2s,
+	&clk_cam,
+	&clk_uart,
+	&clk_display,
+	&clk_hsmmc_div,
+	&clk_usb_bus_host,
+};
+
 static void __init s3c2443_clk_initparents(void)
 {
 	unsigned long clksrc = __raw_readl(S3C2443_CLKSRC);
 	struct clk *parent;
-
-	switch (clksrc & S3C2443_CLKSRC_EPLLREF_MASK) {
-	case S3C2443_CLKSRC_EPLLREF_EXTCLK:
-		parent = &clk_ext;
-		break;
-
-	case S3C2443_CLKSRC_EPLLREF_XTAL:
-	default:
-		parent = &clk_xtal;
-		break;
-
-	case S3C2443_CLKSRC_EPLLREF_MPLLREF:
-	case S3C2443_CLKSRC_EPLLREF_MPLLREF2:
-		parent = &clk_mpllref;
-		break;
-	}
-
-	clk_init_set_parent(&clk_epllref, parent);
-
-	switch (clksrc & S3C2443_CLKSRC_I2S_MASK) {
-	case S3C2443_CLKSRC_I2S_EXT:
-		parent = &clk_i2s_ext;
-		break;
-
-	case S3C2443_CLKSRC_I2S_EPLLDIV:
-	default:
-		parent = &clk_i2s_eplldiv;
-		break;
-
-	case S3C2443_CLKSRC_I2S_EPLLREF:
-	case S3C2443_CLKSRC_I2S_EPLLREF3:
-		parent = &clk_epllref;
-	}
-
-	clk_init_set_parent(&clk_i2s, &clk_epllref);
+	int ptr;
 
 	/* esysclk source */
 
 	parent = (clksrc & S3C2443_CLKSRC_ESYSCLK_EPLL) ?
-		&clk_epll : &clk_epllref;
+		&clk_epll : &clk_epllref.clk;
 
 	clk_init_set_parent(&clk_esysclk, parent);
 
@@ -953,6 +683,9 @@ static void __init s3c2443_clk_initparents(void)
 		parent = &clk_armdiv;
 
 	clk_init_set_parent(&clk_arm, parent);
+
+	for (ptr = 0; ptr < ARRAY_SIZE(init_list); ptr++)
+		s3c_set_clksrc(init_list[ptr], false);
 }
 
 /* armdiv divisor table */
@@ -984,15 +717,9 @@ static inline unsigned long s3c2443_get_hdiv(unsigned long clkcon0)
 
 /* clocks to add straight away */
 
-static struct clk *clks[] __initdata = {
-	&clk_ext,
-	&clk_epll,
+static struct clksrc_clk *clksrcs[] __initdata = {
 	&clk_usb_bus_host,
-	&clk_usb_bus,
-	&clk_esysclk,
 	&clk_epllref,
-	&clk_mpllref,
-	&clk_msysclk,
 	&clk_uart,
 	&clk_display,
 	&clk_cam,
@@ -1000,6 +727,15 @@ static struct clk *clks[] __initdata = {
 	&clk_i2s,
 	&clk_hsspi,
 	&clk_hsmmc_div,
+};
+
+static struct clk *clks[] __initdata = {
+	&clk_ext,
+	&clk_epll,
+	&clk_usb_bus,
+	&clk_esysclk,
+	&clk_mpllref,
+	&clk_msysclk,
 	&clk_hsmmc,
 	&clk_armdiv,
 	&clk_arm,
@@ -1064,15 +800,18 @@ void __init s3c2443_init_clocks(int xtal)
 		}
 	}
 
+	for (ptr = 0; ptr < ARRAY_SIZE(clksrcs); ptr++)
+		s3c_register_clksrc(clksrcs[ptr], 1);
+
 	clk_epll.rate = s3c2443_get_epll(epllcon, xtal);
-	clk_epll.parent = &clk_epllref;
-	clk_usb_bus.parent = &clk_usb_bus_host;
+	clk_epll.parent = &clk_epllref.clk;
+	clk_usb_bus.parent = &clk_usb_bus_host.clk;
 
 	/* ensure usb bus clock is within correct rate of 48MHz */
 
-	if (clk_get_rate(&clk_usb_bus_host) != (48 * 1000 * 1000)) {
+	if (clk_get_rate(&clk_usb_bus_host.clk) != (48 * 1000 * 1000)) {
 		printk(KERN_INFO "Warning: USB host bus not at 48MHz\n");
-		clk_set_rate(&clk_usb_bus_host, 48*1000*1000);
+		clk_set_rate(&clk_usb_bus_host.clk, 48*1000*1000);
 	}
 
 	printk("S3C2443: epll %s %ld.%03ld MHz, usb-bus %ld.%03ld MHz\n",
diff --git a/arch/arm/plat-samsung/clock-clksrc.c b/arch/arm/plat-samsung/clock-clksrc.c
index ae8b850..3dfbcfb 100644
--- a/arch/arm/plat-samsung/clock-clksrc.c
+++ b/arch/arm/plat-samsung/clock-clksrc.c
@@ -1,4 +1,4 @@
-/* linux/arch/arm/plat-samsung/clock-clksrc.c
+#/* linux/arch/arm/plat-samsung/clock-clksrc.c
  *
  * Copyright 2008 Simtec Electronics
  *	Ben Dooks <ben@simtec.co.uk>
-- 
1.6.3.3
