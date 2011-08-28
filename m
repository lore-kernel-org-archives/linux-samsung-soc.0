From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: [PATCH v2 3/4] S3C2416: Add HSSPI clock sourced from EPLL
Date: Sun, 28 Aug 2011 20:10:43 +0200
Message-ID: <201108282010.44152.heiko@sntech.de>
References: <201108282006.31667.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from s15407518.onlinehome-server.info ([82.165.136.167]:34729 "EHLO
	s15407518.onlinehome-server.info" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751664Ab1H1SKv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 28 Aug 2011 14:10:51 -0400
In-Reply-To: <201108282006.31667.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, 'Ben Dooks' <ben-linux@fluff.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>

This clock is special to the S3C2416/2450 SoCs.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 Changes since v1: move hsspi sources array
 arch/arm/mach-s3c2416/clock.c |   28 ++++++++++++++++++++++++++++
 1 files changed, 28 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s3c2416/clock.c b/arch/arm/mach-s3c2416/clock.c
index 21a5e81..196fb37 100644
--- a/arch/arm/mach-s3c2416/clock.c
+++ b/arch/arm/mach-s3c2416/clock.c
@@ -38,6 +38,32 @@ static unsigned int armdiv[8] = {
 	[7] = 8,
 };
 
+static struct clksrc_clk hsspi_eplldiv = {
+	.clk = {
+		.name	= "hsspi-eplldiv",
+		.parent	= &clk_esysclk.clk,
+		.ctrlbit = (1 << 14),
+		.enable = s3c2443_clkcon_enable_s,
+	},
+	.reg_div = { .reg = S3C2443_CLKDIV1, .size = 2, .shift = 24 },
+};
+
+static struct clk *hsspi_sources[] = {
+	[0] = &hsspi_eplldiv.clk,
+	[1] = NULL, /* to fix */
+};
+
+static struct clksrc_clk hsspi_mux = {
+	.clk	= {
+		.name	= "hsspi-if",
+	},
+	.sources = &(struct clksrc_sources) {
+		.sources = hsspi_sources,
+		.nr_sources = ARRAY_SIZE(hsspi_sources),
+	},
+	.reg_src = { .reg = S3C2443_CLKSRC, .size = 1, .shift = 18 },
+};
+
 static struct clksrc_clk hsmmc_div[] = {
 	[0] = {
 		.clk = {
@@ -114,6 +140,8 @@ void __init_or_cpufreq s3c2416_setup_clocks(void)
 
 
 static struct clksrc_clk *clksrcs[] __initdata = {
+	&hsspi_eplldiv,
+	&hsspi_mux,
 	&hsmmc_div[0],
 	&hsmmc_div[1],
 	&hsmmc_mux[0],
-- 
1.7.2.3
