Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DEF35A3A5;
	Thu, 23 Apr 2026 21:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776978932; cv=none; b=Uo4RgvZUIoCxqYxBF14QSCHMDyDGUeFO4fP8PI30HFKGKgB2GtC49SZnw61CwpmoBq2MMFXUYNuFWWl1vOodF4z0cFhfB0xRyoTrvBk9uNFuO0F1ryOT0OCNyX65tgg4w5o4M3E2zay/M/t5Rh1uc4jW7+qOKDrKJxLftTSu8l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776978932; c=relaxed/simple;
	bh=huhIXe5LzTuSdn4x/eDx9x97adSs7l5TQbXWOlsR6Ss=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hf7MGUupmPbpNM2txM7avXefDn90vTG0zOnJ1fYoZQ0btdcuS8VsFpHk9fgp+5gypIMPQmdk2vy7NjgY2HsCIZUBsPQ1aYBNDfEoMOU5ukWeFgVw2Vrcn3iiT0XiCxQqokdydIPiGseTdP2nTZ9Q4SrvcDn54QGRgKP94S2zAUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space; spf=pass smtp.mailfrom=timmermann.space; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timmermann.space
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4g1plj03ssz9vM4;
	Thu, 23 Apr 2026 23:15:29 +0200 (CEST)
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of linux@timmermann.space designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=linux@timmermann.space
From: Lukas Timmermann <linux@timmermann.space>
Date: Thu, 23 Apr 2026 23:14:41 +0200
Subject: [PATCH 5/5] ARM: dts: exynos: Add display support for
 exynos5250-manta
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-manta-display-v1-5-196f80c5673a@timmermann.space>
References: <20260423-manta-display-v1-0-196f80c5673a@timmermann.space>
In-Reply-To: <20260423-manta-display-v1-0-196f80c5673a@timmermann.space>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Douglas Anderson <dianders@chromium.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Lukas Timmermann <linux@timmermann.space>, 
 Alexandre Marquet <tb@a-marquet.fr>
X-Rspamd-Queue-Id: 4g1plj03ssz9vM4

Adds the necessary entries for panel and backlight as
well as the fimd controller.

Signed-off-by: Alexandre Marquet <tb@a-marquet.fr>
Signed-off-by: Lukas Timmermann <linux@timmermann.space>
---
 arch/arm/boot/dts/samsung/exynos5250-manta.dts | 99 ++++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/arch/arm/boot/dts/samsung/exynos5250-manta.dts b/arch/arm/boot/dts/samsung/exynos5250-manta.dts
index 76d3657eb22f..eb97a28ff4e3 100644
--- a/arch/arm/boot/dts/samsung/exynos5250-manta.dts
+++ b/arch/arm/boot/dts/samsung/exynos5250-manta.dts
@@ -25,6 +25,29 @@ aliases {
 		mmc1 = &mmc_1; /* WiFi */
 	};
 
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pwm 0 1000000 0>;
+
+		brightness-levels = <2 255>; /* TODO */
+		num-interpolated-steps = <254>; /* TODO */
+		default-brightness-level = <102>; /* TODO */
+		post-pwm-on-delay-ms = <97>; /* TODO */
+
+		power-supply = <&backlight_reg>;
+		enable-gpios = <&gpg0 5 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-0 = <&led_bl_reset &pwm0_out>;
+		pinctrl-names = "default";
+	};
+
+	backlight_reg: regulator-backlight {
+		compatible = "regulator-fixed";
+		regulator-name = "APS_EN_18V";
+		pinctrl-0 = <&aps_en_18v>;
+		pinctrl-names = "default";
+	};
+
 	/* Voltage source unknown */
 	bmp180_vdda_reg: regulator-bmp180-vdda {
 		compatible = "regulator-fixed";
@@ -105,6 +128,28 @@ multi-led {
 		leds = <&status_red>, <&status_green>, <&status_blue>, <&status_white>;
 	};
 
+	panel {
+		compatible = "samsung,ltl101dl02-002";
+
+		backlight = <&backlight>;
+		power-supply = <&panel_reg>;
+		enable-gpios = <&gph1 7 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&lcd_en>;
+		pinctrl-names = "default";
+		no-hpd;
+
+		port {
+			panel: endpoint {
+				remote-endpoint = <&dp_out>;
+			};
+		};
+	};
+
+	panel_reg: regulator-panel {
+		compatible = "regulator-fixed";
+		regulator-name = "LCD_EN";
+	};
+
 	pwrseq: mmc1-pwrseq {
 		compatible = "mmc-pwrseq-simple";
 
@@ -146,10 +191,36 @@ &cpu1 {
 	cpu-supply = <&buck2_reg>;
 };
 
+&dp {
+	status = "okay";
+
+	samsung,color-space = <0>;
+	samsung,color-depth = <1>;
+	samsung,link-rate = <0x0a>;
+	samsung,lane-count = <4>;
+	samsung,dynamic-range = <0>;
+	samsung,ycbcr-coeff = <0>;
+
+	ports {
+		port {
+			dp_out: endpoint {
+				remote-endpoint = <&panel>;
+			};
+		};
+	};
+};
+
 &ehci {
 	status = "disabled";
 };
 
+&fimd {
+	status = "okay";
+
+	assigned-clocks = <&clock CLK_MOUT_FIMD1>, <&clock CLK_MOUT_VPLL>;
+	assigned-clock-parents = <&clock CLK_MOUT_VPLL>;
+};
+
 &i2c_1 {
 	status = "okay";
 
@@ -396,6 +467,12 @@ ldo25_reg: LDO25 {
 	};
 };
 
+&mali {
+	status = "okay";
+
+	mali-supply = <&buck4_reg>;
+};
+
 &mixer {
 	status = "okay";
 };
@@ -489,6 +566,14 @@ wlan_irq: wlan-irq-pins {
 };
 
 &pinctrl_1 {
+	aps_en_18v: aps-en-18v-pins {
+		samsung,pins = "gph1-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>; /* TODO */
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_INPUT>; /* TODO */
+		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_UP>; /* TODO */
+		samsung,pin-val = <0>; /* TODO */
+	};
+
 	bh1721fvc_reset: bh1721fvc-reset-pins {
 		samsung,pins = "gph1-2";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
@@ -509,6 +594,20 @@ bt_wake: bt-wake-pins {
 		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_NONE>;
 	};
 
+	lcd_en: lcd-en-pins {
+		samsung,pins = "gph1-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>; /* TODO */
+		samsung,pin-val = <0>;
+	};
+
+	led_bl_reset: led-bl-rst-pins {
+		samsung,pins = "gpg0-5";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>; /* TODO */
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>; /* TODO */
+		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_NONE>; /* TODO */
+		samsung,pin-val = <0>; /* TODO */
+	};
+
 	msense_reset: msense-reset-pins {
 		samsung,pins = "gpg2-0";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;

-- 
2.53.0

