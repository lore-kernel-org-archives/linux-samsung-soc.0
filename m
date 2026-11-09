Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794254828;
	b=fzQrUEeWq1g+slEjssEpx9mqBWAHr/CyJ4/sgS8Bd+YdoDd3wbp4LOazOiEZyxotQlkQ
	 Ej2g/8dFLPzHPeCxhhIES5B4nLeTczTP+rXgiDdm4Bsw1DGhM4y2fSvEh0i7OipvVkjUg
	 L1sZoLHbFMJPGFJOHU5JW5NcjAVtzzvKTOEUbTz2ci1InPMRrCt5UD6eRsZa2oxMxqOeU
	 Ca1UwSaJBpssDS4sQwmWOj/1T8ERiapq/kGaHRDMDFFMBejA6xSXJGpBDaj10UelKc4MC
	 /M9BdOaRNWWrVgRkHDMRYeBvnpzwEBR0JQbDkPFslOgCNMToi/nRXPtkTFMkCrdFViw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794254828;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=UYW1wrkZr6Ve325KimyEhngJfnF/nxRsNmxSJ9VLYKA=;
	b=DEsYg0JrAJagluJf+X6qPqDXBINivR/03H/i9Q+LeAA9o+erD2VbCGZEq/u98GVwZUgs
	 dJtpIaYUks+BU2QHxoQRBlXnCuSPxeq6AokthEdtRW8wynDIxmiSaVprbh9ibZHsFAMR8
	 eI4BSyP0MN232lcA4CXoGrjy+pMz3rW5zcwObo5kZp/neDE96C3iKH+gy8HEwOrr7uRx2
	 4hhSz3vua3Bo59o77R4c+AMxe25ZPXJ2b8cGVanrwkPDiR0aG9/NK7R+SrrKLwL9pzgGr
	 Esu/wF0zu72sLWtuu7vrL+/1iR8px7+f/GfTN7fS51+86uz3Gojp/BU3uS8SWGso3Fg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NqCTYuMN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D57606A321;
	Mon,  9 Nov 2026 20:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NqCTYuMN
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794254828;
	b=B8SmZYrxmpRa2dFKX1uf/k2AixEZrULsJs8/xQcAeBNwxpmYSim/MXdcn8kNO3xAQwM2
	 rAyuHXFTWkQNaw6R9eKBEr7akJ9bBIeKAgAG55zAd4YOAzXN1zF6qfLv+zJ6DnmioJR1X
	 b89dqb4brvOpgMu54ItKgra9Am/G9Y6b08z7CjmmwTiootdHjFqfr2d/1v/oLf+atun+x
	 vop5+/wLvkmN3N7z1HpOcK4ZYBQkp+E4SeG3W7HzLR2czPOR3TXTjlAAMW6YMs2J7J6h4
	 JCvFJ/zaFFadofW2n2y+YNL9YEWeHVCboivOh22IdwqJFqdLdPxqCCy3ZfvGSyFuYyA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794254828;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=UYW1wrkZr6Ve325KimyEhngJfnF/nxRsNmxSJ9VLYKA=;
	b=NFpAeNnZHts6bhmW0n1c+dNPSNOL3J+Ee7Vq5/cWjTzKoawgcYtr7L1XGnPwJzRgBeIn
	 6R4GVhSQtXPPJVlmgqrbeaedbXWfueDHBwX0CoW80QqueYJ15U3vv3XHBrC39FaRNEEg/
	 495D1wk1xdul+nr/DWeehra49o5vjGSwV28q5cTNtF0ksI6exEfXeBSGtjYtlPcxdD8DH
	 G3wf5HrJNOpyL0Fz1c6u6o74DtjRg3Mvaa+fqPXSYqkZWBYZT70sT4lr8TH1r9B7PqXha
	 wz3ut8SeKq5I3bmR6mG5oYT9NZclBsUlqP8dDt3c9JR0Hpgc/clWJ8G+oMOweUK+nnw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1A25B1F008A2;
	Mon,  9 Nov 2026 20:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794254828;
	bh=UYW1wrkZr6Ve325KimyEhngJfnF/nxRsNmxSJ9VLYKA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=NqCTYuMNsI5bOix0FJYUSlgiUlJbo3p+6ZqDK1vIT/l6zHlC5nPgSbks9k7JoKKfK
	 uDDt2A9+d/HPzXC5+dGjf6ExHngoBXDrSyDbSl5CBhJtv92Hgz7Wo9rY1qvSESFrPT
	 pRbPhZDupJsUzWBUkNgIJW7ZaNCgatEd5vh0f83+B8cPk0tUuUupkNggWXV5lLlmLC
	 wUhTUI/3QtcHdNtU8UO/KCCw245HCA7JkxpG7E2tSxTUQsrt7ScjvyAHbQrAq8Aizq
	 Rgaxe30qzzlU1/oCffwy78DukK8GPcQH3SgXXO755hPaoo2V9Eaj6lQ0Hmp5VY81in
	 mNfrT4D0xH8eA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 939B148630;
	Mon,  9 Nov 2026 20:07:06 +0000 (UTC)
From: Umer Uddin via B4 Relay <devnull+umer.uddin.mentallysanemainliners.org@kernel.org>
Date: Mon, 09 Nov 2026 20:07:06 +0000
Subject: [PATCH 2/2] arm64: exynos: Add initial support for Samsung Galaxy
 Tab A 10.1 (2019, 4G)
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261109-gta3xllte-support-v1-2-dc0c4bfa8b44@mentallysanemainliners.org>
References: <20261109-gta3xllte-support-v1-0-dc0c4bfa8b44@mentallysanemainliners.org>
In-Reply-To: <20261109-gta3xllte-support-v1-0-dc0c4bfa8b44@mentallysanemainliners.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Umer Uddin <umer.uddin@mentallysanemainliners.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794254826; l=4320;
 i=umer.uddin@mentallysanemainliners.org; s=20261109;
 h=from:subject:message-id;
 bh=+LL3c8/ipkqWVv9r1KZLMf00kFeNiLI3tGaS/IhfK9M=;
 b=1kcjAI2er2E/jruRzNf2zvKZqzyiw+XYus1gGcAgQ2acyyMcd1aNiyOmUIXlsCD2XHRwvi2Iz
 Qkz61dJ2YHIC5f5Xxk/8vUV3LDCgTxMrvwqS7Z3qwA+FGzR1DS7nJYb
X-Developer-Key: i=umer.uddin@mentallysanemainliners.org; a=ed25519;
 pk=Hsgrt4A72CFTe27AI1AAWlnLsiQrlb4+T+cbrfWDhUA=
X-Endpoint-Received: by B4 Relay for
 umer.uddin@mentallysanemainliners.org/20261109 with auth_id=1466
X-Original-From: Umer Uddin <umer.uddin@mentallysanemainliners.org>
Reply-To: umer.uddin@mentallysanemainliners.org
Content-Transfer-Encoding: 7bit

From: Umer Uddin <umer.uddin@mentallysanemainliners.org>

Add initial support for Samsung Galaxy Tab A 10.1 (2019) is a tablet that
is based on Exynos7885, this patch adds support for the LTE variant.

This device tree adds support for the following:

- SimpleFB
- 2GB RAM
- Buttons
- Internal eMMC

Signed-off-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>
---
 arch/arm64/boot/dts/exynos/Makefile                |   1 +
 .../arm64/boot/dts/exynos/exynos7885-gta3xllte.dts | 130 +++++++++++++++++++++
 2 files changed, 131 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/Makefile b/arch/arm64/boot/dts/exynos/Makefile
index 7534b773d28f..f1946a95cb42 100644
--- a/arch/arm64/boot/dts/exynos/Makefile
+++ b/arch/arm64/boot/dts/exynos/Makefile
@@ -12,6 +12,7 @@ dtb-$(CONFIG_ARCH_EXYNOS) += \
 	exynos7870-j6lte.dtb		\
 	exynos7870-j7xelte.dtb		\
 	exynos7870-on7xelte.dtb		\
+	exynos7885-gta3xllte.dtb	\
 	exynos7885-jackpotlte.dtb	\
 	exynos850-a217f.dtb		\
 	exynos850-e850-96.dtb		\
diff --git a/arch/arm64/boot/dts/exynos/exynos7885-gta3xllte.dts b/arch/arm64/boot/dts/exynos/exynos7885-gta3xllte.dts
new file mode 100644
index 000000000000..0e4e6c0b20e1
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynos7885-gta3xllte.dts
@@ -0,0 +1,130 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Samsung Galaxy Tab A 10.1 (2019, 4G) (gta3xllte/SM-T515) device tree source
+ *
+ * Copyright (c) 2026, Umer Uddin <umer.uddin@mentallysanemainliners.org>
+ */
+
+/dts-v1/;
+#include "exynos7885.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+	model = "Samsung Galaxy Tab A 10.1 (2019, 4G)";
+	compatible = "samsung,gta3xllte", "samsung,exynos7885";
+	chassis-type = "handset";
+
+	aliases {
+		mmc0 = &mmc_0;
+		serial0 = &serial_0;
+		serial1 = &serial_1;
+		serial2 = &serial_2;
+	};
+
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <1>;
+		ranges;
+
+		framebuffer0: framebuffer@ec000000 {
+			compatible = "simple-framebuffer";
+			reg = <0 0xec000000 0x01400000>;
+			width = <1200>;
+			height = <1920>;
+			stride = <(1200 * 4)>;
+			format = "a8r8g8b8";
+		};
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <1>;
+		ranges;
+
+		cont_splash_mem: framebuffer@ec000000 {
+			reg = <0 0xec000000 0x01400000>;
+			no-map;
+		};
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x3dd00000>,
+		      <0x0 0xc0000000 0x40000000>;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&key_volup &key_voldown &key_power>;
+
+		volup-key {
+			label = "Volume Up";
+			linux,code = <KEY_VOLUMEUP>;
+			gpios = <&gpa1 5 GPIO_ACTIVE_LOW>;
+		};
+
+		voldown-key {
+			label = "Volume Down";
+			linux,code = <KEY_VOLUMEDOWN>;
+			gpios = <&gpa1 6 GPIO_ACTIVE_LOW>;
+		};
+
+		power-key {
+			label = "Power";
+			linux,code = <KEY_POWER>;
+			gpios = <&gpa1 7 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+	};
+};
+
+&mmc_0 {
+	mmc-hs200-1_8v;
+	mmc-hs400-1_8v;
+	cap-mmc-highspeed;
+	non-removable;
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
+	pinctrl-0 = <&sd0_clk_fast_slew_rate_3x &sd0_cmd &sd0_rdqs
+		     &sd0_bus1 &sd0_bus4 &sd0_bus8>;
+
+	status = "okay";
+};
+
+&oscclk {
+	clock-frequency = <26000000>;
+};
+
+&pinctrl_alive {
+	key_volup: key-volup-pins {
+		samsung,pins = "gpa1-5";
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
+	key_power: key-power-pins {
+		samsung,pins = "gpa1-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_F>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+};

-- 
2.56.0


