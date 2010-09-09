From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2] ARM: Samsung: s5p-fimc: fix dma coherent mask
Date: Thu, 09 Sep 2010 04:17:53 +0200
Message-ID: <1283998673-14899-1-git-send-email-m.szyprowski@samsung.com>
References: <000301cb4fb7$b4448530$1ccd8f90$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:8373 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751228Ab0IICR6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 8 Sep 2010 22:17:58 -0400
Received: from eu_spt2 ([210.118.77.13]) by mailout3.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0L8G00HLMJPW3K80@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 09 Sep 2010 03:17:56 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0L8G00LSBJPVTC@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 09 Sep 2010 03:17:56 +0100 (BST)
In-reply-to: <000301cb4fb7$b4448530$1ccd8f90$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, kgene.kim@samsung.com, ben-linux@fluff.org

FIMC driver uses DMA_coherent allocator, which requires proper dma mask
to be set.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---

Chnages since v1:
- use DMA_BIT_MASK() macro, minor coding style change

---
 arch/arm/plat-s5p/dev-fimc0.c |    7 +++++++
 arch/arm/plat-s5p/dev-fimc1.c |    7 +++++++
 arch/arm/plat-s5p/dev-fimc2.c |    7 +++++++
 3 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/arch/arm/plat-s5p/dev-fimc0.c b/arch/arm/plat-s5p/dev-fimc0.c
index d3f1a9b..f9203fa 100644
--- a/arch/arm/plat-s5p/dev-fimc0.c
+++ b/arch/arm/plat-s5p/dev-fimc0.c
@@ -10,6 +10,7 @@
  */
 
 #include <linux/kernel.h>
+#include <linux/dma-mapping.h>
 #include <linux/platform_device.h>
 #include <linux/interrupt.h>
 #include <linux/ioport.h>
@@ -28,9 +29,15 @@ static struct resource s5p_fimc0_resource[] = {
 	},
 };
 
+static u64 s5p_fimc0_dma_mask = DMA_BIT_MASK(32);
+
 struct platform_device s5p_device_fimc0 = {
 	.name		= "s5p-fimc",
 	.id		= 0,
 	.num_resources	= ARRAY_SIZE(s5p_fimc0_resource),
 	.resource	= s5p_fimc0_resource,
+	.dev		= {
+		.dma_mask		= &s5p_fimc0_dma_mask,
+		.coherent_dma_mask	= DMA_BIT_MASK(32),
+	},
 };
diff --git a/arch/arm/plat-s5p/dev-fimc1.c b/arch/arm/plat-s5p/dev-fimc1.c
index 41bd698..7ed91a3 100644
--- a/arch/arm/plat-s5p/dev-fimc1.c
+++ b/arch/arm/plat-s5p/dev-fimc1.c
@@ -10,6 +10,7 @@
  */
 
 #include <linux/kernel.h>
+#include <linux/dma-mapping.h>
 #include <linux/platform_device.h>
 #include <linux/interrupt.h>
 #include <linux/ioport.h>
@@ -28,9 +29,15 @@ static struct resource s5p_fimc1_resource[] = {
 	},
 };
 
+static u64 s5p_fimc1_dma_mask = DMA_BIT_MASK(32);
+
 struct platform_device s5p_device_fimc1 = {
 	.name		= "s5p-fimc",
 	.id		= 1,
 	.num_resources	= ARRAY_SIZE(s5p_fimc1_resource),
 	.resource	= s5p_fimc1_resource,
+	.dev		= {
+		.dma_mask		= &s5p_fimc1_dma_mask,
+		.coherent_dma_mask	= DMA_BIT_MASK(32),
+	},
 };
diff --git a/arch/arm/plat-s5p/dev-fimc2.c b/arch/arm/plat-s5p/dev-fimc2.c
index dfddeda..5543d6373 100644
--- a/arch/arm/plat-s5p/dev-fimc2.c
+++ b/arch/arm/plat-s5p/dev-fimc2.c
@@ -10,6 +10,7 @@
  */
 
 #include <linux/kernel.h>
+#include <linux/dma-mapping.h>
 #include <linux/platform_device.h>
 #include <linux/interrupt.h>
 #include <linux/ioport.h>
@@ -28,9 +29,15 @@ static struct resource s5p_fimc2_resource[] = {
 	},
 };
 
+static u64 s5p_fimc2_dma_mask = DMA_BIT_MASK(32);
+
 struct platform_device s5p_device_fimc2 = {
 	.name		= "s5p-fimc",
 	.id		= 2,
 	.num_resources	= ARRAY_SIZE(s5p_fimc2_resource),
 	.resource	= s5p_fimc2_resource,
+	.dev		= {
+		.dma_mask		= &s5p_fimc2_dma_mask,
+		.coherent_dma_mask	= DMA_BIT_MASK(32),
+	},
 };
-- 
1.7.2.2
