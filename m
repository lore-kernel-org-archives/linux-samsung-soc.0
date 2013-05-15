From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH] ARM: SAMSUNG: devs: Add names to fimd0 IRQ resources
Date: Wed, 15 May 2013 17:09:44 +0200
Message-ID: <1368630584-30147-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:8721 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756602Ab3EOPKe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 15 May 2013 11:10:34 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MMU00BWAI56W660@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 15 May 2013 16:10:32 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, arnd@arndb.de, olof@lixom.net, Tomasz Figa <t.figa@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

Since commit 1977e6d8 (drm/exynos: change the method for getting the
interrupt) the Exynos DRM FIMD driver requires IRQ resources to be
named. This patch fixes probe failure in non-DT cases by adding
appropriate resource names to fimd0 platform device.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/plat-samsung/devs.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/plat-samsung/devs.c b/arch/arm/plat-samsung/devs.c
index 30c2fe2..0f9c3f4 100644
--- a/arch/arm/plat-samsung/devs.c
+++ b/arch/arm/plat-samsung/devs.c
@@ -311,9 +311,9 @@ struct platform_device s5p_device_jpeg = {
 #ifdef CONFIG_S5P_DEV_FIMD0
 static struct resource s5p_fimd0_resource[] = {
 	[0] = DEFINE_RES_MEM(S5P_PA_FIMD0, SZ_32K),
-	[1] = DEFINE_RES_IRQ(IRQ_FIMD0_VSYNC),
-	[2] = DEFINE_RES_IRQ(IRQ_FIMD0_FIFO),
-	[3] = DEFINE_RES_IRQ(IRQ_FIMD0_SYSTEM),
+	[1] = DEFINE_RES_IRQ_NAMED(IRQ_FIMD0_VSYNC, "vsync"),
+	[2] = DEFINE_RES_IRQ_NAMED(IRQ_FIMD0_FIFO, "fifo"),
+	[3] = DEFINE_RES_IRQ_NAMED(IRQ_FIMD0_SYSTEM, "lcd_sys"),
 };
 
 struct platform_device s5p_device_fimd0 = {
-- 
1.8.2.1
