Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4AD101DE;
	Sat, 14 Dec 2024 22:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734214078; cv=none; b=aAsXp2NrfpDeiUM+koBX7WVmkGA6n5NxpLlLzbOU7fX+MP19cTG5Ol3FgnoYfVyNBEFY5um+qRe0n3UtUq3nzXrsLFnro8QzbhAw9t/xZIr0bT2UlUYu/EIZdzhBAzwJD/DooOI1Sy8fDu4F1bO7cxfW39R3j7WtCpyz8uy4cO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734214078; c=relaxed/simple;
	bh=znLEje4MeyzH8FXJBBFHAEoIafEYOYSMa0mrK5GnCYw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BBJ7xWuvXUKFV5U8PPeBwJV0NRSo8PSSVoHKuPcuT++vRzcbnbtUrjB+QodMq6CNasLgAUoZdmnX8Lor2+w1ooGa3dZSjcxJ3u9ecmXjozBIbONesQIu/U6Q5wNsqlVxADoJFqqZukriKFpBhi8dN2rzCrCmGvjpnDJPkGQ3n1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cfnvjqVd; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cfnvjqVd"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4361e89b6daso19924805e9.3;
        Sat, 14 Dec 2024 14:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734214075; x=1734818875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ACrh33/0VpPxeYXX8I2uo19L8kPY5JYfKU4wzm3RzKU=;
        b=cfnvjqVd9JMzjaiIpfAWSBTvJIYwyTXdcxgIPSX56F9p2P8zDpamsJC/nlN5Fuew2Q
         RD2vMxG4bt4k39MUpG1H22tcA1NZnXNIJu27KKFVIZFZfGcpkGFvS2CteoHRRamgX1sm
         Fwp5Ye4IsYbKh31Gfd1+ZzhbXZI1jHJ/3/w9/nqcCqfe7jgsu2HvmQtxtiyhKjoDlHUO
         vPADr9XrWy66hzG/abOYK8A7n8xFJNnA3T1WUX0Bn0+TQp1490ZkFo+amlvHHaqCXpnw
         Az0zq+gIJyA0OyE6Iggddmr9oQFz0eprfgveZBhTLii4rLceHTH/eK73fs8OgXzt3L2I
         3C/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734214075; x=1734818875;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ACrh33/0VpPxeYXX8I2uo19L8kPY5JYfKU4wzm3RzKU=;
        b=rLHWKYwnILIXQ5heKC8PFj2t/Q+8L2XiwwWOCMSOn79+00Gdt5ywNYHJyyas6h+3Ol
         HP/1DTKmgO7vpQnyILEH5FMCet9ecEzy4uSKiEcjNW1dNxGTB3TYeZMjB2PrXnPuU/wV
         QJSJilBnfW14QxR4BHjjF8IV4Tw7n5pZ6CQHe1+wOLHPJnboGFmDGYP4jZaT7Jlz4xFu
         hkZGE83ebBFv1KnPFuloK2+wHbRK0+HAjI2GTNq1/FgUFcQaIQ6WBx6T80wHrP1RiTOq
         VnewaV28vDQh4SD9ZiUJGflZwxQcODZMXMukoyLmCh1WH8zWD0bzRyNbM2ja5kWYBqKi
         rbgg==
X-Forwarded-Encrypted: i=1; AJvYcCWNCoxQyvHzPOV8PEUy/G3mnsoMS7FomSDI2nN5Hu5Mw3nSNojAZ16E9ZtFlScxyL5nm8LBvBEP6567@vger.kernel.org, AJvYcCXJHzjmy+FzDAmn2ZHEqpthIHq0moWJgirw0dtqjr/40DogMW3giNqsNIy5QjErK90xWLI6J9HvPQx5E33v@vger.kernel.org
X-Gm-Message-State: AOJu0YxNcG0B5VVYQJdk+kNgf6HqQykyDNFL+XBFXOCcdj9LnMaDUIGC
	NHHlQkS+HLMi4Y1Cssb7Fg+Ydh6MLX3V7J7XhZlUoDBOBvH/FIEM
X-Gm-Gg: ASbGncvgrups8IBpKQ5kBAs6wBAGpeugiapjfEDw+OC7erd5C9oQqsha0Rib/vriHsR
	55UJPycI0SlZhjl288QcLpocKcQhO4XVtRFYw7Jhl5v38lQWg9ngddFEys/k2hzanwFwTVROERv
	ciCd7JIucoUTgYe4mWG+pp1j2H6WqF4Blig4ChcI0Gq2/WeXnCn+PYkaayDAPQeCRJ78H+1dnt3
	hgP4dfm430h1KvCZU0+7V6ihGCFv5CIXY98t6DlT/1jFjDUb+duKvIydJaChDF6I+FczsKBxIOq
	qN/E8fgHsa2N/MqRLGRr5Mymcxy3e2C/
X-Google-Smtp-Source: AGHT+IEfd+QSAC7E/LXZUUhBYjyLml2o2c1E1vNqypWjINCbXo/G4qVPa0wBP1p2fCV8u0Syz7iBSw==
X-Received: by 2002:a05:6000:460c:b0:385:e961:6589 with SMTP id ffacd0b85a97d-3888dcd4789mr5336184f8f.20.1734214074709;
        Sat, 14 Dec 2024 14:07:54 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c8049facsm3696434f8f.79.2024.12.14.14.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 14:07:54 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] arm64: dts: exynos8895: Add camera hsi2c nodes
Date: Sun, 15 Dec 2024 00:07:50 +0200
Message-ID: <20241214220750.723354-1-ivo.ivanov.ivanov1@gmail.com>
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

