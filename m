From: Anand Moon <linux.amoon@gmail.com>
Subject: usb phy reset for ethernet.
Date: Sat, 10 Sep 2016 15:53:08 +0530
Message-ID: <CANAwSgT0f5LiD6O2yogfAJAvrHQqXKYxmMgqHuzv9AsqhSK29g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oi0-f44.google.com ([209.85.218.44]:36210 "EHLO
        mail-oi0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755311AbcIJKX3 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 10 Sep 2016 06:23:29 -0400
Received: by mail-oi0-f44.google.com with SMTP id q188so81855533oia.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 10 Sep 2016 03:23:29 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski@samsung.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Mark Brown <broonie@debian.org>

Hi Krzysztof,

For log time I am trying to understanding the reset for PHY for Odroid XU4
for ethenet/emmc/sdcard.

So in-order to reset the PHY I would like to attempt some thing like this below.
I am trying to understand and modify the driver drivers/regulator/s2mps11.c
If you thing this approach is good enough. Or their will be another approach.

diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
index d562530..bed5263 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
@@ -369,9 +369,10 @@
                        };

                        ldo17_reg: LDO17 {
-                               regulator-name = "tsp_avdd";
+                               regulator-name = "vdd_eth";
                                regulator-min-microvolt = <3300000>;
                                regulator-max-microvolt = <3300000>;
+                               samsung,ext-control-gpios = <&gpg1 1
GPIO_ACTIVE_HIGH>;
                                regulator-always-on;
                        };

Or is there reset core logic for the usb phy to be integrated for
exynos platform.

Please let me know your thought on this.

Best Regards
-Anand Moon
