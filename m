From: Inki Dae <inki.dae@samsung.com>
Subject: [PATCH] ARM: dts: exynos4412-trats2: set display clock correctly
Date: Sat, 07 Feb 2015 19:49:08 +0900
Message-ID: <1423306148-22212-1-git-send-email-inki.dae@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:47163 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752199AbbBGKtL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 7 Feb 2015 05:49:11 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, Inki Dae <inki.dae@samsung.com>

This patch sets display clock correctly.

If Display clock isn't set correctly then you would find below messages
and Display controller doesn't work correctly since a patch[1]

   exynos-drm: No connectors reported connected with modes
   [drm] Cannot find any crtc or sizes - going 1024x768

[1] commit abc0b1447d49 ("drm: Perform basic sanity checks on probed modes")

Signed-off-by: Inki Dae <inki.dae@samsung.com>
---
 arch/arm/boot/dts/exynos4412-trats2.dts |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos4412-trats2.dts b/arch/arm/boot/dts/exynos4412-trats2.dts
index 29231b4..1ec4d33 100644
--- a/arch/arm/boot/dts/exynos4412-trats2.dts
+++ b/arch/arm/boot/dts/exynos4412-trats2.dts
@@ -691,7 +691,7 @@
 
 			display-timings {
 				timing-0 {
-					clock-frequency = <0>;
+					clock-frequency = <57153600>;
 					hactive = <720>;
 					vactive = <1280>;
 					hfront-porch = <5>;
-- 
1.7.9.5
