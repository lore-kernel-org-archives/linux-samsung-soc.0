From: Seungwon Jeon <tgih.jun@samsung.com>
Subject: [PATCH v2] ARM: dts: disable MDMA1 node for Exynos5420
Date: Tue, 22 Apr 2014 22:05:26 +0900
Message-ID: <000a01cf5e2b$87601760$96204620$%jun@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:28708 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755987AbaDVNF2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 Apr 2014 09:05:28 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N4F00MTIOD2W580@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 22 Apr 2014 22:05:26 +0900 (KST)
References: 
In-reply-to: 
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: 'Kukjin Kim' <kgene.kim@samsung.com>, 'Tushar Behera' <tushar.behera@linaro.org>, 'Javi Merino' <javi.merino@arm.com>

This change places MDMA1 in disabled node for Exynos5420.
If MDMA1 region is configured with secure mode, it makes
the boot failure with the following on smdk5420 board.
("Unhandled fault: imprecise external abort (0x1406) at 0x00000000")
Thus, arndale-octa board don't need to do the same thing anymore.

Signed-off-by: Seungwon Jeon <tgih.jun@samsung.com>
---
Note: This patch comes from "[PATCH] ARM: dts: disable MDMA1 node for smdk5420 board"

 arch/arm/boot/dts/exynos5420-arndale-octa.dts |   12 ------------
 arch/arm/boot/dts/exynos5420.dtsi             |    7 +++++++
 2 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5420-arndale-octa.dts b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
index 80a3bf4..896a2a6 100644
--- a/arch/arm/boot/dts/exynos5420-arndale-octa.dts
+++ b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
@@ -364,16 +364,4 @@
 			gpio-key,wakeup;
 		};
 	};
-
-	amba {
-		mdma1: mdma@11C10000 {
-			/*
-			 * MDMA1 can support both secure and non-secure
-			 * AXI transactions. When this is enabled in the kernel
-			 * for boards that run in secure mode, we are getting
-			 * imprecise external aborts causing the kernel to oops.
-			 */
-			status = "disabled";
-		};
-	};
 };
diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index c3a9a66..97cbcdd 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -336,6 +336,13 @@
 			#dma-cells = <1>;
 			#dma-channels = <8>;
 			#dma-requests = <1>;
+			/*
+			 * MDMA1 can support both secure and non-secure
+			 * AXI transactions. When this is enabled in the kernel
+			 * for boards that run in secure mode, we are getting
+			 * imprecise external aborts causing the kernel to oops.
+			 */
+			status = "disabled";
 		};
 	};
 
-- 
1.7.0.4
