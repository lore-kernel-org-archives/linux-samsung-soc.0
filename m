From: amit.kachhap@linaro.org
Subject: [PATCH 2/4] ARM: exynos4: remove useless churn in sleep.S
Date: Fri,  4 Nov 2011 13:03:46 -0400
Message-ID: <1320426228-21746-3-git-send-email-amit.kachhap@linaro.org>
References: <1320426228-21746-1-git-send-email-amit.kachhap@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:35009 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933016Ab1KDREG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Nov 2011 13:04:06 -0400
Received: by mail-gx0-f174.google.com with SMTP id b2so2692694ggn.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Nov 2011 10:04:06 -0700 (PDT)
In-Reply-To: <1320426228-21746-1-git-send-email-amit.kachhap@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linaro-dev@lists.linaro.org, linux-arm-kernel@lists.infradead.org, patches@linaro.org, kgene.kim@samsung.com, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>

From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>

This patch cleans up sleep code in preparation for L2 resume code
and hotplug functions

Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
---
 arch/arm/mach-exynos4/sleep.S |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-exynos4/sleep.S b/arch/arm/mach-exynos4/sleep.S
index 0984078..c19527b 100644
--- a/arch/arm/mach-exynos4/sleep.S
+++ b/arch/arm/mach-exynos4/sleep.S
@@ -27,8 +27,6 @@
 */
 
 #include <linux/linkage.h>
-#include <asm/assembler.h>
-#include <asm/memory.h>
 
 	.text
 
@@ -52,3 +50,4 @@
 
 ENTRY(s3c_cpu_resume)
 	b	cpu_resume
+ENDPROC(s3c_cpu_resume)
-- 
1.7.5.4
