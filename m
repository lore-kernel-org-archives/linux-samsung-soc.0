From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v3 08/12] ARM: dts: exynos4: add MIPI DSI Master node
Date: Fri, 28 Mar 2014 12:52:43 +0100
Message-ID: <1396007567-4015-9-git-send-email-a.hajda@samsung.com>
References: <1396007567-4015-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:62417 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752103AbaC1Lxh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 28 Mar 2014 07:53:37 -0400
In-reply-to: <1396007567-4015-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <a.hajda@samsung.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Sean Paul <seanpaul@chromium.org>, Inki Dae <inki.dae@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>

This is a common part of DSI node for all Exynos4 boards.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 arch/arm/boot/dts/exynos4.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index 08452e1..3d14cdb 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -104,6 +104,20 @@
 		reg = <0x10010000 0x400>;
 	};
 
+	dsi_0: dsi@11C80000 {
+		compatible = "samsung,exynos4210-mipi-dsi";
+		reg = <0x11C80000 0x10000>;
+		interrupts = <0 79 0>;
+		samsung,power-domain = <&pd_lcd0>;
+		phys = <&mipi_phy 1>;
+		phy-names = "dsim";
+		clocks = <&clock 286>, <&clock 143>;
+		clock-names = "bus_clk", "pll_clk";
+		status = "disabled";
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+
 	camera {
 		compatible = "samsung,fimc", "simple-bus";
 		status = "disabled";
-- 
1.8.3.2
