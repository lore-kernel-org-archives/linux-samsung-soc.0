From: Amit Daniel Kachhap <amit.kachhap@linaro.org>
Subject: [PATCH V2 2/5] ARM: exynos4: remove useless churn in sleep.S
Date: Fri, 11 Nov 2011 11:59:34 +0530
Message-ID: <1320992977-11589-3-git-send-email-amit.kachhap@linaro.org>
References: <1320992977-11589-1-git-send-email-amit.kachhap@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:43753 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753852Ab1KKGaR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 11 Nov 2011 01:30:17 -0500
Received: by mail-gx0-f174.google.com with SMTP id b2so3856488ggn.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Nov 2011 22:30:16 -0800 (PST)
In-Reply-To: <1320992977-11589-1-git-send-email-amit.kachhap@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, amit.kachhap@linaro.org, patches@linaro.org

This patch cleans up sleep code in preparation for L2 resume code
and hotplug functions

Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Signed-off-by: Amit Daniel Kachhap <amit.kachhap@linaro.org>
---
 arch/arm/plat-s5p/sleep.S |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/arch/arm/plat-s5p/sleep.S b/arch/arm/plat-s5p/sleep.S
index 0fd591b..c371ba2 100644
--- a/arch/arm/plat-s5p/sleep.S
+++ b/arch/arm/plat-s5p/sleep.S
@@ -23,7 +23,6 @@
 */
 
 #include <linux/linkage.h>
-#include <asm/assembler.h>
 
 	.text
 
@@ -44,6 +43,9 @@
 	 * other way of restoring the stack pointer after sleep, and we
 	 * must not write to the code segment (code is read-only)
 	 */
+	.align
+	.data
 
 ENTRY(s3c_cpu_resume)
 	b	cpu_resume
+ENDPROC(s3c_cpu_resume)
-- 
1.7.1
