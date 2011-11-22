From: Amit Daniel Kachhap <amit.kachhap@linaro.org>
Subject: [PATCH V3 2/6] ARM: s5p: remove useless churn in sleep.S
Date: Tue, 22 Nov 2011 15:05:28 +0530
Message-ID: <1321954532-18724-3-git-send-email-amit.kachhap@linaro.org>
References: <1321954532-18724-1-git-send-email-amit.kachhap@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:64598 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752590Ab1KVJiC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 Nov 2011 04:38:02 -0500
Received: by iage36 with SMTP id e36so8467875iag.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Nov 2011 01:38:01 -0800 (PST)
In-Reply-To: <1321954532-18724-1-git-send-email-amit.kachhap@linaro.org>
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
