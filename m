From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH v5 5/8] ARM: dts: add SROM device node for exynos5
Date: Tue, 20 Oct 2015 14:45:36 +0530
Message-ID: <1445332540-12814-6-git-send-email-pankaj.dubey@samsung.com>
References: <1445332540-12814-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1445332540-12814-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, k.kozlowski@samsung.com, p.fedin@samsung.com, thomas.ab@samsung.com, andi.shyti@samsung.com, Pankaj Dubey <pankaj.dubey@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>
List-Id: linux-samsung-soc@vger.kernel.org

Add SROM controller device node for exynos5.

CC: Rob Herring <robh+dt@kernel.org>
CC: Mark Rutland <mark.rutland@arm.com>
CC: Ian Campbell <ijc+devicetree@hellion.org.uk>
Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 arch/arm/boot/dts/exynos5.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5.dtsi b/arch/arm/boot/dts/exynos5.dtsi
index 110dbd4..b5d3437 100644
--- a/arch/arm/boot/dts/exynos5.dtsi
+++ b/arch/arm/boot/dts/exynos5.dtsi
@@ -30,6 +30,11 @@
 		reg = <0x10000000 0x100>;
 	};
 
+	sromc@12250000 {
+		compatible = "samsung,exynos-srom";
+		reg = <0x12250000 0x10>;
+	};
+
 	combiner: interrupt-controller@10440000 {
 		compatible = "samsung,exynos4210-combiner";
 		#interrupt-cells = <2>;
-- 
2.4.5
