Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C87019CD0B;
	Wed, 23 Oct 2024 09:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729675089; cv=none; b=QeFwH+oRmJN6KHf59gF0V2X3DzHpinszC6Q4zAjdFQrNZoLF6K3/dk10ctSjvCE5XaYKL+ImYypfsYsmlStgXP4YMEThuTgsjND8gHKBOia/Gi/frFwFesKIV0r+U5l7L9PNBO/r2ETB0MDIN8hp5PpP/5Nn0CqUrjfACF7t2T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729675089; c=relaxed/simple;
	bh=G9yQ73mzQfERkRbKc4rb/2hcgcl+vwHdBNXjc0nLNNU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nTuzPKfdMoZ/B7VhO4PMOYynStYzh21Hi0TruAZdRKVxmMtAjE6O4Ms9jydNGr1sdMSeepzXmF7VYXcR+qkIWFrnXtI4mcO3CO6I67emLsg4+d6duuwdUTX9m5tcBfCMFMAt6k8rOa8CLiHv1jfvRsOmq6/ucNswlRGBh3AjEMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A1oDzSnb; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A1oDzSnb"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a99eb8b607aso710876466b.2;
        Wed, 23 Oct 2024 02:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729675086; x=1730279886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o3oz7XzRnYr4BG8E7Y3NV1EOsqUppoM4Gh7wTtLxU/8=;
        b=A1oDzSnbZnX/KyFfsFBHp7T54bZIVycVLc0MfaFjxFjbggaBtGABFqDx4c3Gm2Z/V0
         NNuNyWNzAQCQd3MZauEErmbVitMxA0VP8VlgTmXtZDUXLLAb5Bra5Zg4uEFI7B7dvDJ2
         PB08NzGOkkBPQekXT1aDctSfmW5lqIPs21dRw8BpH/4muroSImP/k69uAZNc9366rP5g
         ffvxivLizQreKZNgsLgfD8cwivdQTIwbn4ND6mqvT1uSZzrZCGCJtADwTpiTyv9/GvjD
         WhSH8vr2mkBRgi768Nl+i8lP+Omg4uNXDWSoXy/+GxNPjjhDMLphf5Y9GTXCuTUMCart
         cIsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729675086; x=1730279886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o3oz7XzRnYr4BG8E7Y3NV1EOsqUppoM4Gh7wTtLxU/8=;
        b=nwM32S1ZBXstGbmU28pRIH6RzZ467vk9hbvv9DYMG3n+6Opx2F8KloOTBDwFhXBcsx
         LVG9sf4B0R3kHq8AkLd90IEZpB3VfdPfOk8ftW9Xvls5Ao0yWJbDiy/o4N/4gOz8KGDl
         6b573fvfL3WsJmjb6ZTQvxhsPpJ29IFJWEu8nqAlO5ay3HxIBqJZfWWoY9XeaiJSPUb9
         MvVGCxHSMxFniCNsAHqgZ81nzYr9RGkobmIe5/NHAZMygbjaPNIVeezTH3A2LlKE8AYE
         hjL9zZr32st+Xu/HxhEDojzTbKC7bOCbNGdCxxcuNZng643fhL/8IGJd3ect0OFvHCpn
         Fc/A==
X-Forwarded-Encrypted: i=1; AJvYcCUL5Rag0Yp4bXYjmA5ewUytIfC8aEAb/fNgFrpnOSC6I0ZLtRolfnEXsuixcK8Qn/6PQIQfnZea2ntnupSw@vger.kernel.org, AJvYcCXhoR+13PQn1S98mSbrT0w/7tBBqbdvp4rXlfE3m8SZY+mfCjkR7rH/cEC0nGUaHeWbxZvNvkryDLsx@vger.kernel.org
X-Gm-Message-State: AOJu0YxFD8C0YBIWICa9ibWO6rz1/GrWNO3e/s8iQgrnybB7MlOU9qV/
	duGLWv0IV0pCY/WrLzm5F+ufoKkDwXiE2OopscdJqNkWnUwEao4u
X-Google-Smtp-Source: AGHT+IELm5faha5fBkO+OkQZoZplpoZtIS6VuriIaHnZFiemjbiSkn2GUdkWdEFBi9/ZsZQzY2BP8Q==
X-Received: by 2002:a17:906:c150:b0:a9a:2afc:e4e3 with SMTP id a640c23a62f3a-a9abf92d226mr174401966b.50.1729675085910;
        Wed, 23 Oct 2024 02:18:05 -0700 (PDT)
Received: from ivaylo-T580.. ([77.85.230.22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a913704easm449177466b.107.2024.10.23.02.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 02:18:05 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] arm64: dts: exynos8895: Add serial_0/1 nodes
Date: Wed, 23 Oct 2024 12:17:33 +0300
Message-ID: <20241023091734.538682-5-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241023091734.538682-1-ivo.ivanov.ivanov1@gmail.com>
References: <20241023091734.538682-1-ivo.ivanov.ivanov1@gmail.com>
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
 arch/arm64/boot/dts/exynos/exynos8895.dtsi | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos8895.dtsi b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
index e6c8a4966..ad50cd4f6 100644
--- a/arch/arm64/boot/dts/exynos/exynos8895.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
@@ -218,6 +218,19 @@ cmu_peric0: clock-controller@10400000 {
 				      "usi1", "usi2", "usi3";
 		};
 
+		serial_0: serial@10430000 {
+			compatible = "samsung,exynos8895-uart";
+			reg = <0x10430000 0x100>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_UART_DBG_PCLK>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_UART_DBG_EXT_UCLK>;
+			clock-names = "uart", "clk_uart_baud0";
+			interrupts = <GIC_SPI 385 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&uart0_bus>;
+			samsung,uart-fifosize = <256>;
+			status = "disabled";
+		};
+
 		pinctrl_peric0: pinctrl@104d0000 {
 			compatible = "samsung,exynos8895-pinctrl";
 			reg = <0x104d0000 0x1000>;
@@ -250,6 +263,19 @@ cmu_peric1: clock-controller@10800000 {
 				      "usi10", "usi11", "usi12", "usi13";
 		};
 
+		serial_1: serial@10830000 {
+			compatible = "samsung,exynos8895-uart";
+			reg = <0x10830000 0x100>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_UART_BT_PCLK>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_UART_BT_EXT_UCLK>;
+			clock-names = "uart", "clk_uart_baud0";
+			interrupts = <GIC_SPI 389 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&uart1_bus>;
+			samsung,uart-fifosize = <256>;
+			status = "disabled";
+		};
+
 		pinctrl_peric1: pinctrl@10980000 {
 			compatible = "samsung,exynos8895-pinctrl";
 			reg = <0x10980000 0x1000>;
-- 
2.43.0

