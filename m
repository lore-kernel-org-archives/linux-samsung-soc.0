From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 2/2] ARM: dts: Update MFC documentation for clock entries
Date: Thu,  4 Apr 2013 11:56:55 +0530
Message-ID: <1365056815-28000-2-git-send-email-sachin.kamat@linaro.org>
References: <1365056815-28000-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f178.google.com ([209.85.192.178]:33847 "EHLO
	mail-pd0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1761003Ab3DDGin (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 4 Apr 2013 02:38:43 -0400
Received: by mail-pd0-f178.google.com with SMTP id w11so1264811pde.9
        for <linux-samsung-soc@vger.kernel.org>; Wed, 03 Apr 2013 23:38:42 -0700 (PDT)
In-Reply-To: <1365056815-28000-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, rob.herring@calxeda.com, sachin.kamat@linaro.org, patches@linaro.org

Added clock entry definitions to MFC bindings document.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 .../devicetree/bindings/media/s5p-mfc.txt          |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/s5p-mfc.txt b/Documentation/devicetree/bindings/media/s5p-mfc.txt
index bf0182d..d7b991a 100644
--- a/Documentation/devicetree/bindings/media/s5p-mfc.txt
+++ b/Documentation/devicetree/bindings/media/s5p-mfc.txt
@@ -15,6 +15,9 @@ Required properties:
 	  mapped region.
 
   - interrupts : MFC interrupt number to the CPU.
+  - clocks: from common clock binding: handle to mfc clocks.
+  - clock-names: from common clock binding: Shall be "sclk_mfc" and "mfc"
+		 for "samsung,mfc-v5".
 
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
