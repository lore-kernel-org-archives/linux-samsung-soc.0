From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH V2 4/4] ARM: dts: exynos5420: add audio clock controller
Date: Fri, 16 Aug 2013 13:19:38 +0530
Message-ID: <1376639378-20707-5-git-send-email-padma.v@samsung.com>
References: <1376639378-20707-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:29320 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753068Ab3HPHsY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 16 Aug 2013 03:48:24 -0400
In-reply-to: <1376639378-20707-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, padma.v@samsung.com, padma.kvr@gmail.com
Cc: broonie@kernel.org, kgene.kim@samsung.com, abrestic@chromium.org, mturquette@linaro.org

From: Andrew Bresticker <abrestic@chromium.org>

This adds device-tree bindings for the audio subsystem clock controller
on Exynos 5420.

Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
Reviewed-by: Simon Glass <sjg@chromium.org>
Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
---
 arch/arm/boot/dts/exynos5420.dtsi |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 334f7b7..dde4cc2 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -15,6 +15,9 @@
 
 #include "exynos5.dtsi"
 #include "exynos5420-pinctrl.dtsi"
+
+#include <dt-bindings/clk/exynos-audss-clk.h>
+
 / {
 	compatible = "samsung,exynos5420";
 
@@ -65,6 +68,12 @@
 		#clock-cells = <1>;
 	};
 
+	clock_audss: audss-clock-controller@3810000 {
+		compatible = "samsung,exynos5420-audss-clock";
+		reg = <0x03810000 0x0C>;
+		#clock-cells = <1>;
+	};
+
 	mct@101C0000 {
 		compatible = "samsung,exynos4210-mct";
 		reg = <0x101C0000 0x800>;
-- 
1.7.4.4
