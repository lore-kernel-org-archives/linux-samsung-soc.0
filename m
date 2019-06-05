From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: [PATCH v4 5/5] DT: arm: exynos4412: add event data type which is
 monitored
Date: Wed,  5 Jun 2019 11:12:36 +0200
Message-ID: <20190605091236.24263-6-l.luba@partner.samsung.com>
References: <20190605091236.24263-1-l.luba@partner.samsung.com>
        <CGME20190605091305eucas1p136332cc3d1a299d90617bddcb365bee0@eucas1p1.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190605091236.24263-1-l.luba@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: b.zolnierkie@samsung.com, krzk@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, cw00.choi@samsung.com, kyungmin.park@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, kgene@kernel.org, l.luba@partner.samsung.com, willy.mh.wolff.ml@gmail.com
List-Id: linux-samsung-soc@vger.kernel.org

The patch adds new field in the PPMU event which shows explicitly
what kind of data the event is monitoring. It is possible to change it
using defined values in exynos_ppmu.h file.

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
---
 arch/arm/boot/dts/exynos4412-ppmu-common.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-ppmu-common.dtsi b/arch/arm/boot/dts/exynos4412-ppmu-common.dtsi
index 3a3b2fafefdd..549faba85a7a 100644
--- a/arch/arm/boot/dts/exynos4412-ppmu-common.dtsi
+++ b/arch/arm/boot/dts/exynos4412-ppmu-common.dtsi
@@ -6,12 +6,16 @@
  * Author: Chanwoo Choi <cw00.choi@samsung.com>
  */
 
+#include <dt-bindings/pmu/exynos_ppmu.h>
+
 &ppmu_dmc0 {
        status = "okay";
 
        events {
 	       ppmu_dmc0_3: ppmu-event3-dmc0 {
 		       event-name = "ppmu-event3-dmc0";
+		       event-data-type = <(PPMU_RO_DATA_CNT |
+					   PPMU_WO_DATA_CNT)>;
 	       };
        };
 };
@@ -22,6 +26,8 @@
        events {
 	       ppmu_dmc1_3: ppmu-event3-dmc1 {
 		       event-name = "ppmu-event3-dmc1";
+		       event-data-type = <(PPMU_RO_DATA_CNT |
+					   PPMU_WO_DATA_CNT)>;
 	       };
        };
 };
@@ -32,6 +38,8 @@
        events {
 	       ppmu_leftbus_3: ppmu-event3-leftbus {
 		       event-name = "ppmu-event3-leftbus";
+		       event-data-type = <(PPMU_RO_DATA_CNT |
+					   PPMU_WO_DATA_CNT)>;
 	       };
        };
 };
@@ -42,6 +50,8 @@
        events {
 	       ppmu_rightbus_3: ppmu-event3-rightbus {
 		       event-name = "ppmu-event3-rightbus";
+		       event-data-type = <(PPMU_RO_DATA_CNT |
+					   PPMU_WO_DATA_CNT)>;
 	       };
        };
 };
-- 
2.17.1
