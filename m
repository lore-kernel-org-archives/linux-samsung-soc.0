From: Matthew Leach <matthew@mattleach.net>
Subject: [PATCH RESEND] ARM: dts: exynos4412: Enable AX88760 USB hub on Origen board
Date: Mon, 13 Apr 2015 18:02:46 +0100
Message-ID: <1428944566-17132-1-git-send-email-matthew@mattleach.net>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mx0.mattleach.net ([176.58.118.143]:45752 "EHLO
	mx0.mattleach.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754074AbbDMRD1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 13 Apr 2015 13:03:27 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Russell King <linux@arm.linux.org.uk>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Matthew Leach <matthew@mattleach.net>

Enable the Origen's usb phy and ohci devices in the device tree.  Also
add the "samsung,vbus-gpio" property to enable the GPX3(5) gpio pin so
the AX88760 hub is powered.

Signed-off-by: Matthew Leach <matthew@mattleach.net>
---
 arch/arm/boot/dts/exynos4412-origen.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-origen.dts b/arch/arm/boot/dts/exynos4412-origen.dts
index bd8b730..c810ca3 100644
--- a/arch/arm/boot/dts/exynos4412-origen.dts
+++ b/arch/arm/boot/dts/exynos4412-origen.dts
@@ -531,4 +531,19 @@
 			clock-frequency = <24000000>;
 		};
 	};
+
+	exynos-usbphy@125B0000 {
+		status = "okay";
+	};
+
+	ehci@12580000 {
+		samsung,vbus-gpio = <&gpx3 5 1>;
+		status = "okay";
+		port@1{
+			status = "okay";
+		};
+		port@2 {
+			status = "okay";
+		};
+	};
 };
-- 
2.3.5
