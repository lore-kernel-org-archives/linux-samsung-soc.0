From: Vikas Sajjan <vikas.sajjan@samsung.com>
Subject: [PATCH] ARM: dts: Add mask-tpm-reset to the device tree
Date: Thu, 26 Jun 2014 14:45:27 +0530
Message-ID: <1403774127-21892-1-git-send-email-vikas.sajjan@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:41324 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754992AbaFZJSE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Jun 2014 05:18:04 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N7R0039KR5VRZ90@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 26 Jun 2014 18:17:55 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, sajjan.linux@gmail.com, dianders@chromium.org, Vikas Sajjan <vikas.sajjan@samsung.com>

From: Doug Anderson <dianders@chromium.org>

The mask-tpm-reset GPIO is used by the kernel to prevent the TPM from
being reset across sleep/wake.  If we don't set it to anything then
the TPM will be reset.  U-Boot will detect this as invalid
and will reset the system on resume time. This GPIO can always be low
and not hurt anything.  It will get pulled back high again during a
normal warm reset when it will default back to an input.

To properly preserve the TPM state across suspend/resume and to make
the chrome U-Boot happy, properly set the GPIO to mask the
reset to the TPM.

Signed-off-by: Doug Anderson <dianders@chromium.org>
Signed-off-by: Vikas Sajjan <vikas.sajjan@samsung.com>
---
 arch/arm/boot/dts/exynos5420-peach-pit.dts |   20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/boot/dts/exynos5420-peach-pit.dts
index 7649982..8fd990a 100644
--- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
+++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
@@ -87,6 +87,18 @@
 		pinctrl-0 = <&usb301_vbus_en>;
 		enable-active-high;
 	};
+
+	/* We need GPX0_6 to be low at sleep time; just keep it low always */
+	mask_tpm_reset_regulator: mask-tpm-reset-regulator {
+	compatible = "regulator-fixed";
+	regulator-name = "mask-tpm-reset ";
+		gpio = <&gpx0 6 0>;
+		enable-active-low;
+		regulator-boot-on;
+		regulator-always-on;
+		pinctrl-names = "default";
+		pinctrl-0 = <&mask_tpm_reset>;
+	};
 };
 
 &dp {
@@ -210,6 +222,14 @@
 
 
 &pinctrl_0 {
+
+	mask_tpm_reset: mask-tpm-reset {
+		samsung,pins = "gpx0-6";
+		samsung,pin-function = <1>;
+		samsung,pin-pud = <0>;
+		samsung,pin-drv = <0>;
+	};
+
 	max98090_irq: max98090-irq {
 		samsung,pins = "gpx0-2";
 		samsung,pin-function = <0>;
-- 
1.7.9.5
