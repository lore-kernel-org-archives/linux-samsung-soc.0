From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH] ARM: SAMSUNG: Correct MIPI-CSIS io memory resource definition
Date: Tue, 14 Feb 2012 18:36:47 +0100
Message-ID: <1329241007-28811-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:28163 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751683Ab2BNRgx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 14 Feb 2012 12:36:53 -0500
Received: from euspt1 ([210.118.77.14]) by mailout4.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LZE00ET18XFW980@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 14 Feb 2012 17:36:51 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LZE00H5X8XFRR@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 14 Feb 2012 17:36:51 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, riverful.kim@samsung.com, sw0312.kim@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

The resources size is increased to 16KB to also include the non-image packet
data buffers (CSIS_PKTDATAn). The 4KiB region is only sufficient when the
driver is not using the packet data buffers.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>

---
Hi Kgene,

This patch is a fix, but it should be needed starting from v3.4,
when the MIPI-CSIS driver is updated.

Thanks,
Sylwester
---
 arch/arm/plat-samsung/devs.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/plat-samsung/devs.c b/arch/arm/plat-samsung/devs.c
index 848b9c6..130fdaa 100644
--- a/arch/arm/plat-samsung/devs.c
+++ b/arch/arm/plat-samsung/devs.c
@@ -904,7 +904,7 @@ struct platform_device s5p_device_mfc_r = {
 
 #ifdef CONFIG_S5P_DEV_CSIS0
 static struct resource s5p_mipi_csis0_resource[] = {
-	[0] = DEFINE_RES_MEM(S5P_PA_MIPI_CSIS0, SZ_4K),
+	[0] = DEFINE_RES_MEM(S5P_PA_MIPI_CSIS0, SZ_16K),
 	[1] = DEFINE_RES_IRQ(IRQ_MIPI_CSIS0),
 };
 
@@ -918,7 +918,7 @@ struct platform_device s5p_device_mipi_csis0 = {
 
 #ifdef CONFIG_S5P_DEV_CSIS1
 static struct resource s5p_mipi_csis1_resource[] = {
-	[0] = DEFINE_RES_MEM(S5P_PA_MIPI_CSIS1, SZ_4K),
+	[0] = DEFINE_RES_MEM(S5P_PA_MIPI_CSIS1, SZ_16K),
 	[1] = DEFINE_RES_IRQ(IRQ_MIPI_CSIS1),
 };
 
-- 
1.7.9
