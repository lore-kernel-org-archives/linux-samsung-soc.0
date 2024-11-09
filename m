Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBE81A9B32;
	Sat,  9 Nov 2024 23:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731193467; cv=none; b=dtTEQVso6cEELBkmJjSDfKYdegihdeF+e8ruanTysMKXB+4KOHs4B+t2N/Mb1dcS0aFwHN9W8dr3qu1TLBW4BrmNmGj6zkbijzhv8GiGtPOI7A+94tGjPxj+QzeJ6mlJgcEmiyl1B40rnnRm1dINtobkKaOavRxRsHMgF/VSRos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731193467; c=relaxed/simple;
	bh=uPUkKT4dEr0T4gau4e/j6X7JAM+LdOF6JWUXj2ptDs0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GpsnevGGaC8oVmkc1SiYSHeFJeBlD4BELAvnpZTVDixrDmSpJ0VEhUu/qCPWlqYao2tMHiZd7DdjQwOKzj2SGOroyf+ELFVIXmKfuo4toyU63y5LQ4BbuxXmtevrwZ/Vxh52kwuEzlc3QkXcKuU5Jx2TV+YAqsnSpzr46EWIgME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lLMI4aop; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lLMI4aop"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-20c7ee8fe6bso33774705ad.2;
        Sat, 09 Nov 2024 15:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731193465; x=1731798265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h0TAscultBWfpxXBV9mGtO8Oc58VDQvYlCayV4b4ArM=;
        b=lLMI4aop0FQzOoczji0AJ/sagOwIKAJBZKtq34CJK6RHGvf8t6mBOS3VZn5NWLP1dp
         AVa89xLxoTcJ38VsiSTbA13NnrNBwE0jXg/JEjj9CBcbv2JmEwJVAwTGqCYVVG51ohmY
         b8R6vt2bqnpjJ4u5AeHHuxQLoZpeumoER75LsWCJmz87y3TFZ1RV/uDoo/sznGwAql/R
         g+wMvWh6+Rs9cQRsy0H06SHLkd9fpurCHItmy8q+C5GZ4iv2ANij4nIViU3vDYf34pVt
         TRFb43JD4MGYcomeCnwgF3m0gwvjl73H7lsMeTFW3KEAZyj3srXHVL9TplvZf3q9VEn6
         zz6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731193465; x=1731798265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h0TAscultBWfpxXBV9mGtO8Oc58VDQvYlCayV4b4ArM=;
        b=h1k/6v7FzkmgTHHTAtPFRQWE9k2Xh5TtHVgEOCO4Bp+dK3GHbGotzPrsvJAnnn8vLz
         FRVpot+erpRXuKKMN/TS6jaiu3oRf31SEj3MEsveBoS0CBcywP9HzzNxjtzGZitib5k/
         sMG7ETIS7VkuZ4EVq8uaK2fGdtcWz1xDtZmki3se9RQALMllAzSiAdxz5nHm4rSu2olM
         bN2fcRLwx+rbf97/ZQbNMudANPp9ZmzIIpvnaiigM8RwLrVN6PtIwgPTupnrP6WiS9zB
         QMDtRx9/Auog39YkWT+G6KMgD7KICIh1lhVbtOIRvpzc+jNNbMA1GlsW0/RDIPpGVAOI
         Xuhw==
X-Forwarded-Encrypted: i=1; AJvYcCUJOOMTOQaOKR08k6eSVco7cKCGi3oWC7TUM6dsCN0doou5WH3N/AMJ1W2PrHGQBvrUamoI8fOJxfLmGhxq@vger.kernel.org, AJvYcCWmsRO9KolsOOl16TxQBXhtqsso7I64648ogfcSUQemXe0PkAe70uLjmj7KEsghdN/2ayB7oLz5sBWE@vger.kernel.org, AJvYcCXH4UkYwPGYGau3Su/Bu6cY1i+RXOXOs2a5f3j3fQkZe2o9556atGFj6lpIxNDq1pqZqalS81fc/g7iFeAbC/JLg6w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKHAyhZa9HliM2PKSuxvaZTRUso8PShjeEYppLULTqNqFOcejM
	bCcok8mURlpr+TBIrqoKcFhGelXR4+P7fi82M2Rifps0jctRfWXk
X-Google-Smtp-Source: AGHT+IEEwko2sZK8zp7cWYH3ediZKHQGh64tWJ48vZuXxcd/8ql8CRgM/uW3JOJAL4MckDlVfhYSxg==
X-Received: by 2002:a17:903:1cd:b0:205:8bad:171c with SMTP id d9443c01a7336-21183cd15bfmr90934925ad.12.1731193464741;
        Sat, 09 Nov 2024 15:04:24 -0800 (PST)
Received: from localhost.localdomain ([38.44.237.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e9a5feb50bsm5847991a91.53.2024.11.09.15.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Nov 2024 15:04:24 -0800 (PST)
From: Sota4Ever <wachiturroxd150@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] arm64: dts: Add initial support for Samsung Galaxy S20 FE (r8s)
Date: Sat,  9 Nov 2024 23:04:02 +0000
Message-Id: <20241109230402.831-3-wachiturroxd150@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241109230402.831-1-wachiturroxd150@gmail.com>
References: <20241109230402.831-1-wachiturroxd150@gmail.com>
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

Signed-off-by: Sota4Ever <wachiturroxd150@gmail.com>
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
index 000000000..6d0b5f715
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynos990-r8s.dts
@@ -0,0 +1,115 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+/*
+ * Samsung Galaxy S20 FE (r8s/SM-G780F) device tree source
+ *
+ * Copyright (c) 2024, Sota4Ever <wachiturroxd150@gmail.com>
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
+		      <0x08 0x80000000 0x0 0xc0000000>;
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

