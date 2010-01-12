From: Ben Dooks <ben@trinity.fluff.org>
Subject: [PATCH] ARM: S5PC1XX: Move clock definitions around ready to turn into clksrc arrays
Date: Tue, 12 Jan 2010 04:20:13 +0000
Message-ID: <1263270017-25155-5-git-send-email-ben@trinity.fluff.org>
References: <1263270017-25155-1-git-send-email-ben@trinity.fluff.org>
 <1263270017-25155-2-git-send-email-ben@trinity.fluff.org>
 <1263270017-25155-3-git-send-email-ben@trinity.fluff.org>
 <1263270017-25155-4-git-send-email-ben@trinity.fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:40851 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753549Ab0ALEUW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Jan 2010 23:20:22 -0500
Received: from ben by trinity.fluff.org with local (Exim 4.69)
	(envelope-from <ben@trinity.fluff.org>)
	id 1NUYEr-0006a2-Ju
	for linux-samsung-soc@vger.kernel.org; Tue, 12 Jan 2010 04:20:17 +0000
In-Reply-To: <1263270017-25155-4-git-send-email-ben@trinity.fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

From: Ben Dooks <ben-linux@fluff.org>

Move the clock definitions around ready to turn the clocks into an array
of clocks and register them in one go.

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 arch/arm/plat-s5pc1xx/s5pc100-clock.c |  250 +++++++++++++++++----------------
 1 files changed, 127 insertions(+), 123 deletions(-)

diff --git a/arch/arm/plat-s5pc1xx/s5pc100-clock.c b/arch/arm/plat-s5pc1xx/s5pc100-clock.c
index 75cffca..cf71f2c 100644
--- a/arch/arm/plat-s5pc1xx/s5pc100-clock.c
+++ b/arch/arm/plat-s5pc1xx/s5pc100-clock.c
@@ -446,6 +446,45 @@ static struct clksrc_clk clk_mout_hpll = {
  * have a common parent divisor so are not included here.
  */
 
+static struct clk clk_iis_cd0 = {
+	.name		= "iis_cdclk0",
+	.id		= -1,
+};
+
+static struct clk clk_iis_cd1 = {
+	.name		= "iis_cdclk1",
+	.id		= -1,
+};
+
+static struct clk clk_iis_cd2 = {
+	.name		= "iis_cdclk2",
+	.id		= -1,
+};
+
+static struct clk clk_pcm_cd0 = {
+	.name		= "pcm_cdclk0",
+	.id		= -1,
+};
+
+static struct clk clk_pcm_cd1 = {
+	.name		= "pcm_cdclk1",
+	.id		= -1,
+};
+
+static struct clk *clkset_audio0_list[] = {
+	&clk_mout_epll.clk,
+	&clk_dout_mpll,
+	&clk_fin_epll,
+	&clk_iis_cd0,
+	&clk_pcm_cd0,
+	&clk_mout_hpll.clk,
+};
+
+static struct clksrc_sources clkset_audio0 = {
+	.sources	= clkset_audio0_list,
+	.nr_sources	= ARRAY_SIZE(clkset_audio0_list),
+};
+
 static struct clk *clkset_spi_list[] = {
 	&clk_mout_epll.clk,
 	&clk_dout_mpll2,
@@ -458,6 +497,94 @@ static struct clksrc_sources clkset_spi = {
 	.nr_sources	= ARRAY_SIZE(clkset_spi_list),
 };
 
+static struct clk *clkset_uart_list[] = {
+	&clk_mout_epll.clk,
+	&clk_dout_mpll,
+};
+
+static struct clksrc_sources clkset_uart = {
+	.sources	= clkset_uart_list,
+	.nr_sources	= ARRAY_SIZE(clkset_uart_list),
+};
+
+static struct clk *clkset_audio1_list[] = {
+	&clk_mout_epll.clk,
+	&clk_dout_mpll,
+	&clk_fin_epll,
+	&clk_iis_cd1,
+	&clk_pcm_cd1,
+	&clk_mout_hpll.clk,
+};
+
+static struct clksrc_sources clkset_audio1 = {
+	.sources	= clkset_audio1_list,
+	.nr_sources	= ARRAY_SIZE(clkset_audio1_list),
+};
+
+static struct clk *clkset_audio2_list[] = {
+	&clk_mout_epll.clk,
+	&clk_dout_mpll,
+	&clk_fin_epll,
+	&clk_iis_cd2,
+	&clk_mout_hpll.clk,
+};
+
+static struct clksrc_sources clkset_audio2 = {
+	.sources	= clkset_audio2_list,
+	.nr_sources	= ARRAY_SIZE(clkset_audio2_list),
+};
+
+static struct clksrc_clk clk_audio0;
+static struct clksrc_clk clk_audio1;
+static struct clksrc_clk clk_audio2;
+
+static struct clk *clkset_spdif_list[] = {
+	&clk_audio0.clk,
+	&clk_audio1.clk,
+	&clk_audio2.clk,
+};
+
+static struct clksrc_sources clkset_spdif = {
+	.sources	= clkset_spdif_list,
+	.nr_sources	= ARRAY_SIZE(clkset_spdif_list),
+};
+
+static struct clk *clkset_lcd_fimc_list[] = {
+	&clk_mout_epll.clk,
+	&clk_dout_mpll,
+	&clk_mout_hpll.clk,
+	&clk_vclk_54m,
+};
+
+static struct clksrc_sources clkset_lcd_fimc = {
+	.sources	= clkset_lcd_fimc_list,
+	.nr_sources	= ARRAY_SIZE(clkset_lcd_fimc_list),
+};
+
+static struct clk *clkset_mmc_list[] = {
+	&clk_mout_epll.clk,
+	&clk_dout_mpll,
+	&clk_fin_epll,
+	&clk_mout_hpll.clk ,
+};
+
+static struct clksrc_sources clkset_mmc = {
+	.sources	= clkset_mmc_list,
+	.nr_sources	= ARRAY_SIZE(clkset_mmc_list),
+};
+
+static struct clk *clkset_usbhost_list[] = {
+	&clk_mout_epll.clk,
+	&clk_dout_mpll,
+	&clk_mout_hpll.clk,
+	&clk_48m,
+};
+
+static struct clksrc_sources clkset_usbhost = {
+	.sources	= clkset_usbhost_list,
+	.nr_sources	= ARRAY_SIZE(clkset_usbhost_list),
+};
+
 static struct clksrc_clk clk_spi0 = {
 	.clk	= {
 		.name		= "spi_bus",
@@ -495,16 +622,6 @@ static struct clksrc_clk clk_spi2 = {
 	.reg_src = { .reg = S5PC100_CLKSRC1, .shift = 12, .size = 2, },
 };
 
-static struct clk *clkset_uart_list[] = {
-	&clk_mout_epll.clk,
-	&clk_dout_mpll,
-};
-
-static struct clksrc_sources clkset_uart = {
-	.sources	= clkset_uart_list,
-	.nr_sources	= ARRAY_SIZE(clkset_uart_list),
-};
-
 static struct clksrc_clk clk_uart_uclk1 = {
 	.clk	= {
 		.name		= "uclk1",
@@ -517,45 +634,6 @@ static struct clksrc_clk clk_uart_uclk1 = {
 	.reg_src = { .reg = S5PC100_CLKSRC1, .shift = 0, .size = 1, },
 };
 
-static struct clk clk_iis_cd0 = {
-	.name		= "iis_cdclk0",
-	.id		= -1,
-};
-
-static struct clk clk_iis_cd1 = {
-	.name		= "iis_cdclk1",
-	.id		= -1,
-};
-
-static struct clk clk_iis_cd2 = {
-	.name		= "iis_cdclk2",
-	.id		= -1,
-};
-
-static struct clk clk_pcm_cd0 = {
-	.name		= "pcm_cdclk0",
-	.id		= -1,
-};
-
-static struct clk clk_pcm_cd1 = {
-	.name		= "pcm_cdclk1",
-	.id		= -1,
-};
-
-static struct clk *clkset_audio0_list[] = {
-	&clk_mout_epll.clk,
-	&clk_dout_mpll,
-	&clk_fin_epll,
-	&clk_iis_cd0,
-	&clk_pcm_cd0,
-	&clk_mout_hpll.clk,
-};
-
-static struct clksrc_sources clkset_audio0 = {
-	.sources	= clkset_audio0_list,
-	.nr_sources	= ARRAY_SIZE(clkset_audio0_list),
-};
-
 static struct clksrc_clk clk_audio0 = {
 	.clk	= {
 		.name		= "audio-bus",
@@ -568,20 +646,6 @@ static struct clksrc_clk clk_audio0 = {
 	.reg_src = { .reg = S5PC100_CLKSRC3, .shift = 12, .size = 3, },
 };
 
-static struct clk *clkset_audio1_list[] = {
-	&clk_mout_epll.clk,
-	&clk_dout_mpll,
-	&clk_fin_epll,
-	&clk_iis_cd1,
-	&clk_pcm_cd1,
-	&clk_mout_hpll.clk,
-};
-
-static struct clksrc_sources clkset_audio1 = {
-	.sources	= clkset_audio1_list,
-	.nr_sources	= ARRAY_SIZE(clkset_audio1_list),
-};
-
 static struct clksrc_clk clk_audio1 = {
 	.clk	= {
 		.name		= "audio-bus",
@@ -594,18 +658,6 @@ static struct clksrc_clk clk_audio1 = {
 	.reg_src = { .reg = S5PC100_CLKSRC3, .shift = 16, .size = 3, },
 };
 
-static struct clk *clkset_audio2_list[] = {
-	&clk_mout_epll.clk,
-	&clk_dout_mpll,
-	&clk_fin_epll,
-	&clk_iis_cd2,
-	&clk_mout_hpll.clk,
-};
-
-static struct clksrc_sources clkset_audio2 = {
-	.sources	= clkset_audio2_list,
-	.nr_sources	= ARRAY_SIZE(clkset_audio2_list),
-};
 
 static struct clksrc_clk clk_audio2 = {
 	.clk	= {
@@ -619,17 +671,6 @@ static struct clksrc_clk clk_audio2 = {
 	.reg_src = { .reg = S5PC100_CLKSRC3, .shift = 20, .size = 3, },
 };
 
-static struct clk *clkset_spdif_list[] = {
-	&clk_audio0.clk,
-	&clk_audio1.clk,
-	&clk_audio2.clk,
-};
-
-static struct clksrc_sources clkset_spdif = {
-	.sources	= clkset_spdif_list,
-	.nr_sources	= ARRAY_SIZE(clkset_spdif_list),
-};
-
 static struct clksrc_clk clk_spdif = {
 	.clk	= {
 		.name		= "spdif",
@@ -639,18 +680,6 @@ static struct clksrc_clk clk_spdif = {
 	.reg_src = { .reg = S5PC100_CLKSRC3, .shift = 24, .size = 2, },
 };
 
-static struct clk *clkset_lcd_fimc_list[] = {
-	&clk_mout_epll.clk,
-	&clk_dout_mpll,
-	&clk_mout_hpll.clk,
-	&clk_vclk_54m,
-};
-
-static struct clksrc_sources clkset_lcd_fimc = {
-	.sources	= clkset_lcd_fimc_list,
-	.nr_sources	= ARRAY_SIZE(clkset_lcd_fimc_list),
-};
-
 static struct clksrc_clk clk_lcd = {
 	.clk	= {
 		.name		= "lcd",
@@ -699,18 +728,6 @@ static struct clksrc_clk clk_fimc2 = {
 	.reg_src = { .reg = S5PC100_CLKSRC2, .shift = 24, .size = 2, },
 };
 
-static struct clk *clkset_mmc_list[] = {
-	&clk_mout_epll.clk,
-	&clk_dout_mpll,
-	&clk_fin_epll,
-	&clk_mout_hpll.clk ,
-};
-
-static struct clksrc_sources clkset_mmc = {
-	.sources	= clkset_mmc_list,
-	.nr_sources	= ARRAY_SIZE(clkset_mmc_list),
-};
-
 static struct clksrc_clk clk_mmc0 = {
 	.clk	= {
 		.name		= "mmc_bus",
@@ -747,19 +764,6 @@ static struct clksrc_clk clk_mmc2 = {
 	.reg_src = { .reg = S5PC100_CLKSRC2, .shift = 8, .size = 2, },
 };
 
-
-static struct clk *clkset_usbhost_list[] = {
-	&clk_mout_epll.clk,
-	&clk_dout_mpll,
-	&clk_mout_hpll.clk,
-	&clk_48m,
-};
-
-static struct clksrc_sources clkset_usbhost = {
-	.sources	= clkset_usbhost_list,
-	.nr_sources	= ARRAY_SIZE(clkset_usbhost_list),
-};
-
 static struct clksrc_clk clk_usbhost = {
 	.clk	= {
 		.name		= "usbhost",
-- 
1.6.0.4
