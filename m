Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A47C217704
	for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Jun 2025 09:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749721702; cv=none; b=B9EBCm7lk7pTx+gdXMAf8dZIqjMgG9UXzjpWuJtf/xIyrN8W5xLJDDK/J7q/8VIAlGVL5jVMTCyyo4ZHeRrb/XordALSvundbPFUhuuzZgOAjsL7jJzcaq8hLkml/T7sS6jKU7ssBNdQL/gVt/+JaW1D6lYVhSkzRfwj3edasS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749721702; c=relaxed/simple;
	bh=L5LoFcl51Iem2mft6JT3xmbahq/ooGCn2HKGLYEj68g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uAZPldoflU1H5ZOE2lav9nil5JHd+m/cd4cZZ7J+PL2x7TjODyVpER7kLoXXLc5pc4ppQj6wP/rCBPlQrIQtK+4aJijvJzggyH5Ra75eMc/jGdyjMWU7GQHZ/Ijxw2BIwHHzjLD6JPxY1ipih/whk4uEvp+bNcMapZxrLWQtBHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K0Zwte+R; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K0Zwte+R"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-450828af36aso192775e9.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Jun 2025 02:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749721699; x=1750326499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B70k2QPDSr4i0ZgOnedGK+9i7ro/DH2DRK+ZNWKC9pg=;
        b=K0Zwte+R1QGpl0bZG/iU/Dummfdo+qx//2U/nyA426C8VKNEIs0j903OHlbrOMaMAK
         U/yvJV9Wz6am5kVI7d/KQZ37q0ahp4dItmF9GGThNMi2TS1+7PZRXQORO+7Ex+vwohJD
         v9NR4Y51oE/Dv/9MKOdAWXg5Gx1i1EfzIherV0TtC/AINaOGUOTY6oYDBtebr5PXH/nO
         rt1Pi9SkXHp528NyEEKFn63F/CPoMGA5V0ZwhsgzHTopGWe6jVsF1106xTew49Cs93qJ
         o1LwrfEuuvsfti0nR3d0lPXKzLPGaTOIsMx0NqCOMcD+m/qG2MHugbz2Qs5LC4jLlGGB
         tfTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749721699; x=1750326499;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B70k2QPDSr4i0ZgOnedGK+9i7ro/DH2DRK+ZNWKC9pg=;
        b=gtKPjbeYXmm/8SnHXLXij9VKJwxxVPeLX0K9oiB8RjWBJiIZz/6lLkMEBXLp9Gns2/
         g5V/FK479FESuWutsfOKOKjwdzOkNYmgsIcH3jw/LkCWi0j4XTPyibtq5fHhRe8Un7ay
         kJFItTZhZcumUAnOx57Ufb0ItJFh+IWKLoaP0iEjwdrsIGwqAkOqiQN63XycGLiUEEcL
         ASYlswhTt7SqUYk7lT5qKc6QjEW6mYIgnmkP8lANLScGtgIRclmeth3qEa7Px8UyV5lb
         X+lIaeE1l8pPnAALgEHadkoDVSJbMlAyMJpVgzD5fRbiHoMt66n621CQIcDgU8vc+Ko4
         Mr5A==
X-Forwarded-Encrypted: i=1; AJvYcCUsSBlBfiHI4uXzvf269mJm+VTWUK07b37GDlls/FnJj5Ft68bwRn30ap+R7xsADtUJOo5QNlDSqRxv8+rEj8WMEg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yze09Qa4Hqm6whEx5Yt+8UGJekUxxjCqcKJLjiIOZvkfiCrNkMv
	oXY8Diu2PZZAn2Hyk8xsaMn0CKkC95mm3/ceVSmhgu8I8RREIMQmb05UfK33g0A6Rqc=
X-Gm-Gg: ASbGnctOLEJAStelyL9m71w05cWxCSgheHxvXfJPYWTP+aw7CVYdeV3wuBOiJCs6U8O
	sRZDKI6J1B5ga9hcFgVJ5eK8zKzDh7llX++vkzD+0p7SuKWxXJ8nSdduzoMRozA3621sRj87HEk
	yGra527oclS8woKC/2H8tmnFVI4KTbiFCxcDXSJQuFrOatFtxxO1uN58akpRiyRoj7QHG+63w8M
	jo3cvtkOD3OelpvFjP3oOaWpDmETfUESC77UaXVLmcJp/cx9ufIG7jTvplBoNyuYG3nSmViaejW
	I5aHKW/HJdYYSgkrJSU61bw0K5GQBZhRDc8eZuGJ3Tc1/Rvocfw4Rf8x6ZBuPxShgMu/JW712w=
	=
X-Google-Smtp-Source: AGHT+IEGEdER8j18C2N9IDsXkuWiNYo5TUP+yHyesGgK8p5+c1gwuK2eS+tj7pF5c6oJ3HZQAIvOug==
X-Received: by 2002:a05:600c:c106:b0:43d:fa58:81d2 with SMTP id 5b1f17b1804b1-453248ed6fcmr16621305e9.9.1749721698561;
        Thu, 12 Jun 2025 02:48:18 -0700 (PDT)
Received: from kuoka.. ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532de8bd0bsm15394225e9.5.2025.06.12.02.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 02:48:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 1/2] ARM: dts: exynos: Align i2c-gpio node names with dtschema
Date: Thu, 12 Jun 2025 11:48:08 +0200
Message-ID: <20250612094807.62532-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8561; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=L5LoFcl51Iem2mft6JT3xmbahq/ooGCn2HKGLYEj68g=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSqJXz7NKj9GKEHpgGLCRO9LFdpPf5qKPpNdPv
 mdaxQR0GaSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEqiVwAKCRDBN2bmhouD
 1/JJD/9uuw8L5AXfjbIoexgHK+rr9C2C9K/EhmR14Kgoaxs1+ku0XTgkiXmjVh6TFAqLWSIK/95
 zO8R8sUv95K0OBgwcCM05P/Xv0TRGPtpu3S7v8mqq70f1cBHHffdXrRIF9DSmuo1ZdStnGyOoH8
 vgWnylyYWTu9SOlRRGn8OoT/Dudp8Oy2FUspAMrA2NuCKk+haQkg8WWGM1NRrh6d0ZAv2IkgcjI
 rhAzm5QKvd2p64rSvP4oMqzJjoZrs9Sos/UtaP5UQyv3gDyexV3lfekJb4Vne3c7+U3tUdfpe4H
 LDbqeStGA7hWFT/WmFqtdleLuTRXjlhbBqY/TVpTVG697CUWVi1WjKOfpnDXKUmHetms2ODTNd3
 7gvPCR2CDvExbvEbXNFIyaYStVhX0CNMh7vKPv82QYF8qdPu1uOdpX1YzDH/eqfbs42bjM00ERL
 uNGkvIbkoV+yjX+fq0AzvTlEmAXmsUUs/TppyeyydwafTHlJk8V84GKE/FuUPELFJYesUvHsfKY
 fq6dPhzH5s1aDOhIUGVxlLCqZCoD3edto1TBrk3/7SVXiCtyKfIqZqE4m+IKIl0i7OFrNfQ9lDu
 ip7HIV/V7xU+fWBpiv5DUz17dEvX6GjXY8jnXnYD0yew1tTuQXIYdt/Zfd+q8OTDZXepqc3BGWW 36zOJyX357vcgtA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

New dtschema v2025.6 enforces different naming on I2C nodes thus new
dtbs_check warnings appeared for I2C GPIO nodes:

  exynos4212-tab3-lte8.dtb: i2c-gpio-3 (i2c-gpio):
    $nodename:0: 'i2c-gpio-3' does not match '^i2c(@.+|-[a-z0-9]+)?$'
  exynos4212-tab3-lte8.dtb: i2c-gpio-3 (i2c-gpio):
    Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'magnetometer@2e' were unexpected)

Rename the nodes to a generic i2c-[0-9]+ style with numbers continuing
the SoC I2C controller indexing (Exynos3250: 8 controllers, Exynos4: 9
controllers) for simplicity and obviousness, even if the SoC I2C
controller is not enabled on given board.  The names anyway would not
conflict with SoC ones because of unit addresses.

Verified with comparing two fdt (after fdtdump).

Reported-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Closes: https://lore.kernel.org/all/aCtD7BH5N_uPGkq7@shikoro/
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/samsung/exynos3250-monk.dts       |  2 +-
 arch/arm/boot/dts/samsung/exynos3250-rinato.dts     |  2 +-
 arch/arm/boot/dts/samsung/exynos4210-i9100.dts      |  6 +++---
 arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi      | 10 +++++-----
 arch/arm/boot/dts/samsung/exynos4412-galaxy-s3.dtsi |  4 ++--
 arch/arm/boot/dts/samsung/exynos4412-midas.dtsi     |  8 ++++----
 arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi    |  8 ++++----
 7 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/exynos3250-monk.dts b/arch/arm/boot/dts/samsung/exynos3250-monk.dts
index 2de877d4ccc5..68236c7297d7 100644
--- a/arch/arm/boot/dts/samsung/exynos3250-monk.dts
+++ b/arch/arm/boot/dts/samsung/exynos3250-monk.dts
@@ -56,7 +56,7 @@ vemmc_reg: voltage-regulator-0 {
 		enable-active-high;
 	};
 
-	i2c_max77836: i2c-gpio-0 {
+	i2c_max77836: i2c-8 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpd0 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpd0 3 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
diff --git a/arch/arm/boot/dts/samsung/exynos3250-rinato.dts b/arch/arm/boot/dts/samsung/exynos3250-rinato.dts
index 88fb3e68ff02..36d2171c1ce8 100644
--- a/arch/arm/boot/dts/samsung/exynos3250-rinato.dts
+++ b/arch/arm/boot/dts/samsung/exynos3250-rinato.dts
@@ -58,7 +58,7 @@ wlan_pwrseq: mshc1-pwrseq {
 		reset-gpios = <&gpe0 4 GPIO_ACTIVE_LOW>;
 	};
 
-	i2c_max77836: i2c-gpio-0 {
+	i2c_max77836: i2c-8 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpd0 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpd0 3 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
diff --git a/arch/arm/boot/dts/samsung/exynos4210-i9100.dts b/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
index 0d8495792a70..df229fb8a16b 100644
--- a/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
+++ b/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
@@ -130,7 +130,7 @@ wlan_pwrseq: sdhci3-pwrseq {
 		reset-gpios = <&gpl1 2 GPIO_ACTIVE_LOW>;
 	};
 
-	i2c_max17042_fuel: i2c-gpio-0 {
+	i2c_max17042_fuel: i2c-9 {
 		compatible = "i2c-gpio";
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -154,7 +154,7 @@ battery@36 {
 		};
 	};
 
-	i2c_s5k5baf: i2c-gpio-1 {
+	i2c_s5k5baf: i2c-10 {
 		compatible = "i2c-gpio";
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -184,7 +184,7 @@ s5k5bafx_ep: endpoint {
 		};
 	};
 
-	i2c-gpio-2 {
+	i2c-11 {
 		compatible = "i2c-gpio";
 		#address-cells = <1>;
 		#size-cells = <0>;
diff --git a/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi b/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
index 70e3091062f9..12b7f252b24d 100644
--- a/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
@@ -123,7 +123,7 @@ led-touchkeys {
 		color = <LED_COLOR_ID_WHITE>;
 	};
 
-	i2c_max77693: i2c-gpio-1 {
+	i2c_max77693: i2c-9 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpm2 0 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpm2 1 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
@@ -169,7 +169,7 @@ charger {
 		};
 	};
 
-	i2c_max77693_fuel: i2c-gpio-2 {
+	i2c_max77693_fuel: i2c-10 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpy0 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpy0 3 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
@@ -190,7 +190,7 @@ fuel-gauge@36 {
 		};
 	};
 
-	i2c_magnetometer: i2c-gpio-3 {
+	i2c_magnetometer: i2c-11 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpy2 4 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpy2 5 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
@@ -208,7 +208,7 @@ magnetometer@2e {
 		};
 	};
 
-	i2c_lightsensor: i2c-gpio-4 {
+	i2c_lightsensor: i2c-12 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpl0 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpl0 1 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
@@ -220,7 +220,7 @@ i2c_lightsensor: i2c-gpio-4 {
 		/* WiFi model uses CM3323, 3G/LTE use CM36653 */
 	};
 
-	i2c_bl: i2c-gpio-5 {
+	i2c_bl: i2c-13 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpm4 3 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpm4 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
diff --git a/arch/arm/boot/dts/samsung/exynos4412-galaxy-s3.dtsi b/arch/arm/boot/dts/samsung/exynos4412-galaxy-s3.dtsi
index 54e1a57ae886..3248be990059 100644
--- a/arch/arm/boot/dts/samsung/exynos4412-galaxy-s3.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4412-galaxy-s3.dtsi
@@ -53,7 +53,7 @@ ps_als_reg: voltage-regulator-11 {
 		enable-active-high;
 	};
 
-	i2c_ak8975: i2c-gpio-0 {
+	i2c_ak8975: i2c-13 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpy2 4 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpy2 5 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
@@ -68,7 +68,7 @@ magnetometer@c {
 		};
 	};
 
-	i2c_cm36651: i2c-gpio-2 {
+	i2c_cm36651: i2c-14 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpf0 0 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpf0 1 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
diff --git a/arch/arm/boot/dts/samsung/exynos4412-midas.dtsi b/arch/arm/boot/dts/samsung/exynos4412-midas.dtsi
index 3d5aace668dc..05ddddb565ee 100644
--- a/arch/arm/boot/dts/samsung/exynos4412-midas.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4412-midas.dtsi
@@ -166,7 +166,7 @@ key-ok {
 		};
 	};
 
-	i2c_max77693: i2c-gpio-1 {
+	i2c_max77693: i2c-9 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpm2 0 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpm2 1 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
@@ -246,7 +246,7 @@ charger {
 		};
 	};
 
-	i2c_max77693_fuel: i2c-gpio-3 {
+	i2c_max77693_fuel: i2c-10 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpf1 5 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpf1 4 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
@@ -267,7 +267,7 @@ fuel-gauge@36 {
 		};
 	};
 
-	i2c-gpio-4 {
+	i2c-11 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpl0 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpl0 1 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
@@ -286,7 +286,7 @@ touchkey@20 {
 		};
 	};
 
-	i2c-mhl {
+	i2c-12 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpf0 4 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpf0 6 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
diff --git a/arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi b/arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi
index 28a605802733..8d52aa13b862 100644
--- a/arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi
@@ -140,7 +140,7 @@ battery_cell: battery-cell {
 		constant-charge-voltage-max-microvolt = <4200000>;
 	};
 
-	i2c-gpio-1 {
+	i2c-9 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpy2 4 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpy2 5 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
@@ -158,7 +158,7 @@ magnetometer@c {
 		};
 	};
 
-	i2c-gpio-2 {
+	i2c-10 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpy0 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpy0 3 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
@@ -179,7 +179,7 @@ fuel-gauge@36 {
 		};
 	};
 
-	i2c-gpio-3 {
+	i2c-11 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpm4 1 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpm4 0 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
@@ -207,7 +207,7 @@ adc {
 		};
 	};
 
-	i2c-gpio-4 {
+	i2c-12 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpm2 0 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpm2 1 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
-- 
2.45.2

