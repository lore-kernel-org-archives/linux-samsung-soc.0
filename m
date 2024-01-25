Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1B773176
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jan 2024 15:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706195807; cv=none; b=c/oJe09l1aMC4ESO4P1btdTi47izwY69xKrgZsJQ5SugB2i9icQsa7SkI+1Da7U3XJoQ1cqSesjumzmPf5yR9GC1we//oJ/nnhiAHJU/V3wtRFvUIc4ykU6FJytjuJlWcSit30GL77sqYAQnVg/OvEGM8e8Huu7wa5dX/g95rUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706195807; c=relaxed/simple;
	bh=CIAizzJebZtx1/g8zjjifKsCrrjh+jRaAW0m31CylKk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=khgLlh899RkAGySao5BnEDBOof0mWLCz0xykYP1HzrCZ7as4VMJDY4ORdtKisAx/F9jczFEXKec3nfvy9STJuKUrcki+YHHUyPNV88sPX8fHp3ivwrP9qe1+/QCsErFQxZ4Msq56bnZM5fVu1i1a9RgDG7LsOlQnxY4M7AdIrg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lr8ZW/KF; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lr8ZW/KF"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40ed28f8666so6034325e9.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jan 2024 07:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706195803; x=1706800603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DYvvmpy3gvXDtu9+cgwcBJMRAtk90gz+DuNp4PyQjQs=;
        b=lr8ZW/KFLrMlmub6tCbbsov0TV3h6WBAEzfm9AkY7k29SoFnS/yT4lOvEHDmBHXFqJ
         7CX/+D4KM8X+FbwVKpzhoWCRilJbIMN1nnjoTjyzJFSPI7HRAuk5sW4hX9KQzvzhSc7s
         NShek+smH3N6HoTsdY1SiuA3GKe5wRw22OraeemSNzQ+MyHXp+EwM6ISR7oof625DVpZ
         FELf4AIWnyq1HahTCzRxpiFo2d9S1BuDTZqcx6YlantAbFghSJwBBnEQoZRdqL9lvEfe
         SnnEJ/kZMWCdZoWmUHPc16LGLuGOHJhRVGuaJrRd6epCvIK7AtQFWYAZbWMwrqvc0ZE9
         PByQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706195803; x=1706800603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DYvvmpy3gvXDtu9+cgwcBJMRAtk90gz+DuNp4PyQjQs=;
        b=VxtSYfv7D+LlYaDULPf1fAcLpEHB+qZdv+IzorNm5WMKboP+wqBMOpdK2mSpp2zMLQ
         VnlIICcXYSiGF/9ep+3DXzdRgH73NKPYdDCXDlHqoXLBaMx+5xR8q3dKV/mZHTDPBpNJ
         LQFsdYLsg0GksNAtvGi/G0lMeKhFjlN8YR9D3UJS6rNopGGI2rt8DCTRrFAWxgbz56MD
         ktWeyHo/ppp70Z6hYzoKVUWRifGuGDzx3CVMAEVnp2177GlwSvzwNK9IEWUFVeUaBesO
         I5VFXhgdsrjS4US2z7Fn+0ODTPSO6F+qn/nyLhBTEg3NvexLILCEai+ejYqT79f9YDBW
         AAeg==
X-Gm-Message-State: AOJu0Yw09Gr32N4gtsIvVt6lb11GgjoVlfdnKmW6qjElUFjqCh8Ryvcv
	lMIytufO9azZGPfnWdijN5MVEKCKym3wTmC1Vg9BLM7dRoOlG/ucQgwckkqXvks=
X-Google-Smtp-Source: AGHT+IGuWq41cd/mRGhM7in6UzcnHANCL0ranLj92tjRczIUg8SRuL80g/hVClELM745HKmfd4IpZQ==
X-Received: by 2002:a05:600c:4f52:b0:40e:d425:841 with SMTP id m18-20020a05600c4f5200b0040ed4250841mr256288wmq.60.1706195803587;
        Thu, 25 Jan 2024 07:16:43 -0800 (PST)
Received: from ta2.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id q17-20020adfcb91000000b00337d3465997sm3184656wrh.38.2024.01.25.07.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 07:16:42 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: krzysztof.kozlowski+dt@linaro.org,
	broonie@kernel.org
Cc: robh+dt@kernel.org,
	conor+dt@kernel.org,
	alim.akhtar@samsung.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org,
	andre.draszik@linaro.org,
	peter.griffin@linaro.org,
	semen.protsenko@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 3/7] ARM: dts: samsung: exynos4: specify the SPI fifosize
Date: Thu, 25 Jan 2024 15:16:26 +0000
Message-ID: <20240125151630.753318-4-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
In-Reply-To: <20240125151630.753318-1-tudor.ambarus@linaro.org>
References: <20240125151630.753318-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Up to now the SPI alias was used as an index into an array defined in
the SPI driver to determine the SPI FIFO size. Drop the dependency on
the SPI alias and specify the SPI FIFO size directly into the SPI node.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm/boot/dts/samsung/exynos4.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/samsung/exynos4.dtsi b/arch/arm/boot/dts/samsung/exynos4.dtsi
index 7f981b5c0d64..10967063727c 100644
--- a/arch/arm/boot/dts/samsung/exynos4.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4.dtsi
@@ -621,6 +621,7 @@ spi_0: spi@13920000 {
 			clock-names = "spi", "spi_busclk0";
 			pinctrl-names = "default";
 			pinctrl-0 = <&spi0_bus>;
+			samsung,spi-fifosize = <256>;
 			status = "disabled";
 		};
 
@@ -636,6 +637,7 @@ spi_1: spi@13930000 {
 			clock-names = "spi", "spi_busclk0";
 			pinctrl-names = "default";
 			pinctrl-0 = <&spi1_bus>;
+			samsung,spi-fifosize = <64>;
 			status = "disabled";
 		};
 
@@ -651,6 +653,7 @@ spi_2: spi@13940000 {
 			clock-names = "spi", "spi_busclk0";
 			pinctrl-names = "default";
 			pinctrl-0 = <&spi2_bus>;
+			samsung,spi-fifosize = <64>;
 			status = "disabled";
 		};
 
-- 
2.43.0.429.g432eaa2c6b-goog

