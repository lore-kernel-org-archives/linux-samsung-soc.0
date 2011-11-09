From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: S5P: Fix export.h inclusion
Date: Wed,  9 Nov 2011 14:55:49 +0900
Message-ID: <1320818149-29106-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:56038 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752827Ab1KIGPs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Nov 2011 01:15:48 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>

Commit 32aaeffbd4a7 ("Merge branch 'modsplit-Oct31_2011'...") breaks
build like following and this fixes it to add inclusion <linux/export.h>.

arch/arm/plat-s5p/sysmmu.c:302: error: 'THIS_MODULE' undeclared here (not in a function)

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/plat-s5p/sysmmu.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/plat-s5p/sysmmu.c b/arch/arm/plat-s5p/sysmmu.c
index e1cbc72..c8bec9c 100644
--- a/arch/arm/plat-s5p/sysmmu.c
+++ b/arch/arm/plat-s5p/sysmmu.c
@@ -11,6 +11,7 @@
 #include <linux/io.h>
 #include <linux/interrupt.h>
 #include <linux/platform_device.h>
+#include <linux/export.h>
 
 #include <asm/pgtable.h>
 
-- 
1.7.1
