Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E8C136658;
	Thu, 14 Nov 2024 14:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731595025; cv=none; b=CkKqH2GObO7GdCBNcYi8PTq7UOpMwnklflGLnh61bylnTWkdlhjMF2NwLUfw51ihWuGhRrmgVY3OFnH/oOA5m4/aQxGiaT2MBbfPpStvwYuZ+htvj9YgJR6ij6qd9ce+jBr+T/V/HNpOCe2/vHf0KuLo3Nks+2FIsEEeMO4ynno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731595025; c=relaxed/simple;
	bh=4ZkpScxoggvW3svRDxvCxH7viLFxvvGKl1hlfnj6dx4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fYQR/hT7MPooA35W9DlklZvlPRNxY8i8eXTfCbY7wqb9Fh1cnRuJnhEfVgY4LZF26m90zMvsn/6e0pxT61lfcCSOXhg0zYY/OFvq0HqVfmbSG9PsQ6Z6RYEXeSk/PLe5Z0fZXUz62gYbf0Iq0ZyBc/jvQb71TnkeCqQJxkbBrbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CjYJQpG+; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CjYJQpG+"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-290d8d53893so270956fac.2;
        Thu, 14 Nov 2024 06:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731595023; x=1732199823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IGt3perR6MKvrKIP+pWiAPIqBuHbAKWRSnzDOTu938g=;
        b=CjYJQpG+z7iWlz6nr138rjQG1JRl9sitxaf7o4zZsHloFJhDysSdbFffmQZKBy/LHr
         6rkIFz6qehWNvtb5SoGq1nmFtdXAtnBvg5kSIC+2liqOIvZgfQhrVpa+qejM8oQviamE
         ILZwAgFjUTZerr6UePNs/cMCKsILu5RmlRtxW5rm9XgOdhZQwF/PIr43Dn9KiXGZ2LkS
         dylvEOxDiuYW2a9kmxU3IfhBFJhicrZ1JPpWrdDWJrsEUDwjMeYI2MQnBhHwBuFo36PR
         tdbjpI202PpXfS8PiARUVCoz9FXawCGyAdZ22nP8Dy33wcNS7ULoEvg5plUReP7/4kg7
         EB/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731595023; x=1732199823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IGt3perR6MKvrKIP+pWiAPIqBuHbAKWRSnzDOTu938g=;
        b=H1SuwffUHNL0KppN2s+H5S9cNnxuxG9v1XMbQlQghrEwn8lp2uaNlxQJYiVWG8RVwS
         ni7zzg2hE8bikhoW6eUD7QxT9xNndQRVjKT975Sv1CetOfqyGJfy60iZqbDn+eUbl8SO
         ObGdUEWAycnzG7sWA4t8Q1l4SwiEwDGQrjQcsnj79QS63OI+wJ1AsdzVfJGtZCyTaKXm
         OVVqv3DU0w+Sv2oizB3kPV5eufd5WIOpi4MtBdc3ODo1GftrXSTmvClgATj6ihRumQ7k
         WNt0LYB1Bw+ZTxmjFxidhRdyFGILLYldcHqc7bt40+As5NkQAOTBX9Ufy7fqOU1ZgftG
         pAEg==
X-Forwarded-Encrypted: i=1; AJvYcCUHYzcKT8Kvz8PZKPNsUunOu9/KXwxiKm6YhtSShNdZwuNbaRqKb0NcOgVRtvGvxbbgLiW08K9mY5f+@vger.kernel.org, AJvYcCVy/y4vl7p/NIym4Q7EsiT12yqgBnduzB1ZJ23Ia/U2yPDFm0Na4sCJE8ZM9TTxXaJK0VQEiX/qcsaKZ/OJti1bhHk=@vger.kernel.org, AJvYcCXv5C28aTgC4R83eTIfPyLsHAkgTsLe+3HU8jVzZlKRddNw6YS2lLalhKx6cBpda8AbpKmUu2/xkVrBOznb@vger.kernel.org
X-Gm-Message-State: AOJu0Yx32lm6buObiL7hbs1u0mNCf9yKw7rDnbgce6kl2ui9JqZ31MuD
	oZFzAMLke/bd+hqluYEzA0dewyT53NkWoYpkDfTOj80m8CiRlgfFT9e+C+VU
X-Google-Smtp-Source: AGHT+IEqNhhPHGyb7oB+cPPBeJw9s37iJW919hbsr058ZKOG5V8yHEvVE7yjxHXwdc4ny2A8okRAGg==
X-Received: by 2002:a05:6870:d03:b0:261:877:7459 with SMTP id 586e51a60fabf-2956036baedmr20256480fac.38.1731595023281;
        Thu, 14 Nov 2024 06:37:03 -0800 (PST)
Received: from localhost.localdomain ([38.44.237.182])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-71a6eaeea60sm393294a34.43.2024.11.14.06.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 06:37:02 -0800 (PST)
From: Sota4Ever <wachiturroxd150@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] arm64: dts: Add initial support for Samsung Galaxy S20 FE (r8s)
Date: Thu, 14 Nov 2024 14:36:36 +0000
Message-Id: <20241114143636.374-3-wachiturroxd150@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241114143636.374-1-wachiturroxd150@gmail.com>
References: <20241114143636.374-1-wachiturroxd150@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Denzeel Oliva <wachiturroxd150@gmail.com>

Add initial support for the Samsung Galaxy S20 FE (r8s/SM-G780F) device.
Its launch was in 2020 and also based on the Exynos 990 SoC.
It is only configured with 6GB of RAM, although storage options may differ.

This device tree adds support for the following:

- SimpleFB
- 6GB RAM
- Buttons

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 arch/arm64/boot/dts/exynos/Makefile          |   1 +
 arch/arm64/boot/dts/exynos/exynos990-r8s.dts | 115 +++++++++++++++++++
 2 files changed, 116 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos990-r8s.dts

diff --git a/arch/arm64/boot/dts/exynos/Makefile b/arch/arm64/boot/dts/exynos/Makefile
index 7a934499b..948a2c6cb 100644
--- a/arch/arm64/boot/dts/exynos/Makefile
+++ b/arch/arm64/boot/dts/exynos/Makefile
@@ -9,5 +9,6 @@ dtb-$(CONFIG_ARCH_EXYNOS) += \
 	exynos850-e850-96.dtb		\
 	exynos8895-dreamlte.dtb		\
 	exynos990-c1s.dtb		\
+	exynos990-r8s.dtb               \
 	exynosautov9-sadk.dtb		\
 	exynosautov920-sadk.dtb
diff --git a/arch/arm64/boot/dts/exynos/exynos990-r8s.dts b/arch/arm64/boot/dts/exynos/exynos990-r8s.dts
new file mode 100644
index 000000000..b21863bbb
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynos990-r8s.dts
@@ -0,0 +1,115 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+/*
+ * Samsung Galaxy S20 FE (r8s/SM-G780F) device tree source
+ *
+ * Copyright (c) 2024, Denzeel Oliva <wachiturroxd150@gmail.com>
+ */
+
+/dts-v1/;
+#include "exynos990.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+	model = "Samsung Galaxy S20 FE";
+	compatible = "samsung,r8s", "samsung,exynos990";
+
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		framebuffer0: framebuffer@f1000000 {
+			compatible = "simple-framebuffer";
+			reg = <0 0xf1000000 0 (1080 * 2400 * 4)>;
+			width = <1080>;
+			height = <2400>;
+			stride = <(1080 * 4)>;
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
+		      /* Memory hole - last block */
+		      <0x8 0x80000000 0x0 0xc0000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		cont_splash_mem: framebuffer@f1000000 {
+			reg = <0 0xf1000000 0 0x13c6800>;
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
2.34.1

