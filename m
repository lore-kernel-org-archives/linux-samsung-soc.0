From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>
Subject: [RFC PATCH 1/4] ARM: S3C24XX: move s3c24xx-irq to drivers/irqchip
Date: Mon, 12 Nov 2012 14:47:46 +0100
Message-ID: <201211121447.49977.heiko@sntech.de>
References: <201211121446.30167.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:41002 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752027Ab2KLNr4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Nov 2012 08:47:56 -0500
In-Reply-To: <201211121446.30167.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, Stephen Warren <swarren@wwwdotorg.org>, Olof Johansson <olof@lixom.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Removes another part from plat-s3c24xx and also enables further
improvements happening in the correct location.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm/Kconfig                                   |    1 +
 arch/arm/plat-s3c24xx/Makefile                     |    1 -
 drivers/irqchip/Kconfig                            |    3 +++
 drivers/irqchip/Makefile                           |    1 +
 .../irq.c => drivers/irqchip/irq-s3c24xx.c         |    0
 5 files changed, 5 insertions(+), 1 deletions(-)
 rename arch/arm/plat-s3c24xx/irq.c => drivers/irqchip/irq-s3c24xx.c (100%)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 48eea16..7db6b91 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -742,6 +742,7 @@ config ARCH_S3C24XX
 	select HAVE_S3C_RTC if RTC_CLASS
 	select NEED_MACH_GPIO_H
 	select NEED_MACH_IO_H
+	select S3C24XX_IRQ
 	help
 	  Samsung S3C2410, S3C2412, S3C2413, S3C2416, S3C2440, S3C2442, S3C2443
 	  and S3C2450 SoCs based systems, such as the Simtec Electronics BAST
diff --git a/arch/arm/plat-s3c24xx/Makefile b/arch/arm/plat-s3c24xx/Makefile
index 9f60549c..6472416 100644
--- a/arch/arm/plat-s3c24xx/Makefile
+++ b/arch/arm/plat-s3c24xx/Makefile
@@ -12,7 +12,6 @@ obj-				:=
 
 # Core files
 
-obj-y				+= irq.o
 obj-$(CONFIG_S3C24XX_DCLK)	+= clock-dclk.o
 
 obj-$(CONFIG_CPU_FREQ_S3C24XX)	+= cpu-freq.o
diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 62ca575..860d45d 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -1,3 +1,6 @@
+config S3C24XX_IRQ
+	bool
+
 config VERSATILE_FPGA_IRQ
 	bool
 	select IRQ_DOMAIN
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index e2e6eb5..5c20f85 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -1,2 +1,3 @@
 obj-$(CONFIG_ARCH_BCM2835) += irq-bcm2835.o
+obj-$(CONFIG_S3C24XX_IRQ) += irq-s3c24xx.o
 obj-$(CONFIG_VERSATILE_FPGA_IRQ) += irq-versatile-fpga.o
diff --git a/arch/arm/plat-s3c24xx/irq.c b/drivers/irqchip/irq-s3c24xx.c
similarity index 100%
rename from arch/arm/plat-s3c24xx/irq.c
rename to drivers/irqchip/irq-s3c24xx.c
-- 
1.7.2.3
