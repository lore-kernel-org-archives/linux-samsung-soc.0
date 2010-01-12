From: Ben Dooks <ben@trinity.fluff.org>
Subject: [PATCH] ARM: S5PC1XX: Remove definitions deleted by previous clksrc changes
Date: Tue, 12 Jan 2010 04:20:16 +0000
Message-ID: <1263270017-25155-8-git-send-email-ben@trinity.fluff.org>
References: <1263270017-25155-1-git-send-email-ben@trinity.fluff.org>
 <1263270017-25155-2-git-send-email-ben@trinity.fluff.org>
 <1263270017-25155-3-git-send-email-ben@trinity.fluff.org>
 <1263270017-25155-4-git-send-email-ben@trinity.fluff.org>
 <1263270017-25155-5-git-send-email-ben@trinity.fluff.org>
 <1263270017-25155-6-git-send-email-ben@trinity.fluff.org>
 <1263270017-25155-7-git-send-email-ben@trinity.fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:40853 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753320Ab0ALEUW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Jan 2010 23:20:22 -0500
Received: from ben by trinity.fluff.org with local (Exim 4.69)
	(envelope-from <ben@trinity.fluff.org>)
	id 1NUYEr-0006a8-Q2
	for linux-samsung-soc@vger.kernel.org; Tue, 12 Jan 2010 04:20:17 +0000
In-Reply-To: <1263270017-25155-7-git-send-email-ben@trinity.fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

From: Ben Dooks <ben-linux@fluff.org>

Remove the definitions we've deleted in the previous updates to the
clksrc_clk for arch/arm/plat-s5pc1xx/include/plat/regs-clock.h.

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 arch/arm/plat-s5pc1xx/include/plat/regs-clock.h |   60 -----------------------
 1 files changed, 0 insertions(+), 60 deletions(-)

diff --git a/arch/arm/plat-s5pc1xx/include/plat/regs-clock.h b/arch/arm/plat-s5pc1xx/include/plat/regs-clock.h
index c5cc86e..e88562e 100644
--- a/arch/arm/plat-s5pc1xx/include/plat/regs-clock.h
+++ b/arch/arm/plat-s5pc1xx/include/plat/regs-clock.h
@@ -62,53 +62,16 @@
 #define S5PC100_EPLLVAL(_m, _p, _s)	((_m) << 16 | ((_p) << 8) | ((_s)))
 
 /* CLKSRC0 */
-#define S5PC100_CLKSRC0_APLL_MASK		(0x1<<0)
-#define S5PC100_CLKSRC0_APLL_SHIFT		(0)
-#define S5PC100_CLKSRC0_MPLL_MASK		(0x1<<4)
-#define S5PC100_CLKSRC0_MPLL_SHIFT		(4)
-#define S5PC100_CLKSRC0_EPLL_MASK		(0x1<<8)
-#define S5PC100_CLKSRC0_EPLL_SHIFT		(8)
-#define S5PC100_CLKSRC0_HPLL_MASK		(0x1<<12)
-#define S5PC100_CLKSRC0_HPLL_SHIFT		(12)
-#define S5PC100_CLKSRC0_AMMUX_MASK		(0x1<<16)
-#define S5PC100_CLKSRC0_AMMUX_SHIFT		(16)
 #define S5PC100_CLKSRC0_HREF_MASK		(0x1<<20)
 #define S5PC100_CLKSRC0_HREF_SHIFT		(20)
-#define S5PC100_CLKSRC0_ONENAND_MASK	(0x1<<24)
-#define S5PC100_CLKSRC0_ONENAND_SHIFT	(24)
-
 
 /* CLKSRC1 */
-#define S5PC100_CLKSRC1_UART_MASK		(0x1<<0)
-#define S5PC100_CLKSRC1_UART_SHIFT		(0)
-#define S5PC100_CLKSRC1_SPI0_MASK		(0x3<<4)
-#define S5PC100_CLKSRC1_SPI0_SHIFT		(4)
-#define S5PC100_CLKSRC1_SPI1_MASK		(0x3<<8)
-#define S5PC100_CLKSRC1_SPI1_SHIFT		(8)
-#define S5PC100_CLKSRC1_SPI2_MASK		(0x3<<12)
-#define S5PC100_CLKSRC1_SPI2_SHIFT		(12)
 #define S5PC100_CLKSRC1_IRDA_MASK		(0x3<<16)
 #define S5PC100_CLKSRC1_IRDA_SHIFT		(16)
-#define S5PC100_CLKSRC1_UHOST_MASK		(0x3<<20)
-#define S5PC100_CLKSRC1_UHOST_SHIFT		(20)
 #define S5PC100_CLKSRC1_CLK48M_MASK		(0x1<<24)
 #define S5PC100_CLKSRC1_CLK48M_SHIFT	(24)
 
 /* CLKSRC2 */
-#define S5PC100_CLKSRC2_MMC0_MASK		(0x3<<0)
-#define S5PC100_CLKSRC2_MMC0_SHIFT		(0)
-#define S5PC100_CLKSRC2_MMC1_MASK		(0x3<<4)
-#define S5PC100_CLKSRC2_MMC1_SHIFT		(4)
-#define S5PC100_CLKSRC2_MMC2_MASK		(0x3<<8)
-#define S5PC100_CLKSRC2_MMC2_SHIFT		(8)
-#define S5PC100_CLKSRC2_LCD_MASK		(0x3<<12)
-#define S5PC100_CLKSRC2_LCD_SHIFT		(12)
-#define S5PC100_CLKSRC2_FIMC0_MASK		(0x3<<16)
-#define S5PC100_CLKSRC2_FIMC0_SHIFT		(16)
-#define S5PC100_CLKSRC2_FIMC1_MASK		(0x3<<20)
-#define S5PC100_CLKSRC2_FIMC1_SHIFT		(20)
-#define S5PC100_CLKSRC2_FIMC2_MASK		(0x3<<24)
-#define S5PC100_CLKSRC2_FIMC2_SHIFT		(24)
 #define S5PC100_CLKSRC2_MIXER_MASK		(0x3<<28)
 #define S5PC100_CLKSRC2_MIXER_SHIFT		(28)
 
@@ -119,14 +82,6 @@
 #define S5PC100_CLKSRC3_HCLKD2_SHIFT	(4)
 #define S5PC100_CLKSRC3_I2SD2_MASK		(0x3<<8)
 #define S5PC100_CLKSRC3_I2SD2_SHIFT		(8)
-#define S5PC100_CLKSRC3_AUDIO0_MASK		(0x7<<12)
-#define S5PC100_CLKSRC3_AUDIO0_SHIFT	(12)
-#define S5PC100_CLKSRC3_AUDIO1_MASK		(0x7<<16)
-#define S5PC100_CLKSRC3_AUDIO1_SHIFT	(16)
-#define S5PC100_CLKSRC3_AUDIO2_MASK		(0x7<<20)
-#define S5PC100_CLKSRC3_AUDIO2_SHIFT	(20)
-#define S5PC100_CLKSRC3_SPDIF_MASK		(0x3<<24)
-#define S5PC100_CLKSRC3_SPDIF_SHIFT		(24)
 
 /* CLKDIV0 */
 #define S5PC100_CLKDIV0_APLL_MASK		(0x1<<0)
@@ -158,33 +113,21 @@
 
 /* CLKDIV2 */
 #define S5PC100_CLKDIV2_UART_MASK		(0x7<<0)
-#define S5PC100_CLKDIV2_UART_SHIFT		(0)
 #define S5PC100_CLKDIV2_SPI0_MASK		(0xf<<4)
-#define S5PC100_CLKDIV2_SPI0_SHIFT		(4)
 #define S5PC100_CLKDIV2_SPI1_MASK		(0xf<<8)
-#define S5PC100_CLKDIV2_SPI1_SHIFT		(8)
 #define S5PC100_CLKDIV2_SPI2_MASK		(0xf<<12)
-#define S5PC100_CLKDIV2_SPI2_SHIFT		(12)
 #define S5PC100_CLKDIV2_IRDA_MASK		(0xf<<16)
 #define S5PC100_CLKDIV2_IRDA_SHIFT		(16)
 #define S5PC100_CLKDIV2_UHOST_MASK		(0xf<<20)
-#define S5PC100_CLKDIV2_UHOST_SHIFT		(20)
 
 /* CLKDIV3 */
 #define S5PC100_CLKDIV3_MMC0_MASK		(0xf<<0)
-#define S5PC100_CLKDIV3_MMC0_SHIFT		(0)
 #define S5PC100_CLKDIV3_MMC1_MASK		(0xf<<4)
-#define S5PC100_CLKDIV3_MMC1_SHIFT		(4)
 #define S5PC100_CLKDIV3_MMC2_MASK		(0xf<<8)
-#define S5PC100_CLKDIV3_MMC2_SHIFT		(8)
 #define S5PC100_CLKDIV3_LCD_MASK		(0xf<<12)
-#define S5PC100_CLKDIV3_LCD_SHIFT		(12)
 #define S5PC100_CLKDIV3_FIMC0_MASK		(0xf<<16)
-#define S5PC100_CLKDIV3_FIMC0_SHIFT		(16)
 #define S5PC100_CLKDIV3_FIMC1_MASK		(0xf<<20)
-#define S5PC100_CLKDIV3_FIMC1_SHIFT		(20)
 #define S5PC100_CLKDIV3_FIMC2_MASK		(0xf<<24)
-#define S5PC100_CLKDIV3_FIMC2_SHIFT		(24)
 #define S5PC100_CLKDIV3_HDMI_MASK		(0xf<<28)
 #define S5PC100_CLKDIV3_HDMI_SHIFT		(28)
 
@@ -196,11 +139,8 @@
 #define S5PC100_CLKDIV4_I2SD2_MASK		(0xf<<8)
 #define S5PC100_CLKDIV4_I2SD2_SHIFT		(8)
 #define S5PC100_CLKDIV4_AUDIO0_MASK		(0xf<<12)
-#define S5PC100_CLKDIV4_AUDIO0_SHIFT	(12)
 #define S5PC100_CLKDIV4_AUDIO1_MASK		(0xf<<16)
-#define S5PC100_CLKDIV4_AUDIO1_SHIFT	(16)
 #define S5PC100_CLKDIV4_AUDIO2_MASK		(0xf<<20)
-#define S5PC100_CLKDIV4_AUDIO2_SHIFT	(20)
 
 /* HCLKD0/PCLKD0 Clock Gate 0 Registers */
 #define S5PC100_CLKGATE_D00_INTC		(1<<0)
-- 
1.6.0.4
