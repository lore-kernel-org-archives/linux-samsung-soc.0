From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [RFC PATCH v2 17/21] ARM: dts: exynos5250: add DSI node
Date: Wed, 12 Feb 2014 12:31:24 +0100
Message-ID: <1392204688-4591-18-git-send-email-a.hajda@samsung.com>
References: <1392204688-4591-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:19387 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751056AbaBLLcn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Feb 2014 06:32:43 -0500
In-reply-to: <1392204688-4591-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <a.hajda@samsung.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Sean Paul <seanpaul@chromium.org>, Marek Szyprowski <m.szyprowski@samsung.com>

The patch adds common part of DSI node for Exynos5250 platforms.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 arch/arm/boot/dts/exynos5250.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 0935dca..bbe8ef4 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -656,6 +656,20 @@
 		phy-names = "dp";
 	};
 
+	dsi_0: dsi@14500000 {
+		compatible = "samsung,exynos4210-mipi-dsi";
+		reg = <0x14500000 0x10000>;
+		interrupts = <0 82 0>;
+		samsung,power-domain = <&pd_disp>;
+		phys = <&mipi_phy 3>;
+		phy-names = "dsim";
+		clocks = <&clock 341>, <&clock 134>;
+		clock-names = "bus_clk", "pll_clk";
+		status = "disabled";
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+
 	fimd@14400000 {
 		clocks = <&clock 133>, <&clock 339>;
 		clock-names = "sclk_fimd", "fimd";
-- 
1.8.3.2
