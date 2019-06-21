From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2 4/4] ARM: dts: exynos: Use proper regulator for eMMC memory on Arndale Octa
Date: Fri, 21 Jun 2019 17:58:45 +0200
Message-ID: <20190621155845.7079-4-krzk@kernel.org>
References: <20190621155845.7079-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190621155845.7079-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Anand Moon <linux.amoon@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

The eMMC memory is supplied by LDO18 (PVDD_EMMC_1V8) and buck10
(PVDD_EMMCF_2V8), not by LDO10. The LDO10 (PVDD_PRE_1V8) supplies
instead VDDP_MMC pin of eMMC host interface and it is already marked as
always on.

This change only properly models the hardware and reflects in usage of
regulators.  There is no functional change because:
1. LDO18 cannot be turned off (e.g. by lack of consumers) because in
   off mode it is controlled by LDO18EN pin, which is pulled up by
   always-on regulator LDO2 (PVDD_APIO_1V8).
2. LDO10 is marked as always on so removing its consumer will not have
   effect.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. New patch.
---
 arch/arm/boot/dts/exynos5420-arndale-octa.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5420-arndale-octa.dts b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
index 3126a6c3f842..ac7f2fa0ba22 100644
--- a/arch/arm/boot/dts/exynos5420-arndale-octa.dts
+++ b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
@@ -780,7 +780,7 @@
 	samsung,dw-mshc-ddr-timing = <0 2>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_bus1 &sd0_bus4 &sd0_bus8>;
-	vmmc-supply = <&ldo10_reg>;
+	vmmc-supply = <&ldo18_reg>;
 	vqmmc-supply = <&ldo3_reg>;
 	bus-width = <8>;
 	cap-mmc-highspeed;
-- 
2.17.1
