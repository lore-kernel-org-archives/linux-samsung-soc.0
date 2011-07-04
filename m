From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH 1/2] ARM: SAMSUNG: Add tx_st_done variable in the
Date: Mon, 04 Jul 2011 13:39:30 -0400
Message-ID: <1309801171-19818-1-git-send-email-padma.v@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:54945 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752019Ab1GDLvy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Jul 2011 07:51:54 -0400
Received: from epcpsbgm2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LNT002EP4YGB9V0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 04 Jul 2011 20:51:52 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LNT00J1T4Y8XQ@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 04 Jul 2011 20:51:52 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, jassisinghbrar@gmail.com, sbkim73@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, grant.likely@secretlab.ca

tx_st_done is required for checking the transmission status of SPI
channels with different fifo levels

Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
Acked-by: Jassi Brar <jassisinghbrar@gmail.com
Acked-by: Grant Likely <grant.likely@secretlab.ca>
---
 arch/arm/mach-s3c64xx/dev-spi.c                  |    2 ++
 arch/arm/mach-s5p64x0/dev-spi.c                  |    4 ++++
 arch/arm/mach-s5pc100/dev-spi.c                  |    3 +++
 arch/arm/mach-s5pv210/dev-spi.c                  |    2 ++
 arch/arm/plat-samsung/include/plat/s3c64xx-spi.h |    2 ++
 5 files changed, 13 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s3c64xx/dev-spi.c b/arch/arm/mach-s3c64xx/dev-spi.c
index 82db072..5e6b420 100644
--- a/arch/arm/mach-s3c64xx/dev-spi.c
+++ b/arch/arm/mach-s3c64xx/dev-spi.c
@@ -88,6 +88,7 @@ static struct s3c64xx_spi_info s3c64xx_spi0_pdata = {
 	.cfg_gpio = s3c64xx_spi_cfg_gpio,
 	.fifo_lvl_mask = 0x7f,
 	.rx_lvl_offset = 13,
+	.tx_st_done = 21,
 };
 
 static u64 spi_dmamask = DMA_BIT_MASK(32);
@@ -132,6 +133,7 @@ static struct s3c64xx_spi_info s3c64xx_spi1_pdata = {
 	.cfg_gpio = s3c64xx_spi_cfg_gpio,
 	.fifo_lvl_mask = 0x7f,
 	.rx_lvl_offset = 13,
+	.tx_st_done = 21,
 };
 
 struct platform_device s3c64xx_device_spi1 = {
diff --git a/arch/arm/mach-s5p64x0/dev-spi.c b/arch/arm/mach-s5p64x0/dev-spi.c
index e78ee18..ac825e8 100644
--- a/arch/arm/mach-s5p64x0/dev-spi.c
+++ b/arch/arm/mach-s5p64x0/dev-spi.c
@@ -112,12 +112,14 @@ static struct s3c64xx_spi_info s5p6440_spi0_pdata = {
 	.cfg_gpio	= s5p6440_spi_cfg_gpio,
 	.fifo_lvl_mask	= 0x1ff,
 	.rx_lvl_offset	= 15,
+	.tx_st_done	= 25,
 };
 
 static struct s3c64xx_spi_info s5p6450_spi0_pdata = {
 	.cfg_gpio	= s5p6450_spi_cfg_gpio,
 	.fifo_lvl_mask	= 0x1ff,
 	.rx_lvl_offset	= 15,
+	.tx_st_done	= 25,
 };
 
 static u64 spi_dmamask = DMA_BIT_MASK(32);
@@ -160,12 +162,14 @@ static struct s3c64xx_spi_info s5p6440_spi1_pdata = {
 	.cfg_gpio	= s5p6440_spi_cfg_gpio,
 	.fifo_lvl_mask	= 0x7f,
 	.rx_lvl_offset	= 15,
+	.tx_st_done	= 25,
 };
 
 static struct s3c64xx_spi_info s5p6450_spi1_pdata = {
 	.cfg_gpio	= s5p6450_spi_cfg_gpio,
 	.fifo_lvl_mask	= 0x7f,
 	.rx_lvl_offset	= 15,
+	.tx_st_done	= 25,
 };
 
 struct platform_device s5p64x0_device_spi1 = {
diff --git a/arch/arm/mach-s5pc100/dev-spi.c b/arch/arm/mach-s5pc100/dev-spi.c
index 57b1979..2b58c9a 100644
--- a/arch/arm/mach-s5pc100/dev-spi.c
+++ b/arch/arm/mach-s5pc100/dev-spi.c
@@ -90,6 +90,7 @@ static struct s3c64xx_spi_info s5pc100_spi0_pdata = {
 	.fifo_lvl_mask = 0x7f,
 	.rx_lvl_offset = 13,
 	.high_speed = 1,
+	.tx_st_done = 21,
 };
 
 static u64 spi_dmamask = DMA_BIT_MASK(32);
@@ -134,6 +135,7 @@ static struct s3c64xx_spi_info s5pc100_spi1_pdata = {
 	.fifo_lvl_mask = 0x7f,
 	.rx_lvl_offset = 13,
 	.high_speed = 1,
+	.tx_st_done = 21,
 };
 
 struct platform_device s5pc100_device_spi1 = {
@@ -176,6 +178,7 @@ static struct s3c64xx_spi_info s5pc100_spi2_pdata = {
 	.fifo_lvl_mask = 0x7f,
 	.rx_lvl_offset = 13,
 	.high_speed = 1,
+	.tx_st_done = 21,
 };
 
 struct platform_device s5pc100_device_spi2 = {
diff --git a/arch/arm/mach-s5pv210/dev-spi.c b/arch/arm/mach-s5pv210/dev-spi.c
index e3249a4..eaf9a7b 100644
--- a/arch/arm/mach-s5pv210/dev-spi.c
+++ b/arch/arm/mach-s5pv210/dev-spi.c
@@ -85,6 +85,7 @@ static struct s3c64xx_spi_info s5pv210_spi0_pdata = {
 	.fifo_lvl_mask = 0x1ff,
 	.rx_lvl_offset = 15,
 	.high_speed = 1,
+	.tx_st_done = 25,
 };
 
 static u64 spi_dmamask = DMA_BIT_MASK(32);
@@ -129,6 +130,7 @@ static struct s3c64xx_spi_info s5pv210_spi1_pdata = {
 	.fifo_lvl_mask = 0x7f,
 	.rx_lvl_offset = 15,
 	.high_speed = 1,
+	.tx_st_done = 25,
 };
 
 struct platform_device s5pv210_device_spi1 = {
diff --git a/arch/arm/plat-samsung/include/plat/s3c64xx-spi.h b/arch/arm/plat-samsung/include/plat/s3c64xx-spi.h
index 0ffe34a..4c16fa3 100644
--- a/arch/arm/plat-samsung/include/plat/s3c64xx-spi.h
+++ b/arch/arm/plat-samsung/include/plat/s3c64xx-spi.h
@@ -39,6 +39,7 @@ struct s3c64xx_spi_csinfo {
  * @fifo_lvl_mask: All tx fifo_lvl fields start at offset-6
  * @rx_lvl_offset: Depends on tx fifo_lvl field and bus number
  * @high_speed: If the controller supports HIGH_SPEED_EN bit
+ * @tx_st_done: Depends on tx fifo_lvl field
  */
 struct s3c64xx_spi_info {
 	int src_clk_nr;
@@ -53,6 +54,7 @@ struct s3c64xx_spi_info {
 	int fifo_lvl_mask;
 	int rx_lvl_offset;
 	int high_speed;
+	int tx_st_done;
 };
 
 /**
-- 
1.7.0.4
