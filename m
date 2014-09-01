From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH 2/3] ARM: dts: exynos3250: Add CMU node for DMC domain clocks
Date: Mon, 01 Sep 2014 17:26:01 +0200
Message-ID: <1409585162-10523-2-git-send-email-k.kozlowski@samsung.com>
References: <1409585162-10523-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1409585162-10523-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Mike Turquette <mturquette@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Kyungmin Park <kyungmin.park@samsung.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>, Russell King <linux@arm.linux.org.uk>, Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Add CMU (Clock Management Unit) node for DMC (Dynamic Memory Controller)
domain clocks on Exynos3250.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 arch/arm/boot/dts/exynos3250.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
index 429a6c6cfcf9..8c3a9cc0a4d1 100644
--- a/arch/arm/boot/dts/exynos3250.dtsi
+++ b/arch/arm/boot/dts/exynos3250.dtsi
@@ -163,6 +163,12 @@
 			#clock-cells = <1>;
 		};
 
+		cmu_dmc: clock-controller@105C0000 {
+			compatible = "samsung,exynos3250-cmu-dmc";
+			reg = <0x105C0000 0x2000>;
+			#clock-cells = <1>;
+		};
+
 		rtc: rtc@10070000 {
 			compatible = "samsung,exynos3250-rtc";
 			reg = <0x10070000 0x100>;
-- 
1.9.1
