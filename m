Received: from out-03.smtp.spacemail.com (out-03.smtp.spacemail.com [63.250.43.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809EB193061;
	Mon,  2 Dec 2024 16:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733156558; cv=none; b=APb4UCzfJ9yGHq/F80CmaGqPTLT1pOrku2SUdr+xmIehkOxF1VAgwtxGA2sjLUYh4TzG63aNiSQplvpER/S/7Lwwtyg1vk0BB8d/1lMrm4JANM86fFtKAaQ4XNOQP5WA+f1HKFxhrp1gIvzSBi+xbAYOFyRZhpbgkAxYJSpAS/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733156558; c=relaxed/simple;
	bh=jOxsA+CL9aUkhSVrBAbfTar5Qf4DtRIr0OegAhr6BDM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z9D3UAnHQ2sWa/OeU9/eVdKxtc8k69zzX7C/xsLtlEaBGVzKjFTKJlZERZ2k3qPVT+R2T5annGkxMzrFvv8XiGx7tNGeNd+Gejn//zMVBG4B5tSFDLIblW1ZLMTnoKymQg9q1/MJylGY3/tD174EflRcL6z6Y0OSVyZUaGI3S98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b=EmkR19qu; arc=none smtp.client-ip=63.250.43.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b="EmkR19qu"
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4Y28Ff54vFzGpHk;
	Mon, 02 Dec 2024 16:22:30 +0000 (UTC)
Received: from umer-b550pro4.lan (host-213-78-252-153.as13285.net [213.78.252.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4Y28FV1NGCz6tkP;
	Mon,  2 Dec 2024 16:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1733156545;
	bh=jOxsA+CL9aUkhSVrBAbfTar5Qf4DtRIr0OegAhr6BDM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EmkR19quzcs03s+ltBDWUG3sxlu+tTZ66ElinH0HqGX20gOl6r5XrFwIPnvC7jKuh
	 oCB7z6iGX863yHDNaQkJQKNS+Tig7lNokraPBibwxPfR9gynJpM6YqVXkR18WxjbM8
	 O/G4bbWYdJy2w0c6Zp3IzhHuH2UXU/CndZd+XXH0tUCYEDsK6eisGg20ARsjYuP9ug
	 6PILKZyaCht+5yZ5m1wIZd1dDwo55vXMywCaYvncLWDHIkoU0KLz7TlufK2zsElEzD
	 umG3ajoRiE0S3U4hDPvTl+Eb2Hv7oNmsYGUIFRL44/Rhq2oNxZc+q0TMMm3D+zRO3+
	 NC9g+Ldd52GxQ==
From: Umer Uddin <umer.uddin@mentallysanemainliners.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	igor.belwon@mentallysanemainliners.org
Subject: [PATCH v3 2/4] arm64: dts: exynos: Add initial support for Samsung Galaxy S20 Series boards (hubble)
Date: Mon,  2 Dec 2024 16:21:56 +0000
Message-ID: <20241202162158.5208-3-umer.uddin@mentallysanemainliners.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241202162158.5208-1-umer.uddin@mentallysanemainliners.org>
References: <20241202162158.5208-1-umer.uddin@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add initial support for the Samsung Galaxy S20 Series (hubble) phones.
They were launched in 2020, and are based on the Exynos 990 SoC.
The devices have multiple RAM configurations,
starting from 8GB going all the way up to 16GB for the S20 Ultra devices.

This device tree adds support for the following:

- SimpleFB
- 8GB RAM (Any more will be mapped in device trees)
- Buttons

Signed-off-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>
---
 .../dts/exynos/exynos990-hubble-common.dtsi   | 98 +++++++++++++++++++
 1 file changed, 98 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos990-hubble-common.dtsi

diff --git a/arch/arm64/boot/dts/exynos/exynos990-hubble-common.dtsi b/arch/arm64/boot/dts/exynos/exynos990-hubble-common.dtsi
new file mode 100644
index 000000000..55fa8e9e0
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynos990-hubble-common.dtsi
@@ -0,0 +1,98 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+/*
+ * Samsung Galaxy S20 Series device tree source
+ *
+ * Copyright (c) 2024, Umer Uddin <umer.uddin@mentallysanemainliners.org>
+ */
+
+/dts-v1/;
+#include "exynos990.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		framebuffer0: framebuffer@f1000000 {
+			compatible = "simple-framebuffer";
+			reg = <0 0xf1000000 0 (1440 * 3200 * 4)>;
+			width = <1440>;
+			height = <3200>;
+			stride = <(1440 * 4)>;
+			format = "a8r8g8b8";
+		};
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		cont_splash_mem: framebuffer@f1000000 {
+			reg = <0 0xf1000000 0 0x1194000>;
+			no-map;
+		};
+
+		abox_reserved: audio@f7fb0000 {
+			reg = <0 0xf7fb0000 0 0x2a50000>;
+			no-map;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&key_power &key_voldown &key_volup>;
+		pinctrl-names = "default";
+
+		power-key {
+			label = "Power";
+			linux,code = <KEY_POWER>;
+			gpios = <&gpa2 4 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+
+		voldown-key {
+			label = "Volume Down";
+			linux,code = <KEY_VOLUMEDOWN>;
+			gpios = <&gpa0 4 GPIO_ACTIVE_LOW>;
+		};
+
+		volup-key {
+			label = "Volume Up";
+			linux,code = <KEY_VOLUMEUP>;
+			gpios = <&gpa0 3 GPIO_ACTIVE_LOW>;
+		};
+	};
+};
+
+&oscclk {
+	clock-frequency = <26000000>;
+};
+
+&pinctrl_alive {
+	key_power: key-power-pins {
+		samsung,pins = "gpa2-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	key_voldown: key-voldown-pins {
+		samsung,pins = "gpa0-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	key_volup: key-volup-pins {
+		samsung,pins = "gpa0-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+};
-- 
2.47.1

