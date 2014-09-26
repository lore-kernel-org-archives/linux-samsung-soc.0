From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: [PATCH] ARM: exynos: fix UART address selection for DEBUG_LL
Date: Fri, 26 Sep 2014 19:43:54 +0900
Message-ID: <1411728234-29705-1-git-send-email-jy0922.shim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:31775 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751418AbaIZKny (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 26 Sep 2014 06:43:54 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NCI000BV8H47ID0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 26 Sep 2014 19:43:52 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: cw00.choi@samsung.com, kgene.kim@samsung.com, m.szyprowski@samsung.com, linux-arm-kernel@lists.infradead.org, tomasz.figa@gmail.com

The exynos5 SoCs using A15+A7 can boot to A15 or A7. If it boots using
A7, it can't detect right UART physical address only the part number of
CP15. It's possible to solve as checking Cluster ID additionally.

Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
---
 arch/arm/include/debug/exynos.S | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm/include/debug/exynos.S b/arch/arm/include/debug/exynos.S
index b17fdb7..60bf3c2 100644
--- a/arch/arm/include/debug/exynos.S
+++ b/arch/arm/include/debug/exynos.S
@@ -24,7 +24,11 @@
 		mrc	p15, 0, \tmp, c0, c0, 0
 		and	\tmp, \tmp, #0xf0
 		teq	\tmp, #0xf0		@@ A15
-		ldreq	\rp, =EXYNOS5_PA_UART
+		beq	100f
+		mrc	p15, 0, \tmp, c0, c0, 5
+		and	\tmp, \tmp, #0xf00
+		teq	\tmp, #0x100		@@ A15 + A7 but boot to A7
+100:		ldreq	\rp, =EXYNOS5_PA_UART
 		movne	\rp, #EXYNOS4_PA_UART	@@ EXYNOS4
 		ldr	\rv, =S3C_VA_UART
 #if CONFIG_DEBUG_S3C_UART != 0
-- 
1.9.1
