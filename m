Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.81
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795249472;
	b=acnlHNLKidzp8TKP5XF+56qQIz/S7xLkO/MrRgy4hg4/J2rF3XHw18LzvONAVw4qIrOW
	 bHR8R+o8m8tZG5fih8uWDkZc5n40x4tZlPOfgOGOx+0iqHSRsWOnmZIe4KbavBAQUGXRE
	 OYRmoHy6w8ydHkfbJvWqcST4xQPOWi7XRezSXCEPWNmn4LuqktLwJwnbxVXNfDAKUhfIh
	 2kDz/leINhB05EMtM7Ft0KDPq+ep+B2IiJHPa0THAxh8C41v7hF6fxsmaAcjXlELRPlOw
	 jEGxiLuOBaTomZsJ6D9Ec9vAuPgAewo5HS6zOov0YmTDKsNcdoT16rArvN1jUzuiT5A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795249472;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=fn6MA5wvwdgU/LQGq+H1dBRC+v3xURWQDakqTLJM3PY=;
	b=UQjcEaDgaWQAoqhZ+iG+QW4Vuk7Uig5Pyfk6UzfV+Q7KZ9Y6S2Yx0UUi37C0+qmWfRdx
	 snwqQpApNPVLaWwYhsssIp0SoM1FT6zSUBhtoEiBEev4Z91BIYISYZUXfsmiUf5kYtVch
	 cT5sOgj+/ZiqX0x96PV5zSIxJZypWCmxqyL5usv3IGqIPwKv77YA3+HUxb2HsLZPScoDO
	 +QJNjZd0KVRARqo1WAIClU0dQgf//uBfvUfk4CRqy+z6qlJXAbuB3RJSD/dG59c0W4Sv2
	 4QF2dp+OPKu92I8HbelV+fXtIY/HWonq16wmAhh3Yj9RL9PFWLqucaK5v0Kcuzy5SCw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=ommer.net;
	spf=fail smtp.mailfrom=ommer.net;
	dkim=pass header.d=ommer.net header.i=@ommer.net header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=HTbEj4zx;
	dkim=pass header.d=ommer.net header.i=@ommer.net header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b="ZgTH/9ff";
	arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.81
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7FC606A330;
	Sat, 21 Nov 2026 08:24:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF7FC606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ommer.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=ommer.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ommer.net header.i=@ommer.net header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=HTbEj4zx;
	dkim=pass header.d=ommer.net header.i=@ommer.net header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=ZgTH/9ff
ARC-Seal: i=1; a=rsa-sha256; t=1795249464; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=bRHHXpPKKpTAiFh4USQ3abSzOtk/zA1iCYuILzKYfv10cpRO43ym+Sh1iyzVztDYfI
    4g2skXdBBmdlaq91JfcF3z1e9IyQa558HRhf0oQodX2Ndztqq6MzeJZu/EFBYuhmgjDe
    +1MAv2rPFQrOp/+e5oC7DP++uMqreaWyT2xxJ2pc5RzX9DHn+zB80LP72W09mNx7ZPZS
    Y1aXMQXfd1xYYidkbJnTdPvFloIF0mAf//cPLgT+3fAd5kKYhesHzSqDyytON+FQj2VU
    BaZaqJfSt403hl4y3whl0Id7KtewT1DfctNDSsNbLPj8dMLDPL1U5s4j5cIKhrA48+KA
    XcKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1795249464;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=fn6MA5wvwdgU/LQGq+H1dBRC+v3xURWQDakqTLJM3PY=;
    b=tdyUrEKZcP9rICygyLAdsePgVRTi7RVQAlrSPs6Gs8hfILIfzPcP8PTDGyOibPPd9o
    +q3tddhvOOhI/Y1gKGvtxXn/V0eue7aYZLa+dxm1K4vYm0GJ1jqR38hUkmkcwokv0NM9
    JBHtC4ZA/WXO1glMjR/UXl2yClQPAbPZLy1jDPINobATAsKlwo0haLoyEu3Yo700NcYQ
    CrrNOLnxColPg7hGz+0DQQtZO4qPlMbBMF7i7asv7xBzGdSkvLOwLh1hgM74enoBtyDE
    1YVuqt6njzuKz9oPQAYgVTc/SLBxuVv9XImGTbSOsx1zkV7s8x4QYSVf+hFvOgXdPrg+
    Mo1A==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1795249464;
    s=strato-dkim-0002; d=ommer.net;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=fn6MA5wvwdgU/LQGq+H1dBRC+v3xURWQDakqTLJM3PY=;
    b=HTbEj4zxCoHraKrSczsj4QWiZAcO/3M5QqBuxMdiKYprkSbsXZBcz7tKa03VRjYzCu
    3a+pSld5rfVMtb8MYa/EUHrw7uAjAz/KHkHqADgjM8RTgqTqAsJF3inIeqpbe3KXLM3K
    2HYgjYVGBbOBxXc5VfT4tqOR9Apgj9kpzjRjOu2EI9CdkvQpWcq9GfzQzd4KcKiXisdL
    TF6pR6TTV0trm0IpPvdKOZDop9KNJdntV0ZuLGkAEwBs3BiMxkNmt8LOODrm0/8gefqP
    fNWGK18FOHyIdYV8zkz1sDBb7iOd9ggpCuHXLZk+T9A2FI/Zi+6o6poWI8kpJ+EbbNZr
    ia0w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1795249464;
    s=strato-dkim-0003; d=ommer.net;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=fn6MA5wvwdgU/LQGq+H1dBRC+v3xURWQDakqTLJM3PY=;
    b=ZgTH/9ffWHkssfYVXa2qCVsnMk7qWf6QL+FpU4JieT+c8MJPHcDsC6kahzuTUlCiBP
    HMTrsSBpAE/qNeg+n+BQ==
X-RZG-AUTH: ":JGkKZ0mIdPJLfj3rk5MOrv6kH/tvwFubxUqMvsWOyVXJkOABZnPqvKUstHY8FQgi4y8Fiu3j5HL2zuVyTQ9NDYXzNSFFaQ=="
Received: from localhost.localdomain
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id n2f42d2AL8ONV5C
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sat, 21 Nov 2026 09:24:23 +0100 (CET)
From: Henri Ommer <henri@ommer.net>
To: krzk+dt@kernel.org,
	peter.griffin@linaro.org,
	alim.akhtar@samsung.com,
	robh@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Henri Ommer <henri@ommer.net>
Subject: [PATCH 2/2] arm64: exynos: Add support for Samsung Galaxy A20e
Date: Sat, 21 Nov 2026 09:24:04 +0100
Message-ID: <20261121082404.24864-3-henri@ommer.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261121082404.24864-1-henri@ommer.net>
References: <20261121082404.24864-1-henri@ommer.net>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

This initial bringup consists of
- memory
- internal MMC
- GPIO keys (volume and power)

The device boots into LightDM on Nura/postmarketOS

Signed-off-by: Henri Ommer <henri@ommer.net>
---
 arch/arm64/boot/dts/exynos/Makefile           |   1 +
 .../arm64/boot/dts/exynos/exynos7885-a20e.dts | 132 ++++++++++++++++++
 2 files changed, 133 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos7885-a20e.dts

diff --git a/arch/arm64/boot/dts/exynos/Makefile b/arch/arm64/boot/dts/exynos/Makefile
index f1946a95c..f359b5776 100644
--- a/arch/arm64/boot/dts/exynos/Makefile
+++ b/arch/arm64/boot/dts/exynos/Makefile
@@ -12,6 +12,7 @@ dtb-$(CONFIG_ARCH_EXYNOS) += \
 	exynos7870-j6lte.dtb		\
 	exynos7870-j7xelte.dtb		\
 	exynos7870-on7xelte.dtb		\
+	exynos7885-a20e.dtb		\
 	exynos7885-gta3xllte.dtb	\
 	exynos7885-jackpotlte.dtb	\
 	exynos850-a217f.dtb		\
diff --git a/arch/arm64/boot/dts/exynos/exynos7885-a20e.dts b/arch/arm64/boot/dts/exynos/exynos7885-a20e.dts
new file mode 100644
index 000000000..61f6e5c53
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynos7885-a20e.dts
@@ -0,0 +1,132 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Samsung Galaxy A20e (a20e/SM-A202F) device tree source
+ *
+ * Copyright (c) 2026, Henri Ommer <henri@ommer.net>
+ */
+
+/dts-v1/;
+#include "exynos7885.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+
+/ {
+	model = "Samsung Galaxy A20e";
+	compatible = "samsung,a20e", "samsung,exynos7885";
+	chassis-type = "handset";
+
+	chosen {
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <1>;
+		bootargs = "console=tty0 clk_ignore_unused pd_ignore_unused regulator_ignore_unused pmos.nosplash";
+
+		framebuffer0: framebuffer@ec000000 {
+			compatible = "simple-framebuffer";
+			reg = <0x0 0xec000000 (720 * 1560 * 4)>;
+			width = <720>;
+			height = <1560>;
+			stride = <(720 * 4)>;
+			format = "a8r8g8b8";
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-0 = <&key_volup &key_voldown &key_power>;
+		pinctrl-names = "default";
+
+		power-key {
+			gpios = <&gpa1 7 GPIO_ACTIVE_LOW>;
+			label = "Power";
+			wakeup-source;
+			linux,code = <KEY_POWER>;
+		};
+
+		voldown-key {
+			gpios = <&gpa1 6 GPIO_ACTIVE_LOW>;
+			label = "Volume Down";
+			linux,code = <KEY_VOLUMEDOWN>;
+		};
+
+		volup-key {
+			gpios = <&gpa1 5 GPIO_ACTIVE_LOW>;
+			label = "Volume Up";
+			linux,code = <KEY_VOLUMEUP>;
+		};
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x3bc00000>,
+		      <0x0 0xc0000000 0x40000000>,
+		      <0x8 0x80000000 0x3fffffff>;
+	};
+
+	reserved-memory {
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <1>;
+
+		cont_splash_mem: framebuffer@ec000000 {
+			reg = <0x0 0xec000000 (720 * 1560 * 4)>;
+			no-map;
+		};
+	};
+};
+
+&mmc_0 {
+	bus-width = <8>;
+	cap-mmc-highspeed;
+	card-detect-delay = <200>;
+	clock-frequency = <800000000>;
+	mmc-hs200-1_8v;
+	mmc-hs400-1_8v;
+	mmc-hs400-enhanced-strobe;
+	non-removable;
+
+	pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_rdqs &sd0_bus1 &sd0_bus4 &sd0_bus8>;
+	pinctrl-1 = <&sd0_clk_fast_slew_rate_1x>;
+	pinctrl-2 = <&sd0_clk_fast_slew_rate_2x>;
+	pinctrl-3 = <&sd0_clk_fast_slew_rate_3x>;
+	pinctrl-4 = <&sd0_clk_fast_slew_rate_4x>;
+	pinctrl-names = "default",
+			"fast-slew-rate-1x",
+			"fast-slew-rate-2x",
+			"fast-slew-rate-3x",
+			"fast-slew-rate-4x";
+
+	samsung,dw-mshc-ciu-div = <3>;
+	samsung,dw-mshc-ddr-timing = <2 4>;
+	samsung,dw-mshc-hs400-timing = <0 2>;
+	samsung,dw-mshc-sdr-timing = <0 4>;
+
+	status = "okay";
+};
+
+&oscclk {
+	clock-frequency = <26000000>;
+};
+
+&pinctrl_alive {
+	key_power: key-power-pins {
+		samsung,pins = "gpa1-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_F>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	key_voldown: key-voldown-pins {
+		samsung,pins = "gpa1-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_F>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	key_volup: key-volup-pins {
+		samsung,pins = "gpa1-5";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_F>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+};
-- 
2.56.0

