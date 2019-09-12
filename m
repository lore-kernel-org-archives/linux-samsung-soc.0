From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] arm64: dts: exynos: Revert
 "Remove unneeded address space mapping for soc node"
Date: Thu, 12 Sep 2019 09:36:02 +0200
Message-ID: <20190912073602.22829-1-m.szyprowski@samsung.com>
References: <CGME20190912073608eucas1p1c2da86b1f85244a507b0f2ce96390ad3@eucas1p1.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, stable@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Commit ef72171b3621 ("arm64: dts: exynos: Remove unneeded address space
mapping for soc node") changed the address and size cells in root node from
2 to 1, but /memory nodes for the affected boards were not updated. This
went unnoticed on Exynos5433-based TM2(e) boards, because they use u-boot,
which updates /memory node to the correct values. On the other hand, the
mentioned commit broke boot on Exynos7-based Espresso board, which
bootloader doesn't touch /memory node at all.

This patch reverts commit ef72171b3621, so Exynos5433 and Exynos7 SoCs
again matches other ARM64 platforms with 64bit mappings in root node.

Reported-by: Alim Akhtar <alim.akhtar@samsung.com>
Fixes: ef72171b3621 ("arm64: dts: exynos: Remove unneeded address space mapping for soc node")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: <stable@vger.kernel.org>
Tested-by: Alim Akhtar <alim.akhtar@samsung.com>
---
A few more comments:

1. I've added 'tested-by' tag from Alim, as his original report pointed
that reverting the offending commit fixes the boot issue.

2. This patch applies down to v4.18.

3. For v5.3 release, two patches:
   - "arm64: dts: exynos: Move GPU under /soc node for  Exynos5433"
   - "arm64: dts: exynos: Move GPU under /soc node for Exynos7"
   has to be applied first to ensure that GPU node will have correct 'reg'
   property (nodes under /soc still use 32bit mappings). I'm not sure if
   this can be expressed somehow in stable porting tags.

Best regards
Marek Szyprowski
Samsung R&D Institute Poland
---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 6 +++---
 arch/arm64/boot/dts/exynos/exynos7.dtsi    | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index 239bf44d174b..f69530730219 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -18,8 +18,8 @@
 
 / {
 	compatible = "samsung,exynos5433";
-	#address-cells = <1>;
-	#size-cells = <1>;
+	#address-cells = <2>;
+	#size-cells = <2>;
 
 	interrupt-parent = <&gic>;
 
@@ -260,7 +260,7 @@
 		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
-		ranges;
+		ranges = <0x0 0x0 0x0 0x18000000>;
 
 		chipid@10000000 {
 			compatible = "samsung,exynos4210-chipid";
diff --git a/arch/arm64/boot/dts/exynos/exynos7.dtsi b/arch/arm64/boot/dts/exynos/exynos7.dtsi
index f09800f355db..3a00ef0a17ff 100644
--- a/arch/arm64/boot/dts/exynos/exynos7.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7.dtsi
@@ -12,8 +12,8 @@
 / {
 	compatible = "samsung,exynos7";
 	interrupt-parent = <&gic>;
-	#address-cells = <1>;
-	#size-cells = <1>;
+	#address-cells = <2>;
+	#size-cells = <2>;
 
 	aliases {
 		pinctrl0 = &pinctrl_alive;
@@ -87,7 +87,7 @@
 		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
-		ranges;
+		ranges = <0 0 0 0x18000000>;
 
 		chipid@10000000 {
 			compatible = "samsung,exynos4210-chipid";
-- 
2.17.1
