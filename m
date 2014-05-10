From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH v4 01/11] ARM: EXYNOS: Make exynos machine_ops as static
Date: Sat, 10 May 2014 15:56:28 +0900
Message-ID: <1399704998-13321-2-git-send-email-pankaj.dubey@samsung.com>
References: <1399704998-13321-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:44373 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751127AbaEJGiY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 10 May 2014 02:38:24 -0400
In-reply-to: <1399704998-13321-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, linux@arm.linux.org.uk, t.figa@samsung.com, chow.kim@samsung.com, yg1004.jang@samsung.com, vikas.sajjan@samsung.com, Pankaj Dubey <pankaj.dubey@samsung.com>

As machine function ops are used only in this file let's make
them static. Also remove unused and unwanted declarations from
common.h.

Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
---
 arch/arm/mach-exynos/common.h |    8 --------
 arch/arm/mach-exynos/exynos.c |    6 +++---
 2 files changed, 3 insertions(+), 11 deletions(-)

diff --git a/arch/arm/mach-exynos/common.h b/arch/arm/mach-exynos/common.h
index c8893b3..69739e4 100644
--- a/arch/arm/mach-exynos/common.h
+++ b/arch/arm/mach-exynos/common.h
@@ -15,15 +15,7 @@
 #include <linux/reboot.h>
 #include <linux/of.h>
 
-void mct_init(void __iomem *base, int irq_g0, int irq_l0, int irq_l1);
-
-struct map_desc;
 extern void __iomem *sram_ns_base_addr;
-void exynos_init_io(void);
-void exynos_restart(enum reboot_mode mode, const char *cmd);
-void exynos_cpuidle_init(void);
-void exynos_cpufreq_init(void);
-void exynos_init_late(void);
 
 void exynos_firmware_init(void);
 
diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/exynos.c
index 7d9d8762..bf8a473 100644
--- a/arch/arm/mach-exynos/exynos.c
+++ b/arch/arm/mach-exynos/exynos.c
@@ -148,7 +148,7 @@ static struct map_desc exynos5_iodesc[] __initdata = {
 	},
 };
 
-void exynos_restart(enum reboot_mode mode, const char *cmd)
+static void exynos_restart(enum reboot_mode mode, const char *cmd)
 {
 	struct device_node *np;
 	u32 val = 0x1;
@@ -189,7 +189,7 @@ void __init exynos_cpufreq_init(void)
 	platform_device_register_simple("exynos-cpufreq", -1, NULL, 0);
 }
 
-void __init exynos_init_late(void)
+static void __init exynos_init_late(void)
 {
 	if (of_machine_is_compatible("samsung,exynos5440"))
 		/* to be supported later */
@@ -236,7 +236,7 @@ static void __init exynos_map_io(void)
 		iotable_init(exynos5_iodesc, ARRAY_SIZE(exynos5_iodesc));
 }
 
-void __init exynos_init_io(void)
+static void __init exynos_init_io(void)
 {
 	debug_ll_io_init();
 
-- 
1.7.10.4
