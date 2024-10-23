Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7161991BF;
	Wed, 23 Oct 2024 09:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729675086; cv=none; b=P119qJyzaGbWGsScHN5keWHT6TAoRLsBsYItZMRPpkHaCYBgvcdM+RU2FLHEwyybtfcRo69wJcPNmXf492NpK54tKYoTr8DexlEoekcyrn6DAi5PTTwDqe985bt5BSNReC6JUlbjzaAOJ2eVUkVvwaun9irVA0e0yLWu8RtisVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729675086; c=relaxed/simple;
	bh=2EKDBlrWUyLz/T4sq1AX6uXb3A+w25CeahBa+U/Rh6M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U2Gojgy58RaChzRoq5Aao4nRkKgv5YHoAFp4X1mugl8vx327AXkfxRpDeHpmYj07KLSGcmu4pk4EP9wPLA93WOtFyRu0MlgBvQFkWG0rJ4KWzJqjnU6UFUd4orZghzKDCKZonqUmsUatCaG8GodB+oHA2kjNiqpFbYJ7EEowVaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gtg5B9Ry; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gtg5B9Ry"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5c9428152c0so8448573a12.1;
        Wed, 23 Oct 2024 02:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729675083; x=1730279883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TukqJrYsDFG1DJAJmueEwaHQL71E3jPssuf+t5HzkMw=;
        b=gtg5B9RywrpWeB45LWgPJYZ0EXS/if2RRiJ5ZvseRlGUKi2HYHynnMi4+dux4JUG4C
         BIT0O3M+ZQfUBBMYUXhsySYH6rVkBA6ERlkZFeb3mXIUg3kIX7kwLF6WAOW1nD9cgyar
         VC77yyDaz0kKDMucQXfkQx4K4z/ZbatrNPtYOoMRaacVtT16UhFuYxnTIAgHANTyPF0B
         C7GeQAjq8LFGQAWeoRKVzasiLtKSNHMuhkEhjH61XG5fNT7CvGgabtU4jvG6GvdnZVOk
         5s2KyAre9wd9g4slHNcKHaKnBVOCElXYlIcViBxQCc7eIt7ZrR9pWHNTqHjDVtiHgqZC
         4DQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729675083; x=1730279883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TukqJrYsDFG1DJAJmueEwaHQL71E3jPssuf+t5HzkMw=;
        b=nEm3ixwUZCDB0ArV4b7fLJ01z77Jgl+Nn8FUSen68UHqgZWOr9v8AOwe6YgfaxaSB6
         8FQ34LlPRUMY5rZWsJc3p+1X73y8zFhm7YpqMSxul0HVutVpgY58pNsG3ZjOZffr/O9I
         2RVkAUBfZulrRO4flT62d6AvkznQO7Enu2RELAWibrKkFZ4h/7jJm84gcet6EmnQgmI/
         N+wJC2kMaAZNm0Ea4yQg9offLYUTVMcCwtMzCgGQIS6v5jGV9SG7tFSgipX6u4CC33fp
         YE/fjI9ktJ0xLEIWs2n6a+ZuYGjHqZJ4CqCXHyoI8ghj0fAqz0j834iaNcq0W9XS2Fra
         05pA==
X-Forwarded-Encrypted: i=1; AJvYcCUJ1PpwJTnF+REpq6FrIVUkOL/BfnEFNo2iRcfeBQEDgWLIhfkLMKqKRGwlpnS26f+epdsd9ZG+42JG@vger.kernel.org, AJvYcCVd6vduMS44lwVbgMq2e6iK1jq2QW68mmwGfF8W7XRUHKiaSRby2KRK/TnY9r9TqxKuGuxtLC/6BFyBnXPo@vger.kernel.org
X-Gm-Message-State: AOJu0YwyG+LAlRYjoRQwcrGm0aentbwMvQGFieNQvhdq/hZ9eDgPQDyB
	990/2m81mIjAa2T4ey1aqm7HOW/kdIu4LDRLLtsIXlIgpCMcHuiO
X-Google-Smtp-Source: AGHT+IHZv/+oJUevS4s8PoL1LtsFuNYgQymnDcOySsDEjVW2EW41HdvXfoHIx9nX4R1+73GpfVGcFw==
X-Received: by 2002:a17:907:728a:b0:a9a:188f:efd9 with SMTP id a640c23a62f3a-a9abf8a828cmr166012466b.29.1729675083365;
        Wed, 23 Oct 2024 02:18:03 -0700 (PDT)
Received: from ivaylo-T580.. ([77.85.230.22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a913704easm449177466b.107.2024.10.23.02.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 02:18:03 -0700 (PDT)
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
Subject: [PATCH v2 2/5] arm64: dts: exynos8895: Add clock management unit nodes
Date: Wed, 23 Oct 2024 12:17:31 +0300
Message-ID: <20241023091734.538682-3-ivo.ivanov.ivanov1@gmail.com>
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

Add clock management unit nodes for:
- cmu_top, which provides muxes, divs and gates for other CMUs
- cmu_peris, which provides clocks for GIC and MCT
- cmu_fsys0, which provides clocks for USBDRD30
- cmu_fsys1, which provides clocks for MMC, UFS and PCIE
- cmu_peric0, which provides clocks for UART_DBG, USI00 ~ USI03
- cmu_peric1, which provides clocks for SPI_CAM0/1, UART_BT,
USI04 ~ USI13

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 arch/arm64/boot/dts/exynos/exynos8895.dtsi | 85 ++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos8895.dtsi b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
index 223ebd482..54037b0dc 100644
--- a/arch/arm64/boot/dts/exynos/exynos8895.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
@@ -5,6 +5,7 @@
  * Copyright (c) 2024, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
  */
 
+#include <dt-bindings/clock/samsung,exynos8895.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 
 / {
@@ -159,6 +160,15 @@ chipid@10000000 {
 			reg = <0x10000000 0x24>;
 		};
 
+		cmu_peris: clock-controller@10010000 {
+			compatible = "samsung,exynos8895-cmu-peris";
+			reg = <0x10010000 0x8000>;
+			#clock-cells = <1>;
+			clocks = <&oscclk>,
+				 <&cmu_top CLK_DOUT_CMU_PERIS_BUS>;
+			clock-names = "oscclk", "bus";
+		};
+
 		gic: interrupt-controller@10201000 {
 			compatible = "arm,gic-400";
 			reg = <0x10201000 0x1000>,
@@ -173,24 +183,91 @@ gic: interrupt-controller@10201000 {
 			#size-cells = <1>;
 		};
 
+		cmu_peric0: clock-controller@10400000 {
+			compatible = "samsung,exynos8895-cmu-peric0";
+			reg = <0x10400000 0x8000>;
+			#clock-cells = <1>;
+			clocks = <&oscclk>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC0_BUS>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC0_UART_DBG>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC0_USI00>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC0_USI01>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC0_USI02>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC0_USI03>;
+			clock-names = "oscclk", "bus", "uart", "usi0",
+				      "usi1", "usi2", "usi3";
+		};
+
 		pinctrl_peric0: pinctrl@104d0000 {
 			compatible = "samsung,exynos8895-pinctrl";
 			reg = <0x104d0000 0x1000>;
 			interrupts = <GIC_SPI 386 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		cmu_peric1: clock-controller@10800000 {
+			compatible = "samsung,exynos8895-cmu-peric1";
+			reg = <0x10800000 0x8000>;
+			#clock-cells = <1>;
+			clocks = <&oscclk>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC1_BUS>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC1_SPEEDY2>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC1_SPI_CAM0>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC1_SPI_CAM1>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC1_UART_BT>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC1_USI04>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC1_USI05>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC1_USI06>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC1_USI07>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC1_USI08>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC1_USI09>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC1_USI10>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC1_USI11>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC1_USI12>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC1_USI13>;
+			clock-names = "oscclk", "bus", "speedy", "cam0",
+				      "cam1", "uart", "usi4", "usi5",
+				      "usi6", "usi7", "usi8", "usi9",
+				      "usi10", "usi11", "usi12", "usi13";
+		};
+
 		pinctrl_peric1: pinctrl@10980000 {
 			compatible = "samsung,exynos8895-pinctrl";
 			reg = <0x10980000 0x1000>;
 			interrupts = <GIC_SPI 430 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		cmu_fsys0: clock-controller@11000000 {
+			compatible = "samsung,exynos8895-cmu-fsys0";
+			reg = <0x11000000 0x8000>;
+			#clock-cells = <1>;
+			clocks = <&oscclk>,
+				 <&cmu_top CLK_DOUT_CMU_FSYS0_BUS>,
+				 <&cmu_top CLK_DOUT_CMU_FSYS0_DPGTC>,
+				 <&cmu_top CLK_DOUT_CMU_FSYS0_MMC_EMBD>,
+				 <&cmu_top CLK_DOUT_CMU_FSYS0_UFS_EMBD>,
+				 <&cmu_top CLK_DOUT_CMU_FSYS0_USBDRD30>;
+			clock-names = "oscclk", "bus", "dpgtc", "mmc",
+				      "ufs", "usbdrd30";
+		};
+
 		pinctrl_fsys0: pinctrl@11050000 {
 			compatible = "samsung,exynos8895-pinctrl";
 			reg = <0x11050000 0x1000>;
 			interrupts = <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		cmu_fsys1: clock-controller@11400000 {
+			compatible = "samsung,exynos8895-cmu-fsys1";
+			reg = <0x11400000 0x8000>;
+			#clock-cells = <1>;
+			clocks = <&oscclk>,
+				 <&cmu_top CLK_DOUT_CMU_FSYS1_BUS>,
+				 <&cmu_top CLK_DOUT_CMU_FSYS1_PCIE>,
+				 <&cmu_top CLK_DOUT_CMU_FSYS1_UFS_CARD>,
+				 <&cmu_top CLK_DOUT_CMU_FSYS1_MMC_CARD>;
+			clock-names = "oscclk", "bus", "pcie", "ufs", "mmc";
+		};
+
 		pinctrl_fsys1: pinctrl@11430000 {
 			compatible = "samsung,exynos8895-pinctrl";
 			reg = <0x11430000 0x1000>;
@@ -213,6 +290,14 @@ pinctrl_busc: pinctrl@15a30000 {
 			interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		cmu_top: clock-controller@15a80000 {
+			compatible = "samsung,exynos8895-cmu-top";
+			reg = <0x15a80000 0x8000>;
+			#clock-cells = <1>;
+			clocks = <&oscclk>;
+			clock-names = "oscclk";
+		};
+
 		pmu_system_controller: system-controller@16480000 {
 			compatible = "samsung,exynos8895-pmu",
 				     "samsung,exynos7-pmu", "syscon";
-- 
2.43.0

