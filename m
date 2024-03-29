Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6067130E2D
	for <linux-samsung-soc@vger.kernel.org>; Fri, 29 Mar 2024 17:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711734515; cv=none; b=tMjEx6f0NrXYWcsu17EyO5SRnvskByzZ4BUml+k9Dj+ZA+zbP19llwH60j8kz6ICnNxkMJijuR/59cs2HsYDuLDfbKdqmDXwLrhfG7HOgFKWmnbJT9qg9sBI3JNN4WfwAjdu10RClFzb4G0lvdtUqL6g2AKfmgOc82+OFWGg1GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711734515; c=relaxed/simple;
	bh=/lMEaQ5FWLqHxvVKuDHkZPuDwH08gzMnjgffT2YIXAA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Jekxqp4GCYxynzFlZcaNrtRZDP2tUOs64vZ8jTqJyiyaO/E+QDmT8/rPHWNouRa7E+jfrgQrDBzyjTGmpAXYsRphQ5pfLGr7mhzcMwS9WVxQt54e8yCVXMOQ7+P+3myhszF8bnd3E0+7IePRxB3/bYMTGqpy6dZpSx1l25mBrmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dwIAnNRX; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dwIAnNRX"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-41493e0fbf2so15023815e9.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 29 Mar 2024 10:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711734511; x=1712339311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ui/J5zKmEsVywXjm0Kgz2mYnNVlOw/q5qR+FEIy068E=;
        b=dwIAnNRXbWnOZJ43Vwpr0sC0+4gDA1CkVOZ6ZTZBYwI13c7Iz2R3ll+d7nScXPYte7
         CJEH0fiGg1zyz34N3/9NSWlAxQzsQ+HuQlnTamSKstrIWJRD/bORDdXw8GClGd9vbRmw
         mNANwTO9SYeN65Dh7Nzyb/h7yS7wOmXD2OrhkNNz0Ug2H5xUwZBADR6thDk0zp5K83YZ
         vuS+kaz7INCrDeG4MwaCfCD4gI4u/Ip6Adkwc02xwSMYGGnrzX/3djKqmRwHe/5V8t4B
         KPQ66NlmOf7NAXBpWqQbL+9Ohv5koqHHe4MW5B29l0iIsWVZasPRr011WvLS15Awwr3i
         SKMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711734511; x=1712339311;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ui/J5zKmEsVywXjm0Kgz2mYnNVlOw/q5qR+FEIy068E=;
        b=Fjz8hsLbvIEeUIZ193UbwdBbntERBY0tA15s4fFEWKJ29D1qFWgw0HhlassuRGWPvf
         If3CMtZaF77i8vpRzKIseea9gRC/h/uD4W3c5CdsKjiHMLuH/sOZHigAetZmQ6+SO7wN
         F4blqlDPfeKCDfDLv7EhEhlsFQRwLvXY/jxXYCOM0uo7JZT/xjKYWxBf1SlR7EEL/QjN
         c+B3R8gkB0LUu1q09VzCs+vCJdBuNKmXLJvGGJEQkHYgWud7t7/CpRKlfCH8MOT68DF6
         MSyWlAPi8eAF5T9Fv6/g6Swp6cu8FnHNzcMysbj6k87dPhxWX0Dm+gsy8DaoHd40+seQ
         UGZw==
X-Forwarded-Encrypted: i=1; AJvYcCXM2HqMWWsBjZ+/gJ3K7Iur/ONbbIc6RPFOtJWkAhPx0cK2qKvRpgb9NtAb4ZmFkiLhRY3kKYtP3kU8wtPcnjQ9GvlXm4tigUQ2UVj0ryUxElE=
X-Gm-Message-State: AOJu0Yw7ZbQQDPBHRpEcR8Xa49i5YOhQygon04K1QTRbXojV3t79paO6
	wgDbmhseQxKfbzN1xzCKhtODdcDSuRpNRfhzt0Mrlj0gyHFuu0Upd0Sl4zSYxis=
X-Google-Smtp-Source: AGHT+IGfd2HZTroy7a6ljeuF6eUNe+t5bfgbd6ICXavZQWyRpJL8AzYiWUdWFmwHAudmGtcksOQWoA==
X-Received: by 2002:a05:6000:1143:b0:33e:4d34:f40f with SMTP id d3-20020a056000114300b0033e4d34f40fmr1804706wrx.46.1711734511133;
        Fri, 29 Mar 2024 10:48:31 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id g16-20020adfa490000000b00341dd083371sm4687089wrb.90.2024.03.29.10.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 10:48:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] MAINTAINERS: Change Krzysztof Kozlowski's email address
Date: Fri, 29 Mar 2024 18:48:23 +0100
Message-Id: <20240329174823.74918-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch Krzysztof Kozlowski's to @kernel.org account.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 MAINTAINERS | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 56aa6108b58b..aa97210edb41 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2698,7 +2698,7 @@ F:	sound/soc/rockchip/
 N:	rockchip
 
 ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES
-M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+M:	Krzysztof Kozlowski <krzk@kernel.org>
 R:	Alim Akhtar <alim.akhtar@samsung.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-samsung-soc@vger.kernel.org
@@ -5555,7 +5555,7 @@ F:	drivers/cpuidle/cpuidle-big_little.c
 CPUIDLE DRIVER - ARM EXYNOS
 M:	Daniel Lezcano <daniel.lezcano@linaro.org>
 M:	Kukjin Kim <kgene@kernel.org>
-R:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+R:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-pm@vger.kernel.org
 L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
@@ -8998,7 +8998,7 @@ F:	drivers/i2c/muxes/i2c-mux-gpio.c
 F:	include/linux/platform_data/i2c-mux-gpio.h
 
 GENERIC GPIO RESET DRIVER
-M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+M:	Krzysztof Kozlowski <krzk@kernel.org>
 S:	Maintained
 F:	drivers/reset/reset-gpio.c
 
@@ -13286,7 +13286,7 @@ F:	drivers/iio/adc/max11205.c
 
 MAXIM MAX17040 FAMILY FUEL GAUGE DRIVERS
 R:	Iskren Chernev <iskren.chernev@gmail.com>
-R:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+R:	Krzysztof Kozlowski <krzk@kernel.org>
 R:	Marek Szyprowski <m.szyprowski@samsung.com>
 R:	Matheus Castello <matheus@castello.eng.br>
 L:	linux-pm@vger.kernel.org
@@ -13296,7 +13296,7 @@ F:	drivers/power/supply/max17040_battery.c
 
 MAXIM MAX17042 FAMILY FUEL GAUGE DRIVERS
 R:	Hans de Goede <hdegoede@redhat.com>
-R:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+R:	Krzysztof Kozlowski <krzk@kernel.org>
 R:	Marek Szyprowski <m.szyprowski@samsung.com>
 R:	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
 R:	Purism Kernel Team <kernel@puri.sm>
@@ -13354,7 +13354,7 @@ F:	Documentation/devicetree/bindings/power/supply/maxim,max77976.yaml
 F:	drivers/power/supply/max77976_charger.c
 
 MAXIM MUIC CHARGER DRIVERS FOR EXYNOS BASED BOARDS
-M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-pm@vger.kernel.org
 S:	Maintained
 B:	mailto:linux-samsung-soc@vger.kernel.org
@@ -13365,7 +13365,7 @@ F:	drivers/power/supply/max77693_charger.c
 
 MAXIM PMIC AND MUIC DRIVERS FOR EXYNOS BASED BOARDS
 M:	Chanwoo Choi <cw00.choi@samsung.com>
-M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
 B:	mailto:linux-samsung-soc@vger.kernel.org
@@ -14157,7 +14157,7 @@ F:	lib/alloc_tag.c
 F:	lib/pgalloc_tag.c
 
 MEMORY CONTROLLER DRIVERS
-M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
 B:	mailto:krzysztof.kozlowski@linaro.org
@@ -15538,7 +15538,7 @@ F:	include/uapi/linux/nexthop.h
 F:	net/ipv4/nexthop.c
 
 NFC SUBSYSTEM
-M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	netdev@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/net/nfc/
@@ -15914,7 +15914,7 @@ F:	Documentation/devicetree/bindings/regulator/nxp,pf8x00-regulator.yaml
 F:	drivers/regulator/pf8x00-regulator.c
 
 NXP PTN5150A CC LOGIC AND EXTCON DRIVER
-M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/extcon/extcon-ptn5150.yaml
@@ -16525,7 +16525,7 @@ K:	of_overlay_remove
 
 OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
 M:	Rob Herring <robh@kernel.org>
-M:	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
+M:	Krzysztof Kozlowski <krzk+dt@kernel.org>
 M:	Conor Dooley <conor+dt@kernel.org>
 L:	devicetree@vger.kernel.org
 S:	Maintained
@@ -17483,7 +17483,7 @@ F:	Documentation/devicetree/bindings/pinctrl/renesas,*
 F:	drivers/pinctrl/renesas/
 
 PIN CONTROLLER - SAMSUNG
-M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+M:	Krzysztof Kozlowski <krzk@kernel.org>
 M:	Sylwester Nawrocki <s.nawrocki@samsung.com>
 R:	Alim Akhtar <alim.akhtar@samsung.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
@@ -19420,7 +19420,7 @@ F:	Documentation/devicetree/bindings/sound/samsung*
 F:	sound/soc/samsung/
 
 SAMSUNG EXYNOS PSEUDO RANDOM NUMBER GENERATOR (RNG) DRIVER
-M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-crypto@vger.kernel.org
 L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
@@ -19455,7 +19455,7 @@ S:	Maintained
 F:	drivers/platform/x86/samsung-laptop.c
 
 SAMSUNG MULTIFUNCTION PMIC DEVICE DRIVERS
-M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-kernel@vger.kernel.org
 L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
@@ -19481,7 +19481,7 @@ F:	drivers/media/platform/samsung/s3c-camif/
 F:	include/media/drv-intf/s3c_camif.h
 
 SAMSUNG S3FWRN5 NFC DRIVER
-M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+M:	Krzysztof Kozlowski <krzk@kernel.org>
 S:	Maintained
 F:	Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml
 F:	drivers/nfc/s3fwrn5
@@ -19502,7 +19502,7 @@ S:	Supported
 F:	drivers/media/i2c/s5k5baf.c
 
 SAMSUNG S5P Security SubSystem (SSS) DRIVER
-M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+M:	Krzysztof Kozlowski <krzk@kernel.org>
 M:	Vladimir Zapolskiy <vz@mleia.com>
 L:	linux-crypto@vger.kernel.org
 L:	linux-samsung-soc@vger.kernel.org
@@ -19524,7 +19524,7 @@ F:	Documentation/devicetree/bindings/media/samsung,fimc.yaml
 F:	drivers/media/platform/samsung/exynos4-is/
 
 SAMSUNG SOC CLOCK DRIVERS
-M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+M:	Krzysztof Kozlowski <krzk@kernel.org>
 M:	Sylwester Nawrocki <s.nawrocki@samsung.com>
 M:	Chanwoo Choi <cw00.choi@samsung.com>
 R:	Alim Akhtar <alim.akhtar@samsung.com>
@@ -19556,7 +19556,7 @@ F:	drivers/net/ethernet/samsung/sxgbe/
 
 SAMSUNG THERMAL DRIVER
 M:	Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
-M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-pm@vger.kernel.org
 L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
@@ -23740,7 +23740,7 @@ S:	Orphan
 F:	drivers/mmc/host/vub300.c
 
 W1 DALLAS'S 1-WIRE BUS
-M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+M:	Krzysztof Kozlowski <krzk@kernel.org>
 S:	Maintained
 F:	Documentation/devicetree/bindings/w1/
 F:	Documentation/w1/
-- 
2.34.1

