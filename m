From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH v3 01/12] ARM: EXYNOS: Make exynos machine_ops as static
Date: Wed, 30 Apr 2014 14:17:26 +0900
Message-ID: <1398835057-3860-2-git-send-email-pankaj.dubey@samsung.com>
References: <1398835057-3860-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:63351 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751273AbaD3E7k (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Apr 2014 00:59:40 -0400
In-reply-to: <1398835057-3860-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, linux@arm.linux.org.uk, t.figa@samsung.com, chow.kim@samsung.com, yg1004.jang@samsung.com, vikas.sajjan@samsung.com, Pankaj Dubey <pankaj.dubey@samsung.com>

As machine function ops are used only in this file let's make
them static.

Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
---
 arch/arm/mach-exynos/exynos.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/exynos.c
index 3d69e8d..06dcce5 100644
--- a/arch/arm/mach-exynos/exynos.c
+++ b/arch/arm/mach-exynos/exynos.c
@@ -198,7 +198,7 @@ static struct map_desc exynos5_iodesc[] __initdata = {
 	},
 };
 
-void exynos_restart(enum reboot_mode mode, const char *cmd)
+static void exynos_restart(enum reboot_mode mode, const char *cmd)
 {
 	struct device_node *np;
 	u32 val = 0x1;
@@ -239,7 +239,7 @@ void __init exynos_cpufreq_init(void)
 	platform_device_register_simple("exynos-cpufreq", -1, NULL, 0);
 }
 
-void __init exynos_init_late(void)
+static void __init exynos_init_late(void)
 {
 	if (of_machine_is_compatible("samsung,exynos5440"))
 		/* to be supported later */
@@ -300,7 +300,7 @@ static void __init exynos_map_io(void)
 		iotable_init(exynos5250_iodesc, ARRAY_SIZE(exynos5250_iodesc));
 }
 
-void __init exynos_init_io(void)
+static void __init exynos_init_io(void)
 {
 	debug_ll_io_init();
 
-- 
1.7.10.4
