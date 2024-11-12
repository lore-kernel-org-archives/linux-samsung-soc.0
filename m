Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0BA209F3C;
	Tue, 12 Nov 2024 19:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731439946; cv=none; b=G7qCR/Ne7ZlNXVx7boCWuoJ3uuvuid8+8lBYM6IC9OkAfxCagqv5QSTKs5RiZJhr2RlP3f/fIuvHStaLSM8JjOibI/0bnR50+HbAUvNxxN62ZNl4f6MILy5lCgodNcSDgponr+ZeKboWCMhBeglWEawDcYnaWz2o+f1ZtoYu1TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731439946; c=relaxed/simple;
	bh=r55Z6MOTixhxRiVu8ctWrgWSs1vzPVZVei/U/gnK6Tw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oAfl32bGpO3bA8ysGlwz796by9amCmAZAoGDHHPyS/GrJwdlylnluD6z9LRzI4vIuef721ONyQaSetsfcaVAeUglc1Y7D7q5nHpDwCGfQM3nBysTJBDBl0heD1y4nQfesh9QCWyopcn3oywlbqjz9FXZNkdrOY/RdgA6d0GuHBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HPTzy/Ba; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HPTzy/Ba"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2e2e2d09decso58070a91.1;
        Tue, 12 Nov 2024 11:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731439944; x=1732044744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CxZTbla4niJMH3tL1PwAlNcohgmLARZJ7Xx5m9G3Teg=;
        b=HPTzy/BaLwTTTJXtA8qpJBmle2WtexUORF3cvGyzl3Li1/Jc2YfzqJAPYT4qusWoEt
         LPhrWYprpNxeXBjghw6FluJF0+9myNHHsqmQLN5FfCBi9p56jfcw09sGAf7xRqdxA4sM
         RIUqiJ0F4nXQ5B/hV7Cgq8ZOV2JutV+DxGSNPEJggtxoNqJmrQDDpddpss23TnhI8MJI
         ykDMf4ujKfCPY6AwLNcEd2SuUSP1B2nki7qkcMOWz0zcQDWao65GesXTwhmFvQSHD1zi
         afxkmg9c6RjMAEZTKn/rRxM79lHLzYUUpVrQFDniCW5OkmqWpfmPoddzdgUXLjp9mmzk
         kD/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731439944; x=1732044744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CxZTbla4niJMH3tL1PwAlNcohgmLARZJ7Xx5m9G3Teg=;
        b=Oeix2LOplAOZcdyEakYkLWsgh50yFaNfrla8t4GDU80SgOwwwXFtzaUMNToVyU2XWN
         vhG9ZlCPZ2Ez/KuRG/SrjK6TnM7IXSIuLYNnSisLzoWSK9EFBO2onB+n9W6LoqVcQMT1
         qFJptEhSIfGxZxy8TcBQe3xM09elv96dM1xDe7HdD2jmIAU058f0RLZDIdbwKW7pKeGm
         Ha9EHYTFjzyERgvkJX3jGLVOiRc2pek5+gNgL/57oK/hxWRNvSDjP/DShWuCiLcLV1Cd
         mbaRGvvpmcCk/8CFamXlRjjB3igYviyLp1WBTOTVBm4lkltEPvd/X3ZfeTj1onJdHcsy
         BfMw==
X-Forwarded-Encrypted: i=1; AJvYcCVXcx3uVXHd4Ph+ejVWGNs8Njh4L7l8A9toRmQD81NxtO8ua2rt3qLmuQMABWkr9nfOR7HLUs5k/8KJReDn@vger.kernel.org, AJvYcCWTM8DZ/YrA/1N9e5SHJrfuD++8UpKJCI0+ba5yskle/kenYYvTC2v2TgEIp2veeoaz9kqmgVUjOkLD@vger.kernel.org, AJvYcCWk/ienGgm5JhgvHKBGQK+RwcY7W2wv4BY0i23fcGLzP2R6iPyLbeAcwEIXY3MKvz0iuHf/XRDS/S0BdF0qEuchzjc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRwHG/nq3iHIrX0NwAB9KzEGpGK/f0UK2MBfRdswVjS5qL1/6i
	uaNlZ9mkWW0Vyw4zM4uIKAzUF+c+NBdMpX2a5UrWK2zvWBu6yNSuZbUliWNn
X-Google-Smtp-Source: AGHT+IFqiKSGyEZPQe+kbya/qd5AI1ZcrPrnAzkyYfedyIbzQJKFkHklrRh2pQta+hx6XbHOJn//FA==
X-Received: by 2002:a17:90b:1a91:b0:2e2:c225:4729 with SMTP id 98e67ed59e1d1-2e9b0a3325emr27783101a91.8.1731439944497;
        Tue, 12 Nov 2024 11:32:24 -0800 (PST)
Received: from localhost.localdomain ([38.44.237.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e9a5fd17d8sm10988958a91.41.2024.11.12.11.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 11:32:24 -0800 (PST)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] arm64: dts: Add initial support for Samsung Galaxy S20 FE (r8s)
Date: Tue, 12 Nov 2024 19:31:49 +0000
Message-Id: <20241112193149.1262-3-wachiturroxd150@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241112193149.1262-1-wachiturroxd150@gmail.com>
References: <20241112193149.1262-1-wachiturroxd150@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
+		      <0x08 0x80000000 0x0 0x0c000000>;
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

