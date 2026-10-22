Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792648338;
	b=K5NRCs+Inkre8wROmQM5q/VOQ+lHcbkHxAwkRwaOMxNp8J8VkAuoZ5oLMvF/UYTaEMeX
	 tH1KStPrpPe6QvbNEd0jnZD+kZO6zfMVCz1xGOObT1uHxUcko88D3j9neBHA4mGiawMLL
	 Z4PPxWjH43qtCNcEcMYTTbXNABDQFF1aHyTbhrKzH+AYOtX0JaO9zu36DJLcjqu8qDQjB
	 DC7u3Gp5Pqv+E1C9mECbenKvC7ea1Kh6JgCC5z0C7rZ5ZjkBk8UCvX8cpQ8Zql0iqOteT
	 1EQAtPf+WxERaXzh08924WIg1Qu0YCkJqaVDKC+5d7yxCWmfvn2LAP7uE0BnAW7GdKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792648338;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=K2tWmEOG35vkyGU1OZ0Xjhu69P/i4beeqfklVuj2BQQ=;
	b=vybs6GlIxiUySHA35qEaqxgDse2yYpuHLLoYZLsjh6mNFQJLZKZF2+D2T7G1mFtHPLbQ
	 uzOy2FGKK/p4/mgN05h0xZdDOXOIGXcBKqycmxIWntALjWC0JdNHJJBRdNBegqCMRdczc
	 lQpRX9CyM8HDciSKE7WzDpyxjOYMXRmnShocrTwfSZYvy2Q3dXzJRPIUVPwdqenw1ZUNG
	 xcU6qWO3rOY3o9igmIl+weehBUCuUhUdz7W27o21Y2QT5kQMxpMy3VfogFm0JTtR0k9Tg
	 Pb5oAK32qLVCu+qSk3UZ+4WiJe+/cU5notiSwMyGUP4jm5Hp97/t1LVpzGVsYwXMRZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lQRJrQ8o;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55535606A337
	for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Oct 2026 05:52:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55535606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lQRJrQ8o
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso2768995e9.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 21 Oct 2026 22:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792648336; x=1793253136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K2tWmEOG35vkyGU1OZ0Xjhu69P/i4beeqfklVuj2BQQ=;
        b=lQRJrQ8oSQIwG/TXADRZHwRmstT2q0TjO16z5OTT96fmiSQTd6o12ffxSGR9Qm068g
         pzhv7cqhlV9Tm6x6a+mTnPC9xRfu5h4TzAjEzHY8703+lU+B+7qeggJFI1clDAyeY0Ol
         ANVMXtQYhkuh2vlxoDnD7BQ1ZQzv4vG4iXoZ3wWz2mcEUob133f+4o5Y4kIl+v0ky83m
         eq++273wj+UbHBLwRnP4bh/ClwzKslu5w4QY5DF5ZNER68EBHe/mgcYTjGoMCC9rC/tX
         A+nWzqak3oSm77fUD4DsbcSu9m3zTtzMpRUvntZ5hcgMrXCe6TkubULCoXce8uf1SzuM
         cxgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792648336; x=1793253136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K2tWmEOG35vkyGU1OZ0Xjhu69P/i4beeqfklVuj2BQQ=;
        b=vzGoqiWfA6GwZzAsO5FCQyemLwm47K23Cg5QG0Ct4DJnj+v83rWwvZT/Qk5wMODadT
         Frcv6R31XTcbSqisNrHxjM2D81c1yw/2+vIFc9XpzIcVEDU1l5T8QbAMJ1VSJL4Wem5i
         OE/PjxddEUcHt+yPXB9SUPJFIhhdx//YD8WbWS+6tMFX6QTERq1U+BnCghWzsg+jK9ZU
         qV5AFav1/B2sG9auDzJP30DKF7iRt5FhfyN5bp+pzUrwhGWtD3R+KGAyCGpPFpNaufe6
         A92x5v0SIO7cCSO+4P+UaT1DEexO340b4JWp1NCsAn4GD0L+fZAJ02F22L2KTvUs2dLu
         woMA==
X-Gm-Message-State: AFq9FYIgEryDvkaGzxW46VxHmkpCHJ2sWcAQaKaeUCa+HMtjr2RM7aeh
	KlvrX9tY3IH6ExOVQxgq9pJ7VQbYnUHy4xZ+syMSKU+rOpWCbXvCzguS
X-Gm-Gg: AYBFou1Eeg0rOn2NP0W70sbr0gNymGbSgujysGa1fKAi5i+LLCjl7Sl5+JaYh15Ol96
	xi20/hSYeatmDqg6XBesEVzVEFZMM3JoBwPCF8G8Ss4y+iE+89Lj1tEm/GlHRRnBuHW2PCgMQSZ
	yhaXZywQbZjFID9cpY6Xvzo+3ozSDnFLiguLm/3ORtACJ23WqH0cbkvJXilW49cB3N/VdRPZvzt
	AjaMuHI140X8eYu1WHA+rBj0oHhOjZro9i+j4EMGBlgmN2VALSiktPWBtOT9Jw8An5nrcebP+vJ
	TZq6GYhOn4pqtluAAEvfkoW54ey+QkaVxvbHR6vrsEfkFHKJPgWkngBAAzZYtWXJ9ocBqznu1eU
	Lo/PhW9H3xWy9KaVlYUnMCe8OS3s+h5TtU6/CW0zgzX02ROZh8ejPfiXeTGMJkAoiQi6rKAueye
	xiPCjsDs2+MCEvJJZqpYIh90ZdzB4Khhx5tNl8i2NHbOR2KrR1jJSJflarrxZwSsePateHnuq+e
	LTD/d2OaeBERTTri+aAiF+rk2A4u8i8kDoiHRlNlRHbe98DMQAGt3Rl9OeN6q9L0caXTaYNDhs+
	vE/p5wEhjq300GTqROmRZ9vx2jJZy8kPAkpIFkKBJph7i4rorT3iRzCge7oMFDVT2qElaT4kLYu
	BmezCjK2bTGXBidi/YHXDPgw45o/72IR5u3P9bQocvygk5ph6y6YywHhEB9RwRwvOaXGDaAosgG
	HAlkiT
X-Received: by 2002:a05:600c:a49:b0:49f:ffa2:1c72 with SMTP id 5b1f17b1804b1-4a204b20321mr25966005e9.11.1792648335601;
        Wed, 21 Oct 2026 22:52:15 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-a0a3-b57b-feb7-50dc.ipv6.o2.cz. [2a00:1028:8388:a84e:a0a3:b57b:feb7:50dc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2038ddb20sm41312875e9.0.2026.10.21.22.52.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 22:52:14 -0700 (PDT)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Henrik Grimler <henrik@grimler.se>
Subject: [PATCH v2 2/2] ARM: dts: samsung: Add Hardkernel ODROID-U2
Date: Thu, 22 Oct 2026 07:52:08 +0200
Message-ID: <20261022055208.17746-3-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261022055208.17746-1-pepe.schlehofer@gmail.com>
References: <20261022055208.17746-1-pepe.schlehofer@gmail.com>
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

ODROID-U2 is a single board computer from Hardkernel based on the
Samsung Exynos4412 Prime SoC with 2 GB of LPDDR2 RAM. It is the
predecessor of the ODROID-U3 and shares most of its design:
- microSD card slot and eMMC module socket
- SMSC LAN9730 10/100 Ethernet on HSIC0
- SMSC USB3503A hub on HSIC1 with two USB 2.0 host ports
- micro-HDMI port with CEC
- MAX98090 audio codec with a 3.5 mm headphone jack and an on-board
  digital microphone
- MAX77686 PMIC
- 2-pin header for an optional PWM controlled cooling fan
- blue heartbeat LED

Unlike the ODROID-U3, the micro-USB port has no VBUS supply switch, so
it can only work in peripheral mode, and there is no expansion header
with SPI. The 3.5 mm jack is headphone only and the speaker outputs of
the codec are not connected.

Add a device tree for the board that includes the ODROID-U3 one and
describes only these differences, as the ODROID-X2 does with the
ODROID-X, and update the comments in the common dtsi, as the LDO22 and
BUCK8 constraints are now also used by the ODROID-U2.

Also route "HiFi Capture" to "Mixer DAI RX", as on the ODROID-XU3. The
odroid sound card driver adds only the playback routes for boards with
a single CPU DAI, so without it the DPCM capture path to the I2S
back-end is incomplete and recording from the digital microphone fails
with "no backend DAIs enabled for Primary".

Link: https://www.hardkernel.com/shop/odroid-u2/
Link: https://www.hardkernel.com/blog-2/odroid-u2-u-schematics/
Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
---
 arch/arm/boot/dts/samsung/Makefile            |  1 +
 .../dts/samsung/exynos4412-odroid-common.dtsi |  6 +--
 .../boot/dts/samsung/exynos4412-odroidu2.dts  | 42 +++++++++++++++++++
 3 files changed, 46 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm/boot/dts/samsung/exynos4412-odroidu2.dts

diff --git a/arch/arm/boot/dts/samsung/Makefile b/arch/arm/boot/dts/samsung/Makefile
index e0143ee8c82d..2a173e4b3e1a 100644
--- a/arch/arm/boot/dts/samsung/Makefile
+++ b/arch/arm/boot/dts/samsung/Makefile
@@ -16,6 +16,7 @@ dtb-$(CONFIG_ARCH_EXYNOS4) += \
 	exynos4412-i9305.dtb \
 	exynos4412-itop-elite.dtb \
 	exynos4412-n710x.dtb \
+	exynos4412-odroidu2.dtb \
 	exynos4412-odroidu3.dtb \
 	exynos4412-odroidx.dtb \
 	exynos4412-odroidx2.dtb \
diff --git a/arch/arm/boot/dts/samsung/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/samsung/exynos4412-odroid-common.dtsi
index 93ddbd4b0a18..b56b92c78c1d 100644
--- a/arch/arm/boot/dts/samsung/exynos4412-odroid-common.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4412-odroid-common.dtsi
@@ -414,8 +414,8 @@ ldo21_reg: LDO21 {
 
 			ldo22_reg: LDO22 {
 				/*
-				 * Only U3 uses it, so let it define the
-				 * constraints
+				 * Only U2 and U3 use it, so let them define
+				 * the constraints
 				 */
 				regulator-name = "LDO22";
 				regulator-boot-on;
@@ -486,7 +486,7 @@ buck7_reg: BUCK7 {
 			buck8_reg: BUCK8 {
 				/*
 				 * Constraints set by specific board: X,
-				 * X2 and U3.
+				 * X2, U2 and U3.
 				 */
 				regulator-name = "BUCK8_2.8V";
 			};
diff --git a/arch/arm/boot/dts/samsung/exynos4412-odroidu2.dts b/arch/arm/boot/dts/samsung/exynos4412-odroidu2.dts
new file mode 100644
index 000000000000..bc14df9be9f7
--- /dev/null
+++ b/arch/arm/boot/dts/samsung/exynos4412-odroidu2.dts
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Hardkernel's Exynos4412 based ODROID-U2 board device tree source
+ *
+ * Copyright (c) 2026 Josef Schlehofer <pepe.schlehofer@gmail.com>
+ *
+ * Device tree source file for Hardkernel's ODROID-U2 board which is based
+ * on Samsung's Exynos4412 SoC. The board is the predecessor of the
+ * ODROID-U3, so only the differences from it are described here.
+ */
+
+#include "exynos4412-odroidu3.dts"
+
+/ {
+	model = "Hardkernel ODROID-U2 board based on Exynos4412";
+	compatible = "hardkernel,odroid-u2", "samsung,exynos4412", "samsung,exynos4";
+};
+
+/* No VBUS supply switch on the micro-USB port */
+/delete-node/ &vbus_otg_reg;
+
+&hsotg {
+	dr_mode = "peripheral";
+	/delete-property/ vbus-supply;
+};
+
+&sound {
+	model = "Odroid-U2";
+	audio-routing = "Headphone Jack", "HPL",
+			"Headphone Jack", "HPR",
+			"DMICL", "DMIC",
+			"DMICR", "DMIC",
+			"Mixer DAI RX", "HiFi Capture";
+	samsung,audio-widgets =
+		"Headphone", "Headphone Jack",
+		"Microphone", "DMIC";
+};
+
+/* No expansion header with SPI */
+&spi_1 {
+	status = "disabled";
+};
-- 
2.54.0 (Apple Git-157)

