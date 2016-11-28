From: Markus Reichl <m.reichl@fivetechno.de>
Subject: [PATCH] ARM: dts: exynos: Cleanup exynos4412-odroidx2.dts and enable
 sound on odroid-x.
Date: Mon, 28 Nov 2016 13:48:06 +0100
Message-ID: <d56c0228-d39b-87e8-3a5f-e8577f3a91e4@fivetechno.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from wp126.webpack.hosteurope.de ([80.237.132.133]:54466 "EHLO
        wp126.webpack.hosteurope.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1754466AbcK1MsT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 28 Nov 2016 07:48:19 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Javier Martinez Canillas <javier@osg.samsung.com>

Odroid-X2 differs from Odroid-X only in RAM and prime CPU.
Remove doubled nodes from exynos4412-odroidx2.dts and move
sound node to exynos4412-odroidx.dts to enable sound on both boards.

Signed-off-by: Markus Reichl <m.reichl@fivetechno.de>
---
 arch/arm/boot/dts/exynos4412-odroidx.dts  | 13 +++++++++++++
 arch/arm/boot/dts/exynos4412-odroidx2.dts | 24 ------------------------
 2 files changed, 13 insertions(+), 24 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4412-odroidx.dts b/arch/arm/boot/dts/exynos4412-odroidx.dts
index 153a75f..46b931e 100644
--- a/arch/arm/boot/dts/exynos4412-odroidx.dts
+++ b/arch/arm/boot/dts/exynos4412-odroidx.dts
@@ -100,3 +100,16 @@
 &serial_3 {
 	status = "okay";
 };
+
+&sound {
+	simple-audio-card,name = "Odroid-X";
+	simple-audio-card,widgets =
+		"Headphone", "Headphone Jack",
+		"Microphone", "Mic Jack",
+		"Microphone", "DMIC";
+	simple-audio-card,routing =
+		"Headphone Jack", "HPL",
+		"Headphone Jack", "HPR",
+		"IN1", "Mic Jack",
+		"Mic Jack", "MICBIAS";
+};
diff --git a/arch/arm/boot/dts/exynos4412-odroidx2.dts b/arch/arm/boot/dts/exynos4412-odroidx2.dts
index d6e92eb..d867b2e 100644
--- a/arch/arm/boot/dts/exynos4412-odroidx2.dts
+++ b/arch/arm/boot/dts/exynos4412-odroidx2.dts
@@ -23,27 +23,3 @@
 		reg = <0x40000000 0x7FF00000>;
 	};
 };
-
-/* VDDQ for MSHC (eMMC card) */
-&buck8_reg {
-	regulator-name = "BUCK8_VDDQ_MMC4_2.8V";
-	regulator-min-microvolt = <2800000>;
-	regulator-max-microvolt = <2800000>;
-};
-
-&mshc_0 {
-	vqmmc-supply = <&buck8_reg>;
-};
-
-&sound {
-	simple-audio-card,name = "Odroid-X2";
-	simple-audio-card,widgets =
-		"Headphone", "Headphone Jack",
-		"Microphone", "Mic Jack",
-		"Microphone", "DMIC";
-	simple-audio-card,routing =
-		"Headphone Jack", "HPL",
-		"Headphone Jack", "HPR",
-		"IN1", "Mic Jack",
-		"Mic Jack", "MICBIAS";
-};
-- 
2.1.4
