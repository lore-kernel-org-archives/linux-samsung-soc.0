From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 2/2] ARM: S5PV210: Add OneNAND device to the Aquila board
Date: Fri, 25 Jun 2010 07:52:07 +0200
Message-ID: <1277445127-16025-3-git-send-email-m.szyprowski@samsung.com>
References: <1277445127-16025-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:63188 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750825Ab0FYFwM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Jun 2010 01:52:12 -0400
Received: from eu_spt1 (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0L4K003AF2YXUN@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 25 Jun 2010 06:52:10 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0L4K00K8J2YX6J@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 25 Jun 2010 06:52:09 +0100 (BST)
In-reply-to: <1277445127-16025-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, kgene.kim@samsung.com, Joonyoung Shim <jy0922.shim@samsung.com>

From: Joonyoung Shim <jy0922.shim@samsung.com>

This patch is to support OneNAND device to the Aquila board.

Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/mach-s5pv210/Kconfig       |    1 +
 arch/arm/mach-s5pv210/mach-aquila.c |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/Kconfig
index d0432c6..7e2e1eb 100644
--- a/arch/arm/mach-s5pv210/Kconfig
+++ b/arch/arm/mach-s5pv210/Kconfig
@@ -51,6 +51,7 @@ config MACH_AQUILA
 	select ARCH_SPARSEMEM_ENABLE
 	select S5PV210_SETUP_FB_24BPP
 	select S3C_DEV_FB
+	select S5PC110_DEV_ONENAND
 	help
 	  Machine support for the Samsung Aquila target based on S5PC110 SoC
 
diff --git a/arch/arm/mach-s5pv210/mach-aquila.c b/arch/arm/mach-s5pv210/mach-aquila.c
index 10bc76e..fb9dbb2 100644
--- a/arch/arm/mach-s5pv210/mach-aquila.c
+++ b/arch/arm/mach-s5pv210/mach-aquila.c
@@ -118,6 +118,7 @@ static struct s3c_fb_platdata aquila_lcd_pdata __initdata = {
 
 static struct platform_device *aquila_devices[] __initdata = {
 	&s3c_device_fb,
+	&s5pc110_device_onenand,
 };
 
 static void __init aquila_map_io(void)
-- 
1.7.1.569.g6f426
