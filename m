From: Jaechul Lee <jcsing.lee@samsung.com>
Subject: [PATCH v6 3/3] arm64: dts: exynos: Add tm2 touchkey node
Date: Mon, 09 Jan 2017 16:22:15 +0900
Message-ID: <1483946535-4703-4-git-send-email-jcsing.lee@samsung.com>
References: <1483946535-4703-1-git-send-email-jcsing.lee@samsung.com>
 <CGME20170109072219epcas5p2b1dd8d38c4ae6bd5727e68c4ecaf7f24@epcas5p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:55267 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756446AbdAIHWW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 9 Jan 2017 02:22:22 -0500
In-reply-to: <1483946535-4703-1-git-send-email-jcsing.lee@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>
Cc: Jaechul Lee <jcsing.lee@samsung.com>, Andi Shyti <andi.shyti@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, beomho.seo@samsung.com, galaxyra@gmail.com, linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org

Add DT node support for TM2 touchkey device.

Signed-off-by: Beomho Seo <beomho.seo@samsung.com>
Signed-off-by: Jaechul Lee <jcsing.lee@samsung.com>
Signed-off-by: Andi Shyti <andi.shyti@samsung.com>
Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos5433-tm2.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
index 2449266..ddba2f8 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
@@ -18,6 +18,19 @@
 	compatible = "samsung,tm2", "samsung,exynos5433";
 };
 
+&hsi2c_9 {
+	status = "okay";
+
+	touchkey@20 {
+		compatible = "cypress,tm2-touchkey";
+		reg = <0x20>;
+		interrupt-parent = <&gpa3>;
+		interrupts = <2 IRQ_TYPE_EDGE_FALLING>;
+		vcc-supply = <&ldo32_reg>;
+		vdd-supply = <&ldo33_reg>;
+	};
+};
+
 &ldo31_reg {
 	regulator-name = "TSP_VDD_1.85V_AP";
 	regulator-min-microvolt = <1850000>;
-- 
2.7.4
