From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH RFC 3/8] dt-bindings: exynos: Add ASV tables binding
 documentation
Date: Thu, 04 Apr 2019 19:17:30 +0200
Message-ID: <20190404171735.12815-4-s.nawrocki@samsung.com>
References: <20190404171735.12815-1-s.nawrocki@samsung.com>
        <CGME20190404172234epcas1p37667ec0996000aff9297f13639908dfc@epcas1p3.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20190404171735.12815-1-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: krzk@kernel.org
Cc: kgene@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, cw00.choi@samsung.com, myungjoo.ham@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, pankaj.dubey@samsung.com, b.zolnierkie@samsung.com, m.szyprowski@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds documentation of the Exynos ASV (Adaptive Voltage Supply)
tables DT binding.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 .../devicetree/bindings/arm/samsung/asv.txt   | 76 +++++++++++++++++++
 1 file changed, 76 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/samsung/asv.txt

diff --git a/Documentation/devicetree/bindings/arm/samsung/asv.txt b/Documentation/devicetree/bindings/arm/samsung/asv.txt
new file mode 100644
index 000000000000..0db907263a91
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/samsung/asv.txt
@@ -0,0 +1,76 @@
+Exynos Adaptive Supply Voltage (ASV) tables
+-------------------------------------------
+
+The Adaptive Supply Voltage (ASV) on Exynos SoCs is a technique of adjusting
+operating points, i.e. the power supply voltage for given clock frequency,
+in order to better match actual capabilities of the hardware and optimize power
+consumption.  This applies to subsystem of the SoC like: CPU clusters, GPU,
+the memory controller or camera ISP.  During production process the SoC chip
+is assigned to one of several bins (ASV groups) and the group information
+is encoded in the SoC CHIPID block registers and/or OTP memory. This information
+is then used by the OS to select more finely matching operating points for
+devices.
+
+This binding describes data used to create actual operating points for the
+subsystems.  The data is in form of two-dimensional arrays of M x N cells,
+where the first column contains frequency values and subsequent columns
+associated with ASV groups contain corresponding voltage values.
+
+    frequency group0 group1 ...  group(N-1)
+       0        1      2    ...  N-1
+0    <f0      V00    V01    ...  V0n>,
+1    <f1      V10    V11    ...  V1n>,
+...  <        ...                 >,
+M-1  <fm      Vm0    Vm1    ...  Vmn>,
+
+In simplest form the actual operating points set may be created by selecting
+whole column for the voltage values, however also parts of multiple columns may
+be combined by the OS to create series of voltage values corresponding to
+frequencies in column 0.
+
+The ASV tables are defined as sub-nodes of parent node containing all tables.
+
+* Main node
+
+Required properties:
+ - compatible : should at least contain "samsung,exynos-asv-v1".
+
+* Table node
+
+Required properties:
+ - samsung,asv-table-size : specifies dimension of the table, the first cell is
+   total number of rows (M), the second cell is total number of columns (N),
+ - samsung,asv-table-id : ID of the table, lower 8-bits is an index (revision)
+   of the table, remaining bits (31...8) specify a subsystem the table applies
+   to:  0 - ARM/Eagle (big) CPU cluster, 1 - KFC (little) CPU cluster,
+ - samsung,asv-data : the ASV table data as described earlier in this document.
+   First cell is frequency value, then N-1 voltage values. Such sequence
+   is repeated M times.
+
+Optional properties:
+ - samsung,asv-common-data : a list of frequency, voltage pairs used to describe
+   operating points where voltage is same for all N-1 ASV groups. This allows
+   to avoid data duplication is the "samsung,asv-data" property.
+
+Example:
+
+&chipid {
+	asv {
+		compatible = "samsung,exynos-asv-v1";
+		asv-table-0 {
+			samsung,asv-table-size = <8 6>;
+			samsung,asv-table-id = <0x0>;
+			samsung,asv-data =
+				/*     ASV0    ASV1    ASV2    ASV3    ASV4  */
+				<1700 1187500 1175000 1162500 1150000 1137500 >,
+				<1500 1125000 1112500 1100000 1087500 1075000 >,
+				<1300 1075000 1062500 1050000 1037500 1025000 >,
+				<1000  987500  975000  962500  950000  937500 >,
+				< 900  950000  937500  925000  925000  925000 >,
+				< 700  925000  912500  912500  912500  912500 >;
+						     /* ASV0...15 */
+			samsung,asv-common-data = <600 900000>,
+						  <500 900000>;
+		};
+	};
+};
-- 
2.17.1
