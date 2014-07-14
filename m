From: Vikas Sajjan <vikas.sajjan@samsung.com>
Subject: [PATCH] ARM: dts: Add mask-tpm-reset DT node to the exynos5800-peach-pi
Date: Mon, 14 Jul 2014 17:36:17 +0530
Message-ID: <1405339577-7878-1-git-send-email-vikas.sajjan@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:63837 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753305AbaGNMJX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Jul 2014 08:09:23 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N8P009V4B3LP410@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 14 Jul 2014 21:09:21 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, sajjan.linux@gmail.com, dianders@chromium.org, linus.walleij@linaro.org, swarren@wwwdotorg.org, olof@lixom.net, thomas.ab@samsung.com, Vikas Sajjan <vikas.sajjan@samsung.com>

The mask-tpm-reset GPIO is used by the kernel to prevent the TPM from
being reset across sleep/wake.  If we don't set it to anything then
the TPM will be reset.  U-Boot will detect this as invalid
and will reset the system on resume time. This GPIO can always be low
and not hurt anything.  It will get pulled back high again during a
normal warm reset when it will default back to an input.

To properly preserve the TPM state across suspend/resume and to make
the chrome U-Boot happy, properly set the GPIO to mask the
reset to the TPM.

Signed-off-by: Vikas Sajjan <vikas.sajjan@samsung.com>
---
 arch/arm/boot/dts/exynos5800-peach-pi.dts |   12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/boot/dts/exynos5800-peach-pi.dts
index 28f2a25..caa8952 100644
--- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
+++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
@@ -209,6 +209,18 @@
 
 
 &pinctrl_0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mask_tpm_reset>;
+
+	/* We need GPX0_6 to be low at sleep time; just keep it low always */
+	mask_tpm_reset: mask-tpm-reset {
+		samsung,pins = "gpx0-6";
+		samsung,pin-function = <1>;
+		samsung,pin-pud = <0>;
+		samsung,pin-drv = <0>;
+		samsung,pin-val = <0>;
+	};
+
 	max98091_irq: max98091-irq {
 		samsung,pins = "gpx0-2";
 		samsung,pin-function = <0>;
-- 
1.7.9.5
