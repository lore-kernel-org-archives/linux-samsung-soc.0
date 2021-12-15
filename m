Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5B89C4167B
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 15 Dec 2021 16:09:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244510AbhLOQJW (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 15 Dec 2021 11:09:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244488AbhLOQJT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 15 Dec 2021 11:09:19 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C298C061401
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Dec 2021 08:09:19 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id e5so5647107wrc.5
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Dec 2021 08:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CRgVMq9DF9x+0J8o8j9OpwatCahv8oEQW22dmXLLnP0=;
        b=A3oN71jjZ3To5ijvj0w5O1v/d8R455dKNGIPYhLVJ49vRatwmvpXzXJ/iH/5NwkF15
         8m8MrtQiDGIGxncvWCXJBPSIrJWC+yN2U+/1z6foTytOjLVkGhjCHEm6/ibMNcEKm8kL
         HQGw7H03Rw/r6IS7qdDACbSNFjFTa+hyClbh07Wnis/UpeNb21c/nCv1lxE5sJ74Q30z
         qx96HcdZMrAVnGW7ZzIh9OkdOeM2kyaj0VkbHXeejiND61U4EDVb6IBHuu6wOkp1gNi3
         eiCB6ooTg9JiOfSRtSH7qmH+cTmA3GlVwCs6cDkUQM9oQf0/mF/NX1mQLzFt0rF779oB
         FW1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CRgVMq9DF9x+0J8o8j9OpwatCahv8oEQW22dmXLLnP0=;
        b=cGevU2zpcm0xnxHY1k1vejzEv8reOKxCP5oL/UdloQCYQBbMHuu/kMj2qf6GsSPL5g
         edu33NKXyjxF8r1EwcStv6fWFcr4gym8aUNBn23qxNlCjXk6+niS3gKfOMkJOAWhudNH
         YljgJU18uDZGIHK4crzN+/L6/KbfNbd/bdTMm9hj95D4HWzAzjlt+KySLIDE5K5DZ7Pw
         lPgiVFb+j9rwetD1pZgy0H52iF5+WifDISIhjU7EaWTYSbbwENjRrPrJWkhwYAZIUXxE
         RrFcU213kDuEbDy7fgEcN5TMRukbw+EjeU/8gI8rZaT61/SXzE6rheHtiJJnvxbifWuq
         HtwQ==
X-Gm-Message-State: AOAM532h2KymNQ6m++LUPEIRUIq3U+O0Eje/xRItBhpQnV8uq5rKAT9E
        R63UkT9ap+TyHh7gb4dBB5rsXg==
X-Google-Smtp-Source: ABdhPJwRvR6MJ+NCfeW66QQy9P5tG4a0Tw3Jwpjwtd5otuCxLv3fvcwPph6a66Ux51cGTRUJmGPyXA==
X-Received: by 2002:adf:ea8c:: with SMTP id s12mr4387259wrm.342.1639584557748;
        Wed, 15 Dec 2021 08:09:17 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id c7sm2869613wrq.81.2021.12.15.08.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 08:09:17 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Palmer <daniel@0x0f.com>,
        Hao Fang <fanghao11@huawei.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 7/7] arm64: dts: exynos: Add initial E850-96 board support
Date:   Wed, 15 Dec 2021 18:09:06 +0200
Message-Id: <20211215160906.17451-8-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211215160906.17451-1-semen.protsenko@linaro.org>
References: <20211215160906.17451-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

E850-96 is a 96boards development board manufactured by WinLink. It
incorporates Samsung Exynos850 SoC, and is compatible with 96boards
mezzanine boards [1], as it follows 96boards standards.

This patch adds minimal support for E850-96 board. Next features are
enabled in board dts file and verified with minimal BusyBox rootfs:

 * User buttons
 * LEDs
 * Serial console
 * Watchdog timers
 * RTC
 * eMMC

[1] https://www.96boards.org/products/mezzanine/

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 arch/arm64/boot/dts/exynos/Makefile           |   3 +-
 .../boot/dts/exynos/exynos850-e850-96.dts     | 157 ++++++++++++++++++
 2 files changed, 159 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos850-e850-96.dts

diff --git a/arch/arm64/boot/dts/exynos/Makefile b/arch/arm64/boot/dts/exynos/Makefile
index b41e86df0a84..803548ccc537 100644
--- a/arch/arm64/boot/dts/exynos/Makefile
+++ b/arch/arm64/boot/dts/exynos/Makefile
@@ -3,4 +3,5 @@ dtb-$(CONFIG_ARCH_EXYNOS) += \
 	exynos5433-tm2.dtb	\
 	exynos5433-tm2e.dtb	\
 	exynos7-espresso.dtb	\
-	exynosautov9-sadk.dtb
+	exynosautov9-sadk.dtb	\
+	exynos850-e850-96.dtb
diff --git a/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts b/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts
new file mode 100644
index 000000000000..fd611906d81c
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts
@@ -0,0 +1,157 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * WinLink E850-96 board device tree source
+ *
+ * Copyright (C) 2018 Samsung Electronics Co., Ltd.
+ * Copyright (C) 2021 Linaro Ltd.
+ *
+ * Device tree source file for WinLink's E850-96 board which is based on
+ * Samsung Exynos850 SoC.
+ */
+
+/dts-v1/;
+
+#include "exynos850.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+
+#define BOARD_ID	0x0
+#define BOARD_REV	0x2
+
+/ {
+	model = "WinLink E850-96 board";
+	compatible = "winlink,e850-96", "samsung,exynos850";
+	board_id = <BOARD_ID>;
+	board_rev = <BOARD_REV>;
+
+	chosen {
+		stdout-path = &serial_0;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&key_voldown_pins &key_volup_pins>;
+
+		volume-down-key {
+			label = "Volume Down";
+			linux,code = <KEY_VOLUMEDOWN>;
+			gpios = <&gpa1 0 GPIO_ACTIVE_LOW>;
+		};
+
+		volume-up-key {
+			label = "Volume Up";
+			linux,code = <KEY_VOLUMEUP>;
+			gpios = <&gpa0 7 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		/* HEART_BEAT_LED */
+		user_led1: led-1 {
+			label = "yellow:user1";
+			gpios = <&gpg2 2 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+		};
+
+		/* eMMC_LED */
+		user_led2: led-2 {
+			label = "yellow:user2";
+			gpios = <&gpg2 3 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "mmc0";
+		};
+
+		/* SD_LED */
+		user_led3: led-3 {
+			label = "white:user3";
+			gpios = <&gpg2 4 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "mmc2";
+		};
+
+		/* WIFI_LED */
+		wlan_active_led: led-4 {
+			label = "yellow:wlan";
+			gpios = <&gpg2 6 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "phy0tx";
+			default-state = "off";
+		};
+
+		/* BLUETOOTH_LED */
+		bt_active_led: led-5 {
+			label = "blue:bt";
+			gpios = <&gpg2 7 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "hci0rx";
+			default-state = "off";
+		};
+	};
+};
+
+&oscclk {
+	clock-frequency = <26000000>;
+};
+
+&rtcclk {
+	clock-frequency = <32768>;
+};
+
+&usi_uart {
+	samsung,clkreq-on; /* needed for UART mode */
+	status = "okay";
+};
+
+&serial_0 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart1_pins>;
+};
+
+&watchdog_cl0 {
+	status = "okay";
+};
+
+&watchdog_cl1 {
+	status = "okay";
+};
+
+&rtc {
+	status = "okay";
+};
+
+&mmc_0 {
+	status = "okay";
+	mmc-hs200-1_8v;
+	mmc-hs400-1_8v;
+	cap-mmc-highspeed;
+	non-removable;
+	broken-cd;
+	mmc-hs400-enhanced-strobe;
+	card-detect-delay = <200>;
+	clock-frequency = <800000000>;
+	bus-width = <8>;
+	samsung,dw-mshc-ciu-div = <3>;
+	samsung,dw-mshc-sdr-timing = <0 4>;
+	samsung,dw-mshc-ddr-timing = <2 4>;
+	samsung,dw-mshc-hs400-timing = <0 2>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&sd0_clk_pins &sd0_cmd_pins &sd0_rdqs_pins &sd0_nreset_pins
+		     &sd0_bus1_pins &sd0_bus4_pins &sd0_bus8_pins>;
+};
+
+&pinctrl_alive {
+	key_voldown_pins: key-voldown-pins {
+		samsung,pins = "gpa1-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	key_volup_pins: key-volup-pins {
+		samsung,pins = "gpa0-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+};
-- 
2.30.2

