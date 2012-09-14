From: Arun Kumar K <arun.kk@samsung.com>
Subject: [PATCH v3] ARM: EXYNOS: Add MFC device tree support
Date: Fri, 14 Sep 2012 21:08:17 +0530
Message-ID: <1347637097-15015-2-git-send-email-arun.kk@samsung.com>
References: <1347637097-15015-1-git-send-email-arun.kk@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:14064 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753822Ab2INKQP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 Sep 2012 06:16:15 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MAC00I614IZL570@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 14 Sep 2012 19:16:13 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MAC00ARO4G9R9A0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 14 Sep 2012 19:16:12 +0900 (KST)
In-reply-to: <1347637097-15015-1-git-send-email-arun.kk@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, k.debski@samsung.com, jtp.park@samsung.com, thomas.abraham@linaro.org, k.lewandowsk@samsung.com, s.nawrocki@samsung.com, ch.naveen@samsung.com, arun.kk@samsung.com, joshi@samsung.com

This patch adds device tree entry for MFC v6 in the Exynos5
SoC. Makes the required changes in the clock files and adds
MFC to the DT device list.

Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
---
 .../devicetree/bindings/media/s5p-mfc.txt          |   27 ++++++++++
 arch/arm/boot/dts/exynos5250-smdk5250.dts          |    7 +++
 arch/arm/boot/dts/exynos5250.dtsi                  |    6 ++
 arch/arm/mach-exynos/Kconfig                       |    1 +
 arch/arm/mach-exynos/clock-exynos5.c               |    2 +-
 arch/arm/mach-exynos/mach-exynos5-dt.c             |   55 ++++++++++++++++++++
 6 files changed, 97 insertions(+), 1 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/s5p-mfc.txt

diff --git a/Documentation/devicetree/bindings/media/s5p-mfc.txt b/Documentation/devicetree/bindings/media/s5p-mfc.txt
new file mode 100644
index 0000000..f95e775
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/s5p-mfc.txt
@@ -0,0 +1,27 @@
+* Samsung Multi Format Codec (MFC)
+
+Multi Format Codec (MFC) is the IP present in Samsung SoCs which
+supports high resolution decoding and encoding functionalities.
+The MFC device driver is a v4l2 driver which can encode/decode
+video raw/elementary streams and has support for all popular
+video codecs.
+
+Required properties:
+  - compatible : value should be either one among the following
+	(a) "samsung,mfc-v5" for MFC v5 present in Exynos4 SoCs
+	(b) "samsung,mfc-v6" for MFC v6 present in Exynos5 SoCs
+
+  - reg : Physical base address of the IP registers and length of memory
+	  mapped region.
+
+  - interrupts : MFC interrupt number to the CPU.
+
+  - samsung,mfc-r : Base address of the first memory bank used by MFC
+		    for DMA contiguous memory allocation.
+
+  - samsung,mfc-r-size : Size of the first memory bank.
+
+  - samsung,mfc-l : Base address of the second memory bank used by MFC
+		    for DMA contiguous memory allocation.
+
+  - samsung,mfc-l-size : Size of the second memory bank.
diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
index 8a5e348..5824c97 100644
--- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
@@ -109,4 +109,11 @@
 	spi_2: spi@12d40000 {
 		status = "disabled";
 	};
+
+	mfc {
+		samsung,mfc-r = <0x43000000>;
+		samsung,mfc-r-size = <8388608>;
+		samsung,mfc-l = <0x51000000>;
+		samsung,mfc-l-size = <8388608>;
+	};
 };
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index b55794b..5df2f99 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -62,6 +62,12 @@
 		interrupts = <0 42 0>;
 	};
 
+	mfc {
+		compatible = "samsung,mfc-v6";
+		reg = <0x11000000 0x10000>;
+		interrupts = <0 96 0>;
+	};
+
 	rtc {
 		compatible = "samsung,s3c6410-rtc";
 		reg = <0x101E0000 0x100>;
diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index 195b50e..8ddc26a 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -64,6 +64,7 @@ config SOC_EXYNOS5250
 	select SAMSUNG_DMADEV
 	select S5P_PM if PM
 	select S5P_SLEEP if PM
+	select S5P_DEV_MFC
 	help
 	  Enable EXYNOS5250 SoC support
 
diff --git a/arch/arm/mach-exynos/clock-exynos5.c b/arch/arm/mach-exynos/clock-exynos5.c
index eb3f4fc..461a721 100644
--- a/arch/arm/mach-exynos/clock-exynos5.c
+++ b/arch/arm/mach-exynos/clock-exynos5.c
@@ -669,7 +669,7 @@ static struct clk exynos5_init_clocks_off[] = {
 		.ctrlbit	= (1 << 25),
 	}, {
 		.name		= "mfc",
-		.devname	= "s5p-mfc",
+		.devname	= "s5p-mfc-v6",
 		.enable		= exynos5_clk_ip_mfc_ctrl,
 		.ctrlbit	= (1 << 0),
 	}, {
diff --git a/arch/arm/mach-exynos/mach-exynos5-dt.c b/arch/arm/mach-exynos/mach-exynos5-dt.c
index e707eb1..243ba63 100644
--- a/arch/arm/mach-exynos/mach-exynos5-dt.c
+++ b/arch/arm/mach-exynos/mach-exynos5-dt.c
@@ -11,6 +11,8 @@
 
 #include <linux/of_platform.h>
 #include <linux/serial_core.h>
+#include <linux/memblock.h>
+#include <linux/of_fdt.h>
 
 #include <asm/mach/arch.h>
 #include <asm/hardware/gic.h>
@@ -18,6 +20,7 @@
 
 #include <plat/cpu.h>
 #include <plat/regs-serial.h>
+#include <plat/mfc.h>
 
 #include "common.h"
 
@@ -64,6 +67,7 @@ static const struct of_dev_auxdata exynos5250_auxdata_lookup[] __initconst = {
 				"exynos-gsc.2", NULL),
 	OF_DEV_AUXDATA("samsung,exynos5-gsc", EXYNOS5_PA_GSC3,
 				"exynos-gsc.3", NULL),
+	OF_DEV_AUXDATA("samsung,mfc-v6", 0x11000000, "s5p-mfc-v6", NULL),
 	{},
 };
 
@@ -84,6 +88,56 @@ static char const *exynos5250_dt_compat[] __initdata = {
 	NULL
 };
 
+struct mfc_dt_meminfo {
+	unsigned long loff;
+	unsigned long lsize;
+	unsigned long roff;
+	unsigned long rsize;
+};
+
+int fdt_find_mfc_mem(unsigned long node, const char *uname, int depth,
+		void *data)
+{
+	__be32 *prop;
+	unsigned long len;
+	struct mfc_dt_meminfo *mfc_mem = data;
+
+	if (!of_flat_dt_is_compatible(node, "samsung,mfc-v6"))
+		return 0;
+
+	prop = of_get_flat_dt_prop(node, "samsung,mfc-l", &len);
+	if (!prop)
+		return 0;
+	mfc_mem->loff = of_read_ulong(prop, len/4);
+
+	prop = of_get_flat_dt_prop(node, "samsung,mfc-l-size", &len);
+	if (!prop)
+		return 0;
+	mfc_mem->lsize = of_read_ulong(prop, len/4);
+
+	prop = of_get_flat_dt_prop(node, "samsung,mfc-r", &len);
+	if (!prop)
+		return 0;
+	mfc_mem->roff = of_read_ulong(prop, len/4);
+
+	prop = of_get_flat_dt_prop(node, "samsung,mfc-r-size", &len);
+	if (!prop)
+		return 0;
+	mfc_mem->rsize = of_read_ulong(prop, len/4);
+
+	return 1;
+}
+
+static void __init exynos5_reserve(void)
+{
+	struct mfc_dt_meminfo mfc_mem;
+
+	/* Reserve memory for MFC only if it's available */
+	if (of_scan_flat_dt(fdt_find_mfc_mem, &mfc_mem))
+		s5p_mfc_reserve_mem(mfc_mem.roff, mfc_mem.rsize, mfc_mem.loff,
+				mfc_mem.lsize);
+}
+
 DT_MACHINE_START(EXYNOS5_DT, "SAMSUNG EXYNOS5 (Flattened Device Tree)")
 	/* Maintainer: Kukjin Kim <kgene.kim@samsung.com> */
 	.init_irq	= exynos5_init_irq,
@@ -94,4 +148,5 @@ DT_MACHINE_START(EXYNOS5_DT, "SAMSUNG EXYNOS5 (Flattened Device Tree)")
 	.timer		= &exynos4_timer,
 	.dt_compat	= exynos5250_dt_compat,
 	.restart        = exynos5_restart,
+	.reserve	= exynos5_reserve,
 MACHINE_END
-- 
1.7.0.4
