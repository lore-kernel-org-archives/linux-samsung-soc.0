From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 2/2] arm64: dts: exynos: Fix typo in MSCL clock controller unit address
Date: Wed, 20 Dec 2017 20:27:02 +0100
Message-ID: <20171220192702.32515-2-krzk@kernel.org>
References: <20171220192702.32515-1-krzk@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:53956 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932469AbdLTT1d (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 20 Dec 2017 14:27:33 -0500
In-Reply-To: <20171220192702.32515-1-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Fix typo in unit address of MSCL clock controller (the reg entry is
correct).

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index 0ba5df825eff..3e8311c60d1b 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -468,7 +468,7 @@
 			clocks = <&xxti>, <&cmu_mif CLK_SCLK_BUS_PLL_ATLAS>;
 		};
 
-		cmu_mscl: clock-controller@105d0000 {
+		cmu_mscl: clock-controller@150d0000 {
 			compatible = "samsung,exynos5433-cmu-mscl";
 			reg = <0x150d0000 0x1000>;
 			#clock-cells = <1>;
-- 
2.11.0
