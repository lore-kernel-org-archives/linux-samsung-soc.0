From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 1/2] ARM: S5PV210: Add OneNAND device to the GONI board
Date: Fri, 25 Jun 2010 07:52:06 +0200
Message-ID: <1277445127-16025-2-git-send-email-m.szyprowski@samsung.com>
References: <1277445127-16025-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:31676 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751182Ab0FYFwN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Jun 2010 01:52:13 -0400
Received: from eu_spt2 (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0L4K008DM2YY4D@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 25 Jun 2010 06:52:10 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0L4K009D72YXJX@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 25 Jun 2010 06:52:10 +0100 (BST)
In-reply-to: <1277445127-16025-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, kgene.kim@samsung.com, Joonyoung Shim <jy0922.shim@samsung.com>

From: Joonyoung Shim <jy0922.shim@samsung.com>

This patch is to support OneNAND device to the GONI board.

Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

---
 arch/arm/mach-s5pv210/Kconfig     |    1 +
 arch/arm/mach-s5pv210/mach-goni.c |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/Kconfig
index 0761eac..d0432c6 100644
--- a/arch/arm/mach-s5pv210/Kconfig
+++ b/arch/arm/mach-s5pv210/Kconfig
@@ -58,6 +58,7 @@ config MACH_GONI
 	bool "GONI"
 	select CPU_S5PV210
 	select ARCH_SPARSEMEM_ENABLE
+	select S5PC110_DEV_ONENAND
 	help
 	  Machine support for Samsung GONI board
 	  S5PC110(MCP) is one of package option of S5PV210
diff --git a/arch/arm/mach-s5pv210/mach-goni.c b/arch/arm/mach-s5pv210/mach-goni.c
index 4863b13..bea812f 100644
--- a/arch/arm/mach-s5pv210/mach-goni.c
+++ b/arch/arm/mach-s5pv210/mach-goni.c
@@ -72,6 +72,7 @@ static struct s3c2410_uartcfg goni_uartcfgs[] __initdata = {
 };
 
 static struct platform_device *goni_devices[] __initdata = {
+	&s5pc110_device_onenand,
 };
 
 static void __init goni_map_io(void)
-- 
1.7.1.569.g6f426
