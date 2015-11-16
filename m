From: Pavel Fedin <p.fedin@samsung.com>
Subject: [PATCH v9 2/4] ARM: dts: Add SROMc to Exynos 5410
Date: Mon, 16 Nov 2015 10:43:03 +0300
Message-ID: <35a5e734235d8cd77cd847f1a180ba924bed6108.1447659546.git.p.fedin@samsung.com>
References: <cover.1447659546.git.p.fedin@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <cover.1447659546.git.p.fedin@samsung.com>
In-reply-to: <cover.1447659546.git.p.fedin@samsung.com>
References: <cover.1447659546.git.p.fedin@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This machine uses own SoC device tree file, add missing part.

Signed-off-by: Pavel Fedin <p.fedin@samsung.com>
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 arch/arm/boot/dts/exynos5410.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5410.dtsi b/arch/arm/boot/dts/exynos5410.dtsi
index 4603356..e2b58f8 100644
--- a/arch/arm/boot/dts/exynos5410.dtsi
+++ b/arch/arm/boot/dts/exynos5410.dtsi
@@ -101,6 +101,11 @@
 			reg = <0x10000000 0x100>;
 		};
 
+		sromc: sromc@12250000 {
+			compatible = "samsung,exynos-srom";
+			reg = <0x12250000 0x14>;
+		};
+
 		pmu_system_controller: system-controller@10040000 {
 			compatible = "samsung,exynos5410-pmu", "syscon";
 			reg = <0x10040000 0x5000>;
-- 
2.4.4
