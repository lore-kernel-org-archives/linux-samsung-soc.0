From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 2/3] of/documentation: Update G2D documentation
Date: Fri,  5 Jul 2013 14:12:28 +0530
Message-ID: <1373013749-14530-2-git-send-email-sachin.kamat@linaro.org>
References: <1373013749-14530-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f176.google.com ([209.85.192.176]:35754 "EHLO
	mail-pd0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757167Ab3GEI6D (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 5 Jul 2013 04:58:03 -0400
Received: by mail-pd0-f176.google.com with SMTP id t12so1812970pdi.21
        for <linux-samsung-soc@vger.kernel.org>; Fri, 05 Jul 2013 01:58:02 -0700 (PDT)
In-Reply-To: <1373013749-14530-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org, mturquette@linaro.org, inki.dae@samsung.com

Exynos5250 G2D IP requires only the gate clock. Update the
binding documentation accordingly.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
Cc: Inki Dae <inki.dae@samsung.com>
---
 .../devicetree/bindings/gpu/samsung-g2d.txt        |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpu/samsung-g2d.txt b/Documentation/devicetree/bindings/gpu/samsung-g2d.txt
index 3f454ff..60ca631 100644
--- a/Documentation/devicetree/bindings/gpu/samsung-g2d.txt
+++ b/Documentation/devicetree/bindings/gpu/samsung-g2d.txt
@@ -12,7 +12,9 @@ Required properties:
   - interrupts : G2D interrupt number to the CPU.
   - clocks : from common clock binding: handle to G2D clocks.
   - clock-names : from common clock binding: must contain "sclk_fimg2d" and
-		  "fimg2d", corresponding to entries in the clocks property.
+		  "fimg2d" for S5PV210 & Exynos4 based SoCs and "fimg2d" for
+		  Exynos5250 SoC, corresponding to entries in the clocks
+		  property.
 
 Example:
 	g2d@12800000 {
-- 
1.7.9.5
