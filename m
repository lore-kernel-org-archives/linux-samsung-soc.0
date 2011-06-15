From: Sangbeom Kim <sbkim73@samsung.com>
Subject: [PATCH V2 4/4] ARM: SAMSUNG: Add IRQ_I2S0 definition
Date: Wed, 15 Jun 2011 17:43:27 +0900
Message-ID: <1308127407-22458-5-git-send-email-sbkim73@samsung.com>
References: <1308127407-22458-1-git-send-email-sbkim73@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:34631 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753381Ab1FOItw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 15 Jun 2011 04:49:52 -0400
In-Reply-To: <1308127407-22458-1-git-send-email-sbkim73@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org
Cc: jassisinghbrar@gmail.com, lrg@slimlogic.co.uk, broonie@opensource.wolfsonmicro.com, kgene.kim@samsung.com, Sangbeom Kim <sbkim73@samsung.com>

To handle i2s0 interrupt and To fix compilation error
adds IRQ_I2S0 for exynos4, s3c64xx, s5p64x0

Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
---
 arch/arm/mach-exynos4/include/mach/irqs.h |    2 ++
 arch/arm/mach-s3c64xx/include/mach/irqs.h |    1 +
 arch/arm/mach-s5p64x0/include/mach/irqs.h |    2 ++
 3 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos4/include/mach/irqs.h b/arch/arm/mach-exynos4/include/mach/irqs.h
index 5d03730..4c78dc0 100644
--- a/arch/arm/mach-exynos4/include/mach/irqs.h
+++ b/arch/arm/mach-exynos4/include/mach/irqs.h
@@ -73,6 +73,8 @@
 #define IRQ_SYSMMU_MFC_M1_0	COMBINER_IRQ(5, 6)
 #define IRQ_SYSMMU_PCIE_0	COMBINER_IRQ(5, 7)
 
+#define IRQ_I2S0		COMBINER_IRQ(17, 0)
+
 #define IRQ_PDMA0		COMBINER_IRQ(21, 0)
 #define IRQ_PDMA1		COMBINER_IRQ(21, 1)
 
diff --git a/arch/arm/mach-s3c64xx/include/mach/irqs.h b/arch/arm/mach-s3c64xx/include/mach/irqs.h
index 8e2df26..bf7cc82 100644
--- a/arch/arm/mach-s3c64xx/include/mach/irqs.h
+++ b/arch/arm/mach-s3c64xx/include/mach/irqs.h
@@ -215,6 +215,7 @@
 /* Compatibility */
 
 #define IRQ_ONENAND	IRQ_ONENAND0
+#define IRQ_I2S0	IRQ_S3C6410_IIS
 
 #endif /* __ASM_MACH_S3C64XX_IRQS_H */
 
diff --git a/arch/arm/mach-s5p64x0/include/mach/irqs.h b/arch/arm/mach-s5p64x0/include/mach/irqs.h
index 513abff..5837a36 100644
--- a/arch/arm/mach-s5p64x0/include/mach/irqs.h
+++ b/arch/arm/mach-s5p64x0/include/mach/irqs.h
@@ -85,6 +85,8 @@
 #define IRQ_S3CUART_RX4		IRQ_S5P_UART_RX4
 #define IRQ_S3CUART_RX5		IRQ_S5P_UART_RX5
 
+#define IRQ_I2S0		IRQ_I2SV40
+
 /* S5P6450 EINT feature will be added */
 
 /*
-- 
1.7.1
