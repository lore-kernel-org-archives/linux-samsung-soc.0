From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 2/4] ARM: Samsung: s5p-fimc: fix dma coherent mask
Date: Mon, 06 Sep 2010 05:50:42 +0200
Message-ID: <1283745044-15514-3-git-send-email-m.szyprowski@samsung.com>
References: <1283745044-15514-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:14826 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755241Ab0IFDut (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 5 Sep 2010 23:50:49 -0400
Received: from eu_spt1 (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0L8B00K4V40NY0@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 06 Sep 2010 04:50:47 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0L8B001GR40MA4@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 06 Sep 2010 04:50:47 +0100 (BST)
In-reply-to: <1283745044-15514-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, kgene.kim@samsung.com, ben-linux@fluff.org

FIMC driver uses DMA_coherent allocator, which requires proper dma mask
to be set.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/plat-s5p/dev-fimc0.c |    2 ++
 arch/arm/plat-s5p/dev-fimc1.c |    2 ++
 arch/arm/plat-s5p/dev-fimc2.c |    2 ++
 3 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/arch/arm/plat-s5p/dev-fimc0.c b/arch/arm/plat-s5p/dev-fimc0.c
index d3f1a9b..9f26096 100644
--- a/arch/arm/plat-s5p/dev-fimc0.c
+++ b/arch/arm/plat-s5p/dev-fimc0.c
@@ -33,4 +33,6 @@ struct platform_device s5p_device_fimc0 = {
 	.id		= 0,
 	.num_resources	= ARRAY_SIZE(s5p_fimc0_resource),
 	.resource	= s5p_fimc0_resource,
+	.dev.dma_mask	  = &s5p_device_fimc0.dev.coherent_dma_mask,
+	.dev.coherent_dma_mask = 0xffffffffUL,
 };
diff --git a/arch/arm/plat-s5p/dev-fimc1.c b/arch/arm/plat-s5p/dev-fimc1.c
index 41bd698..4149c49 100644
--- a/arch/arm/plat-s5p/dev-fimc1.c
+++ b/arch/arm/plat-s5p/dev-fimc1.c
@@ -33,4 +33,6 @@ struct platform_device s5p_device_fimc1 = {
 	.id		= 1,
 	.num_resources	= ARRAY_SIZE(s5p_fimc1_resource),
 	.resource	= s5p_fimc1_resource,
+	.dev.dma_mask	  = &s5p_device_fimc1.dev.coherent_dma_mask,
+	.dev.coherent_dma_mask = 0xffffffffUL,
 };
diff --git a/arch/arm/plat-s5p/dev-fimc2.c b/arch/arm/plat-s5p/dev-fimc2.c
index dfddeda..ced9097 100644
--- a/arch/arm/plat-s5p/dev-fimc2.c
+++ b/arch/arm/plat-s5p/dev-fimc2.c
@@ -33,4 +33,6 @@ struct platform_device s5p_device_fimc2 = {
 	.id		= 2,
 	.num_resources	= ARRAY_SIZE(s5p_fimc2_resource),
 	.resource	= s5p_fimc2_resource,
+	.dev.dma_mask	  = &s5p_device_fimc2.dev.coherent_dma_mask,
+	.dev.coherent_dma_mask = 0xffffffffUL,
 };
-- 
1.7.2.2
