From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH v2 2/2] ARM: dts: Update MFC documentation for clock entries
Date: Mon,  8 Apr 2013 11:44:17 +0530
Message-ID: <1365401657-5428-2-git-send-email-sachin.kamat@linaro.org>
References: <1365401657-5428-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f50.google.com ([209.85.220.50]:42403 "EHLO
	mail-pa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934769Ab3DHG0Y (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Apr 2013 02:26:24 -0400
Received: by mail-pa0-f50.google.com with SMTP id bg2so3119963pad.37
        for <linux-samsung-soc@vger.kernel.org>; Sun, 07 Apr 2013 23:26:23 -0700 (PDT)
In-Reply-To: <1365401657-5428-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, rob.herring@calxeda.com, s.nawrocki@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

Added clock entry definitions to MFC bindings document.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
Changes since v1:
Updated "clock-names" description as suggested by
Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 .../devicetree/bindings/media/s5p-mfc.txt          |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/s5p-mfc.txt b/Documentation/devicetree/bindings/media/s5p-mfc.txt
index bf0182d..df37b02 100644
--- a/Documentation/devicetree/bindings/media/s5p-mfc.txt
+++ b/Documentation/devicetree/bindings/media/s5p-mfc.txt
@@ -15,6 +15,9 @@ Required properties:
 	  mapped region.
 
   - interrupts : MFC interrupt number to the CPU.
+  - clocks : from common clock binding: handle to mfc clocks.
+  - clock-names : from common clock binding: must contain "sclk_mfc" and "mfc",
+		  corresponding to entries in the clocks property.
 
   - samsung,mfc-r : Base address of the first memory bank used by MFC
 		    for DMA contiguous memory allocation and its size.
@@ -34,6 +37,8 @@ mfc: codec@13400000 {
 	reg = <0x13400000 0x10000>;
 	interrupts = <0 94 0>;
 	samsung,power-domain = <&pd_mfc>;
+	clocks = <&clock 170>, <&clock 273>;
+	clock-names = "sclk_mfc", "mfc";
 };
 
 Board specific DT entry:
-- 
1.7.9.5
