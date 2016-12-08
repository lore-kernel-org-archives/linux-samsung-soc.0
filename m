From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH v2 3/5] arm64: dts: exynos5433: Add PPMU dt node
Date: Thu, 08 Dec 2016 13:58:09 +0900
Message-ID: <1481173091-9728-4-git-send-email-cw00.choi@samsung.com>
References: <1481173091-9728-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1481173091-9728-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: krzk@kernel.org, javier@osg.samsung.com, kgene@kernel.org, robh+dt@kernel.org, s.nawrocki@samsung.com, tomasz.figa@gmail.com
Cc: cw00.choi@samsung.com, myungjoo.ham@samsung.com, kyungmin.park@samsung.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds PPMU (Platform Performance Monitoring Unit) Device-tree node
to measure the utilization of each IP in Exynos SoC.

- PPMU_D{0|1}_CPU are used to measure the utilization of MIF (Memory Interface)
  block with VDD_MIF power source.
- PPMU_D{0|1}_GENERAL are used to measure the utilization of INT(Internal)
  block with VDD_INT power source.

Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index 64226d5ae471..8c4ee84d5232 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -599,6 +599,30 @@
 			clock-names = "fin_pll", "mct";
 		};
 
+		ppmu_d0_cpu: ppmu@10480000 {
+			compatible = "samsung,exynos-ppmu-v2";
+			reg = <0x10480000 0x2000>;
+			status = "disabled";
+		};
+
+		ppmu_d0_general: ppmu@10490000 {
+			compatible = "samsung,exynos-ppmu-v2";
+			reg = <0x10490000 0x2000>;
+			status = "disabled";
+		};
+
+		ppmu_d1_cpu: ppmu@104b0000 {
+			compatible = "samsung,exynos-ppmu-v2";
+			reg = <0x104b0000 0x2000>;
+			status = "disabled";
+		};
+
+		ppmu_d1_general: ppmu@104c0000 {
+			compatible = "samsung,exynos-ppmu-v2";
+			reg = <0x104c0000 0x2000>;
+			status = "disabled";
+		};
+
 		pinctrl_alive: pinctrl@10580000 {
 			compatible = "samsung,exynos5433-pinctrl";
 			reg = <0x10580000 0x1a20>, <0x11090000 0x100>;
-- 
1.9.1
