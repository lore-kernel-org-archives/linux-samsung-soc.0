From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 7/7] ARM: dts: Add Samsung G2D DT bindings documentation
Date: Mon, 18 Feb 2013 10:32:13 +0530
Message-ID: <1361163733-4338-8-git-send-email-sachin.kamat@linaro.org>
References: <1361163733-4338-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f41.google.com ([209.85.220.41]:46326 "EHLO
	mail-pa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754668Ab3BRFMe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Feb 2013 00:12:34 -0500
Received: by mail-pa0-f41.google.com with SMTP id fb11so2611057pad.14
        for <linux-samsung-soc@vger.kernel.org>; Sun, 17 Feb 2013 21:12:34 -0800 (PST)
In-Reply-To: <1361163733-4338-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, s.nawrocki@samsung.com, patches@linaro.org, sachin.kamat@linaro.org, Tomasz Figa <tomasz.figa@gmail.com>, Inki Dae <inki.dae@samsung.com>

Added documentaion about G2D bindings.

Cc: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Inki Dae <inki.dae@samsung.com>
Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 .../devicetree/bindings/gpu/samsung-g2d.txt        |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpu/samsung-g2d.txt

diff --git a/Documentation/devicetree/bindings/gpu/samsung-g2d.txt b/Documentation/devicetree/bindings/gpu/samsung-g2d.txt
new file mode 100644
index 0000000..2b14a94
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpu/samsung-g2d.txt
@@ -0,0 +1,20 @@
+* Samsung 2D Graphics Accelerator
+
+Required properties:
+  - compatible : value should be one among the following:
+	(a) "samsung,s5pv210-g2d" for G2D IP present in S5PV210 & Exynos4210 SoC
+	(b) "samsung,exynos4212-g2d" for G2D IP present in Exynos4x12 SoCs
+	(c) "samsung,exynos5250-g2d" for G2D IP present in Exynos5250 SoC
+
+  - reg : Physical base address of the IP registers and length of memory
+	  mapped region.
+
+  - interrupts : G2D interrupt number to the CPU.
+
+Example:
+	g2d@12800000 {
+		compatible = "samsung,s5pv210-g2d";
+		reg = <0x12800000 0x1000>;
+		interrupts = <0 89 0>;
+		status = "disabled";
+	};
-- 
1.7.4.1
