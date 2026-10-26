Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793047320;
	b=yBeRU8DVUD5tFbDMID4pxm6kfDSKyZaSFGwCQ6jkyPc051jswqZcADh3eYgABBu5+9cr
	 +uNSouONxi9FWxVUV3lFsTNnt4Dg776TgtFRwPEsrb342hf2cNnXnvQ0XbEvexl8zpIpj
	 OUNuYxYrhzc86gl/S3GgCY6uAknqhq4okJ7RwW2bIsRf0366W5UPm7+8eSzArb1wvl1lU
	 dQmZBeVMK3WkF20MAIaOxNo5N4tUvrKh/Fl02oIbSkXGyTHG/iNUi95n6W791LNdxMsVD
	 1/A8SG6WLnfcKua42gp7MGfsfK4LZEfRVwFtBmEg2pMFzoVNrZ3bLuDiPs3Xi+V8+tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793047320;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uNPrYlA+DnonfWUvT/WXv31GUY54FKsXFffmLPGjc3U=;
	b=MXpseaJynk1qsgDSuz9F5zXTe4NzanPl9Q0TeRoCog9Jua9REAiQbrcGOYpGyZm8oL6d
	 oSMZXD8kMuTZSbv61iWII46jHHHXW7bvJoOwZWkUjs7pUckMy+OKClPxJ5Gv8AeQrAVlT
	 7Aoj0dtbAGg+LGP46+kmrFCmo1b0tTTPRZ1zOoPRUkVDv9VV7J4ZLU3OnKZQHHWVO/ZtY
	 dHcOF+ihEZ0NHjHvNo4m0q9c3tMiktzNbwHDQlzYRWTwSQlbbr/MwkcDK1CpFSkfVYZMr
	 wU8s8NM7ApCippaflriTuusKzqbtirBqBSRkIv8GuQ/bCbpnCggFO9UEWjbOCgSC2Ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=D2u1l+51;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C76606A327
	for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2026 20:41:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0C76606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=D2u1l+51
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48df8fe8513so3214836f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2026 13:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793047318; x=1793652118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uNPrYlA+DnonfWUvT/WXv31GUY54FKsXFffmLPGjc3U=;
        b=D2u1l+51ww8RaMZptAI7B2SQPsbabz0R1hDbaoLcihdpMnClUig+O2jy2SiOn6eCJy
         JP0e/6Y8IEo/e6RUNAR5tjAWURStvxGEa4z/0tw6qzs1npH1Oac7ytoJwqXL64BQOHZ5
         eXjxwfgAztA1AqLXQypQ96peyGJb+MBQhTCDHmUZfWXT5IcMmtlIlx1vmH2qfFdHEfgJ
         uj59hHB7bYa9KpH08mXvwZi7Y6sCqk0LWrOry9IUWjW4edsqo/avSYZ0pMS06WjSmUbp
         1lXiuqrDhTiatpBYX9dANzQ4xNyajc8C2+bgRsJE/6IKDJi3DdtJLqWeonuvPpgw8Gzl
         u5ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793047318; x=1793652118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uNPrYlA+DnonfWUvT/WXv31GUY54FKsXFffmLPGjc3U=;
        b=OfiEn9VjY/jB17JWs0u1++rEXJg0p5Mra6qvCeLLygW86PtVe4oIpp9Nzb80ss4FCk
         9zMBUSCHdbTeP7YpwoB3Y3CQE2yOTSM6ZsrwB5xHzgThNdM7ZRlazvwcpVRz0xpsDX0b
         UsmOQlXKhu4gxA/c5oMbJP591htZVCH0zeWe6ftb8GeSUbJF4qsfkJuOelaF6DEcQLED
         nNSl9uS7M4czNphPFdCwwgTSKU/hetL2O8IJUVBONdStsUXLtu1Vh1/ieTYINVJN7mEd
         752mw1PqfIcshiLSpVrKpL+W2tPJ8tRLcoRJGduCAbxEdxbJf6aAwrsL8e2VIx9LyOP8
         CRKA==
X-Gm-Message-State: AFq9FYItfp+0sRLVUSQJFQl5PdotM+W1h2SV2CJdzmwnFYPf2eOEsPz8
	QNFiiEsnYXbuhd6uNfPkEM6g+kkxVkbmUddKZSsHS88QMGfKDrEj4pWm
X-Gm-Gg: AYBFou2Ecf6tiv933b2mvlrtiB9mgSMDZ/YNR/hRZOSApmHB79O9M1wp3hj4h6OVxMO
	DIawUtjG4h1qboYex5VrJDOpvTJUzgqCkwJzXM1t7pSujOaQ++p+KSJRGGXbpk+yHP50nWFaxKS
	5SGeeuaHRvn6czprEj/bfjhZbfSTGS8hC5WjYgyPHwg1TgH4BiMgBxZmdSdWe1Waj9qvjxYtytu
	fjybqjhNhV1fOlTqD5hGvFOidSjvx8h0AP+YzIhinMXwM1fU+RgTzHncGZdd6ZOIXupO+iEQKy9
	+gOwxlc+2JX2ByYHpYAh310JhtgugOsaNi9RorEN4ltE+Mki1HWXD9Z4lfFZ9USx++dD8LIK5tX
	wTks3cqe3HUR+//fhBnE3EViYvetNgWlQ7f0nnByNs/leFto7mqLQ9iV4ltwoPPywJPi7qSjJox
	T90jSqVfeKM0UP9jl87P2st3BtLcLi4htANCOdcQbAhjNBbDI1pPnWhukrqp1K2Av69lDdfR3+/
	oKfzeihasg2PjpbtxFMFzOh/HzzbgK3r3+lTzxyXE5DQNSB0gAHQkR4ST0J4dEyMRx7BqtSqO5l
	xCSh31IRh1PvJkVU5Q5IA022LbG0L7x78wj7bU6ZihRYmcRAjQ9La5256iRGCsvSGAMyKcUpK3I
	gKlGW1/xrI8maDKMneDhx8aY2wyDH3QXYO5tWOf+26/hXop2ONC+Hxt3HvbzZgptCrB59dzhVSb
	nNOHQ1
X-Received: by 2002:adf:f284:0:b0:48e:2980:d396 with SMTP id ffacd0b85a97d-48e3eb8d6a5mr12409485f8f.37.1793047318143;
        Mon, 26 Oct 2026 13:41:58 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-8ce1-bbf6-5949-b0f3.ipv6.o2.cz. [2a00:1028:8388:a84e:8ce1:bbf6:5949:b0f3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc39b3sm19053152f8f.10.2026.10.26.13.41.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 Oct 2026 13:41:57 -0700 (PDT)
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
Subject: [PATCH v3 2/2] ARM: dts: samsung: Add Hardkernel ODROID-U2
Date: Mon, 26 Oct 2026 21:41:54 +0100
Message-ID: <20261026204154.26378-3-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261026204154.26378-1-pepe.schlehofer@gmail.com>
References: <20261026204154.26378-1-pepe.schlehofer@gmail.com>
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
Reviewed-by: Henrik Grimler <henrik@grimler.se>
Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
---
 arch/arm/boot/dts/samsung/Makefile            |  1 +
 .../dts/samsung/exynos4412-odroid-common.dtsi |  6 +--
 .../boot/dts/samsung/exynos4412-odroidu2.dts  | 41 +++++++++++++++++++
 3 files changed, 45 insertions(+), 3 deletions(-)
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
index 000000000000..8a18e65de30c
--- /dev/null
+++ b/arch/arm/boot/dts/samsung/exynos4412-odroidu2.dts
@@ -0,0 +1,41 @@
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
+	samsung,audio-widgets = "Headphone", "Headphone Jack",
+				"Microphone", "DMIC";
+};
+
+/* No expansion header with SPI */
+&spi_1 {
+	status = "disabled";
+};
-- 
2.54.0 (Apple Git-157)

