From: Willy Wolff <willy.mh.wolff.ml@gmail.com>
Subject: [PATCH] ARM: dts: exynos: add CCI-400 PMU nodes support to
 Exynos542x SoCs
Date: Fri, 12 Apr 2019 18:25:46 +0100
Message-ID: <20190412172545.fkxnpnymhcw7xncc@macpro-scc.lancs.ac.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Add device tree entries for PMU of ARM CCI-400.

$ sudo ./perf stat -a -C 0 -e CCI_400/config=0xff,name=cycles/ sleep 1

 Performance counter stats for 'system wide':

       420,303,619      cycles

       1.019058775 seconds time elapsed

Tested on Odroid-xu3 and 4.

Signed-off-by: Willy Wolff <willy.mh.wolff.ml@gmail.com>
---
 arch/arm/boot/dts/exynos5420.dtsi | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index aaff15880761..be58650aca35 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -158,7 +158,7 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			reg = <0x10d20000 0x1000>;
-			ranges = <0x0 0x10d20000 0x6000>;
+			ranges = <0x0 0x10d20000 0x10000>;
 
 			cci_control0: slave-if@4000 {
 				compatible = "arm,cci-400-ctrl-if";
@@ -170,6 +170,16 @@
 				interface-type = "ace";
 				reg = <0x5000 0x1000>;
 			};
+
+			pmu@9000 {
+				compatible = "arm,cci-400-pmu,r0";
+				reg = <0x9000 0x5000>;
+				interrupts = <0 105 4>,
+					     <0 101 4>,
+					     <0 102 4>,
+					     <0 103 4>,
+					     <0 104 4>;
+			};
 		};
 
 		clock: clock-controller@10010000 {
-- 
2.11.0
