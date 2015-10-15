From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [RFT PATCH 3/3] ARM: dts: Mark SDIO as non-removable in exynos5250-snow-common
Date: Thu, 15 Oct 2015 12:55:30 +0200
Message-ID: <1444906530-25048-4-git-send-email-javier@osg.samsung.com>
References: <1444906530-25048-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1444906530-25048-1-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Douglas Anderson <dianders@chromium.org>, Alim Akhtar <alim.akhtar@samsung.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Javier Martinez Canillas <javier@osg.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The Exynos5250 Snow Chromebooks have a Marvell WiFi SDIO chip which
can't neither be removed nor be detected. But the node isn't marked
as non-removable and instead has the broken-cd DT property.

This causes the device to be removed when the system enters into a
suspend state and the following warnings is shown after a resume:

[  181.944636] mmc2: error -2 during resume (card was removed?)

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

---

 arch/arm/boot/dts/exynos5250-snow-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5250-snow-common.dtsi b/arch/arm/boot/dts/exynos5250-snow-common.dtsi
index 0a7f408824d8..bf27957fd660 100644
--- a/arch/arm/boot/dts/exynos5250-snow-common.dtsi
+++ b/arch/arm/boot/dts/exynos5250-snow-common.dtsi
@@ -520,7 +520,7 @@
 &mmc_0 {
 	status = "okay";
 	num-slots = <1>;
-	broken-cd;
+	non-removable;
 	card-detect-delay = <200>;
 	samsung,dw-mshc-ciu-div = <3>;
 	samsung,dw-mshc-sdr-timing = <2 3>;
-- 
2.4.3
