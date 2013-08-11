From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: [PATCH 13/18] ARM: s3c64xx: clock: Add clkdev lookup for DMA clocks
Date: Sun, 11 Aug 2013 19:59:25 +0200
Message-ID: <1376243970-6489-14-git-send-email-tomasz.figa@gmail.com>
References: <1376243970-6489-1-git-send-email-tomasz.figa@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1376243970-6489-1-git-send-email-tomasz.figa@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, Dan Williams <djbw@fb.com>, Jaroslav Kysela <perex@perex.cz>, Kukjin Kim <kgene.kim@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>, Mike Turquette <mturquette@linaro.org>, Padmavathi Venna <padma.v@samsung.com>, Russell King <linux@arm.linux.org.uk>, Sangbeom Kim <sbkim73@samsung.com>, Takashi Iwai <tiwai@suse.de>, Vinod Koul <vinod.koul@intel.com>, Tomasz Figa <tomasz.figa@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds clkdev lookup entries for clocks used by PL08x DMA
driver.

Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
---
 arch/arm/mach-s3c64xx/clock.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/arch/arm/mach-s3c64xx/clock.c b/arch/arm/mach-s3c64xx/clock.c
index 8499415..33aa851 100644
--- a/arch/arm/mach-s3c64xx/clock.c
+++ b/arch/arm/mach-s3c64xx/clock.c
@@ -194,16 +194,6 @@ static struct clk init_clocks_off[] = {
 		.enable		= s3c64xx_hclk_ctrl,
 		.ctrlbit	= S3C_CLKCON_HCLK_IHOST,
 	}, {
-		.name		= "dma0",
-		.parent		= &clk_h,
-		.enable		= s3c64xx_hclk_ctrl,
-		.ctrlbit	= S3C_CLKCON_HCLK_DMA0,
-	}, {
-		.name		= "dma1",
-		.parent		= &clk_h,
-		.enable		= s3c64xx_hclk_ctrl,
-		.ctrlbit	= S3C_CLKCON_HCLK_DMA1,
-	}, {
 		.name		= "3dse",
 		.parent		= &clk_h,
 		.enable		= s3c64xx_hclk_ctrl,
@@ -345,6 +335,20 @@ static struct clk clk_i2s2 = {
 };
 #endif
 
+static struct clk clk_dma0 = {
+	.name		= "dma0",
+	.parent		= &clk_h,
+	.enable		= s3c64xx_hclk_ctrl,
+	.ctrlbit	= S3C_CLKCON_HCLK_DMA0,
+};
+
+static struct clk clk_dma1 = {
+	.name		= "dma1",
+	.parent		= &clk_h,
+	.enable		= s3c64xx_hclk_ctrl,
+	.ctrlbit	= S3C_CLKCON_HCLK_DMA1,
+};
+
 static struct clk init_clocks[] = {
 	{
 		.name		= "lcd",
@@ -849,6 +853,8 @@ static struct clk *clk_cdev[] = {
 	&clk_48m_spi1,
 	&clk_i2s0,
 	&clk_i2s1,
+	&clk_dma0,
+	&clk_dma1,
 };
 
 static struct clk_lookup s3c64xx_clk_lookup[] = {
@@ -873,6 +879,8 @@ static struct clk_lookup s3c64xx_clk_lookup[] = {
 	CLKDEV_INIT("samsung-i2s.2", "i2s_opclk0", &clk_i2s2),
 	CLKDEV_INIT("samsung-i2s.2", "i2s_opclk1", &clk_audio_bus2.clk),
 #endif
+	CLKDEV_INIT("dma-pl080s.0", "apb_pclk", &clk_dma0),
+	CLKDEV_INIT("dma-pl080s.1", "apb_pclk", &clk_dma1),
 };
 
 #define GET_DIV(clk, field) ((((clk) & field##_MASK) >> field##_SHIFT) + 1)
-- 
1.8.3.2
