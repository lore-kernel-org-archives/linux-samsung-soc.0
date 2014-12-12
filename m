From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH 3/3] ARM: dts: Set Peach boards USB WebCam regulators to always on
Date: Fri, 12 Dec 2014 11:25:51 +0100
Message-ID: <1418379951-5551-4-git-send-email-javier.martinez@collabora.co.uk>
References: <1418379951-5551-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:33863 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754104AbaLLK0M (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Dec 2014 05:26:12 -0500
In-Reply-To: <1418379951-5551-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

The Exynos5420 Peach Pit and Exynos5800 Peach Pi boards have a built-in
Silicon Motion USB UVC WebCam whose power supply is the tps65090 fet5
regulator. Since the camera uses the generic USB Video Class driver and
this does not grab a regulator, mark the regulator as always on so the
USB device is enumerated and usable.

Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
---
 arch/arm/boot/dts/exynos5420-peach-pit.dts | 1 +
 arch/arm/boot/dts/exynos5800-peach-pi.dts  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/boot/dts/exynos5420-peach-pit.dts
index fa74a73..a4c5152 100644
--- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
+++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
@@ -831,6 +831,7 @@
 					};
 					tps65090_fet5: fet5 {
 						regulator-name = "camout";
+						regulator-always-on;
 					};
 					tps65090_fet6: fet6 {
 						regulator-name = "lcd_vdd";
diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/boot/dts/exynos5800-peach-pi.dts
index d603e73..1367276 100644
--- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
+++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
@@ -820,6 +820,7 @@
 					};
 					tps65090_fet5: fet5 {
 						regulator-name = "camout";
+						regulator-always-on;
 					};
 					tps65090_fet6: fet6 {
 						regulator-name = "lcd_vdd";
-- 
2.1.0
