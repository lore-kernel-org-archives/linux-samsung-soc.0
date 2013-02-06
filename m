From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 7/7] ARM: dts: Add Samsung G2D DT bindings documentation
Date: Wed,  6 Feb 2013 17:21:17 +0530
Message-ID: <1360151477-26460-8-git-send-email-sachin.kamat@linaro.org>
References: <1360151477-26460-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-da0-f52.google.com ([209.85.210.52]:51781 "EHLO
	mail-da0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750782Ab3BFMBO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Feb 2013 07:01:14 -0500
Received: by mail-da0-f52.google.com with SMTP id f10so606195dak.11
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Feb 2013 04:01:13 -0800 (PST)
In-Reply-To: <1360151477-26460-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, s.nawrocki@samsung.com, inki.dae@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

Added documentaion about G2D bindings.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 .../devicetree/bindings/gpu/samsung-g2d.txt        |   30 ++++++++++++++++++++
 1 files changed, 30 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpu/samsung-g2d.txt

diff --git a/Documentation/devicetree/bindings/gpu/samsung-g2d.txt b/Documentation/devicetree/bindings/gpu/samsung-g2d.txt
new file mode 100644
index 0000000..838b26b
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpu/samsung-g2d.txt
@@ -0,0 +1,30 @@
+* Samsung 2D Graphics Accelerator
+
+Samsung FIMG2D is a 2D graphics accelerator which supports Bit Block Transfer.
+We set the drawing-context registers for configuring the rendering parameters
+and then start rendering.
+The G2D has V4L2 as well as DRM framework based driver support.
+
+Required properties:
+  - compatible : value should be one among the following
+	(a) "samsung,s5pv210-g2d" for G2D IP present in S5PV210 & Exynos4210 SoC
+	(b) "samsung,exynos4212-g2d" for G2D IP present in Exynos4x12 SoCs
+	(b) "samsung,exynos5250-g2d" for G2D IP present in Exynos5250 SoC
+
+  - reg : Physical base address of the IP registers and length of memory
+	  mapped region.
+
+  - interrupts : G2D interrupt number to the CPU.
+
+Optional properties:
+  - samsung,power-domain : power-domain property defined with a phandle
+			   to respective power domain.
+
+Example:
+	g2d@12800000 {
+		compatible = "samsung,s5pv210-g2d";
+		reg = <0x12800000 0x1000>;
+		interrupts = <0 89 0>;
+		samsung,power-domain = <&pd_lcd0>;
+		status = "disabled";
+	};
-- 
1.7.4.1
