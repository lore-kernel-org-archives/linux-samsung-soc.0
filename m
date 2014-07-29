From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH 1/3] ARM: dts: Add TMU dt node to monitor the temperature for
 Exynos3250
Date: Tue, 29 Jul 2014 11:17:10 +0900
Message-ID: <1406600232-31033-2-git-send-email-cw00.choi@samsung.com>
References: <1406600232-31033-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1406600232-31033-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: kgene.kim@samsung.com
Cc: t.figa@samsung.com, ben-linux@fluff.org, linux@arm.linux.org.uk, kyungmin.park@samsung.com, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This patch add TMU (Thermal Management Unit) dt node to monitor the high
temperature for Exynos3250.

Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
This patch has a dependency on following patch [1] which supporting the TMU
of Exynos3250:
 [1] https://git.kernel.org/cgit/linux/kernel/git/rzhang/linux.git/commit/?h=next&id=1fe56dc16a3dab400206443f70ae158c8f595c42

Changes from v1:
- Remove duplicate 'interrupt-parent' property.

 arch/arm/boot/dts/exynos3250.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
index 77a06df..41a260a 100644
--- a/arch/arm/boot/dts/exynos3250.dtsi
+++ b/arch/arm/boot/dts/exynos3250.dtsi
@@ -168,6 +168,15 @@
 			status = "disabled";
 		};
 
+		tmu: tmu@100C0000 {
+			compatible = "samsung,exynos3250-tmu";
+			reg = <0x100C0000 0x100>;
+			interrupts = <0 216 0>;
+			clocks = <&cmu CLK_TMU_APBIF>;
+			clock-names = "tmu_apbif";
+			status = "disabled";
+		};
+
 		gic: interrupt-controller@10481000 {
 			compatible = "arm,cortex-a15-gic";
 			#interrupt-cells = <3>;
-- 
1.8.0
