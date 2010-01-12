From: Ben Dooks <ben@trinity.fluff.org>
Subject: [PATCH] ARM: S5PC1XX: Change clksrc_clks to use array of clocks
Date: Tue, 12 Jan 2010 04:20:14 +0000
Message-ID: <1263270017-25155-6-git-send-email-ben@trinity.fluff.org>
References: <1263270017-25155-1-git-send-email-ben@trinity.fluff.org>
 <1263270017-25155-2-git-send-email-ben@trinity.fluff.org>
 <1263270017-25155-3-git-send-email-ben@trinity.fluff.org>
 <1263270017-25155-4-git-send-email-ben@trinity.fluff.org>
 <1263270017-25155-5-git-send-email-ben@trinity.fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:40852 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753621Ab0ALEUW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Jan 2010 23:20:22 -0500
Received: from ben by trinity.fluff.org with local (Exim 4.69)
	(envelope-from <ben@trinity.fluff.org>)
	id 1NUYEr-0006a4-Li
	for linux-samsung-soc@vger.kernel.org; Tue, 12 Jan 2010 04:20:17 +0000
In-Reply-To: <1263270017-25155-5-git-send-email-ben@trinity.fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

From: Ben Dooks <ben-linux@fluff.org>

Remove the individual 'struct clksrc_clks' and place them into an array
so that we can simply use s3c_register_clksrcs to register tham all in one
go.

Since the spdif clock relies on the audio clock, move the audio clocks
into their own arrary.

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 arch/arm/plat-s5pc1xx/s5pc100-clock.c |  411 ++++++++++++++-------------------
 1 files changed, 174 insertions(+), 237 deletions(-)

diff --git a/arch/arm/plat-s5pc1xx/s5pc100-clock.c b/arch/arm/plat-s5pc1xx/s5pc100-clock.c
index cf71f2c..d36ab40 100644
--- a/arch/arm/plat-s5pc1xx/s5pc100-clock.c
+++ b/arch/arm/plat-s5pc1xx/s5pc100-clock.c
@@ -534,14 +534,44 @@ static struct clksrc_sources clkset_audio2 = {
 	.nr_sources	= ARRAY_SIZE(clkset_audio2_list),
 };
 
-static struct clksrc_clk clk_audio0;
-static struct clksrc_clk clk_audio1;
-static struct clksrc_clk clk_audio2;
+static struct clksrc_clk clksrc_audio[] = {
+	{
+		.clk	= {
+			.name		= "audio-bus",
+			.id		= 0,
+			.ctrlbit	= S5PC100_CLKGATE_SCLK1_AUDIO0,
+			.enable		= s5pc100_sclk1_ctrl,
+		},
+		.sources = &clkset_audio0,
+		.reg_div = { .reg = S5PC100_CLKDIV4, .shift = 12, .size = 4, },
+		.reg_src = { .reg = S5PC100_CLKSRC3, .shift = 12, .size = 3, },
+	}, {
+		.clk	= {
+			.name		= "audio-bus",
+			.id		= 1,
+			.ctrlbit	= S5PC100_CLKGATE_SCLK1_AUDIO1,
+			.enable		= s5pc100_sclk1_ctrl,
+		},
+		.sources = &clkset_audio1,
+		.reg_div = { .reg = S5PC100_CLKDIV4, .shift = 16, .size = 4, },
+		.reg_src = { .reg = S5PC100_CLKSRC3, .shift = 16, .size = 3, },
+	}, {
+		.clk	= {
+			.name		= "audio-bus",
+			.id		= 2,
+			.ctrlbit	= S5PC100_CLKGATE_SCLK1_AUDIO2,
+			.enable		= s5pc100_sclk1_ctrl,
+		},
+		.sources = &clkset_audio2,
+		.reg_div = { .reg = S5PC100_CLKDIV4, .shift = 20, .size = 4, },
+		.reg_src = { .reg = S5PC100_CLKSRC3, .shift = 20, .size = 3, },
+	},
+};
 
 static struct clk *clkset_spdif_list[] = {
-	&clk_audio0.clk,
-	&clk_audio1.clk,
-	&clk_audio2.clk,
+	&clksrc_audio[0].clk,
+	&clksrc_audio[1].clk,
+	&clksrc_audio[2].clk,
 };
 
 static struct clksrc_sources clkset_spdif = {
@@ -585,195 +615,136 @@ static struct clksrc_sources clkset_usbhost = {
 	.nr_sources	= ARRAY_SIZE(clkset_usbhost_list),
 };
 
-static struct clksrc_clk clk_spi0 = {
-	.clk	= {
-		.name		= "spi_bus",
-		.id		= 0,
-		.ctrlbit	= S5PC100_CLKGATE_SCLK0_SPI0,
-		.enable		= s5pc100_sclk0_ctrl,
-
-	},
-	.sources = &clkset_spi,
-	.reg_div = { .reg = S5PC100_CLKDIV2, .shift = 4, .size = 4, },
-	.reg_src = { .reg = S5PC100_CLKSRC1, .shift = 4, .size = 2, },
-};
-
-static struct clksrc_clk clk_spi1 = {
-	.clk	= {
-		.name		= "spi_bus",
-		.id		= 1,
-		.ctrlbit	= S5PC100_CLKGATE_SCLK0_SPI1,
-		.enable		= s5pc100_sclk0_ctrl,
-	},
-	.sources = &clkset_spi,
-	.reg_div = { .reg = S5PC100_CLKDIV2, .shift = 8, .size = 4, },
-	.reg_src = { .reg = S5PC100_CLKSRC1, .shift = 8, .size = 2, },
-};
-
-static struct clksrc_clk clk_spi2 = {
-	.clk	= {
-		.name		= "spi_bus",
-		.id		= 2,
-		.ctrlbit	= S5PC100_CLKGATE_SCLK0_SPI2,
-		.enable		= s5pc100_sclk0_ctrl,
-	},
-	.sources = &clkset_spi,
-	.reg_div = { .reg = S5PC100_CLKDIV2, .shift = 12, .size = 4, },
-	.reg_src = { .reg = S5PC100_CLKSRC1, .shift = 12, .size = 2, },
-};
-
-static struct clksrc_clk clk_uart_uclk1 = {
-	.clk	= {
-		.name		= "uclk1",
-		.id		= -1,
-		.ctrlbit        = S5PC100_CLKGATE_SCLK0_UART,
-		.enable		= s5pc100_sclk0_ctrl,
-	},
-	.sources = &clkset_uart,
-	.reg_div = { .reg = S5PC100_CLKDIV2, .shift = 0, .size = 3, },
-	.reg_src = { .reg = S5PC100_CLKSRC1, .shift = 0, .size = 1, },
-};
-
-static struct clksrc_clk clk_audio0 = {
-	.clk	= {
-		.name		= "audio-bus",
-		.id		= 0,
-		.ctrlbit	= S5PC100_CLKGATE_SCLK1_AUDIO0,
-		.enable		= s5pc100_sclk1_ctrl,
-	},
-	.sources = &clkset_audio0,
-	.reg_div = { .reg = S5PC100_CLKDIV4, .shift = 12, .size = 4, },
-	.reg_src = { .reg = S5PC100_CLKSRC3, .shift = 12, .size = 3, },
-};
-
-static struct clksrc_clk clk_audio1 = {
-	.clk	= {
-		.name		= "audio-bus",
-		.id		= 1,
-		.ctrlbit	= S5PC100_CLKGATE_SCLK1_AUDIO1,
-		.enable		= s5pc100_sclk1_ctrl,
-	},
-	.sources = &clkset_audio1,
-	.reg_div = { .reg = S5PC100_CLKDIV4, .shift = 16, .size = 4, },
-	.reg_src = { .reg = S5PC100_CLKSRC3, .shift = 16, .size = 3, },
-};
-
-
-static struct clksrc_clk clk_audio2 = {
-	.clk	= {
-		.name		= "audio-bus",
-		.id		= 2,
-		.ctrlbit	= S5PC100_CLKGATE_SCLK1_AUDIO2,
-		.enable		= s5pc100_sclk1_ctrl,
-	},
-	.sources = &clkset_audio2,
-	.reg_div = { .reg = S5PC100_CLKDIV4, .shift = 20, .size = 4, },
-	.reg_src = { .reg = S5PC100_CLKSRC3, .shift = 20, .size = 3, },
-};
-
-static struct clksrc_clk clk_spdif = {
-	.clk	= {
-		.name		= "spdif",
-		.id		= -1,
-	},
-	.sources	= &clkset_spdif,
-	.reg_src = { .reg = S5PC100_CLKSRC3, .shift = 24, .size = 2, },
-};
-
-static struct clksrc_clk clk_lcd = {
-	.clk	= {
-		.name		= "lcd",
-		.id		= -1,
-		.ctrlbit	= S5PC100_CLKGATE_SCLK1_LCD,
-		.enable		= s5pc100_sclk1_ctrl,
-	},
-	.sources = &clkset_lcd_fimc,
-	.reg_div = { .reg = S5PC100_CLKDIV3, .shift = 12, .size = 4, },
-	.reg_src = { .reg = S5PC100_CLKSRC2, .shift = 12, .size = 2, },
-};
-
-static struct clksrc_clk clk_fimc0 = {
-	.clk	= {
-		.name		= "fimc",
-		.id		= 0,
-		.ctrlbit	= S5PC100_CLKGATE_SCLK1_FIMC0,
-		.enable		= s5pc100_sclk1_ctrl,
-	},
-	.sources = &clkset_lcd_fimc,
-	.reg_div = { .reg = S5PC100_CLKDIV3, .shift = 16, .size = 4, },
-	.reg_src = { .reg = S5PC100_CLKSRC2, .shift = 16, .size = 2, },
-};
-
-static struct clksrc_clk clk_fimc1 = {
-	.clk	= {
-		.name		= "fimc",
-		.id		= 1,
-		.ctrlbit	= S5PC100_CLKGATE_SCLK1_FIMC1,
-		.enable		= s5pc100_sclk1_ctrl,
-	},
-	.sources	= &clkset_lcd_fimc,
-	.reg_div = { .reg = S5PC100_CLKDIV3, .shift = 20, .size = 4, },
-	.reg_src = { .reg = S5PC100_CLKSRC2, .shift = 20, .size = 2, },
-};
-
-static struct clksrc_clk clk_fimc2 = {
-	.clk	= {
-		.name		= "fimc",
-		.id		= 2,
-		.ctrlbit	= S5PC100_CLKGATE_SCLK1_FIMC2,
-		.enable		= s5pc100_sclk1_ctrl,
-	},
-	.sources = &clkset_lcd_fimc,
-	.reg_div = { .reg = S5PC100_CLKDIV3, .shift = 24, .size = 4, },
-	.reg_src = { .reg = S5PC100_CLKSRC2, .shift = 24, .size = 2, },
-};
-
-static struct clksrc_clk clk_mmc0 = {
-	.clk	= {
-		.name		= "mmc_bus",
-		.id		= 0,
-		.ctrlbit	= S5PC100_CLKGATE_SCLK0_MMC0,
-		.enable		= s5pc100_sclk0_ctrl,
-	},
-	.sources = &clkset_mmc,
-	.reg_div = { .reg = S5PC100_CLKDIV3, .shift = 0, .size = 4, },
-	.reg_src = { .reg = S5PC100_CLKSRC2, .shift = 0, .size = 2, },
-};
-
-static struct clksrc_clk clk_mmc1 = {
-	.clk	= {
-		.name		= "mmc_bus",
-		.id		= 1,
-		.ctrlbit	= S5PC100_CLKGATE_SCLK0_MMC1,
-		.enable		= s5pc100_sclk0_ctrl,
-	},
-	.sources = &clkset_mmc,
-	.reg_div = { .reg = S5PC100_CLKDIV3, .shift = 4, .size = 4, },
-	.reg_src = { .reg = S5PC100_CLKSRC2, .shift = 4, .size = 2, },
-};
-
-static struct clksrc_clk clk_mmc2 = {
-	.clk	= {
-		.name		= "mmc_bus",
-		.id		= 2,
-		.ctrlbit	= S5PC100_CLKGATE_SCLK0_MMC2,
-		.enable		= s5pc100_sclk0_ctrl,
-	},
-	.sources	= &clkset_mmc,
-	.reg_div = { .reg = S5PC100_CLKDIV3, .shift = 8, .size = 4, },
-	.reg_src = { .reg = S5PC100_CLKSRC2, .shift = 8, .size = 2, },
-};
-
-static struct clksrc_clk clk_usbhost = {
-	.clk	= {
-		.name		= "usbhost",
-		.id		= -1,
-		.ctrlbit        = S5PC100_CLKGATE_SCLK0_USBHOST,
-		.enable		= s5pc100_sclk0_ctrl,
-	},
-	.sources = &clkset_usbhost,
-	.reg_div = { .reg = S5PC100_CLKDIV2, .shift = 20, .size = 4, },
-	.reg_src = { .reg = S5PC100_CLKSRC1, .shift = 20, .size = 2, },
+static struct clksrc_clk clksrc_clks[] = {
+	{
+		.clk	= {
+			.name		= "spi_bus",
+			.id		= 0,
+			.ctrlbit	= S5PC100_CLKGATE_SCLK0_SPI0,
+			.enable		= s5pc100_sclk0_ctrl,
+
+		},
+		.sources = &clkset_spi,
+		.reg_div = { .reg = S5PC100_CLKDIV2, .shift = 4, .size = 4, },
+		.reg_src = { .reg = S5PC100_CLKSRC1, .shift = 4, .size = 2, },
+	}, {
+		.clk	= {
+			.name		= "spi_bus",
+			.id		= 1,
+			.ctrlbit	= S5PC100_CLKGATE_SCLK0_SPI1,
+			.enable		= s5pc100_sclk0_ctrl,
+		},
+		.sources = &clkset_spi,
+		.reg_div = { .reg = S5PC100_CLKDIV2, .shift = 8, .size = 4, },
+		.reg_src = { .reg = S5PC100_CLKSRC1, .shift = 8, .size = 2, },
+	}, {
+		.clk	= {
+			.name		= "spi_bus",
+			.id		= 2,
+			.ctrlbit	= S5PC100_CLKGATE_SCLK0_SPI2,
+			.enable		= s5pc100_sclk0_ctrl,
+		},
+		.sources = &clkset_spi,
+		.reg_div = { .reg = S5PC100_CLKDIV2, .shift = 12, .size = 4, },
+		.reg_src = { .reg = S5PC100_CLKSRC1, .shift = 12, .size = 2, },
+	}, {
+		.clk	= {
+			.name		= "uclk1",
+			.id		= -1,
+			.ctrlbit        = S5PC100_CLKGATE_SCLK0_UART,
+			.enable		= s5pc100_sclk0_ctrl,
+		},
+		.sources = &clkset_uart,
+		.reg_div = { .reg = S5PC100_CLKDIV2, .shift = 0, .size = 3, },
+		.reg_src = { .reg = S5PC100_CLKSRC1, .shift = 0, .size = 1, },
+	}, {
+		.clk	= {
+			.name		= "spdif",
+			.id		= -1,
+		},
+		.sources	= &clkset_spdif,
+		.reg_src = { .reg = S5PC100_CLKSRC3, .shift = 24, .size = 2, },
+	}, {
+		.clk	= {
+			.name		= "lcd",
+			.id		= -1,
+			.ctrlbit	= S5PC100_CLKGATE_SCLK1_LCD,
+			.enable		= s5pc100_sclk1_ctrl,
+		},
+		.sources = &clkset_lcd_fimc,
+		.reg_div = { .reg = S5PC100_CLKDIV3, .shift = 12, .size = 4, },
+		.reg_src = { .reg = S5PC100_CLKSRC2, .shift = 12, .size = 2, },
+	}, {
+		.clk	= {
+			.name		= "fimc",
+			.id		= 0,
+			.ctrlbit	= S5PC100_CLKGATE_SCLK1_FIMC0,
+			.enable		= s5pc100_sclk1_ctrl,
+		},
+		.sources = &clkset_lcd_fimc,
+		.reg_div = { .reg = S5PC100_CLKDIV3, .shift = 16, .size = 4, },
+		.reg_src = { .reg = S5PC100_CLKSRC2, .shift = 16, .size = 2, },
+	}, {
+		.clk	= {
+			.name		= "fimc",
+			.id		= 1,
+			.ctrlbit	= S5PC100_CLKGATE_SCLK1_FIMC1,
+			.enable		= s5pc100_sclk1_ctrl,
+		},
+		.sources	= &clkset_lcd_fimc,
+		.reg_div = { .reg = S5PC100_CLKDIV3, .shift = 20, .size = 4, },
+		.reg_src = { .reg = S5PC100_CLKSRC2, .shift = 20, .size = 2, },
+	}, {
+		.clk	= {
+			.name		= "fimc",
+			.id		= 2,
+			.ctrlbit	= S5PC100_CLKGATE_SCLK1_FIMC2,
+			.enable		= s5pc100_sclk1_ctrl,
+		},
+		.sources = &clkset_lcd_fimc,
+		.reg_div = { .reg = S5PC100_CLKDIV3, .shift = 24, .size = 4, },
+		.reg_src = { .reg = S5PC100_CLKSRC2, .shift = 24, .size = 2, },
+	}, {
+		.clk	= {
+			.name		= "mmc_bus",
+			.id		= 0,
+			.ctrlbit	= S5PC100_CLKGATE_SCLK0_MMC0,
+			.enable		= s5pc100_sclk0_ctrl,
+		},
+		.sources = &clkset_mmc,
+		.reg_div = { .reg = S5PC100_CLKDIV3, .shift = 0, .size = 4, },
+		.reg_src = { .reg = S5PC100_CLKSRC2, .shift = 0, .size = 2, },
+	}, {
+		.clk	= {
+			.name		= "mmc_bus",
+			.id		= 1,
+			.ctrlbit	= S5PC100_CLKGATE_SCLK0_MMC1,
+			.enable		= s5pc100_sclk0_ctrl,
+		},
+		.sources = &clkset_mmc,
+		.reg_div = { .reg = S5PC100_CLKDIV3, .shift = 4, .size = 4, },
+		.reg_src = { .reg = S5PC100_CLKSRC2, .shift = 4, .size = 2, },
+	}, {
+		.clk	= {
+			.name		= "mmc_bus",
+			.id		= 2,
+			.ctrlbit	= S5PC100_CLKGATE_SCLK0_MMC2,
+			.enable		= s5pc100_sclk0_ctrl,
+		},
+		.sources	= &clkset_mmc,
+		.reg_div = { .reg = S5PC100_CLKDIV3, .shift = 8, .size = 4, },
+		.reg_src = { .reg = S5PC100_CLKSRC2, .shift = 8, .size = 2, },
+	}, {
+		.clk	= {
+			.name		= "usbhost",
+			.id		= -1,
+			.ctrlbit        = S5PC100_CLKGATE_SCLK0_USBHOST,
+			.enable		= s5pc100_sclk0_ctrl,
+		},
+		.sources = &clkset_usbhost,
+		.reg_div = { .reg = S5PC100_CLKDIV2, .shift = 20, .size = 4, },
+		.reg_src = { .reg = S5PC100_CLKSRC1, .shift = 20, .size = 2, },
+	}
 };
 
 /* Clock initialisation code */
@@ -785,22 +756,6 @@ static struct clksrc_clk *init_parents[] = {
 	&clk_mout_onenand,
 	&clk_mout_epll,
 	&clk_mout_hpll,
-	&clk_spi0,
-	&clk_spi1,
-	&clk_spi2,
-	&clk_uart_uclk1,
-	&clk_audio0,
-	&clk_audio1,
-	&clk_audio2,
-	&clk_spdif,
-	&clk_lcd,
-	&clk_fimc0,
-	&clk_fimc1,
-	&clk_fimc2,
-	&clk_mmc0,
-	&clk_mmc1,
-	&clk_mmc2,
-	&clk_usbhost,
 };
 
 #define GET_DIV(clk, field) ((((clk) & field##_MASK) >> field##_SHIFT) + 1)
@@ -867,6 +822,12 @@ void __init_or_cpufreq s5pc100_setup_clocks(void)
 
 	for (ptr = 0; ptr < ARRAY_SIZE(init_parents); ptr++)
 	  s3c_set_clksrc(init_parents[ptr], true);
+
+	for (ptr = 0; ptr < ARRAY_SIZE(clksrc_audio); ptr++)
+		s3c_set_clksrc(clksrc_audio + ptr, true);
+
+	for (ptr = 0; ptr < ARRAY_SIZE(clksrc_clks); ptr++)
+		s3c_set_clksrc(clksrc_clks + ptr, true);
 }
 
 static struct clk *clks[] __initdata = {
@@ -890,30 +851,6 @@ static struct clk *clks[] __initdata = {
 	&clk_arm,
 };
 
-/* simplest change - will aggregate clocks later */
-static struct clksrc_clk *clks_src[] = {
-	&clk_mout_apll,
-	&clk_mout_mpll,
-	&clk_mout_onenand,
-	&clk_mout_epll,
-	&clk_spi0,
-	&clk_spi1,
-	&clk_spi2,
-	&clk_uart_uclk1,
-	&clk_audio0,
-	&clk_audio1,
-	&clk_audio2,
-	&clk_spdif,
-	&clk_lcd,
-	&clk_fimc0,
-	&clk_fimc1,
-	&clk_fimc2,
-	&clk_mmc0,
-	&clk_mmc1,
-	&clk_mmc2,
-	&clk_usbhost,
-};
-
 void __init s5pc100_register_clocks(void)
 {
 	struct clk *clkp;
@@ -929,6 +866,6 @@ void __init s5pc100_register_clocks(void)
 		}
 	}
 
-	for (ptr = 0; ptr < ARRAY_SIZE(clks_src); ptr++)
-		s3c_register_clksrc(clks_src[ptr], 1);
+	s3c_register_clksrc(clksrc_audio, ARRAY_SIZE(clksrc_audio));
+	s3c_register_clksrc(clksrc_clks, ARRAY_SIZE(clksrc_clks));
 }
-- 
1.6.0.4
