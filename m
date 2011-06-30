From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH 1/2] ARM: SAMSUNG: Added tx_st_done variable in the platform
 data of SPI
Date: Thu, 30 Jun 2011 08:38:55 -0400
Message-ID: <1309437536-9315-1-git-send-email-padma.v@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:13557 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751333Ab1F3Gvj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 30 Jun 2011 02:51:39 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LNL00MJACDL1VC0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 30 Jun 2011 15:51:37 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LNL00EXBCDRRJ@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 30 Jun 2011 15:51:37 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, jassisinghbrar@gmail.com, sbkim73@samsung.com, grant.likely@secretlab.ca, spi-devel-general@lists.sourceforge.net, linux-samsung-soc@vger.kernel.org, linux-arm

tx_st_done is required for checking the transmission status of SPI
channels with different fifo levels

Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
---
 arch/arm/mach-s3c64xx/mach-smdk6410.c            |    2 ++
 arch/arm/mach-s5p64x0/mach-smdk6440.c            |    2 ++
 arch/arm/mach-s5p64x0/mach-smdk6450.c            |    2 ++
 arch/arm/mach-s5pc100/mach-smdkc100.c            |    3 +++
 arch/arm/mach-s5pv210/mach-smdkv210.c            |    2 ++
 arch/arm/plat-samsung/dev-spi0.c                 |    1 +
 arch/arm/plat-samsung/dev-spi1.c                 |    1 +
 arch/arm/plat-samsung/dev-spi2.c                 |    1 +
 arch/arm/plat-samsung/include/plat/s3c64xx-spi.h |    2 ++
 9 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s3c64xx/mach-smdk6410.c b/arch/arm/mach-s3c64xx/mach-smdk6410.c
index ff31a3d..dce89aa 100644
--- a/arch/arm/mach-s3c64xx/mach-smdk6410.c
+++ b/arch/arm/mach-s3c64xx/mach-smdk6410.c
@@ -212,11 +212,13 @@ static struct platform_device smdk6410_smsc911x = {
 static struct s3c64xx_spi_info s3c_spi0_pdata __initdata = {
 	.fifo_lvl_mask	= 0x7f,
 	.rx_lvl_offset	= 13,
+	.tx_st_done	= 21,
 };
 
 static struct s3c64xx_spi_info s3c_spi1_pdata __initdata = {
 	.fifo_lvl_mask	= 0x7f,
 	.rx_lvl_offset	= 13,
+	.tx_st_done	= 21,
 };
 
 #ifdef CONFIG_REGULATOR
diff --git a/arch/arm/mach-s5p64x0/mach-smdk6440.c b/arch/arm/mach-s5p64x0/mach-smdk6440.c
index 03469bc..7488feb 100644
--- a/arch/arm/mach-s5p64x0/mach-smdk6440.c
+++ b/arch/arm/mach-s5p64x0/mach-smdk6440.c
@@ -134,11 +134,13 @@ static struct platform_device smdk6440_backlight_device = {
 static struct s3c64xx_spi_info s3c_spi0_pdata __initdata = {
 	.fifo_lvl_mask	= 0x1ff,
 	.rx_lvl_offset	= 15,
+	.tx_st_done	= 25,
 };
 
 static struct s3c64xx_spi_info s3c_spi1_pdata __initdata = {
 	.fifo_lvl_mask	= 0x7f,
 	.rx_lvl_offset	= 15,
+	.tx_st_done	= 25,
 };
 
 static struct platform_device *smdk6440_devices[] __initdata = {
diff --git a/arch/arm/mach-s5p64x0/mach-smdk6450.c b/arch/arm/mach-s5p64x0/mach-smdk6450.c
index 4048447..e7b2560 100644
--- a/arch/arm/mach-s5p64x0/mach-smdk6450.c
+++ b/arch/arm/mach-s5p64x0/mach-smdk6450.c
@@ -152,11 +152,13 @@ static struct platform_device smdk6450_backlight_device = {
 static struct s3c64xx_spi_info s3c_spi0_pdata __initdata = {
 	.fifo_lvl_mask	= 0x1ff,
 	.rx_lvl_offset	= 15,
+	.tx_st_done	= 25,
 };
 
 static struct s3c64xx_spi_info s3c_spi1_pdata __initdata = {
 	.fifo_lvl_mask	= 0x7f,
 	.rx_lvl_offset	= 15,
+	.tx_st_done	= 25,
 };
 
 static struct platform_device *smdk6450_devices[] __initdata = {
diff --git a/arch/arm/mach-s5pc100/mach-smdkc100.c b/arch/arm/mach-s5pc100/mach-smdkc100.c
index 127f7b6..4e87530 100644
--- a/arch/arm/mach-s5pc100/mach-smdkc100.c
+++ b/arch/arm/mach-s5pc100/mach-smdkc100.c
@@ -223,18 +223,21 @@ static struct s3c64xx_spi_info s3c_spi0_pdata __initdata = {
 	.fifo_lvl_mask	= 0x7f,
 	.rx_lvl_offset	= 13,
 	.high_speed	= 1,
+	.tx_st_done	= 21,
 };
 
 static struct s3c64xx_spi_info s3c_spi1_pdata __initdata = {
 	.fifo_lvl_mask	= 0x7f,
 	.rx_lvl_offset	= 13,
 	.high_speed	= 1,
+	.tx_st_done	= 21,
 };
 
 static struct s3c64xx_spi_info s3c_spi2_pdata __initdata = {
 	.fifo_lvl_mask	= 0x7f,
 	.rx_lvl_offset	= 13,
 	.high_speed	= 1,
+	.tx_st_done	= 21,
 };
 
 static struct platform_device *smdkc100_devices[] __initdata = {
diff --git a/arch/arm/mach-s5pv210/mach-smdkv210.c b/arch/arm/mach-s5pv210/mach-smdkv210.c
index 8978757..71af473 100644
--- a/arch/arm/mach-s5pv210/mach-smdkv210.c
+++ b/arch/arm/mach-s5pv210/mach-smdkv210.c
@@ -254,12 +254,14 @@ static struct s3c64xx_spi_info s3c_spi0_pdata __initdata = {
 	.fifo_lvl_mask	= 0x1ff,
 	.rx_lvl_offset	= 15,
 	.high_speed	= 1,
+	.tx_st_done	= 25,
 };
 
 static struct s3c64xx_spi_info s3c_spi1_pdata __initdata = {
 	.fifo_lvl_mask	= 0x7f,
 	.rx_lvl_offset	= 15,
 	.high_speed	= 1,
+	.tx_st_done	= 25,
 };
 static struct platform_device *smdkv210_devices[] __initdata = {
 	&s3c_device_adc,
diff --git a/arch/arm/plat-samsung/dev-spi0.c b/arch/arm/plat-samsung/dev-spi0.c
index 3d2c8bf..18f379e 100644
--- a/arch/arm/plat-samsung/dev-spi0.c
+++ b/arch/arm/plat-samsung/dev-spi0.c
@@ -71,6 +71,7 @@ void __init s3c_spi0_set_info(struct s3c64xx_spi_info *pd,
 	}
 	spi_info->fifo_lvl_mask = pd->fifo_lvl_mask;
 	spi_info->rx_lvl_offset = pd->rx_lvl_offset;
+	spi_info->tx_st_done = pd->tx_st_done;
 	/* Reject invalid configuration */
 	if (!num_cs || src_clk_nr < 0
 			|| src_clk_nr > ARRAY_SIZE(spi_src_clks)) {
diff --git a/arch/arm/plat-samsung/dev-spi1.c b/arch/arm/plat-samsung/dev-spi1.c
index 2aaa251..2a80c5d 100644
--- a/arch/arm/plat-samsung/dev-spi1.c
+++ b/arch/arm/plat-samsung/dev-spi1.c
@@ -71,6 +71,7 @@ void __init s3c_spi1_set_info(struct s3c64xx_spi_info *pd,
 	}
 	spi_info->fifo_lvl_mask = pd->fifo_lvl_mask;
 	spi_info->rx_lvl_offset = pd->rx_lvl_offset;
+	spi_info->tx_st_done = pd->tx_st_done;
 	/* Reject invalid configuration */
 	if (!num_cs || src_clk_nr < 0
 			|| src_clk_nr > ARRAY_SIZE(spi_src_clks)) {
diff --git a/arch/arm/plat-samsung/dev-spi2.c b/arch/arm/plat-samsung/dev-spi2.c
index 15218b5..5430738 100644
--- a/arch/arm/plat-samsung/dev-spi2.c
+++ b/arch/arm/plat-samsung/dev-spi2.c
@@ -71,6 +71,7 @@ void __init s3c_spi2_set_info(struct s3c64xx_spi_info *pd,
 	}
 	spi_info->fifo_lvl_mask = pd->fifo_lvl_mask;
 	spi_info->rx_lvl_offset = pd->rx_lvl_offset;
+	spi_info->tx_st_done = pd->tx_st_done;
 	/* Reject invalid configuration */
 	if (!num_cs || src_clk_nr < 0
 			|| src_clk_nr > ARRAY_SIZE(spi_src_clks)) {
diff --git a/arch/arm/plat-samsung/include/plat/s3c64xx-spi.h b/arch/arm/plat-samsung/include/plat/s3c64xx-spi.h
index b9f6a4b..551ae27 100644
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
