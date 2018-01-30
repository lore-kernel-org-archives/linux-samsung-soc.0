From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2 1/4] soc: samsung: pmu: Populate children syscon nodes
Date: Tue, 30 Jan 2018 22:18:16 +0100
Message-ID: <20180130211819.17139-2-krzk@kernel.org>
References: <20180130211819.17139-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180130211819.17139-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Pankaj Dubey <pankaj.dubey@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
List-Id: linux-samsung-soc@vger.kernel.org

The syscon poweroff and restart nodes logically belong to the Power
Management Unit so populate possible children.

This also requires providing compatibles for Exynos5410 and Exynos7 so
the PMU device and its children will be instantiated for them as well.
Just like Exynos5433, these chipsets are not yet supported by the PMU
driver.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 Documentation/devicetree/bindings/arm/samsung/pmu.txt | 6 ++++++
 drivers/soc/samsung/exynos-pmu.c                      | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/pmu.txt b/Documentation/devicetree/bindings/arm/samsung/pmu.txt
index 779f5614bcee..16685787d2bd 100644
--- a/Documentation/devicetree/bindings/arm/samsung/pmu.txt
+++ b/Documentation/devicetree/bindings/arm/samsung/pmu.txt
@@ -43,6 +43,12 @@ following properties:
 - interrupt-parent: a phandle indicating which interrupt controller
   this PMU signals interrupts to.
 
+
+Optional nodes:
+
+- nodes defining the restart and poweroff syscon children
+
+
 Example :
 pmu_system_controller: system-controller@10040000 {
 	compatible = "samsung,exynos5250-pmu", "syscon";
diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index f56adbd9fb8b..d34ca201b8b7 100644
--- a/drivers/soc/samsung/exynos-pmu.c
+++ b/drivers/soc/samsung/exynos-pmu.c
@@ -85,10 +85,14 @@ static const struct of_device_id exynos_pmu_of_device_ids[] = {
 		.compatible = "samsung,exynos5250-pmu",
 		.data = exynos_pmu_data_arm_ptr(exynos5250_pmu_data),
 	}, {
+		.compatible = "samsung,exynos5410-pmu",
+	}, {
 		.compatible = "samsung,exynos5420-pmu",
 		.data = exynos_pmu_data_arm_ptr(exynos5420_pmu_data),
 	}, {
 		.compatible = "samsung,exynos5433-pmu",
+	}, {
+		.compatible = "samsung,exynos7-pmu",
 	},
 	{ /*sentinel*/ },
 };
@@ -126,6 +130,9 @@ static int exynos_pmu_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, pmu_context);
 
+	if (devm_of_platform_populate(dev))
+		dev_err(dev, "Error populating children, reboot and poweroff might not work properly\n");
+
 	dev_dbg(dev, "Exynos PMU Driver probe done\n");
 	return 0;
 }
-- 
2.11.0
