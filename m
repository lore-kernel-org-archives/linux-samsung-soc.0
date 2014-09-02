From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH v2 2/3] ARM: dts: exynos3250: Add CMU node for DMC domain clocks
Date: Tue, 02 Sep 2014 15:21:16 +0200
Message-ID: <1409664077-27121-2-git-send-email-k.kozlowski@samsung.com>
References: <1409664077-27121-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:37247 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753406AbaIBNWT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 2 Sep 2014 09:22:19 -0400
In-reply-to: <1409664077-27121-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Kukjin Kim <kgene.kim@samsung.com>, Ben Dooks <ben-linux@fluff.org>, Russell King <linux@arm.linux.org.uk>, Tomasz Figa <t.figa@samsung.com>, Mike Turquette <mturquette@linaro.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

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
