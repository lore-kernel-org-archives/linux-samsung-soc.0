From: Beomho Seo <beomho.seo@samsung.com>
Subject: [PATCH RESEND 1/2] ARM: dts: exynos3250: remove unecessary property of
 gpio-keys node
Date: Tue, 06 Jan 2015 12:43:28 +0900
Message-ID: <1420515809-5151-2-git-send-email-beomho.seo@samsung.com>
References: <1420515809-5151-1-git-send-email-beomho.seo@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:56698 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753379AbbAFDnp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 Jan 2015 22:43:45 -0500
In-reply-to: <1420515809-5151-1-git-send-email-beomho.seo@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: kgene.kim@samsung.com, yj44.cho@samsung.com, cw00.choi@samsung.com, inki.dae@samsung.com, beomho.seo@samsung.com, Kukjin Kim <kgene@kernel.org>

This patch remove unecessary property of gpio-keys node.
gpio-keys driver do not uses interrupts and interrupt-parent.

Cc: Kukjin Kim <kgene@kernel.org>
Cc: Youngjun Cho <yj44.cho@samsung.com>
Cc: Chanwoo Choi <cw00.choi@samsung.com>
Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
Signed-off-by: Beomho Seo <beomho.seo@samsung.com>
---
 arch/arm/boot/dts/exynos3250-monk.dts   |    2 --
 arch/arm/boot/dts/exynos3250-rinato.dts |    2 --
 2 files changed, 4 deletions(-)

diff --git a/arch/arm/boot/dts/exynos3250-monk.dts b/arch/arm/boot/dts/exynos3250-monk.dts
index 24822aa..2129ab98 100644
--- a/arch/arm/boot/dts/exynos3250-monk.dts
+++ b/arch/arm/boot/dts/exynos3250-monk.dts
@@ -37,8 +37,6 @@
 		compatible = "gpio-keys";
 
 		power_key {
-			interrupt-parent = <&gpx2>;
-			interrupts = <7 0>;
 			gpios = <&gpx2 7 1>;
 			linux,code = <KEY_POWER>;
 			label = "power key";
diff --git a/arch/arm/boot/dts/exynos3250-rinato.dts b/arch/arm/boot/dts/exynos3250-rinato.dts
index 80aa8b4..c186ac6 100644
--- a/arch/arm/boot/dts/exynos3250-rinato.dts
+++ b/arch/arm/boot/dts/exynos3250-rinato.dts
@@ -37,8 +37,6 @@
 		compatible = "gpio-keys";
 
 		power_key {
-			interrupt-parent = <&gpx2>;
-			interrupts = <7 0>;
 			gpios = <&gpx2 7 1>;
 			linux,code = <KEY_POWER>;
 			label = "power key";
-- 
1.7.9.5
