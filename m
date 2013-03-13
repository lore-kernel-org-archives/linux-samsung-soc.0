From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH] ARM: dts: add interrupt-names property to get interrupt resource by name
Date: Wed, 13 Mar 2013 16:56:20 +0530
Message-ID: <1363173980-11428-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f48.google.com ([209.85.160.48]:44094 "EHLO
	mail-pb0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754570Ab3CML0c (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 Mar 2013 07:26:32 -0400
Received: by mail-pb0-f48.google.com with SMTP id wy12so916059pbc.21
        for <linux-samsung-soc@vger.kernel.org>; Wed, 13 Mar 2013 04:26:32 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sylvester.nawrocki@gmail.com, devicetree-discuss@lists.ozlabs.org, inki.dae@samsung.com, linaro-kernel@lists.linaro.org, joshi@samsung.com, l.krishna@samsung.com

The FIMD driver expects the "vsync" interrupt to be mentioned as the 1st
parameter in the FIMD DT node. So to meet this expectation of the driver,
the FIMD DT node was forced to be made by keeping "vsync" as the 1st
parameter.

this resolves the above mentioned "hack" by introducing
"interrupt-names", so that FIMD driver can get the interrupt resource by
name as discussed at
http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg16211.html

patch is dependent on https://patchwork.kernel.org/patch/2184981/

Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
---
 arch/arm/boot/dts/exynos5250.dtsi |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 0ee4706..76c8911 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -588,6 +588,7 @@
 		compatible = "samsung,exynos5-fimd";
 		interrupt-parent = <&combiner>;
 		reg = <0x14400000 0x40000>;
-		interrupts = <18 5>, <18 4>, <18 6>;
+		interrupt-names = "fifo", "vsync", "lcd_sys";
+		interrupts = <18 4>, <18 5>, <18 6>;
 	};
 };
-- 
1.7.9.5
