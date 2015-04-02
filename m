From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH 6/6] arm64: dts: exynos: add reboot node for exynos5433
Date: Thu, 02 Apr 2015 17:34:37 +0900
Message-ID: <1427963677-32661-7-git-send-email-cw00.choi@samsung.com>
References: <1427963677-32661-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1427963677-32661-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: kgene@kernel.org
Cc: mark.rutland@arm.com, marc.zyngier@arm.com, arnd@arndb.de, olof@lixom.net, catalin.marinas@arm.com, will.deacon@arm.com, inki.dae@samsung.com, chanho61.park@samsung.com, cw00.choi@samsung.com, jaewon02.kim@samsung.com, beomho.seo@samsung.com, jy0922.shim@samsung.com, a.kesavan@samsung.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.orgChanwoo Choi <cw00.choi@samsung.co>
List-Id: linux-samsung-soc@vger.kernel.org

From: Joonyoung Shim <jy0922.shim@samsung.com>

This patch adds the reboot node which uses the syscon-reboot driver.

Cc: Kukjin Kim <kgene@kernel.org>
Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
Signed-off-by: Chanwoo Choi <cw00.choi@samsung.co>
Acked-by: Inki Dae <inki.dae@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index f179c60..f2d6b18 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -94,6 +94,13 @@
 		cpu_on = <0xC4000003>;
 	};
 
+	reboot: syscon-reboot {
+		compatible = "syscon-reboot";
+		regmap = <&pmu_system_controller>;
+		offset = <0x400>;
+		mask = <0x1>;
+	};
+
 	soc: soc {
 		compatible = "simple-bus";
 		#address-cells = <1>;
-- 
1.8.5.5
