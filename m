From: Arun Kumar K <arun.kk@samsung.com>
Subject: [PATCH 1/2] ARM: dts: Correct the usb phy node in peach-pit
Date: Fri, 30 May 2014 10:31:39 +0530
Message-ID: <1401426100-13720-1-git-send-email-arun.kk@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f43.google.com ([209.85.160.43]:61582 "EHLO
	mail-pb0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750892AbaE3FCD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 May 2014 01:02:03 -0400
Received: by mail-pb0-f43.google.com with SMTP id up15so1302546pbc.16
        for <linux-samsung-soc@vger.kernel.org>; Thu, 29 May 2014 22:02:02 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, gautam.vivek@samsung.com

The vbus-supply property is wrongly updated in the
usbdrd node instead of the usbdrd_phy node. This patch
fixes the same.

Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
---
 arch/arm/boot/dts/exynos5420-peach-pit.dts |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/boot/dts/exynos5420-peach-pit.dts
index 29f64de..1c5b8f9 100644
--- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
+++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
@@ -231,11 +231,11 @@
 	ddc = <&i2c_2>;
 };
 
-&usbdrd3_0 {
+&usbdrd_phy0 {
 	vbus-supply = <&usb300_vbus_reg>;
 };
 
-&usbdrd3_1 {
+&usbdrd_phy1 {
 	vbus-supply = <&usb301_vbus_reg>;
 };
 
-- 
1.7.9.5
