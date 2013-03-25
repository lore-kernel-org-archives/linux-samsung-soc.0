From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: [PATCH v5 1/7] ARM: S3C24XX: move irq driver to drivers/irqchip
Date: Mon, 25 Mar 2013 22:27:19 +0100
Message-ID: <201303252227.20368.heiko@sntech.de>
References: <201303252226.21402.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:46932 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758631Ab3CYV1N (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Mar 2013 17:27:13 -0400
In-Reply-To: <201303252226.21402.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Thomas Abraham <thomas.abraham@linaro.org>, Arnd Bergmann <arnd@arndb.de>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

This move is necessary to make use of the irqchip infrastructure
for the following devicetree support for s3c24xx architectures.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm/mach-s3c24xx/Makefile                               |    2 +-
 drivers/irqchip/Makefile                                     |    1 +
 arch/arm/mach-s3c24xx/irq.c => drivers/irqchip/irq-s3c24xx.c |    0
 3 files changed, 2 insertions(+), 1 deletion(-)
 rename arch/arm/mach-s3c24xx/irq.c => drivers/irqchip/irq-s3c24xx.c (100%)

diff --git a/arch/arm/mach-s3c24xx/Makefile b/arch/arm/mach-s3c24xx/Makefile
index be6e4d0..6f46ecf 100644
--- a/arch/arm/mach-s3c24xx/Makefile
+++ b/arch/arm/mach-s3c24xx/Makefile
@@ -14,7 +14,7 @@ obj-				:=
 
 # core
 
-obj-y				+= common.o irq.o
+obj-y				+= common.o
 
 obj-$(CONFIG_CPU_S3C2410)	+= s3c2410.o
 obj-$(CONFIG_S3C2410_CPUFREQ)	+= cpufreq-s3c2410.o
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index 98e3b87..4d65a21 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -2,6 +2,7 @@ obj-$(CONFIG_IRQCHIP)			+= irqchip.o
 
 obj-$(CONFIG_ARCH_BCM2835)		+= irq-bcm2835.o
 obj-$(CONFIG_ARCH_EXYNOS)		+= exynos-combiner.o
+obj-$(CONFIG_ARCH_S3C24XX)		+= irq-s3c24xx.o
 obj-$(CONFIG_METAG)			+= irq-metag-ext.o
 obj-$(CONFIG_METAG_PERFCOUNTER_IRQS)	+= irq-metag.o
 obj-$(CONFIG_ARCH_SUNXI)		+= irq-sunxi.o
diff --git a/arch/arm/mach-s3c24xx/irq.c b/drivers/irqchip/irq-s3c24xx.c
similarity index 100%
rename from arch/arm/mach-s3c24xx/irq.c
rename to drivers/irqchip/irq-s3c24xx.c
-- 
1.7.10.4
