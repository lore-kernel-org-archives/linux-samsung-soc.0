From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: [PATCH v4 4/5] Documentation: devicetree: add PPMU events
 description
Date: Wed,  5 Jun 2019 11:12:35 +0200
Message-ID: <20190605091236.24263-5-l.luba@partner.samsung.com>
References: <20190605091236.24263-1-l.luba@partner.samsung.com>
        <CGME20190605091304eucas1p21e0717cafa17a14de569f1773cc7abe5@eucas1p2.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190605091236.24263-1-l.luba@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: b.zolnierkie@samsung.com, krzk@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, cw00.choi@samsung.com, kyungmin.park@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, kgene@kernel.org, l.luba@partner.samsung.com, willy.mh.wolff.ml@gmail.com
List-Id: linux-samsung-soc@vger.kernel.org

Extend the documenation by events description with new 'event-data-type'
field. Add example how the event might be defined in DT.

Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
---
 .../bindings/devfreq/event/exynos-ppmu.txt    | 26 +++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/devfreq/event/exynos-ppmu.txt b/Documentation/devicetree/bindings/devfreq/event/exynos-ppmu.txt
index 3e36c1d11386..fb46b491791c 100644
--- a/Documentation/devicetree/bindings/devfreq/event/exynos-ppmu.txt
+++ b/Documentation/devicetree/bindings/devfreq/event/exynos-ppmu.txt
@@ -10,14 +10,23 @@ The Exynos PPMU driver uses the devfreq-event class to provide event data
 to various devfreq devices. The devfreq devices would use the event data when
 derterming the current state of each IP.
 
-Required properties:
+Required properties for PPMU device:
 - compatible: Should be "samsung,exynos-ppmu" or "samsung,exynos-ppmu-v2.
 - reg: physical base address of each PPMU and length of memory mapped region.
 
-Optional properties:
+Optional properties for PPMU device:
 - clock-names : the name of clock used by the PPMU, "ppmu"
 - clocks : phandles for clock specified in "clock-names" property
 
+Required properties for 'events' child node of PPMU device:
+- event-name : the unique event name among PPMU device
+Optional properties for 'events' child node of PPMU device:
+- event-data-type : Define the type of data which shell be counted
+by the counter. You can check include/dt-bindings/pmu/exynos_ppmu.h for
+all possible type, i.e. count read requests, count write data in bytes,
+etc. This field is optional and when it is missing, the driver code
+will use default data type.
+
 Example1 : PPMUv1 nodes in exynos3250.dtsi are listed below.
 
 		ppmu_dmc0: ppmu_dmc0@106a0000 {
@@ -145,3 +154,16 @@ Example3 : PPMUv2 nodes in exynos5433.dtsi are listed below.
 			reg = <0x104d0000 0x2000>;
 			status = "disabled";
 		};
+
+Example4 : 'event-data-type' in exynos4412-ppmu-common.dtsi are listed below.
+
+	&ppmu_dmc0 {
+		status = "okay";
+		events {
+			ppmu_dmc0_3: ppmu-event3-dmc0 {
+			event-name = "ppmu-event3-dmc0";
+			event-data-type = <(PPMU_RO_DATA_CNT |
+					PPMU_WO_DATA_CNT)>;
+			};
+		};
+	};
-- 
2.17.1
