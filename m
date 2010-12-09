From: Kamil Debski <k.debski@samsung.com>
Subject: [RFC/PATCH v4 2/4] MFC: Add MFC 5.1 driver to plat-s5p
Date: Thu, 09 Dec 2010 14:35:21 +0100
Message-ID: <1291901723-20361-3-git-send-email-k.debski@samsung.com>
References: <1291901723-20361-1-git-send-email-k.debski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-media-owner@vger.kernel.org>
In-reply-to: <1291901723-20361-1-git-send-email-k.debski@samsung.com>
Sender: linux-media-owner@vger.kernel.org
To: linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, pawel@osciak.com, kyungmin.park@samsung.com, k.debski@samsung.com, jaeryul.oh@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Add platform support for Multi Format Codec 5.1 is a module available
on S5PC110 and S5PC210 Samsung SoCs. Hardware is capable of handling
a range of video codecs and this driver provides V4L2 interface for
video decoding.

Signed-off-by: Kamil Debski <k.debski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-s5pv210/clock.c                   |    6 ++++
 arch/arm/mach-s5pv210/include/mach/map.h        |    4 ++
 arch/arm/plat-s5p/Kconfig                       |    5 +++
 arch/arm/plat-s5p/Makefile                      |    1 +
 arch/arm/plat-s5p/dev-mfc5.c                    |   37 +++++++++++++++++++++++
 arch/arm/plat-samsung/include/plat/devs.h       |    2 +
 9 files changed, 104 insertions(+), 1 deletions(-)
 create mode 100644 arch/arm/plat-s5p/dev-mfc5.c

diff --git a/arch/arm/mach-s5pv210/clock.c b/arch/arm/mach-s5pv210/clock.c
index 5014b62..f7d742d 100644
--- a/arch/arm/mach-s5pv210/clock.c
+++ b/arch/arm/mach-s5pv210/clock.c
@@ -364,6 +364,12 @@ static struct clk init_clocks_disable[] = {
 		.enable		= s5pv210_clk_ip0_ctrl,
 		.ctrlbit	= (1 << 26),
 	}, {
+		.name		= "mfc",
+		.id		= -1,
+		.parent		= &clk_pclk_psys.clk,
+		.enable		= s5pv210_clk_ip0_ctrl,
+		.ctrlbit	= (1 << 16),
+	}, {
 		.name		= "nfcon",
 		.id		= -1,
 		.parent		= &clk_hclk_psys.clk,
diff --git a/arch/arm/mach-s5pv210/include/mach/map.h b/arch/arm/mach-s5pv210/include/mach/map.h
index 0982443..8f887c4 100644
--- a/arch/arm/mach-s5pv210/include/mach/map.h
+++ b/arch/arm/mach-s5pv210/include/mach/map.h
@@ -107,6 +107,9 @@
 #define S5PV210_PA_DMC0		(0xF0000000)
 #define S5PV210_PA_DMC1		(0xF1400000)
 
+/* MFC */
+#define S5PV210_PA_MFC		(0xF1700000)
+
 /* compatibiltiy defines. */
 #define S3C_PA_UART		S5PV210_PA_UART
 #define S3C_PA_HSMMC0		S5PV210_PA_HSMMC(0)
@@ -123,6 +126,7 @@
 #define S5P_PA_FIMC0		S5PV210_PA_FIMC0
 #define S5P_PA_FIMC1		S5PV210_PA_FIMC1
 #define S5P_PA_FIMC2		S5PV210_PA_FIMC2
+#define S5P_PA_MFC		S5PV210_PA_MFC
 
 #define SAMSUNG_PA_ADC		S5PV210_PA_ADC
 #define SAMSUNG_PA_CFCON	S5PV210_PA_CFCON
diff --git a/arch/arm/plat-s5p/Kconfig b/arch/arm/plat-s5p/Kconfig
index 9755df9..c7a048e 100644
--- a/arch/arm/plat-s5p/Kconfig
+++ b/arch/arm/plat-s5p/Kconfig
@@ -5,6 +5,11 @@
 #
 # Licensed under GPLv2
 
+config S5P_DEV_MFC
+	bool
+	help
+	  Compile in platform device definitions for MFC 
+	  
 config PLAT_S5P
 	bool
 	depends on (ARCH_S5P64X0 || ARCH_S5P6442 || ARCH_S5PC100 || ARCH_S5PV210 || ARCH_S5PV310)
diff --git a/arch/arm/plat-s5p/Makefile b/arch/arm/plat-s5p/Makefile
index df65cb7..ed0f33d 100644
--- a/arch/arm/plat-s5p/Makefile
+++ b/arch/arm/plat-s5p/Makefile
@@ -23,6 +23,7 @@ obj-$(CONFIG_PM)		+= pm.o
 obj-$(CONFIG_PM)		+= irq-pm.o
 
 # devices
+obj-$(CONFIG_S5P_DEV_MFC)	+= dev-mfc5.o
 
 obj-$(CONFIG_S5P_DEV_FIMC0)	+= dev-fimc0.o
 obj-$(CONFIG_S5P_DEV_FIMC1)	+= dev-fimc1.o
diff --git a/arch/arm/plat-s5p/dev-mfc5.c b/arch/arm/plat-s5p/dev-mfc5.c
new file mode 100644
index 0000000..c06ea97
--- /dev/null
+++ b/arch/arm/plat-s5p/dev-mfc5.c
@@ -0,0 +1,37 @@
+/* Base S3C64XX mfc resource and device definitions */
+
+
+#include <linux/kernel.h>
+#include <linux/interrupt.h>
+#include <linux/platform_device.h>
+#include <linux/ioport.h>
+
+#include <mach/map.h>
+#include <plat/map-base.h>
+#include <plat/devs.h>
+#include <plat/irqs.h>
+
+/* MFC controller */
+static struct resource s5p_mfc_resource[] = {
+	[0] = {
+		.start  = S5P_PA_MFC,
+		.end    = S5P_PA_MFC + SZ_64K - 1,
+		.flags  = IORESOURCE_MEM,
+	},
+	[1] = {
+		.start  = IRQ_MFC,
+		.end    = IRQ_MFC,
+		.flags  = IORESOURCE_IRQ,
+	}
+};
+
+struct platform_device s5p_device_mfc5 = {
+	.name          = "s5p-mfc5",
+	.id            = -1,
+	.num_resources = ARRAY_SIZE(s5p_mfc_resource),
+	.resource      = s5p_mfc_resource,
+};
+
+EXPORT_SYMBOL(s5p_device_mfc5);
+
+
diff --git a/arch/arm/plat-samsung/include/plat/devs.h b/arch/arm/plat-samsung/include/plat/devs.h
index 628b331..fc169da 100644
--- a/arch/arm/plat-samsung/include/plat/devs.h
+++ b/arch/arm/plat-samsung/include/plat/devs.h
@@ -124,6 +124,8 @@ extern struct platform_device s5p_device_fimc2;
 extern struct platform_device s5p_device_fimc3;
 extern struct platform_device s5pv310_device_fb0;
 
+extern struct platform_device s5p_device_mfc5;
+
 /* s3c2440 specific devices */
 
 #ifdef CONFIG_CPU_S3C2440
-- 
1.6.3.3
