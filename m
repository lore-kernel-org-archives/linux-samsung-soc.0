Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C939C2EA147;
	Tue, 22 Jul 2025 12:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753187043; cv=none; b=tZYblnueqM4VwhY2a29Ut2wBq/cH+rK+dQpQgOFsizND/O2AKUVm8RHkK2ozbZdhGUUvu8Rxvq0nyHgZXGkWU3/xDHkimiPvaqqiIx57Eej0wPUJcApVjs7leWLYiuL9TXKML9l3LBF5oMwpAfcZBvwEUHiZo/JPHlC5+HciETs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753187043; c=relaxed/simple;
	bh=jcO2uNN9bGpZVzxBlo2u9bZgPy43ekCEIHGVTTVj12w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U4riluunETSF3AXFoWP7ECeiPTy3kitNg5naYV3Xujo/6piVnxcSEpbm3D1qI1qUMXIp2oKqAikyASAVWhFRId86ymiSF9qB2YCzIS4HxCIAJsphz+RF15FTOD48HUoP+fCXhStETbC1RXdkQAK6cfF3Wun7TO2zL0WEZenHNFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kK9RyLCi; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kK9RyLCi"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aef575ad59eso320527466b.2;
        Tue, 22 Jul 2025 05:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753187040; x=1753791840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BV3A9L+gcYLTgq/m2BBB5zI+0t3BKzwph1D1xLxuYPg=;
        b=kK9RyLCinT7FLLAg6FToQQqZHpHs2TL1hiq/U7tVJC9cbkghYBNu49BmkpZqLyOmep
         dBmv8HbRU+TRHU5yNaHUMzum/c+0s2pdOrSPFanB9IAdqYaZGrHK6pavXnCuu+UwEvEa
         W7R7rACbQfZX2BKDylm/1UYVpDFEUc96DUJt3Kjrxo1vunORjuZBHgEcuaua+muCit2r
         Ufs7CZaKmqXi4DWGX6qFCbMCjHYHd/TX3bQBcKTPm1Ji7VUTPBGkY/Anb2Vs0By9fIFO
         kujZDku5gM3WL/AfaXpROTqioWSNnwSBQ9rYZnrEfECE8VwmDjJ9t4sgfVI2UE+8+OSF
         ++GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753187040; x=1753791840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BV3A9L+gcYLTgq/m2BBB5zI+0t3BKzwph1D1xLxuYPg=;
        b=lkbIzY+1u+DiYpkufpBax7FeUukdE1dsyQQHUu3YmsEw07YOR1O+MZARugx8AJa+PF
         hqTIs2Iqnl2CytFahS96a/WC0yPl2gFKBm/cNsWmzcN894v0gQgNAQICVl+ccyNqbUfj
         0ONSkF51ub7pUko9ypjIoSbM2P6ecrpFV6b7P65fYoTeTc8Tks5MO3Dmxukp/kyOAWWr
         WRhKcGcMuCfWN43WH9eP+yUJjjwBANg/+15cu3jI6cAgS8YiPgH0l3+h3kSkQS+6z9HC
         60tGOT0y1RsBa3kpEZdy+2/rDWHmZ5oqZr0TKtS6zXG5tpFS0oBG8JPz4RLLQBoUlqEf
         4pxg==
X-Forwarded-Encrypted: i=1; AJvYcCVynwX7gpjMlANh8LzEbTsBulpyEbgzh/eBay8Ef2/7VHB7se4eJt3XkPjPsVppRRodQrS4VWs0oS+f@vger.kernel.org, AJvYcCWahUf1/w+DdNITrS/GxkBwekq9bBoKDxz477mDMFfCmkptF2RMpDNgGOCyYBG45z/mAPmgRAccGaVXddHU@vger.kernel.org
X-Gm-Message-State: AOJu0YxfIdJ/y9g/FAk79fuMskzkwFoUyq76OGnFwpGl9uG1VQa9UAcC
	z4DyIJ5kAMNKS11o+bOM4LU9H9DgDU+81qc3ruuXKGOOxy1P0uZNpdiOe5vQpQ==
X-Gm-Gg: ASbGncu6WZ3GndLcj+kU3eONYIWxF3XAzmBZ6xXguFR/evKh+li9ckDSBfRmvf0+Wlt
	5Jg/46rVW63jXm3riko01YM0TtJNUjeYZd+c5uQVLfzJwjgU5fKW6uztYek4O4FBVsEbNOiZgZq
	7cYwBMx9QV9wRxcc1NF0qIM8kf9KHUOqmx5JkD0sy6P+UxczZr03eNpfElVeTeP9V2H4kQMmcOI
	7zLStQZjTlReuJVv/OVpPYS73IIjx6QmrTV25rQYbgPvUyh1yl0Rx3/w36mZaYZWv/jBRHc5Rx8
	5XZ29O9YbtR2SLklr1+6CqwXwNhgQcy8TM0yyMd7z7dc4GAePzE5COv7w7KTdvVHSAkZflFIfIc
	2/ZD5QZ5mvTOAdfv+LHDzKzoFdl95FJ93Tt9ULr4tjZlXLC8MsK2bcxKyG+387vGDA6tjtyl4YQ
	==
X-Google-Smtp-Source: AGHT+IEt4kn4A0JiyfUGDXpm1ICFF04OjDfTYiHETQRwdAG1iiF22fyhiLVJUDeFKq5N6QtGAEJdaA==
X-Received: by 2002:a17:907:72d1:b0:ae9:c849:fae0 with SMTP id a640c23a62f3a-ae9ce1e4d8amr2436788566b.58.1753187039780;
        Tue, 22 Jul 2025 05:23:59 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6c79a056sm861358466b.14.2025.07.22.05.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 05:23:59 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/4] arm64: dts: exynos2200: add serial_0/1 nodes
Date: Tue, 22 Jul 2025 15:23:49 +0300
Message-ID: <20250722122350.444019-4-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250722122350.444019-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250722122350.444019-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add nodes for serial_0 (UART_DBG) and serial_1 (UART_BT), which
allows using them.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 arch/arm64/boot/dts/exynos/exynos2200.dtsi | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos2200.dtsi b/arch/arm64/boot/dts/exynos/exynos2200.dtsi
index 3fa183c5d..f94a5907b 100644
--- a/arch/arm64/boot/dts/exynos/exynos2200.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos2200.dtsi
@@ -336,6 +336,19 @@ pinctrl_peric1: pinctrl@10730000 {
 			reg = <0x0 0x10730000 0x0 0x1000>;
 		};
 
+		serial_1: serial@10840000 {
+			compatible = "samsung,exynos2200-uart", "google,gs101-uart";
+			reg = <0x0 0x10840000 0x0 0x100>;
+			clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+				 <&cmu_peric1 CLK_DOUT_PERIC1_UART_BT>;
+			clock-names = "uart", "clk_uart_baud0";
+			interrupts = <GIC_SPI 674 IRQ_TYPE_LEVEL_HIGH 0>;
+			pinctrl-0 = <&uart1_bus>;
+			pinctrl-names = "default";
+			samsung,uart-fifosize = <256>;
+			status = "disabled";
+		};
+
 		cmu_hsi0: clock-controller@10a00000 {
 			compatible = "samsung,exynos2200-cmu-hsi0";
 			reg = <0x0 0x10a00000 0x0 0x8000>;
@@ -458,6 +471,19 @@ pinctrl_peric2: pinctrl@11c30000 {
 			reg = <0x0 0x11c30000 0x0 0x1000>;
 		};
 
+		serial_0: serial@11c40000 {
+			compatible = "samsung,exynos2200-uart", "google,gs101-uart";
+			reg = <0x0 0x11c40000 0x0 0x100>;
+			clocks = <&cmu_peric2 CLK_MOUT_PERIC2_NOC_USER>,
+				 <&cmu_peric2 CLK_DOUT_PERIC2_UART_DBG>;
+			clock-names = "uart", "clk_uart_baud0";
+			interrupts = <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH 0>;
+			pinctrl-0 = <&uart0_bus_single>;
+			pinctrl-names = "default";
+			samsung,uart-fifosize = <256>;
+			status = "disabled";
+		};
+
 		cmu_cmgp: clock-controller@14e00000 {
 			compatible = "samsung,exynos2200-cmu-cmgp";
 			reg = <0x0 0x14e00000 0x0 0x8000>;
-- 
2.43.0

