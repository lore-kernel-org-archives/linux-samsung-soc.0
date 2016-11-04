From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH RFC 2/7] ARM: S3C64XX: Add DMA slave maps for PL080 devices
Date: Fri, 04 Nov 2016 17:14:49 +0100
Message-ID: <1478276094-19135-4-git-send-email-s.nawrocki@samsung.com>
References: <1478276094-19135-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:49297 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934706AbcKDQRM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 4 Nov 2016 12:17:12 -0400
In-reply-to: <1478276094-19135-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org
Cc: vinod.koul@intel.com, broonie@kernel.org, ckeepax@opensource.wolfsonmicro.com, ym0914@gmail.com, arnd@arndb.de, kgene@kernel.org, javier@osg.samsung.com, andi.shyti@samsung.com, sbkim73@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>

This patch adds DMA slave map tables to the pl080 devices's
platform_data in order to support the new channel request API.
A few devices for which there was no DMA support with current
code are omitted from the tables.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 arch/arm/mach-s3c64xx/pl080.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm/mach-s3c64xx/pl080.c b/arch/arm/mach-s3c64xx/pl080.c
index 89c5a62..8c88680 100644
--- a/arch/arm/mach-s3c64xx/pl080.c
+++ b/arch/arm/mach-s3c64xx/pl080.c
@@ -117,6 +117,25 @@ static void pl08x_put_xfer_signal(const struct pl08x_channel_data *cd, int ch)
 	}
 };
 
+static const struct dma_slave_map s3c64xx_dma0_slave_map[] = {
+	{ "s3c6400-uart.0", "tx", (void *)"uart0_tx" },
+	{ "s3c6400-uart.0", "rx", (void *)"uart0_rx" },
+	{ "s3c6400-uart.1", "tx", (void *)"uart1_tx" },
+	{ "s3c6400-uart.1", "rx", (void *)"uart1_rx" },
+	{ "s3c6400-uart.2", "tx", (void *)"uart2_tx" },
+	{ "s3c6400-uart.2", "rx", (void *)"uart2_rx" },
+	{ "s3c6400-uart.3", "tx", (void *)"uart3_tx" },
+	{ "s3c6400-uart.3", "rx", (void *)"uart3_rx" },
+	{ "samsung-pcm.0", "tx", (void *)"pcm0_tx" },
+	{ "samsung-pcm.0", "rx", (void *)"pcm0_rx" },
+	{ "samsung-i2s.0", "tx", (void *)"i2s0_tx" },
+	{ "samsung-i2s.0", "rx", (void *)"i2s0_rx" },
+	{ "s3c6410-spi.0", "tx", (void *)"spi0_tx" },
+	{ "s3c6410-spi.0", "rx", (void *)"spi0_rx" },
+	{ "samsung-i2s.2", "tx", (void *)"i2s2_tx" },
+	{ "samsung-i2s.2", "rx", (void *)"i2s2_rx" },
+};
+
 struct pl08x_platform_data s3c64xx_dma0_plat_data = {
 	.memcpy_channel = {
 		.bus_id = "memcpy",
@@ -134,6 +153,8 @@ struct pl08x_platform_data s3c64xx_dma0_plat_data = {
 	.put_xfer_signal = pl08x_put_xfer_signal,
 	.slave_channels = s3c64xx_dma0_info,
 	.num_slave_channels = ARRAY_SIZE(s3c64xx_dma0_info),
+	.slave_map = s3c64xx_dma0_slave_map,
+	.slavecnt = ARRAY_SIZE(s3c64xx_dma0_slave_map),
 };
 
 static AMBA_AHB_DEVICE(s3c64xx_dma0, "dma-pl080s.0", 0,
@@ -207,6 +228,15 @@ static AMBA_AHB_DEVICE(s3c64xx_dma0, "dma-pl080s.0", 0,
 	},
 };
 
+static const struct dma_slave_map s3c64xx_dma1_slave_map[] = {
+	{ "samsung-pcm.1", "tx", (void *)"pcm1_tx" },
+	{ "samsung-pcm.1", "rx", (void *)"pcm1_rx" },
+	{ "samsung-i2s.1", "tx", (void *)"i2s1_tx" },
+	{ "samsung-i2s.1", "rx", (void *)"i2s1_rx" },
+	{ "s3c6410-spi.1", "tx", (void *)"spi1_tx" },
+	{ "s3c6410-spi.1", "rx", (void *)"spi1_rx" },
+};
+
 struct pl08x_platform_data s3c64xx_dma1_plat_data = {
 	.memcpy_channel = {
 		.bus_id = "memcpy",
@@ -224,6 +254,8 @@ struct pl08x_platform_data s3c64xx_dma1_plat_data = {
 	.put_xfer_signal = pl08x_put_xfer_signal,
 	.slave_channels = s3c64xx_dma1_info,
 	.num_slave_channels = ARRAY_SIZE(s3c64xx_dma1_info),
+	.slave_map = s3c64xx_dma1_slave_map,
+	.slavecnt = ARRAY_SIZE(s3c64xx_dma1_slave_map),
 };
 
 static AMBA_AHB_DEVICE(s3c64xx_dma1, "dma-pl080s.1", 0,
-- 
1.9.1
