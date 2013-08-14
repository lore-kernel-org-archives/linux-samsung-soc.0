From: Arun Kumar K <arun.kk@samsung.com>
Subject: [PATCH v3 1/4] ARM: dts: Update clocks entry in MFC binding documentation
Date: Wed, 14 Aug 2013 17:11:34 +0530
Message-ID: <1376480497-17572-2-git-send-email-arun.kk@samsung.com>
References: <1376480497-17572-1-git-send-email-arun.kk@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f51.google.com ([209.85.220.51]:39135 "EHLO
	mail-pa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759911Ab3HNLl1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Aug 2013 07:41:27 -0400
In-Reply-To: <1376480497-17572-1-git-send-email-arun.kk@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: kgene.kim@samsung.com, k.debski@samsung.com, s.nawrocki@samsung.com, sachin.kamat@linaro.org, arun.kk@samsung.com

MFC driver is updated to use only one clock instead of
two. Correcting this in the binding documentation.

Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
---
 .../devicetree/bindings/media/s5p-mfc.txt          |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/s5p-mfc.txt b/Documentation/devicetree/bindings/media/s5p-mfc.txt
index df37b02..d75c3e5 100644
--- a/Documentation/devicetree/bindings/media/s5p-mfc.txt
+++ b/Documentation/devicetree/bindings/media/s5p-mfc.txt
@@ -15,9 +15,9 @@ Required properties:
 	  mapped region.
 
   - interrupts : MFC interrupt number to the CPU.
-  - clocks : from common clock binding: handle to mfc clocks.
-  - clock-names : from common clock binding: must contain "sclk_mfc" and "mfc",
-		  corresponding to entries in the clocks property.
+  - clocks : from common clock binding: handle to mfc clock.
+  - clock-names : from common clock binding: must contain "mfc",
+		  corresponding to entry in the clocks property.
 
   - samsung,mfc-r : Base address of the first memory bank used by MFC
 		    for DMA contiguous memory allocation and its size.
@@ -37,8 +37,8 @@ mfc: codec@13400000 {
 	reg = <0x13400000 0x10000>;
 	interrupts = <0 94 0>;
 	samsung,power-domain = <&pd_mfc>;
-	clocks = <&clock 170>, <&clock 273>;
-	clock-names = "sclk_mfc", "mfc";
+	clocks = <&clock 273>;
+	clock-names = "mfc";
 };
 
 Board specific DT entry:
-- 
1.7.9.5
