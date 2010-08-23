From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH v2] ARM: SAMSUNG: Fix on build warning regarding VMALLOC_END type
Date: Mon, 23 Aug 2010 10:11:07 +0900
Message-ID: <1282525867-29968-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:44231 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751304Ab0HWBXX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 22 Aug 2010 21:23:23 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>

Fix this warning:

arch/arm/mm/init.c: In function 'mem_init':
arch/arm/mm/init.c:644: warning: format '%08lx' expects type
'long unsigned int', but argument 12 has type 'unsigned int'

And removes the useless parens and white space.

Reported-by: Kyungmin Park <kyungmin.park@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
Cc: Ben Dooks <ben-linux@fluff.org>
---
Change since v1:
- Removing the useless parens as per Sergei Shtylyov suggestion.

 arch/arm/mach-s3c2410/include/mach/vmalloc.h |    2 +-
 arch/arm/mach-s3c64xx/include/mach/vmalloc.h |    2 +-
 arch/arm/mach-s5p6440/include/mach/vmalloc.h |    2 +-
 arch/arm/mach-s5p6442/include/mach/vmalloc.h |    2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-s3c2410/include/mach/vmalloc.h b/arch/arm/mach-s3c2410/include/mach/vmalloc.h
index 315b007..dc3b34c 100644
--- a/arch/arm/mach-s3c2410/include/mach/vmalloc.h
+++ b/arch/arm/mach-s3c2410/include/mach/vmalloc.h
@@ -15,6 +15,6 @@
 #ifndef __ASM_ARCH_VMALLOC_H
 #define __ASM_ARCH_VMALLOC_H
 
-#define VMALLOC_END	  (0xE0000000)
+#define VMALLOC_END	0xE0000000UL
 
 #endif /* __ASM_ARCH_VMALLOC_H */
diff --git a/arch/arm/mach-s3c64xx/include/mach/vmalloc.h b/arch/arm/mach-s3c64xx/include/mach/vmalloc.h
index 7411ef3..f0a0fa2 100644
--- a/arch/arm/mach-s3c64xx/include/mach/vmalloc.h
+++ b/arch/arm/mach-s3c64xx/include/mach/vmalloc.h
@@ -15,6 +15,6 @@
 #ifndef __ASM_ARCH_VMALLOC_H
 #define __ASM_ARCH_VMALLOC_H
 
-#define VMALLOC_END	  (0xE0000000)
+#define VMALLOC_END	0xE0000000UL
 
 #endif /* __ASM_ARCH_VMALLOC_H */
diff --git a/arch/arm/mach-s5p6440/include/mach/vmalloc.h b/arch/arm/mach-s5p6440/include/mach/vmalloc.h
index 16df257..8217b99 100644
--- a/arch/arm/mach-s5p6440/include/mach/vmalloc.h
+++ b/arch/arm/mach-s5p6440/include/mach/vmalloc.h
@@ -12,6 +12,6 @@
 #ifndef __ASM_ARCH_VMALLOC_H
 #define __ASM_ARCH_VMALLOC_H
 
-#define VMALLOC_END	  (0xE0000000)
+#define VMALLOC_END	0xE0000000UL
 
 #endif /* __ASM_ARCH_VMALLOC_H */
diff --git a/arch/arm/mach-s5p6442/include/mach/vmalloc.h b/arch/arm/mach-s5p6442/include/mach/vmalloc.h
index be33336..b9fd9aa 100644
--- a/arch/arm/mach-s5p6442/include/mach/vmalloc.h
+++ b/arch/arm/mach-s5p6442/include/mach/vmalloc.h
@@ -12,6 +12,6 @@
 #ifndef __ASM_ARCH_VMALLOC_H
 #define __ASM_ARCH_VMALLOC_H
 
-#define VMALLOC_END	  (0xE0000000)
+#define VMALLOC_END	0xE0000000UL
 
 #endif /* __ASM_ARCH_VMALLOC_H */
-- 
1.6.2.5
