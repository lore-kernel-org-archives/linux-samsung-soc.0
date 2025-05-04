Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365ED1D7E4A;
	Sun,  4 May 2025 14:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746370775; cv=none; b=ufzwlykrwQ8MNAFO5RqC/WKcprM8C1ytuSfc5gcr6Hij0PwjEf1t5ILRVvJ7uUYslLSibUC2L09zGROJsSLQyEm+gjfbWUJbV/ARXhA7Zi0LbFD/PM0d+qTIUyCXTYZeTTcaR8kZG96TiL2NZRdC+U+2DQnMoxHlMAc2pGeAJYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746370775; c=relaxed/simple;
	bh=gTPJ8hTcxNGJHLL9Lpd+3s6gHBVf+3DqiYOg41ce9SQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xcs1s3kU9pdJOylw8rM4U+flBwybqNkG8ePwpE23U6Y82JzJUcQCTRfmCyRLqLbYK8QRj55BfKikMQUzve5yz4qjd5bADR3X4rZq9gYAY4OE+a0GaTSZ8usi9jF7/FJOSrOS+kghaFko9UD6SnqlhNANnZwrefslRpeXk5jHVvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CGX31n5s; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CGX31n5s"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac25520a289so603306066b.3;
        Sun, 04 May 2025 07:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746370769; x=1746975569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BN9ta3sMInhs0ORhdjqC+26Tj20ww6qaeGn6tZ2vmF4=;
        b=CGX31n5sthGZsIGme6bFlXfcHU3yavXxQrr4V3r1PR+ILZXFJF8ek9CqiQ/Bbpwcua
         r/7e1fmNoHLFpkAsF87KM48zIx/nHVKl0IvTQ6OYRNBZ4nqEVb7EXBW3qKqpUIPNUQLH
         uXqMz0meQcT4UzXvEjii42QzYP3M6mjAMqNBwbV2h3AzGQptgbiaWFxXK5tn5pBA66Id
         i5/EgC3gxn4L+NYrEOZ9pcQ12Ck34Ucmg3xDsi5cF4iu/KBb5phyDtQiO3o1r8dpaYGm
         C8WFdIcQj+jaVwqt6Ct9F/XQqs/hX51M0R6M7tyn1T1RZSyoU/w308VrXedtqbiXPV4U
         bqQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746370769; x=1746975569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BN9ta3sMInhs0ORhdjqC+26Tj20ww6qaeGn6tZ2vmF4=;
        b=lJBJzJQ27NphP17b8ZcYFbRLP7qeawY3xgF6xPrv+EuJcHe5aCq24pES+JcbyJAht4
         dS53ZtAyODbm18DJLHv1VAp2X9G3b9BTTjRijuKUqR+9iOmzdqO7Bv/mYw557jEJDgtk
         OBw/OfCJrok9GiTqjeL2+bAKvRn59SDV5I/tMAngUYwXp6rjS6tfOAo+WGwpz+MMB5C/
         Un42AdHgY1/lMZkkkqKiUDGb7NN3Twt3LzBkQ9UksgcnBxBUEYu7Z23I/aGjbAGCdASd
         XFw0lvMU8HkRzaM8t6DS6WMFA/v0ayoO8XI+2y4/imc/sc9uCk8stNFRwHOCtv4+bMlG
         zRvw==
X-Forwarded-Encrypted: i=1; AJvYcCWmX4GraVKAt79rLG7bM7LgYbiPYHYLt2utCfQG7NAjrzVoycy0GnV9lmwLHAfee0ER2EC5cf2zRagoSpQh@vger.kernel.org, AJvYcCXuUsCQp7onIt6TGsellB1uetFIDUfh2pYFXSsYrN55ErTR0eicbFtnlxgeJpok8DRH4nxWChD0Nvgp@vger.kernel.org
X-Gm-Message-State: AOJu0YyguYK/IgEKQvFzu9ql9DEiS8kIisDRhfYs41vSkrCSyusFBJ+1
	d7fACDS7BacTNOfpfIcemGRheWZz8sSkMEU+DShJvkKzKtlGzoR6
X-Gm-Gg: ASbGncsZsYs3UPT5GZTNws+AxbNWd3kE9V2UrXdflA5S2LPaQWN1TuWcjCjf05v4urT
	kft4QlDDRfg6HYjyOIswvoqAtvlYTs4xWZuRqqVXGHH9Q/op6qvdMtwhAZC+L9foe2gfZOLdMp8
	da+Nb6xPGaGrb1TOhcMcbG5steB6okvdchduBRijQKc7KTc+SXCh+WfY2ZW6YuAk//Hi1RHGIZI
	wqb/KcqnTSNiou9QJtQ6viIcYJpgPKt5bz9ZeGbG0keYHHZcnZjd6XxMIqyvsvGQkW//mfMG+a7
	NSn5R+vL7arxOOq9eXtuVtpvhpqFlRp/bIISjbjuBFubTyB6iJs2xq65IHKTPcArcdy1KO18wXF
	LRVoh+MyqIZfCIXp3
X-Google-Smtp-Source: AGHT+IFKcGHyQ91OoZSZBojjQwH4KRIgJVeb42DEAJWB1SfSqk1M7ZfUylS8kvNsnRbA2GUUEfIqLA==
X-Received: by 2002:a17:907:9447:b0:ad1:8e6a:5945 with SMTP id a640c23a62f3a-ad1a49e6d7fmr403229166b.36.1746370769040;
        Sun, 04 May 2025 07:59:29 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189508cf4sm336614666b.138.2025.05.04.07.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 07:59:28 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/4] arm64: dts: exynos: add initial support for exynos2200 SoC
Date: Sun,  4 May 2025 17:59:05 +0300
Message-ID: <20250504145907.1728721-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250504145907.1728721-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250504145907.1728721-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Exynos 2200 SoC is an ARMv8 mobile SoC found in the Samsung Galaxy S22
(r0s), S22+ (g0s), S22 Ultra (b0s) Add minimal support for that SoC,
including psci, pmu, chipid, architecture timer and mct, pinctrl,
clocks and usb.

The devices using this SoC suffer from an issue caused by the stock
Samsung bootloader, as it doesn't configure CNTFRQ_EL0. Hence it's
needed to hardcode the adequate frequency in the timer node,
otherwise the kernel panics.

Further platform support will be added over time.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../boot/dts/exynos/exynos2200-pinctrl.dtsi   | 1765 +++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos2200.dtsi    |  561 ++++++
 2 files changed, 2326 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos2200.dtsi

diff --git a/arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi
new file mode 100644
index 000000000..f618ff290
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi
@@ -0,0 +1,1765 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+/*
+ * Samsung's Exynos 2200 SoC pin-mux and pin-config device tree source
+ *
+ * Copyright (c) 2025, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include "exynos-pinctrl.h"
+
+&pinctrl_alive {
+	gpa0: gpa0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpa1: gpa1-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpa2: gpa2-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpa3: gpa3-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpa4: gpa4-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpq0: gpq0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpq1: gpq1-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpq2: gpq2-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	bt_hostwake: bt-hostwake-pins {
+		samsung,pins = "gpa0-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_F>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+	};
+
+	uart1_bus: uart1-bus-pins {
+		samsung,pins = "gpq0-3", "gpq0-2", "gpq0-1", "gpq0-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+	};
+
+	wlan_host_wake: wlan-host-wake-pins {
+		samsung,pins = "gpa0-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_F>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+	};
+};
+
+&pinctrl_cmgp {
+	gpm0: gpm0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpm1: gpm1-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpm2: gpm2-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpm3: gpm3-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpm4: gpm4-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpm5: gpm5-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpm6: gpm6-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpm7: gpm7-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpm8: gpm8-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpm9: gpm9-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpm10: gpm10-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpm11: gpm11-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpm12: gpm12-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpm13: gpm13-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpm14: gpm14-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpm15: gpm15-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpm16: gpm16-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpm17: gpm17-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpm20: gpm20-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpm21: gpm21-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpm22: gpm22-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpm23: gpm23-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpm24: gpm24-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	hsi2c24_bus: hsi2c24-bus-pins {
+		samsung,pins = "gpm0-0", "gpm0-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c25_bus: hsi2c25-bus-pins {
+		samsung,pins = "gpm1-0", "gpm1-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c26_bus: hsi2c26-bus-pins {
+		samsung,pins = "gpm2-0", "gpm2-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c27_bus: hsi2c27-bus-pins {
+		samsung,pins = "gpm3-0", "gpm3-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c28_bus: hsi2c28-bus-pins {
+		samsung,pins = "gpm4-0", "gpm4-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c29_bus: hsi2c29-bus-pins {
+		samsung,pins = "gpm5-0", "gpm5-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c30_bus: hsi2c30-bus-pins {
+		samsung,pins = "gpm6-0", "gpm6-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c31_bus: hsi2c31-bus-pins {
+		samsung,pins = "gpm7-0", "gpm7-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c32_bus: hsi2c32-bus-pins {
+		samsung,pins = "gpm8-0", "gpm8-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c33_bus: hsi2c33-bus-pins {
+		samsung,pins = "gpm9-0", "gpm9-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c34_bus: hsi2c34-bus-pins {
+		samsung,pins = "gpm10-0", "gpm10-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c35_bus: hsi2c35-bus-pins {
+		samsung,pins = "gpm11-0", "gpm11-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c36_bus: hsi2c36-bus-pins {
+		samsung,pins = "gpm12-0", "gpm12-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c37_bus: hsi2c37-bus-pins {
+		samsung,pins = "gpm13-0", "gpm13-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c38_bus: hsi2c38-bus-pins {
+		samsung,pins = "gpm23-0", "gpm24-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi12_bus: spi12-bus-pins {
+		samsung,pins = "gpm0-0", "gpm0-1", "gpm1-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi12_cs: spi12-cs-pins {
+		samsung,pins = "gpm1-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi12_cs_func: spi12-cs-func-pins {
+		samsung,pins = "gpm1-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi13_bus: spi13-bus-pins {
+		samsung,pins = "gpm2-0", "gpm2-1", "gpm3-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi13_cs: spi13-cs-pins {
+		samsung,pins = "gpm3-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi13_cs_func: spi13-cs-func-pins {
+		samsung,pins = "gpm3-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi14_bus: spi14-bus-pins {
+		samsung,pins = "gpm4-0", "gpm4-1", "gpm5-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi14_cs: spi14-cs-pins {
+		samsung,pins = "gpm5-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi14_cs_func: spi14-cs-func-pins {
+		samsung,pins = "gpm5-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi15_bus: spi15-bus-pins {
+		samsung,pins = "gpm6-0", "gpm6-1", "gpm7-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi15_cs: spi15-cs-pins {
+		samsung,pins = "gpm7-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi15_cs_func: spi15-cs-func-pins {
+		samsung,pins = "gpm7-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi16_bus: spi16-bus-pins {
+		samsung,pins = "gpm8-0", "gpm8-1", "gpm9-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi16_cs: spi16-cs-pins {
+		samsung,pins = "gpm9-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi16_cs_func: spi16-cs-func-pins {
+		samsung,pins = "gpm9-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi17_bus: spi17-bus-pins {
+		samsung,pins = "gpm10-0", "gpm10-1", "gpm11-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi17_cs: spi17-cs-pins {
+		samsung,pins = "gpm11-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi17_cs_func: spi17-cs-func-pins {
+		samsung,pins = "gpm11-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi18_bus: spi18-bus-pins {
+		samsung,pins = "gpm12-0", "gpm12-1", "gpm13-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi18_cs: spi18-cs-pins {
+		samsung,pins = "gpm13-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi18_cs_func: spi18-cs-func-pins {
+		samsung,pins = "gpm13-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	uart14_bus_single: uart14-bus-single-pins {
+		samsung,pins = "gpm0-0", "gpm0-1", "gpm2-0", "gpm2-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart14_bus_dual: uart14-bus-dual-pins {
+		samsung,pins = "gpm0-0", "gpm0-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart15_bus_single: uart15-bus-single-pins {
+		samsung,pins = "gpm3-0", "gpm3-1", "gpm4-0", "gpm4-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart15_bus_dual: uart15-bus-dual-pins {
+		samsung,pins = "gpm3-0", "gpm3-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart16_bus_single: uart16-bus-single-pins {
+		samsung,pins = "gpm5-0", "gpm5-1", "gpm6-0", "gpm6-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart16_bus_dual: uart16-bus-dual-pins {
+		samsung,pins = "gpm5-0", "gpm5-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart17_bus_single: uart17-bus-single-pins {
+		samsung,pins = "gpm7-0", "gpm7-1", "gpm8-0", "gpm8-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart17_bus_dual: uart17-bus-dual-pins {
+		samsung,pins = "gpm7-0", "gpm7-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart18_bus_single: uart18-bus-single-pins {
+		samsung,pins = "gpm8-0", "gpm8-1", "gpm9-0", "gpm9-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart18_bus_dual: uart18-bus-dual-pins {
+		samsung,pins = "gpm8-0", "gpm8-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart19_bus_single: uart19-bus-single-pins {
+		samsung,pins = "gpm10-0", "gpm10-1", "gpm11-0", "gpm11-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart19_bus_dual: uart19-bus-dual-pins {
+		samsung,pins = "gpm12-0", "gpm12-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart20_bus_single: uart20-bus-single-pins {
+		samsung,pins = "gpm13-0", "gpm13-1", "gpm14-0", "gpm14-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart20_bus_dual: uart20-bus-dual-pins {
+		samsung,pins = "gpm13-0", "gpm13-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+};
+
+&pinctrl_hsi1 {
+	gpf0: gpf0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	pcie0_clkreq: pcie0-clkreq-pins {
+		samsung,pins = "gpf0-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV4>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_UP>;
+	};
+
+	pcie0_perst: pcie0-perst-pins {
+		samsung,pins = "gpf0-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV4>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+	};
+
+	pcie1_clkreq: pcie1-clkreq-pins {
+		samsung,pins = "gpf0-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV4>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_UP>;
+	};
+
+	pcie1_perst: pcie1-perst-pins {
+		samsung,pins = "gpf0-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV4>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+	};
+};
+
+&pinctrl_hsi1ufs {
+	gpf2: gpf2-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	ufs_rst_n: ufs-rst-n-pins {
+		samsung,pins = "gpf2-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	ufs_refclk_out: ufs-refclk-out-pins {
+		samsung,pins = "gpf2-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV3>;
+		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_NONE>;
+	};
+};
+
+&pinctrl_peric0 {
+	gpb0: gpb0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpb1: gpb1-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpb2: gpb2-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpb3: gpb3-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpc0: gpc0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpc1: gpc1-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpc2: gpc2-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpg1: gpg1-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpg2: gpg2-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpp4: gpp4-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	aud_i2s0_bus: aud-i2s0-bus-pins {
+		samsung,pins = "gpb0-0", "gpb0-1", "gpb0-2", "gpb0-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	aud_i2s1_bus: aud-i2s1-bus-pins {
+		samsung,pins = "gpb1-0", "gpb1-1", "gpb1-2", "gpb1-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	aud_i2s2_bus: aud-i2s2-bus-pins {
+		samsung,pins = "gpb2-0", "gpb2-1", "gpb2-2", "gpb2-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	aud_i2s3_bus: aud-i2s3-bus-pins {
+		samsung,pins = "gpb3-0", "gpb3-1", "gpb3-2", "gpb3-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	aud_i2s3_pci: aud-i2s3-pci-pins {
+		samsung,pins = "gpb3-0", "gpb3-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	aud_dsd_bus: aud-dsd-bus-pins {
+		samsung,pins = "gpb1-0", "gpb1-1", "gpb1-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	decon_0_te: decon-0-te-pins {
+		samsung,pins = "gpg2-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_F>;
+	};
+
+	hsi2c8_bus: hsi2c8-bus-pins {
+		samsung,pins = "gpp4-0", "gpp4-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c9_bus: hsi2c9-bus-pins {
+		samsung,pins = "gpp4-2", "gpp4-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	i3c0_bus: i3c0-bus-pins {
+		samsung,pins = "gpc0-0", "gpc0-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	i3c1_bus: i3c1-bus-pins {
+		samsung,pins = "gpc1-0", "gpc1-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	i3c2_bus: i3c2-bus-pins {
+		samsung,pins = "gpc2-0", "gpc2-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	spi4_bus: spi4-bus-pins {
+		samsung,pins = "gpp4-2", "gpp4-1", "gpp4-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi4_cs: spi4-cs-pins {
+		samsung,pins = "gpp4-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi4_cs_func: spi4-cs-func-pins {
+		samsung,pins = "gpp4-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	uart6_bus_single: uart6-bus-single-pins {
+		samsung,pins = "gpp4-0", "gpp4-1", "gpp4-2", "gpp4-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart6_bus_dual: uart6-bus-dual-pins {
+		samsung,pins = "gpp4-0", "gpp4-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+};
+
+&pinctrl_peric1 {
+	gpp7: gpp7-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpp8: gpp8-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpp9: gpp9-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpp10: gpp10-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	hsi2c14_bus: hsi2c14-bus-pins {
+		samsung,pins = "gpp7-0", "gpp7-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c15_bus: hsi2c15-bus-pins {
+		samsung,pins = "gpp7-2", "gpp7-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c16_bus: hsi2c16-bus-pins {
+		samsung,pins = "gpp8-0", "gpp8-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c17_bus: hsi2c17-bus-pins {
+		samsung,pins = "gpp8-2", "gpp8-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c18_bus: hsi2c18-bus-pins {
+		samsung,pins = "gpp9-0", "gpp9-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c19_bus: hsi2c19-bus-pins {
+		samsung,pins = "gpp9-2", "gpp9-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c20_bus: hsi2c20-bus-pins {
+		samsung,pins = "gpp10-0", "gpp10-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c21_bus: hsi2c21-bus-pins {
+		samsung,pins = "gpp10-2", "gpp10-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi7_bus: spi7-bus-pins {
+		samsung,pins = "gpp7-2", "gpp7-1", "gpp7-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi7_cs: spi7-cs-pins {
+		samsung,pins = "gpp7-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi7_cs_func: spi7-cs-func-pins {
+		samsung,pins = "gpp7-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi8_bus: spi8-bus-pins {
+		samsung,pins = "gpp8-2", "gpp8-1", "gpp8-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi8_cs: spi8-cs-pins {
+		samsung,pins = "gpp8-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi8_cs_func: spi8-cs-func-pins {
+		samsung,pins = "gpp8-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi9_bus: spi9-bus-pins {
+		samsung,pins = "gpp9-2", "gpp9-1", "gpp9-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi9_cs: spi9-cs-pins {
+		samsung,pins = "gpp9-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi9_cs_func: spi9-cs-func-pins {
+		samsung,pins = "gpp9-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi10_bus: spi10-bus-pins {
+		samsung,pins = "gpp10-2", "gpp10-1", "gpp10-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi10_cs: spi10-cs-pins {
+		samsung,pins = "gpp10-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi10_cs_func: spi10-cs-func-pins {
+		samsung,pins = "gpp10-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	uart9_bus_single: uart9-bus-single-pins {
+		samsung,pins = "gpp7-3", "gpp7-2", "gpp7-1", "gpp7-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart9_bus_dual: uart9-bus-dual-pins {
+		samsung,pins = "gpp7-0", "gpp7-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart10_bus_single: uart10-bus-single-pins {
+		samsung,pins = "gpp8-3", "gpp8-2", "gpp8-1", "gpp8-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart10_bus_dual: uart10-bus-dual-pins {
+		samsung,pins = "gpp8-0", "gpp8-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart11_bus_single: uart11-bus-single-pins {
+		samsung,pins = "gpp9-3", "gpp9-2", "gpp9-1", "gpp9-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart11_bus_dual: uart11-bus-dual-pins {
+		samsung,pins = "gpp9-0", "gpp9-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart12_bus_single: uart12-bus-single-pins {
+		samsung,pins = "gpp10-3", "gpp10-2", "gpp10-1", "gpp10-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart12_bus_dual: uart12-bus-dual-pins {
+		samsung,pins = "gpp10-0", "gpp10-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+};
+
+&pinctrl_peric2 {
+	gpc3: gpc3-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpc4: gpc4-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpc5: gpc5-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpc6: gpc6-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpc7: gpc7-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpc8: gpc8-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpc9: gpc9-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpg0: gpg0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpp0: gpp0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpp1: gpp1-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpp2: gpp2-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpp3: gpp3-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpp5: gpp5-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpp6: gpp6-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpp11: gpp11-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	hsi2c0_bus: hsi2c0-bus-pins {
+		samsung,pins = "gpp0-0", "gpp0-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c1_bus: hsi2c1-bus-pins {
+		samsung,pins = "gpp0-2", "gpp0-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c2_bus: hsi2c2-bus-pins {
+		samsung,pins = "gpp1-0", "gpp1-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c3_bus: hsi2c3-bus-pins {
+		samsung,pins = "gpp1-2", "gpp1-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c4_bus: hsi2c4-bus-pins {
+		samsung,pins = "gpp2-0", "gpp2-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c5_bus: hsi2c5-bus-pins {
+		samsung,pins = "gpp2-2", "gpp2-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c6_bus: hsi2c6-bus-pins {
+		samsung,pins = "gpp3-0", "gpp3-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c7_bus: hsi2c7-bus-pins {
+		samsung,pins = "gpp3-2", "gpp3-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c10_bus: hsi2c10-bus-pins {
+		samsung,pins = "gpp5-0", "gpp5-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c11_bus: hsi2c11-bus-pins {
+		samsung,pins = "gpp5-2", "gpp5-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c12_bus: hsi2c12-bus-pins {
+		samsung,pins = "gpp6-0", "gpp6-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c13_bus: hsi2c13-bus-pins {
+		samsung,pins = "gpp6-2", "gpp6-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c22_bus: hsi2c22-bus-pins {
+		samsung,pins = "gpp11-0", "gpp11-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	i3c3_bus: i3c3-bus-pins {
+		samsung,pins = "gpc3-0", "gpc3-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	i3c4_bus: i3c4-bus-pins {
+		samsung,pins = "gpc4-0", "gpc4-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	i3c5_bus: i3c5-bus-pins {
+		samsung,pins = "gpc5-0", "gpc5-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	i3c6_bus: i3c6-bus-pins {
+		samsung,pins = "gpc6-0", "gpc6-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	i3c7_bus: i3c7-bus-pins {
+		samsung,pins = "gpc7-0", "gpc7-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	i3c8_bus: i3c8-bus-pins {
+		samsung,pins = "gpc8-0", "gpc8-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	i3c9_bus: i3c9-bus-pins {
+		samsung,pins = "gpc9-0", "gpc9-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	i3c10_bus: i3c10-bus-pins {
+		samsung,pins = "gpp2-2", "gpp2-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_4>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	i3c11_bus: i3c11-bus-pins {
+		samsung,pins = "gpp3-2", "gpp3-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_4>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi223_bus: hsi2c23-bus-pins {
+		samsung,pins = "gpp11-2", "gpp11-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi0_bus: spi0-bus-pins {
+		samsung,pins = "gpp0-2", "gpp0-1", "gpp0-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi0_cs: spi0-cs-pins {
+		samsung,pins = "gpp0-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi0_cs_func: spi0-cs-func-pins {
+		samsung,pins = "gpp0-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi1_bus: spi1-bus-pins {
+		samsung,pins = "gpp1-2", "gpp1-1", "gpp1-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi1_cs: spi1-cs-pins {
+		samsung,pins = "gpp1-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi1_cs_func: spi1-cs-func-pins {
+		samsung,pins = "gpp1-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi2_bus: spi2-bus-pins {
+		samsung,pins = "gpp2-2", "gpp2-1", "gpp2-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi2_cs: spi2-cs-pins {
+		samsung,pins = "gpp2-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi2_cs_func: spi2-cs-func-pins {
+		samsung,pins = "gpp2-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi3_bus: spi3-bus-pins {
+		samsung,pins = "gpp3-2", "gpp3-1", "gpp3-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi3_cs: spi3-cs-pins {
+		samsung,pins = "gpp3-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi3_cs_func: spi3-cs-func-pins {
+		samsung,pins = "gpp3-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi5_bus: spi5-bus-pins {
+		samsung,pins = "gpp5-2", "gpp5-1", "gpp5-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi5_cs: spi5-cs-pins {
+		samsung,pins = "gpp5-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi5_cs_func: spi5-cs-func-pins {
+		samsung,pins = "gpp5-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi6_bus: spi6-bus-pins {
+		samsung,pins = "gpp6-2", "gpp6-1", "gpp6-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi6_cs: spi6-cs-pins {
+		samsung,pins = "gpp6-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi6_cs_func: spi6-cs-func-pins {
+		samsung,pins = "gpp6-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi11_bus: spi11-bus-pins {
+		samsung,pins = "gpp11-2", "gpp11-1", "gpp11-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi11_cs: spi11-cs-pins {
+		samsung,pins = "gpp11-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi11_cs_func: spi11-cs-func-pins {
+		samsung,pins = "gpp11-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	uart0_bus_single: uart0-bus-single-pins {
+		samsung,pins = "gpg0-2", "gpg0-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+	};
+
+	uart2_bus_single: uart2-bus-single-pins {
+		samsung,pins = "gpp0-0", "gpp0-1", "gpp0-2", "gpp0-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart2_bus_dual: uart2-bus-dual-pins {
+		samsung,pins = "gpp0-0", "gpp0-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart3_bus_single: uart3-bus-single-pins {
+		samsung,pins = "gpp1-0", "gpp1-1", "gpp1-2", "gpp1-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart3_bus_dual: uart3-bus-dual-pins {
+		samsung,pins = "gpp1-0", "gpp1-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart4_bus_single: uart4-bus-single-pins {
+		samsung,pins = "gpp2-0", "gpp2-1", "gpp2-2", "gpp2-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart4_bus_dual: uart4-bus-dual-pins {
+		samsung,pins = "gpp2-0", "gpp2-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart5_bus_single: uart5-bus-single-pins {
+		samsung,pins = "gpp3-0", "gpp3-1", "gpp3-2", "gpp3-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart5_bus_dual: uart5-bus-dual-pins {
+		samsung,pins = "gpp3-0", "gpp3-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart7_bus_single: uart7-bus-single-pins {
+		samsung,pins = "gpp5-0", "gpp5-1", "gpp5-2", "gpp5-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart7_bus_dual: uart7-bus-dual-pins {
+		samsung,pins = "gpp5-0", "gpp5-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart8_bus_single: uart8-bus-single-pins {
+		samsung,pins = "gpp6-3", "gpp6-2", "gpp6-1", "gpp6-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart8_bus_dual: uart8-bus-dual-pins {
+		samsung,pins = "gpp6-0", "gpp6-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart13_bus_single: uart13-bus-single-pins {
+		samsung,pins = "gpp11-3", "gpp11-2", "gpp11-1", "gpp11-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart13_bus_dual: uart13-bus-dual-pins {
+		samsung,pins = "gpp11-0", "gpp11-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+};
+
+&pinctrl_ufs {
+	gpf1: gpf1-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+};
+
+&pinctrl_vts {
+	gpv0: gpv0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	amic_pdm0_bus: amic-pdm0-bus-pins {
+		samsung,pins = "gpv0-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_INPUT>;
+	};
+
+	amic_pdm1_bus: amic-pdm1-bus-pins {
+		samsung,pins = "gpv0-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_INPUT>;
+	};
+
+	amic_pdm2_bus: amic-pdm2-bus-pins {
+		samsung,pins = "gpv0-5";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_INPUT>;
+	};
+
+	dmic_bus_clk0: dmic-bus-clk0-pins {
+		samsung,pins = "gpv0-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_INPUT>;
+	};
+
+	dmic_bus_clk1: dmic-bus-clk1-pins {
+		samsung,pins = "gpv0-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_INPUT>;
+	};
+
+	dmic_bus_clk2: dmic-bus-clk2-pins {
+		samsung,pins = "gpv0-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_INPUT>;
+	};
+
+	dmic_pdm0_bus: dmic-pdm0-bus-pins {
+		samsung,pins = "gpv0-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_INPUT>;
+	};
+
+	dmic_pdm1_bus: dmic-pdm1-bus-pins {
+		samsung,pins = "gpv0-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_INPUT>;
+	};
+
+	dmic_pdm2_bus: dmic-pdm2-bus-pins {
+		samsung,pins = "gpv0-5";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_INPUT>;
+	};
+};
diff --git a/arch/arm64/boot/dts/exynos/exynos2200.dtsi b/arch/arm64/boot/dts/exynos/exynos2200.dtsi
new file mode 100644
index 000000000..6b5ac02d0
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynos2200.dtsi
@@ -0,0 +1,561 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+/*
+ * Samsung's Exynos 2200 SoC device tree source
+ *
+ * Copyright (c) 2025, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
+ */
+
+#include <dt-bindings/clock/samsung,exynos2200-cmu.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	compatible = "samsung,exynos2200";
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	interrupt-parent = <&gic>;
+
+	aliases {
+		pinctrl0 = &pinctrl_alive;
+		pinctrl1 = &pinctrl_cmgp;
+		pinctrl2 = &pinctrl_hsi1;
+		pinctrl3 = &pinctrl_ufs;
+		pinctrl4 = &pinctrl_hsi1ufs;
+		pinctrl5 = &pinctrl_peric0;
+		pinctrl6 = &pinctrl_peric1;
+		pinctrl7 = &pinctrl_peric2;
+		pinctrl8 = &pinctrl_vts;
+	};
+
+	xtcxo: clock-1 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-output-names = "oscclk";
+	};
+
+	ext_26m: clock-2 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-output-names = "ext-26m";
+	};
+
+	ext_200m: clock-3 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-output-names = "ext-200m";
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&cpu0>;
+				};
+
+				core1 {
+					cpu = <&cpu1>;
+				};
+
+				core2 {
+					cpu = <&cpu2>;
+				};
+
+				core3 {
+					cpu = <&cpu3>;
+				};
+			};
+
+			cluster1 {
+				core0 {
+					cpu = <&cpu4>;
+				};
+
+				core1 {
+					cpu = <&cpu5>;
+				};
+
+				core2 {
+					cpu = <&cpu6>;
+				};
+			};
+
+			cluster2 {
+				core0 {
+					cpu = <&cpu7>;
+				};
+			};
+		};
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a510";
+			reg = <0>;
+			capacity-dmips-mhz = <260>;
+			dynamic-power-coefficient = <189>;
+			enable-method = "psci";
+			cpu-idle-states = <&little_cpu_sleep>;
+		};
+
+		cpu1: cpu@100 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a510";
+			reg = <0x100>;
+			capacity-dmips-mhz = <260>;
+			dynamic-power-coefficient = <189>;
+			enable-method = "psci";
+			cpu-idle-states = <&little_cpu_sleep>;
+		};
+
+		cpu2: cpu@200 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a510";
+			reg = <0x200>;
+			capacity-dmips-mhz = <260>;
+			dynamic-power-coefficient = <189>;
+			enable-method = "psci";
+			cpu-idle-states = <&little_cpu_sleep>;
+		};
+
+		cpu3: cpu@300 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a510";
+			reg = <0x300>;
+			capacity-dmips-mhz = <260>;
+			dynamic-power-coefficient = <189>;
+			enable-method = "psci";
+			cpu-idle-states = <&little_cpu_sleep>;
+		};
+
+		cpu4: cpu@400 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a710";
+			reg = <0x400>;
+			capacity-dmips-mhz = <380>;
+			dynamic-power-coefficient = <560>;
+			enable-method = "psci";
+			cpu-idle-states = <&big_cpu_sleep>;
+		};
+
+		cpu5: cpu@500 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a710";
+			reg = <0x500>;
+			capacity-dmips-mhz = <380>;
+			dynamic-power-coefficient = <560>;
+			enable-method = "psci";
+			cpu-idle-states = <&big_cpu_sleep>;
+		};
+
+		cpu6: cpu@600 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a710";
+			reg = <0x600>;
+			capacity-dmips-mhz = <380>;
+			dynamic-power-coefficient = <560>;
+			enable-method = "psci";
+			cpu-idle-states = <&big_cpu_sleep>;
+		};
+
+		cpu7: cpu@700 {
+			device_type = "cpu";
+			compatible = "arm,cortex-x2";
+			reg = <0x700>;
+			capacity-dmips-mhz = <488>;
+			dynamic-power-coefficient = <765>;
+			enable-method = "psci";
+			cpu-idle-states = <&prime_cpu_sleep>;
+		};
+
+		idle-states {
+			entry-method = "psci";
+
+			little_cpu_sleep: cpu-sleep-0 {
+				compatible = "arm,idle-state";
+				idle-state-name = "c2";
+				entry-latency-us = <70>;
+				exit-latency-us = <170>;
+				min-residency-us = <2000>;
+				arm,psci-suspend-param = <0x10000>;
+			};
+
+			big_cpu_sleep: cpu-sleep-1 {
+				compatible = "arm,idle-state";
+				idle-state-name = "c2";
+				entry-latency-us = <235>;
+				exit-latency-us = <220>;
+				min-residency-us = <3500>;
+				arm,psci-suspend-param = <0x10000>;
+			};
+
+			prime_cpu_sleep: cpu-sleep-2 {
+				compatible = "arm,idle-state";
+				idle-state-name = "c2";
+				entry-latency-us = <150>;
+				exit-latency-us = <190>;
+				min-residency-us = <2500>;
+				arm,psci-suspend-param = <0x10000>;
+			};
+		};
+	};
+
+	pmu-a510 {
+		compatible = "arm,cortex-a510-pmu";
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluster0>;
+	};
+
+	pmu-a710 {
+		compatible = "arm,cortex-a710-pmu";
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluster1>;
+	};
+
+	pmu-x2 {
+		compatible = "arm,cortex-x2-pmu";
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluster2>;
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+
+	soc {
+		compatible = "simple-bus";
+		ranges;
+
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		chipid@10000000 {
+			compatible = "samsung,exynos2200-chipid",
+				     "samsung,exynos850-chipid";
+			reg = <0x0 0x10000000 0x0 0x24>;
+		};
+
+		cmu_peris: clock-controller@10020000 {
+			compatible = "samsung,exynos2200-cmu-peris";
+			reg = <0x0 0x10020000 0x0 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&cmu_top CLK_DOUT_TCXO_DIV3>,
+				 <&cmu_top CLK_DOUT_CMU_PERIS_NOC>,
+				 <&cmu_top CLK_DOUT_CMU_PERIS_GIC>;
+			clock-names = "tcxo_div3",
+				      "noc",
+				      "gic";
+		};
+
+		mct_peris: timer@10040000 {
+			compatible = "samsung,exynos2200-mct-peris",
+				     "samsung,exynos4210-mct";
+			reg = <0x0 0x10040000 0x0 0x800>;
+			clocks = <&cmu_top CLK_DOUT_TCXO_DIV3>, <&cmu_peris CLK_MOUT_PERIS_GIC>;
+			clock-names = "fin_pll", "mct";
+			interrupts = <GIC_SPI 943 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 944 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 945 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 946 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 947 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 948 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 949 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 950 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 951 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 952 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 953 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 954 IRQ_TYPE_LEVEL_HIGH 0>;
+			status = "disabled";
+		};
+
+		gic: interrupt-controller@10200000 {
+			compatible = "arm,gic-v3";
+			reg = <0x0 0x10200000 0x0 0x10000>,     /* GICD */
+			      <0x0 0x10240000 0x0 0x200000>;    /* GICR * 8 */
+
+			#interrupt-cells = <4>;
+			interrupt-controller;
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			ppi-partitions {
+				ppi_cluster0: interrupt-partition-0 {
+					affinity = <&cpu0 &cpu1 &cpu2 &cpu3>;
+				};
+
+				ppi_cluster1: interrupt-partition-1 {
+					affinity = <&cpu4 &cpu5 &cpu6>;
+				};
+
+				ppi_cluster2: interrupt-partition-2 {
+					affinity = <&cpu7>;
+				};
+			};
+		};
+
+		cmu_peric0: clock-controller@10400000 {
+			compatible = "samsung,exynos2200-cmu-peric0";
+			reg = <0x0 0x10400000 0x0 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&xtcxo>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC0_NOC>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC0_IP0>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC0_IP1>;
+			clock-names = "oscclk", "noc", "ip0", "ip1";
+		};
+
+		syscon_peric0: syscon@10420000 {
+			compatible = "samsung,exynos2200-peric0-sysreg", "syscon";
+			reg = <0x0 0x10420000 0x0 0x2000>;
+		};
+
+		pinctrl_peric0: pinctrl@10430000 {
+			compatible = "samsung,exynos2200-pinctrl";
+			reg = <0x0 0x10430000 0x0 0x1000>;
+		};
+
+		cmu_peric1: clock-controller@10700000 {
+			compatible = "samsung,exynos2200-cmu-peric1";
+			reg = <0x0 0x10700000 0x0 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&xtcxo>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC1_NOC>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC1_IP0>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC1_IP1>;
+			clock-names = "oscclk", "noc", "ip0", "ip1";
+		};
+
+		syscon_peric1: syscon@10720000 {
+			compatible = "samsung,exynos2200-peric1-sysreg", "syscon";
+			reg = <0x0 0x10720000 0x0 0x2000>;
+		};
+
+		pinctrl_peric1: pinctrl@10730000 {
+			compatible = "samsung,exynos2200-pinctrl";
+			reg = <0x0 0x10730000 0x0 0x1000>;
+		};
+
+		cmu_hsi0: clock-controller@10a00000 {
+			compatible = "samsung,exynos2200-cmu-hsi0";
+			reg = <0x0 0x10a00000 0x0 0x8000>;
+			#clock-cells = <1>;
+		};
+
+		usb32drd: phy@10aa0000 {
+			compatible = "samsung,exynos2200-usb32drd-phy";
+			reg = <0x0 0x10aa0000 0x0 0x10000>;
+
+			clocks = <&cmu_hsi0 CLK_MOUT_HSI0_NOC>;
+			clock-names = "phy";
+
+			#phy-cells = <1>;
+			phys = <&usb_hsphy>;
+			phy-names = "hs";
+
+			samsung,pmu-syscon = <&pmu_system_controller>;
+
+			status = "disabled";
+		};
+
+		usb_hsphy: phy@10ab0000 {
+			compatible = "samsung,exynos2200-eusb2-phy";
+			reg = <0x0 0x10ab0000 0x0 0x10000>;
+
+			clocks = <&cmu_hsi0 CLK_MOUT_HSI0_USB32DRD>,
+				 <&cmu_hsi0 CLK_MOUT_HSI0_NOC>,
+				 <&cmu_hsi0 CLK_DOUT_DIV_CLK_HSI0_EUSB>;
+			clock-names = "ref", "bus", "ctrl";
+
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		usb: usb@10b00000 {
+			compatible = "samsung,exynos2200-dwusb3";
+			ranges = <0x0 0x0 0x10b00000 0x10000>;
+
+			clocks = <&cmu_hsi0 CLK_MOUT_HSI0_NOC>;
+			clock-names = "link_aclk";
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			status = "disabled";
+
+			usb_dwc3: usb@0 {
+				compatible = "snps,dwc3";
+				reg = <0x0 0x10000>;
+
+				clocks = <&cmu_hsi0 CLK_MOUT_HSI0_USB32DRD>;
+				clock-names = "ref";
+
+				interrupts = <GIC_SPI 485 IRQ_TYPE_LEVEL_HIGH 0>;
+
+				phys = <&usb32drd 0>;
+				phy-names = "usb2-phy";
+
+				snps,dis-u2-freeclk-exists-quirk;
+				snps,gfladj-refclk-lpm-sel-quirk;
+				snps,has-lpm-erratum;
+				snps,quirk-frame-length-adjustment = <0x20>;
+				snps,usb3_lpm_capable;
+			};
+		};
+
+		cmu_ufs: clock-controller@11000000 {
+			compatible = "samsung,exynos2200-cmu-ufs";
+			reg = <0x0 0x11000000 0x0 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&xtcxo>,
+				 <&cmu_top CLK_DOUT_CMU_UFS_NOC>,
+				 <&cmu_top CLK_MOUT_CMU_UFS_MMC_CARD>,
+				 <&cmu_top CLK_DOUT_CMU_UFS_UFS_EMBD>;
+			clock-names = "oscclk", "noc", "mmc", "ufs";
+		};
+
+		syscon_ufs: syscon@11020000 {
+			compatible = "samsung,exynos2200-ufs-sysreg", "syscon";
+			reg = <0x0 0x11020000 0x0 0x2000>;
+		};
+
+		pinctrl_ufs: pinctrl@11040000 {
+			compatible = "samsung,exynos2200-pinctrl";
+			reg = <0x0 0x11040000 0x0 0x1000>;
+		};
+
+		pinctrl_hsi1ufs: pinctrl@11060000 {
+			compatible = "samsung,exynos2200-pinctrl";
+			reg = <0x0 0x11060000 0x0 0x1000>;
+		};
+
+		pinctrl_hsi1: pinctrl@11240000 {
+			compatible = "samsung,exynos2200-pinctrl";
+			reg = <0x0 0x11240000 0x0 0x1000>;
+		};
+
+		cmu_peric2: clock-controller@11c00000 {
+			compatible = "samsung,exynos2200-cmu-peric2";
+			reg = <0x0 0x11c00000 0x0 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&xtcxo>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC2_NOC>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC2_IP0>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC2_IP1>;
+			clock-names = "oscclk", "noc", "ip0", "ip1";
+		};
+
+		syscon_peric2: syscon@11c20000 {
+			compatible = "samsung,exynos2200-peric2-sysreg", "syscon";
+			reg = <0x0 0x11c20000 0x0 0x4000>;
+		};
+
+		pinctrl_peric2: pinctrl@11c30000 {
+			compatible = "samsung,exynos2200-pinctrl";
+			reg = <0x0 0x11c30000 0x0 0x1000>;
+		};
+
+		cmu_cmgp: clock-controller@14e00000 {
+			compatible = "samsung,exynos2200-cmu-cmgp";
+			reg = <0x0 0x14e00000 0x0 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&xtcxo>,
+				 <&cmu_alive CLK_DOUT_ALIVE_CMGP_NOC>,
+				 <&cmu_alive CLK_DOUT_ALIVE_CMGP_PERI>;
+			clock-names = "oscclk", "noc", "peri";
+		};
+
+		syscon_cmgp: syscon@14e20000 {
+			compatible = "samsung,exynos2200-cmgp-sysreg", "syscon";
+			reg = <0x0 0x14e20000 0x0 0x2000>;
+		};
+
+		pinctrl_cmgp: pinctrl@14e30000 {
+			compatible = "samsung,exynos2200-pinctrl";
+			reg = <0x0 0x14e30000 0x0 0x1000>;
+
+			wakeup-interrupt-controller {
+				compatible = "samsung,exynos2200-wakeup-eint",
+					     "samsung,exynos850-wakeup-eint",
+					     "samsung,exynos7-wakeup-eint";
+			};
+		};
+
+		cmu_vts: clock-controller@15300000 {
+			compatible = "samsung,exynos2200-cmu-vts";
+			reg = <0x0 0x15300000 0x0 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&xtcxo>,
+				 <&cmu_top CLK_DOUT_CMU_VTS_DMIC>;
+			clock-names = "oscclk", "dmic";
+		};
+
+		pinctrl_vts: pinctrl@15320000 {
+			compatible = "samsung,exynos2200-pinctrl";
+			reg = <0x0 0x15320000 0x0 0x1000>;
+		};
+
+		cmu_alive: clock-controller@15800000 {
+			compatible = "samsung,exynos2200-cmu-alive";
+			reg = <0x0 0x15800000 0x0 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&xtcxo>,
+				 <&cmu_top CLK_DOUT_CMU_ALIVE_NOC>;
+			clock-names = "oscclk", "noc";
+		};
+
+		pinctrl_alive: pinctrl@15850000 {
+			compatible = "samsung,exynos2200-pinctrl";
+			reg = <0x0 0x15850000 0x0 0x1000>;
+
+			wakeup-interrupt-controller {
+				compatible = "samsung,exynos2200-wakeup-eint",
+					     "samsung,exynos850-wakeup-eint",
+					     "samsung,exynos7-wakeup-eint";
+			};
+		};
+
+		pmu_system_controller: system-controller@15860000 {
+			compatible = "samsung,exynos2200-pmu",
+				     "samsung,exynos7-pmu", "syscon";
+			reg = <0x0 0x15860000 0x0 0x10000>;
+
+			reboot: syscon-reboot {
+				compatible = "syscon-reboot";
+				offset = <0x3c00>; /* SYSTEM_CONFIGURATION */
+				mask = <0x2>; /* SWRESET_SYSTEM */
+				value = <0x2>; /* reset value */
+			};
+		};
+
+		cmu_top: clock-controller@1a320000 {
+			compatible = "samsung,exynos2200-cmu-top";
+			reg = <0x0 0x1a320000 0x0 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&xtcxo>;
+			clock-names = "oscclk";
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW 0>,
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW 0>,
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW 0>,
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW 0>;
+		/*
+		 * Non-updatable, broken stock Samsung bootloader does not
+		 * configure CNTFRQ_EL0
+		 */
+		clock-frequency = <25600000>;
+	};
+};
+
+#include "exynos2200-pinctrl.dtsi"
-- 
2.43.0

