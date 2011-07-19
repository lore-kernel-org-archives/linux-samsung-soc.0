From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 2/8] ARM: Exynos4: add support for i2c8 controller (for HDMIPHY)
Date: Tue, 19 Jul 2011 10:44:21 +0200
Message-ID: <1311065067-20324-3-git-send-email-m.szyprowski@samsung.com>
References: <1311065067-20324-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:46451 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752611Ab1GSIoh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 19 Jul 2011 04:44:37 -0400
Received: from eu_spt1 (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LOK003U8OA8LS@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 19 Jul 2011 09:44:32 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LOK00DBFOA7TD@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 19 Jul 2011 09:44:32 +0100 (BST)
In-reply-to: <1311065067-20324-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Stanislawski <t.stanislaws@samsung.com>

From: Tomasz Stanislawski <t.stanislaws@samsung.com>

This patch adds platform definitions for i2c8 controller for Samsung
Exynos4 platform (as HDMIPHY dedicated bus).

Signed-off-by: Tomasz Stanislawski <t.stanislaws@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/mach-exynos4/clock.c             |    6 ++++++
 arch/arm/mach-exynos4/cpu.c               |    2 ++
 arch/arm/mach-exynos4/include/mach/irqs.h |    3 +++
 arch/arm/mach-exynos4/include/mach/map.h  |    1 +
 4 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos4/clock.c b/arch/arm/mach-exynos4/clock.c
index 629ea1d..b5e6d9d 100644
--- a/arch/arm/mach-exynos4/clock.c
+++ b/arch/arm/mach-exynos4/clock.c
@@ -581,6 +581,12 @@ static struct clk init_clocks_off[] = {
 		.enable		= exynos4_clk_ip_peril_ctrl,
 		.ctrlbit	= (1 << 13),
 	}, {
+		.name		= "i2c",
+		.devname	= "s3c2440-hdmiphy-i2c.8",
+		.parent		= &clk_aclk_100.clk,
+		.enable		= exynos4_clk_ip_peril_ctrl,
+		.ctrlbit	= (1 << 14),
+	}, {
 		.name		= "SYSMMU_MDMA",
 		.enable		= exynos4_clk_ip_image_ctrl,
 		.ctrlbit	= (1 << 5),
diff --git a/arch/arm/mach-exynos4/cpu.c b/arch/arm/mach-exynos4/cpu.c
index 910ade6..3df6739 100644
--- a/arch/arm/mach-exynos4/cpu.c
+++ b/arch/arm/mach-exynos4/cpu.c
@@ -140,6 +140,8 @@ void __init exynos4_map_io(void)
 	exynos4_default_sdhci2();
 	exynos4_default_sdhci3();
 
+	s3c_i2c8_setname("s3c2440-hdmiphy-i2c");
+
 	s3c_fimc_setname(0, "exynos4-fimc");
 	s3c_fimc_setname(1, "exynos4-fimc");
 	s3c_fimc_setname(2, "exynos4-fimc");
diff --git a/arch/arm/mach-exynos4/include/mach/irqs.h b/arch/arm/mach-exynos4/include/mach/irqs.h
index 250427f..c342ba1 100644
--- a/arch/arm/mach-exynos4/include/mach/irqs.h
+++ b/arch/arm/mach-exynos4/include/mach/irqs.h
@@ -93,6 +93,9 @@
 #define IRQ_2D			IRQ_SPI(89)
 #define IRQ_PCIE		IRQ_SPI(90)
 
+#define IRQ_HDMI_I2C		IRQ_SPI(93)
+#define IRQ_IIC8		IRQ_HDMI_I2C
+
 #define IRQ_MFC			IRQ_SPI(94)
 
 #define IRQ_AUDIO_SS		IRQ_SPI(96)
diff --git a/arch/arm/mach-exynos4/include/mach/map.h b/arch/arm/mach-exynos4/include/mach/map.h
index 610fddb..1fd986b 100644
--- a/arch/arm/mach-exynos4/include/mach/map.h
+++ b/arch/arm/mach-exynos4/include/mach/map.h
@@ -133,6 +133,7 @@
 #define S3C_PA_IIC5			EXYNOS4_PA_IIC(5)
 #define S3C_PA_IIC6			EXYNOS4_PA_IIC(6)
 #define S3C_PA_IIC7			EXYNOS4_PA_IIC(7)
+#define S3C_PA_IIC8			EXYNOS4_PA_IIC(8)
 #define S3C_PA_RTC			EXYNOS4_PA_RTC
 #define S3C_PA_WDT			EXYNOS4_PA_WATCHDOG
 
-- 
1.7.1.569.g6f426
