From: Inha Song <ideal.song@samsung.com>
Subject: [PATCH] ARM: dts: Add the source clock for CLKOUT register as xusbxti
Date: Tue, 24 Feb 2015 18:31:55 +0900
Message-ID: <1424770315-4725-1-git-send-email-ideal.song@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:10771 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752108AbbBXJcU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Feb 2015 04:32:20 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, kgene@kernel.org, linux@arm.linux.org.uk, galak@codeaurora.org, ijc+devicetree@hellion.org.uk, mark.rutland@arm.com, pawel.moll@arm.com, robh+dt@kernel.org, cw00.choi@samsung.com, Inha Song <ideal.song@samsung.com>

This patch add the CLKOUT register source clock as xusbxti in
PMU (Power Management Unit) dt node on Exynos3250.

Cc: Kukjin Kim <kgene@kernel.org>
Signed-off-by: Inha Song <ideal.song@samsung.com>
---
 arch/arm/boot/dts/exynos3250.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
index 277b48b..aa1eb8c 100644
--- a/arch/arm/boot/dts/exynos3250.dtsi
+++ b/arch/arm/boot/dts/exynos3250.dtsi
@@ -130,6 +130,9 @@
 		pmu_system_controller: system-controller@10020000 {
 			compatible = "samsung,exynos3250-pmu", "syscon";
 			reg = <0x10020000 0x4000>;
+			#clock-cells = <1>;
+			clock-names = "clkout9";
+			clocks = <&xusbxti>;
 		};
 
 		mipi_phy: video-phy@10020710 {
-- 
2.0.0.390.gcb682f8
