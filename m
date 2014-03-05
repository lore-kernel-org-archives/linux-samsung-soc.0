From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH 1/2] ARM: dts: Disable MDMA1 node for Arndale-octa board
Date: Wed,  5 Mar 2014 13:39:06 +0530
Message-ID: <1394006947-26126-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f171.google.com ([209.85.192.171]:52014 "EHLO
	mail-pd0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751441AbaCEIPC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 5 Mar 2014 03:15:02 -0500
Received: by mail-pd0-f171.google.com with SMTP id r10so740026pdi.16
        for <linux-samsung-soc@vger.kernel.org>; Wed, 05 Mar 2014 00:15:01 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com

MDMA1 can support both secure and non-secure AXI transactions. When this
is enabled in the kernel for boards that run in secure mode, we get
imprecise external aborts causing the kernel to oops.

Unhandled fault: imprecise external abort (0x1406) at 0x00000000
Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000007

Suggested-by: Javi Merino <javi.merino@arm.com>
Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 arch/arm/boot/dts/exynos5420-arndale-octa.dts |   12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420-arndale-octa.dts b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
index f509e8f..810ec73 100644
--- a/arch/arm/boot/dts/exynos5420-arndale-octa.dts
+++ b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
@@ -361,4 +361,16 @@
 			gpio-key,wakeup;
 		};
 	};
+
+	amba {
+		mdma1: mdma@11C10000 {
+			/*
+			 * MDMA1 can support both secure and non-secure
+			 * AXI transactions. When this is enabled in the kernel
+			 * for boards that run in secure mode, we are getting
+			 * imprecise external aborts causing the kernel to oops.
+			 */
+			status = "disabled";
+		};
+	};
 };
-- 
1.7.9.5
