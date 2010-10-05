From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 2/4] ARM: S3C: Change VMALLOC_END to use more vmalloc()/ioremap() area
Date: Tue,  5 Oct 2010 11:06:36 +0900
Message-ID: <1286244398-9333-3-git-send-email-kgene.kim@samsung.com>
References: <1286244398-9333-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:39310 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753291Ab0JEC1z (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Oct 2010 22:27:55 -0400
In-Reply-To: <1286244398-9333-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>

This patch changes VMALLOC_END from 0xE0000000 to 0xFA000000, because
some systems want to use more vmalloc()/ioremap() area and now don't use
from at 0xE0000000 to 0xFA000000 (the start of Samsung SoCs' VA space)

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
Cc: Ben Dooks <ben-linux@fluff.org>
---
 arch/arm/mach-s3c2410/include/mach/vmalloc.h |    2 +-
 arch/arm/mach-s3c24a0/include/mach/vmalloc.h |    2 +-
 arch/arm/mach-s3c64xx/include/mach/vmalloc.h |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-s3c2410/include/mach/vmalloc.h b/arch/arm/mach-s3c2410/include/mach/vmalloc.h
index 54297eb..4093bc9 100644
--- a/arch/arm/mach-s3c2410/include/mach/vmalloc.h
+++ b/arch/arm/mach-s3c2410/include/mach/vmalloc.h
@@ -15,6 +15,6 @@
 #ifndef __ASM_ARCH_VMALLOC_H
 #define __ASM_ARCH_VMALLOC_H
 
-#define VMALLOC_END	0xE0000000UL
+#define VMALLOC_END	0xFA000000UL
 
 #endif /* __ASM_ARCH_VMALLOC_H */
diff --git a/arch/arm/mach-s3c24a0/include/mach/vmalloc.h b/arch/arm/mach-s3c24a0/include/mach/vmalloc.h
index 9146568..29d0002 100644
--- a/arch/arm/mach-s3c24a0/include/mach/vmalloc.h
+++ b/arch/arm/mach-s3c24a0/include/mach/vmalloc.h
@@ -12,6 +12,6 @@
 #ifndef __ASM_ARCH_VMALLOC_H
 #define __ASM_ARCH_VMALLOC_H
 
-#define VMALLOC_END	  (0xe0000000UL)
+#define VMALLOC_END	0xFA000000UL
 
 #endif /* __ASM_ARCH_VMALLOC_H */
diff --git a/arch/arm/mach-s3c64xx/include/mach/vmalloc.h b/arch/arm/mach-s3c64xx/include/mach/vmalloc.h
index bc0e913..0df9597 100644
--- a/arch/arm/mach-s3c64xx/include/mach/vmalloc.h
+++ b/arch/arm/mach-s3c64xx/include/mach/vmalloc.h
@@ -15,6 +15,6 @@
 #ifndef __ASM_ARCH_VMALLOC_H
 #define __ASM_ARCH_VMALLOC_H
 
-#define VMALLOC_END	0xE0000000UL
+#define VMALLOC_END	0xFA000000UL
 
 #endif /* __ASM_ARCH_VMALLOC_H */
-- 
1.6.2.5
