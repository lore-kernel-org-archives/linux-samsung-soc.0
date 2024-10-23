Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D3417B51A;
	Wed, 23 Oct 2024 09:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729675091; cv=none; b=uzfdiyXZxeP0M8mSQSOIHI7euNkGHIHM35Kr2gMj8qxk/IVQkO/YToIdhcQVreflfHLIb4aPyEkcqy//L1dDxvP5clXKOqZm7QLldZ1k0vMHjtu5acbrLZwntAQ5CrhV6NwgzexZvbr+SH6PQLex2D8vuDSnS35VOnqUA32cFJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729675091; c=relaxed/simple;
	bh=SZvhPTJiHRilCJh3W9vzD0gLM3CWV5kjpNiKojXBMbc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jfhD7n5B/z+jKVtnaFhBA/gOisWqbNnBhAjRtRElNO0L4D8VfiwyB0ZIqVUTO4C2UQF+KzRyZhpVaqg+b82l/OWQ0zP1SpQlPblvqrLWz+VQ3X14KCZtjHIrh6y8TbGRD8cNX6xxSTCcPXKRHby/M1P32uNNlM+Z2GKCQAAiqmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ec/yPzY4; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ec/yPzY4"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a9a0cee600aso815978866b.1;
        Wed, 23 Oct 2024 02:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729675088; x=1730279888; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JWvqM6WbSL8yBJ9uIsQs4Y6elerLACIaBhqwIy3i/lM=;
        b=ec/yPzY4MaZgkS3SU7SeKAC7Ab+YNDY81kvn2SQ1aXzKp97BXLaXxrrntfU+6VvRaJ
         dmbHf7uo3XdBm6uiW77i6CvB6DkwOhKqsU0Zj479eiaEeYB9EnJvzyHHkrxzTJ9oWMwt
         1DgA4pHPaUSn4ZtoWV5KckoOg55Q1schVOibXZkxnKh/QVdIZKU145rN/jwdbq8ttMkz
         lwNFp8SLh4K7dVVH2hVedYQZ+fcHR2lmpL2YnBeifHRNBWgwa3a7eW0GbQbzkrMPrb5I
         yJM16Pg2i3v0350gFC4+Dd9eGiwuETaWKHG+L5dQJgJEVimbMLaMfXhDbn/+p8oS+sD+
         ewPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729675088; x=1730279888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JWvqM6WbSL8yBJ9uIsQs4Y6elerLACIaBhqwIy3i/lM=;
        b=BocfaxXE9EKcoyZEeQfeyHNdfP2rKDJqTcVtKxzoKm3wRXFedHxeEyifSB6eUj3n0k
         CBnLgeKXRSnWpwA5IUjcPHlWlh/shP8zNXtI2yYlS9HekBpP7P92msx0qCXfSHvsjh1F
         Eb7qO/6pxd6ExX0RD85JZX1GmB7WDvkfrXDZX6bJSKh2Tm0RoEnpFUjm9154Zkz83wZ2
         C2R9+eYCei/n8ONxhS+sUGGQfhEJtRAbHc9vaaja99g3wTOwJljS212v94oEx1YR9+ls
         TA2EjRsTM0PJK5lkeWjntt9l1yeLyKGHATVAwOBF2e5geNRgG0xw6izi6gYxkBXHb7AO
         6HOQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5+ImAZaAM5TzlYEZkbBFBL05vHPLjFRGTd2FJL3CGibc0xglASDgFjY8WxAEuzHAWPCL2aasKgfR2@vger.kernel.org, AJvYcCVWiIFpd32frLTUA6JAHDGhMtKOPUYQ/Zt/kUpj75swY0pVypjRAYmWamcT5sXXhw7CKA5d/Avww2qJ8mKe@vger.kernel.org
X-Gm-Message-State: AOJu0YwPdBG5temTidEEYYtSyuIhg6PMBU18ESZ7wLmMUb/Hizcquc9c
	svyfdidtqj1i05pmqRmsw8G9jmwqnjnlKVRTzo2p6ft4DVJogQ4y
X-Google-Smtp-Source: AGHT+IHPZUT68y0TLIe4M7G298hT8apKCcI3+GCExQd/LS2JE80+P5LTZvCQS6qAE+vgvK7+YA2xug==
X-Received: by 2002:a17:907:94cd:b0:a99:fce4:e993 with SMTP id a640c23a62f3a-a9abf8cea42mr144608666b.39.1729675087517;
        Wed, 23 Oct 2024 02:18:07 -0700 (PDT)
Received: from ivaylo-T580.. ([77.85.230.22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a913704easm449177466b.107.2024.10.23.02.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 02:18:06 -0700 (PDT)
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
Subject: [PATCH v2 5/5] arm64: dts: exynos8895: Add spi_0/1 nodes
Date: Wed, 23 Oct 2024 12:17:34 +0300
Message-ID: <20241023091734.538682-6-ivo.ivanov.ivanov1@gmail.com>
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

Add nodes for spi_0 (SPI_CAM0) and spi_1 (SPI_CAM1), which
allows using them.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 arch/arm64/boot/dts/exynos/exynos8895.dtsi | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos8895.dtsi b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
index ad50cd4f6..ee393f4f0 100644
--- a/arch/arm64/boot/dts/exynos/exynos8895.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
@@ -282,6 +282,36 @@ pinctrl_peric1: pinctrl@10980000 {
 			interrupts = <GIC_SPI 430 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		spi_0: spi@109d0000 {
+			compatible = "samsung,exynos8895-spi",
+				     "samsung,exynos850-spi";
+			reg = <0x109d0000 0x100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_SPI_CAM0_PCLK>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_SPI_CAM0_SPI_EXT_CLK>;
+			clock-names = "spi", "spi_busclk0";
+			interrupts = <GIC_SPI 435 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&spi0_bus>;
+			pinctrl-names = "default";
+			status = "disabled";
+		};
+
+		spi_1: spi@109e0000 {
+			compatible = "samsung,exynos8895-spi",
+				     "samsung,exynos850-spi";
+			reg = <0x109e0000 0x100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_SPI_CAM1_PCLK>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_SPI_CAM1_SPI_EXT_CLK>;
+			clock-names = "spi", "spi_busclk0";
+			interrupts = <GIC_SPI 436 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&spi1_bus>;
+			pinctrl-names = "default";
+			status = "disabled";
+		};
+
 		cmu_fsys0: clock-controller@11000000 {
 			compatible = "samsung,exynos8895-cmu-fsys0";
 			reg = <0x11000000 0x8000>;
-- 
2.43.0

