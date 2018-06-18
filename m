From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 2/2] arm64: dts: exynos: Remove unneeded DSI and DECON address/size cells in Exynos5433
Date: Mon, 18 Jun 2018 19:42:16 +0200
Message-ID: <20180618174216.24801-2-krzk@kernel.org>
References: <20180618174216.24801-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180618174216.24801-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Kukjin Kim <kgene@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

The decon, decon_tv and dsi nodes have only one child port so
address/size mappings are not necessary.  This fixes DTC warnings like:

    Warning (graph_child_address): /soc/decon@13800000/ports:
        graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi |  6 +-----
 arch/arm64/boot/dts/exynos/exynos5433.dtsi            | 12 ++----------
 2 files changed, 3 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
index a1e3194b7483..0a15ee513f5c 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
@@ -321,11 +321,7 @@
 	status = "okay";
 
 	ports {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		port@0 {
-			reg = <0>;
+		port {
 			tv_to_hdmi: endpoint {
 				remote-endpoint = <&hdmi_to_tv>;
 			};
diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index 3a9b4c4b9c63..e4367fd39120 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -850,11 +850,7 @@
 			iommu-names = "m0", "m1";
 
 			ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				port@0 {
-					reg = <0>;
+				port {
 					decon_to_mic: endpoint {
 						remote-endpoint =
 							<&mic_to_decon>;
@@ -914,11 +910,7 @@
 			#size-cells = <0>;
 
 			ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				port@0 {
-					reg = <0>;
+				port {
 					dsi_to_mic: endpoint {
 						remote-endpoint = <&mic_to_dsi>;
 					};
-- 
2.14.1
