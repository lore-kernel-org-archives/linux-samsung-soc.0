From: Alexey Klimov <klimov.linux@gmail.com>
Subject: [RFC PATCH 3/3] ARM: dts: add MCT property use-cp15-phys-counter
 for exynos5422-odroidxu3
Date: Tue, 28 Jul 2015 00:28:48 +0300
Message-ID: <1438032528.17734.49.camel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f176.google.com ([209.85.217.176]:36512 "EHLO
	mail-lb0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754755AbbG0V2u (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 27 Jul 2015 17:28:50 -0400
Received: by lbbqi7 with SMTP id qi7so62137456lbb.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Jul 2015 14:28:49 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, daniel.lezcano@linaro.org, dianders@chromium.org, chirantan@chromium.org
Cc: klimov.linux@gmail.com, t.dakhran@gmail.com, k.kozlowski@samsung.com, kgene@kernel.org, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, yury.norov@gmail.com

Speedup MCT operation on odroid-xu3 dev board by using
coprocessor 64-bit counter instead of reading same counter
located in mmio region.

Tested on Odroid-xu3.

Signed-off-by: Alexey Klimov <klimov.linux@gmail.com>
---
 arch/arm/boot/dts/exynos5422-odroidxu3.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3.dts b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
index 78e6a50..b7f6c8f 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3.dts
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
@@ -18,6 +18,10 @@
 	compatible = "hardkernel,odroid-xu3", "samsung,exynos5800", "samsung,exynos5";
 };
 
+&mct {
+	use-cp15-phys-counter;
+};
+
 &i2c_0 {
 	status = "okay";
 
-- 
2.1.4
