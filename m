From: Daniel Drake <drake@endlessm.com>
Subject: [PATCH 2/2] ARM: dts: ODROID i2c improvements
Date: Wed, 16 Jul 2014 09:50:06 +0100
Message-ID: <1405500606-5752-2-git-send-email-drake@endlessm.com>
References: <1405500606-5752-1-git-send-email-drake@endlessm.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f48.google.com ([74.125.82.48]:62756 "EHLO
	mail-wg0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757881AbaGPIuQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Jul 2014 04:50:16 -0400
Received: by mail-wg0-f48.google.com with SMTP id x13so558482wgg.7
        for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Jul 2014 01:50:15 -0700 (PDT)
In-Reply-To: <1405500606-5752-1-git-send-email-drake@endlessm.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, liquid.acid@gmx.net, m.szyprowski@samsung.com, linux-arm-kernel@lists.infradead.org

Increase max i2c bus frequency beyond the default for faster
data transfers. According to the manual, these faster speeds are
only available when the board is wired up the right way. In this case,
the vendor kernel has run at this speed for a long time.

sda-delay is needed for talking to RTC on PMIC, otherwise the i2c
controller never sees an ACK. Strangely the other PMIC i2c slave (the
main one) works fine even without this delay. I Chose value 100 to
match the vendor kernel.

Signed-off-by: Daniel Drake <drake@endlessm.com>
---
 arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
index cb6f55f..adadaf9 100644
--- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
+++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
@@ -134,6 +134,8 @@
 	i2c@13860000 {
 		pinctrl-0 = <&i2c0_bus>;
 		pinctrl-names = "default";
+		samsung,i2c-sda-delay = <100>;
+		samsung,i2c-max-bus-freq = <400000>;
 		status = "okay";
 
 		usb3503: usb3503@08 {
-- 
1.9.1
