From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH 1/1] ARM: dts: Add keep-power-in-suspend to WiFi SDIO node for Peach Boards
Date: Tue,  7 Apr 2015 15:03:34 +0200
Message-ID: <1428411814-21098-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Kevin Hilman <khilman@linaro.org>, Tyler Baker <tyler.baker@linaro.org>, Abhilash Kesavan <kesavan.abhilash@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>
List-Id: linux-samsung-soc@vger.kernel.org

The Marvell mwifiex driver prevents the system to enter into a suspend
state if the card power is not preserved during a suspend/resume cycle.

So Suspend-to-RAM and Suspend-to-idle is failing on Exynos5800 Peach Pi
and Exynos5420 Peach Pit Chromebooks.

Add the keep-power-in-suspend Power Management property to the SDIO/MMC
node so the mwifiex suspend handler doesn't fail and the system is able
to enter into a suspend state.

Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
---
 arch/arm/boot/dts/exynos5420-peach-pit.dts | 1 +
 arch/arm/boot/dts/exynos5800-peach-pi.dts  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/boot/dts/exynos5420-peach-pit.dts
index 0788d08fb43e..146e71118a72 100644
--- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
+++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
@@ -711,6 +711,7 @@
 	num-slots = <1>;
 	broken-cd;
 	cap-sdio-irq;
+	keep-power-in-suspend;
 	card-detect-delay = <200>;
 	clock-frequency = <400000000>;
 	samsung,dw-mshc-ciu-div = <1>;
diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/boot/dts/exynos5800-peach-pi.dts
index 412f41d62686..02eb8b15374f 100644
--- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
+++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
@@ -674,6 +674,7 @@
 	num-slots = <1>;
 	broken-cd;
 	cap-sdio-irq;
+	keep-power-in-suspend;
 	card-detect-delay = <200>;
 	clock-frequency = <400000000>;
 	samsung,dw-mshc-ciu-div = <1>;
-- 
2.1.4
