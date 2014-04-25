From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH v2 1/5] ARM: dts: Add syscon handle in pmu node for exynos5250
Date: Fri, 25 Apr 2014 20:54:13 +0900
Message-ID: <1398426857-5097-2-git-send-email-pankaj.dubey@samsung.com>
References: <1396425778-4379-1-git-send-email-pankaj.dubey@samsung.com>
 <1398426857-5097-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1398426857-5097-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: kgene.kim@samsung.com, robh+dt@kernel.org, t.figa@samsung.com, chow.kim@samsung.com, yg1004.jang@samsung.com, Pankaj Dubey <pankaj.dubey@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Add "samsung,syscon-phandle" property pointing to PMU node
to access PMU register via PMU regmap handle.

Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
---
 arch/arm/boot/dts/exynos5250.dtsi |    1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 3742331..52801af 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -173,6 +173,7 @@
 	pmu_system_controller: system-controller@10040000 {
 		compatible = "samsung,exynos5250-pmu", "syscon";
 		reg = <0x10040000 0x5000>;
+		samsung,syscon-phandle = <&pmu_system_controller>;
 	};
 
 	watchdog@101D0000 {
-- 
1.7.10.4
