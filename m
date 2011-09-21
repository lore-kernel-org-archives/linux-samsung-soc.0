From: Hatim Ali <hatim.rv@samsung.com>
Subject: [RESEND PATCH 2/3] ARM: EXYNOS4: Update consistent DMA size to 8MB
Date: Wed, 21 Sep 2011 11:14:19 +0530
Message-ID: <1316583860-32510-3-git-send-email-hatim.rv@samsung.com>
References: <1316583860-32510-1-git-send-email-hatim.rv@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:52921 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751918Ab1IUFqO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 Sep 2011 01:46:14 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LRU003M4YOUEB00@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 21 Sep 2011 14:46:13 +0900 (KST)
Received: from hatim-linux.sisodomain.com ([107.108.73.95])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LRU0000KYO05M@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 21 Sep 2011 14:46:13 +0900 (KST)
In-reply-to: <1316583860-32510-1-git-send-email-hatim.rv@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com
Cc: t.stanislaws@samsung.com, mchehab@infradead.org, hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com, banajit.g@samsung.com, Hatim Ali <hatim.rv@samsung.com>

Change the consistent DMA allocation to 8MB to support the
TVOUT driver.

NOTE: Once CMA support is merged into mainline, we will use it for memory
allocation.

Signed-off-by: Hatim Ali <hatim.rv@samsung.com>
---
 arch/arm/mach-exynos4/include/mach/memory.h |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos4/include/mach/memory.h b/arch/arm/mach-exynos4/include/mach/memory.h
index 374ef2c..7549742 100644
--- a/arch/arm/mach-exynos4/include/mach/memory.h
+++ b/arch/arm/mach-exynos4/include/mach/memory.h
@@ -15,6 +15,8 @@
 
 #define PLAT_PHYS_OFFSET		UL(0x40000000)
 
+#define CONSISTENT_DMA_SIZE		SZ_8M
+
 /* Maximum of 256MiB in one bank */
 #define MAX_PHYSMEM_BITS	32
 #define SECTION_SIZE_BITS	28
-- 
1.7.2.3
