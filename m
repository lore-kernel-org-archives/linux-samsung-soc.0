Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D67A1BCA0F;
	Sat, 21 Dec 2024 15:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734794894; cv=none; b=scHv1py/29oZPbfatv0+5OrULs35h6w6mGsQt8mC35Y49yU5JRJiuJYg7VqfnFK8+It9jnizlzxnS2G7V3sm5VKuKdHhPos9Cw/wiVxKlc3MYA+vi8WQJLcf/0CkUUno6ZIElN3yyuVonULdbXi2iKpNAL8J7phq4BA+hqP7QfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734794894; c=relaxed/simple;
	bh=/qTE8ptrpkulreSBCf8Ag02gVVxCkefNg640RXIpetA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=asWvLyxnPhEhG/95J7EMx6ulqyy9qDHOVe5N9mO2zjmI+6Hd6+9Ff36yYq7w49Rg2rVIee0wGFCq+tevPeNz2/k/pLcaDDehVfikT0v//Rnj+bRDPAeu7y4eJeM+TTdIkgsiYDbC3GIrhVKKYrLw4J1QriEDG3uQNyGSlLNG9Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GvCFVczk; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GvCFVczk"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4361815b96cso19509325e9.1;
        Sat, 21 Dec 2024 07:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734794891; x=1735399691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OE1x/SFoPuvjqQM46euQohKrxDfC87JAVBTFIJk/JVQ=;
        b=GvCFVczkgaGyZYgyWj9vTAFbzcLjw3OzowsmqHDbHYvz4AwsTRL6UiV2QW26WeDIKL
         FJG1AAmQxePVzzZiW33FpX/WG0STLS+dfdGJp6rGZSrDWyyh2EuncoeLU3sENE3AZfgy
         up/5Ep0frU+Ixpvr1Jzh4nEjaxKcIjpoZBSpJ6o6rVD5C+Sl12ukyUzCKUQpa6/7kNbq
         Jnjwroli//D9Fm8QqIPxl2wnpMfPpufvJOSlZOVTTHJFtQORl52bC7RsQkblsMZICSTO
         fL/pakEqjj8VP7f1Q9pJPCWcA/0tWQbL2158QV6hN2OjtpQjMCPYg3DNjNWvtL8HzUjj
         5GMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734794891; x=1735399691;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OE1x/SFoPuvjqQM46euQohKrxDfC87JAVBTFIJk/JVQ=;
        b=HcrPPx7zWRE8hQGSkhxw5vnww8wz9SSmT09CfpAr9Y2FZshOj7aYW/GkXVPgRqGE6G
         ACU0F8/hiWR67vtZO47k9CpsCUXC1La1hkZRjaYJ0+L90crpcCRlGjC0xEAEgePLmiTi
         cXVFAyWB+Q+jNelsqVpdrRiqY2gD/L49ClI9iDd8q5EgVngpfAbZo97AJnT9BUsublQr
         ruNGnF2aJoI3n5RyHtOUDPC45NY7dAkPAj3SMP4j56RbMLZQbDTUIj9EdKxtw/r8fjmG
         pDLITbbtgQJqdE145eaab16lG/qGBzKWVo17rbektRgNxpwttGU2cILFgxGcVW8JUDtE
         oY6A==
X-Forwarded-Encrypted: i=1; AJvYcCWacCB/oJReB+Uxlnbso3WJcaGZATaa5hCVs5djwZP3D9LqpQ3s1SCKjIZHKe9gdz5Vm5MZj6XEQNXKYwFs@vger.kernel.org, AJvYcCWlAjSI9m6tphJNhLKIchRTPfETrMrqHdFTeACQYW4W+86EyPi0ZF+HvE2+MfiZh9hPVATuFHvc0eC6@vger.kernel.org
X-Gm-Message-State: AOJu0YxZPLTO8215tMQgUdq+NQrInRurq208qX08/CXWXB5uWk3CPCZ0
	b6iaeLX5RthpL2claeikOEVOqrJh0C5PtFSrc9nM3iOTzHWZUdeL
X-Gm-Gg: ASbGncsHjWXd9OBSASPDG7ZfcWykT08FNu6wVw7Ey5bHMeoyO6vQGcYIwP604JvN6s7
	gBWkyS0aq+XGckIS0IiYObs/yh0GPfbf333j0Ed+jopF8DAo331JOXxEx0pup1ffd80/0UyQT7e
	ngW7BsfMu6anNAT2mGKltpPzO1sb/jfeCNN+8lpOuLf8oLzcaetk0Qo5TFRNCaOMDkP8wxDgRoA
	Eygt91CEoXeiKlzkBkX8pDtUZabdz3QdLi+FQna0TmJsjmSBCuk+OuntXRRoFyCGpq9O8TX0Uxj
	9CluP9mQR0w/HNmXlLgHGI+R+P1jt4V8
X-Google-Smtp-Source: AGHT+IGoOuZNtYoITLOG2vWZWYpqu4FbjyfjTwdrHrvZ/TTqDoVpDDb9JxqC+j+tEHS1yOWkwW0Xyw==
X-Received: by 2002:a05:600c:3590:b0:42a:a6d2:3270 with SMTP id 5b1f17b1804b1-43668b5f6b1mr52935245e9.21.1734794890420;
        Sat, 21 Dec 2024 07:28:10 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b3b271sm111659835e9.34.2024.12.21.07.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Dec 2024 07:28:09 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: exynos8895: Add camera hsi2c nodes
Date: Sat, 21 Dec 2024 17:28:03 +0200
Message-ID: <20241221152803.1663820-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add nodes for hsi2c1-4 (CAM0-3), which allows using them.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
Bindings are in another patchset [1].

Changes in v2:
  - Mention the bindings this patch depends on.

[1] https://lore.kernel.org/all/20241221151937.1659139-1-ivo.ivanov.ivanov1@gmail.com/
---
 arch/arm64/boot/dts/exynos/exynos8895.dtsi | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos8895.dtsi b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
index 90b318b2f..36657abfc 100644
--- a/arch/arm64/boot/dts/exynos/exynos8895.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
@@ -292,6 +292,50 @@ pinctrl_peric1: pinctrl@10980000 {
 			interrupts = <GIC_SPI 430 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		hsi2c_1: i2c@10990000 {
+			compatible = "samsung,exynos8895-hsi2c";
+			reg = <0x10990000 0x1000>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_HSI2C_CAM0_IPCLK>;
+			clock-names = "hsi2c";
+			interrupts = <GIC_SPI 431 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&hsi2c1_bus>;
+			pinctrl-names = "default";
+			status = "disabled";
+		};
+
+		hsi2c_2: i2c@109a0000 {
+			compatible = "samsung,exynos8895-hsi2c";
+			reg = <0x109a0000 0x1000>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_HSI2C_CAM1_IPCLK>;
+			clock-names = "hsi2c";
+			interrupts = <GIC_SPI 432 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&hsi2c2_bus>;
+			pinctrl-names = "default";
+			status = "disabled";
+		};
+
+		hsi2c_3: i2c@109b0000 {
+			compatible = "samsung,exynos8895-hsi2c";
+			reg = <0x109b0000 0x1000>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_HSI2C_CAM2_IPCLK>;
+			clock-names = "hsi2c";
+			interrupts = <GIC_SPI 433 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&hsi2c3_bus>;
+			pinctrl-names = "default";
+			status = "disabled";
+		};
+
+		hsi2c_4: i2c@109c0000 {
+			compatible = "samsung,exynos8895-hsi2c";
+			reg = <0x109c0000 0x1000>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_HSI2C_CAM3_IPCLK>;
+			clock-names = "hsi2c";
+			interrupts = <GIC_SPI 434 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&hsi2c4_bus>;
+			pinctrl-names = "default";
+			status = "disabled";
+		};
+
 		spi_0: spi@109d0000 {
 			compatible = "samsung,exynos8895-spi",
 				     "samsung,exynos850-spi";
-- 
2.43.0

