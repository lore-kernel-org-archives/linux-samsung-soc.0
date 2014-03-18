From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH v2 4/6] ARM: SAMSUNG: Fix rebase error in pm-debug.c
Date: Tue, 18 Mar 2014 18:16:02 +0100
Message-ID: <1395162964-5916-4-git-send-email-t.figa@samsung.com>
References: <1395162964-5916-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:40553 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756657AbaCRRQZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Mar 2014 13:16:25 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N2N00KCQ6N3HE90@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 18 Mar 2014 17:16:15 +0000 (GMT)
In-reply-to: <1395162964-5916-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linaro-kernel@lists.linaro.org, Mark Brown <broonie@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Tomasz Figa <t.figa@samsung.com>

Recent Samsung header clean-up series did heavy reorganization of
various Samsung-specific headers, unfortunately causing a conflict with
Samsung PM consolidation series part 2 - multiplatform) and resulting
with a merge error that caused a build failure, due to a missing header
being included.

This patch fixes this by removing incorrect header inclusion.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
---
 arch/arm/plat-samsung/pm-debug.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/plat-samsung/pm-debug.c b/arch/arm/plat-samsung/pm-debug.c
index 602998b..88bb4cf 100644
--- a/arch/arm/plat-samsung/pm-debug.c
+++ b/arch/arm/plat-samsung/pm-debug.c
@@ -20,7 +20,6 @@
 
 #include <plat/cpu.h>
 #include <plat/pm-common.h>
-#include <plat/regs-serial.h>
 
 #ifdef CONFIG_SAMSUNG_ATAGS
 #include <mach/pm-core.h>
-- 
1.9.0
