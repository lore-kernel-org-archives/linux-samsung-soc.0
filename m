Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794258127;
	b=C/s8uCWyIXbn4ktEqfuzsWMk6X0oZ2mi4+jb9LNz0Y1e6HI+6vUgpJJD0izkYixCEMz6
	 KVILEjPHRBbmkx+labJ4HZK9Rwk8G5Mp7+Ap1G8YS2INx+/H+mW14xwQPMbsz2sWgrVoe
	 K0u8RqqqeI/IxM2J1arcgMkWBQTIVUrxBJ1Z7dbIjQ6Oc7O9q0y/Cwv5hAz3flG+f6uZ1
	 lwi5zx9pxpHcYXR+J1id3Ry0buLISPkCrG2cbgl5zIVPyf1veZgivengfBse1dkZvUTOI
	 FWwZkLvSZQlmItjIxqbwERWBP722KzqLSMwCR52lIGeeGgAwSenTIh8gbL59XEmwnjw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794258127;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ybdiC4v8M6MlJX8IenI/O7Y+PfdEKUgT1iXHB+Uir/M=;
	b=wpqZiLmS6KJJ+tlWBNntuxgb5LxPERe3qJm3+2ztxvnt0qp9Qxu2kPm9wzAn4HrdYLJA
	 ZZfI+kNbSTqAzN75MVWB5mV60qX6M/dUiyFc7bT70h5s0rePllWGYJalBgNRdhJ9NvDoR
	 pE6Nt1Cx2roTnj9otH4HUukvMG4jjIKycWZmZ3cwzNrIHyUlJAPNXoWuGKVKVm8vTnFnd
	 mjuEv7lTTiLI5u+HRjB7aVNg7lyV5gWDn3jBOO25lJKE139ysEKwxjerR7DsLlZW+dvpN
	 84n3K88Lqy5ZbIxAnxmgEqwsPpCXFTjF7lP7jWZWDsdI6JDU17zhV/wqurWtiQpSYbw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fUJKdjCe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DD3606A31C;
	Mon,  9 Nov 2026 21:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fUJKdjCe
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794258126;
	b=ILlpUuNYwZyRmFQrSJX9eDFf3ungVoWp8cMszD6653DM8Q/bPesJaguk30aZRqZEyF6c
	 c0LzNdbrxAGj8lAS9h+p+gO9GjHViCWar0cklw0Rxqsu+b+s+trHZhc0YcRJxDJEwKDW+
	 Mly9RkguZZeEYnDpE2njuTBX+mHMQhRhN+6Ag5UdlQ4lr8A+OCAE3hEEWbq1UXdWehosy
	 yfCdUO3SKBr+YbaUQ6ixdwn2XT/2vAJb+0U8/cYQbEeETw1OnS8l+tAhIdzCdAfzs48wx
	 Mp7euOlhx0n8sbkTvMZ/Zy5vWvPJIw+1hH7xg/7ofEk5TSbDIVXb/r+p82dYptT6Nwg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794258126;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ybdiC4v8M6MlJX8IenI/O7Y+PfdEKUgT1iXHB+Uir/M=;
	b=zQIXUFY3UQhIuH6pPofc+6Rk/aknpBzk85EwtgUcpsIduV0JIIARn8lq5UK+001+1E2E
	 td6DahCbKPF/tDBItR8qHXti1ciWtxYmzdvsxBqKJAXjwoYik9g3NMeoGwJPQMlJiNJu8
	 wG9J6xLkDsxQdU+nSppxCWfOZ+eQYBxMhZl6Ng/a9vJ8YTyiK42l4OMimsWGNr+BQKE/B
	 PHiSpTjR/yvPB2XCAwoJy5/58YnjgYycpUMv7nIwm7POzHRRMHbx133COCnMI3cFH6bp6
	 +ppHvlYyoycov7aEcoCluqJVT5eMBKcWxcoJzx83etdgJ1URbwfXtuyvsUXpmgjx0Ew==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 02E9B1F008A3;
	Mon,  9 Nov 2026 21:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794258126;
	bh=ybdiC4v8M6MlJX8IenI/O7Y+PfdEKUgT1iXHB+Uir/M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=fUJKdjCe+HW7LRzytHgED8RESMNh24BjLkv6/TkDmsOWOdGr+SWdvWshd1A4VOaY4
	 +GNPk6zfbQx3Zo0IRMnWONhLhLCsQMjpzyiXNMM5UwhtvdRoZeX4+h3F4v7xPallaE
	 7chuD7eLu/mDxwC7MxSaGFhRNVKpcn0H8CKvRCFnORTwHUsSbxtIv/2IDWVHyfYGrG
	 3YNlFkmWfErKBXm9qDnmT5VkMxXSumqGBaXHfD6bA33msXNr27zWH5Vue3XIAt1GoP
	 i4KlkxJhdx00aEm7SJ0zg8gu0SxSG1RwJ5N3RFdHDJiNlFXrs0jiLrnHhb/yYHHq1u
	 95WWefpNGOa5g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 7AB4F4867D;
	Mon,  9 Nov 2026 21:02:04 +0000 (UTC)
From: Umer Uddin via B4 Relay <devnull+umer.uddin.mentallysanemainliners.org@kernel.org>
Date: Mon, 09 Nov 2026 21:02:03 +0000
Subject: [PATCH v2 2/2] arm64: exynos: Add initial support for Samsung
 Galaxy Tab A 10.1 (2019, 4G)
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
Message-Id: <20261109-gta3xllte-support-v2-2-85c31b6efebd@mentallysanemainliners.org>
References: <20261109-gta3xllte-support-v2-0-85c31b6efebd@mentallysanemainliners.org>
In-Reply-To: <20261109-gta3xllte-support-v2-0-85c31b6efebd@mentallysanemainliners.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Umer Uddin <umer.uddin@mentallysanemainliners.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794258123; l=4267;
 i=umer.uddin@mentallysanemainliners.org; s=20261109;
 h=from:subject:message-id;
 bh=eEsZaspggx8BPKN712bRu9JrPSLF48OkOU10L6YuavM=;
 b=0vHH1hvp7TgGIuMg2ilVfQYx133OOp+vlddohJYFReaI+hUvfkoslhBKcnfMF+fuTTlBcAO5K
 xAVEoapDqnwCSwEKDv1138rw/WwlAwZda808714wUsC2tSAlz7OBa2Q
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
 .../arm64/boot/dts/exynos/exynos7885-gta3xllte.dts | 129 +++++++++++++++++++++
 2 files changed, 130 insertions(+)

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
index 000000000000..03476f8b1200
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynos7885-gta3xllte.dts
@@ -0,0 +1,129 @@
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
+
+/ {
+	model = "Samsung Galaxy Tab A 10.1 (2019, 4G)";
+	compatible = "samsung,gta3xllte", "samsung,exynos7885";
+	chassis-type = "tablet";
+
+	aliases {
+		mmc0 = &mmc_0;
+		serial0 = &serial_0;
+		serial1 = &serial_1;
+		serial2 = &serial_2;
+	};
+
+	chosen {
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <1>;
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
+		reg = <0x0 0x80000000 0x3dd00000>,
+		      <0x0 0xc0000000 0x40000000>;
+	};
+
+	reserved-memory {
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <1>;
+
+		cont_splash_mem: framebuffer@ec000000 {
+			reg = <0 0xec000000 0x01400000>;
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
+	pinctrl-0 = <&sd0_clk_fast_slew_rate_3x &sd0_cmd &sd0_rdqs
+		     &sd0_bus1 &sd0_bus4 &sd0_bus8>;
+	pinctrl-names = "default";
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


