Received: from out-02.smtp.spacemail.com (out-02.smtp.spacemail.com [63.250.43.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F511DFDB2;
	Thu, 17 Oct 2024 16:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729183439; cv=none; b=pVjjh7Uz51PrT5KRjzlIlfdM4J4RTCTQp1GA7Klbp2tp2etOfesIJ7wSJ5p9khmaEQopwEdJvKLW/AuNn6DrkURkFRLhAJ2iCmPFOJiwHH1+gSZg5tOx8nd8pyeaRlJceG/WYPa0C8KFZ3H7R72KAaHMmKj0HyFNXCz49TTKx3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729183439; c=relaxed/simple;
	bh=jmRMCdEnRZvQBpN/U+vpdq7Q26dSNADyNSxdGo7Ewcg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AjiswX6HpryNX3I+p65Vli8qZnwhNAjXJaHz5wik1+NWwEhZkBt39fnLAZc5Bphm9iIaYq+FZLdNiy7C3yaqkr0puJfVnDmdu93WILJPmKBeCNelDh+4ZtfDal/CLSmKFTV3pB0IToovWDQKny68C4mSLW9oIEhOpn/FRtGpBNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b=Q5PcmY3h; arc=none smtp.client-ip=63.250.43.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b="Q5PcmY3h"
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4XTtvM5zlNz4wgR;
	Thu, 17 Oct 2024 16:43:43 +0000 (UTC)
Received: from l-latitude7390.lan (host-80-41-166-50.as13285.net [80.41.166.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4XTtvD356Rz6tkP;
	Thu, 17 Oct 2024 16:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1729183418;
	bh=jmRMCdEnRZvQBpN/U+vpdq7Q26dSNADyNSxdGo7Ewcg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q5PcmY3hisL4AqxtAAjKzVI3JCGLuyKRk1Y2ogsW3rOFbV2BXPT7bC+SaBZ9O1mIL
	 iACsQD8fkMB1fHlyBsF9RpjsptFOOdjoHb6mY7IbYs7Hpoe5rlCuAVwK4UNx6T6J90
	 7qGz1630XLbQ6FIHoscvU28oxJeUP8tCqSqFdLp7Z5JKC9BWPavdoxbpKSOd4xlP1y
	 deGe8uDnDX1Vc0rRTJ1fM2nGWzKDrUg5q/p77zLwrLqpYclZ4Gh+9JjMRYFMEgfK78
	 kH+PhKFpa5SMHAhu6T4qr2hjZajr0x7gt3pyQZg2ACWOLgB+37bJiJbENCZhdj8vNo
	 x34O5IFR3pYIQ==
From: Umer Uddin <umer.uddin@mentallysanemainliners.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	igor.belwon@mentallysanemainliners.org
Subject: [PATCH v2 2/4] arm64: dts: exynos: Add initial support for Samsung Galaxy S20 Series boards (hubble)
Date: Thu, 17 Oct 2024 17:43:25 +0100
Message-ID: <20241017164328.17077-3-umer.uddin@mentallysanemainliners.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241017164328.17077-1-umer.uddin@mentallysanemainliners.org>
References: <20241017164328.17077-1-umer.uddin@mentallysanemainliners.org>
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
 .../dts/exynos/exynos990-hubble-common.dtsi   | 109 ++++++++++++++++++
 1 file changed, 109 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos990-hubble-common.dtsi

diff --git a/arch/arm64/boot/dts/exynos/exynos990-hubble-common.dtsi b/arch/arm64/boot/dts/exynos/exynos990-hubble-common.dtsi
new file mode 100644
index 000000000..2c634e4bb
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynos990-hubble-common.dtsi
@@ -0,0 +1,109 @@
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
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x0 0x3ab00000>,
+		      /* Memory hole */
+		      <0x0 0xc1200000 0x0 0x1ee00000>,
+		      /* Memory hole */
+		      <0x0 0xe1900000 0x0 0x1e700000>,
+		      /* Memory hole */
+		      <0x8 0x80000000 0x1 0x7ec00000>;
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
2.47.0

