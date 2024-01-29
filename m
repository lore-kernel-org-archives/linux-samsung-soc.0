Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0943F9CD
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jan 2024 17:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706550434; cv=none; b=SOn8h5V5UvTooV6kfbR+ZmNxW7QvRoPmZTZYmWAkGXOwG7vSrWDXPOGTKt2DAamRU2KDt3OuhzLXLX8aq6fT9fXbSI2s/JlxBVVHr/EzuY7npv/bINKyZh6T8PStVhv8y8nIen9ihn2NpKjwMaWUCndDkT2HArPJtC/i/mjag7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706550434; c=relaxed/simple;
	bh=NdU2LIEnp5ujFawnyZ2tpXI9lweTV2bJLnqL5ZSnYQI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ue4Li83Rf9DOviDFnU6gJ/1Zx1X1EXRQfZOrB9kbW/qYDHYCJhRL1gN3GmX7Ocv1RrTIhZk86zIoHzirGyJzJOQSWD6Gcw1OhvITgQ9+VM7ZtXnmrgXZSJClX9EjFuuL2nzPQBZbL6hLZXA5ZsNtGuZJzAWRvwllSGU0saRugfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KZ503WVG; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KZ503WVG"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2d057003864so376761fa.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jan 2024 09:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706550430; x=1707155230; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lvAE0+fmvTQFFSzj6Dft6tKLSUPrgAbTsR8MYrmwQCs=;
        b=KZ503WVGN3pHrHdZL4aRsgPxZyewguc4ngDhx+eBNMfblXXKT60bzoENoac1sJw2kp
         NvjRxA6oTrdpj7NwktdTD203fC7qSVo8PJm5EkjzkcUhDklw+s4mgkMq03z5QrtvYgNl
         iT+wJYQnKSl2C4tV8v3RyZU1P0sGC8q9xGckP3s50DSmzXitLPEjomfnTefj94Y2DKZs
         ft6kI9C3nUabKiofEZgwRCx9p4yhOSTLPDxE6frsmsakKSLo/Q5Tj9ltOrdbuGzaBdi+
         7vmx/iKMZWf7jZowKHmaJZEtguAplsaGHW6+NMq7HnneppVurg1zAdA/+nYSo11nLdSi
         Mfyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706550430; x=1707155230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lvAE0+fmvTQFFSzj6Dft6tKLSUPrgAbTsR8MYrmwQCs=;
        b=OdfQMmhy1tOjiC2LUJlt+Y4rmScQN7KCGwN3ug/TLTED3+ebdznyzlAiiZYEqkaNg7
         MVExpD7V42Vfd3r9Huq2OpVnuESmf/+IY/EyJlathE0E7WP1BeVwBjM1o/Acxchc0+7S
         55zyC6lLdWZ/LwlpNdf4HbOiuv/497n+iqNUGouDFPPBmTTVCTxzSIVxnS5iErvCF6gd
         e7qbZohfeCfAnsEAjDQVsZ7j049ToKvRPHd3YCPzNRif3xjpdcw39jDy8t1UCc3TN573
         YzNdwA1bmjWs73wmdXXgLautCp8hYTVN7ukD+XMQOdvosIQIquuPYHN6ADYey5CkuJ3k
         0soA==
X-Gm-Message-State: AOJu0YyxwbpSv55DUihwW2O1U2f1q32vRHyMD7sLS+m8Utls3BOSik6i
	02N3hGvdNzB0dnwEncwGhIkwbpe6Jc9zcnDnyPFFbvWMTtJaMex93PUNTHax4d0=
X-Google-Smtp-Source: AGHT+IGvk8+lvWbrIUDM0jnh0+lwoANpM4fqu2MQ/az18FlOLLv/0Y2uNiyiPGuyQ0z+d0ql2Ygo4Q==
X-Received: by 2002:a2e:a278:0:b0:2d0:4c36:8cbf with SMTP id k24-20020a2ea278000000b002d04c368cbfmr1852012ljm.16.1706550429751;
        Mon, 29 Jan 2024 09:47:09 -0800 (PST)
Received: from puffmais.c.googlers.com.com (94.189.141.34.bc.googleusercontent.com. [34.141.189.94])
        by smtp.gmail.com with ESMTPSA id u10-20020a05640207ca00b0055f08fa9286sm1000999edy.23.2024.01.29.09.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 09:47:09 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>
To: peter.griffin@linaro.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@android.com,
	tudor.ambarus@linaro.org,
	willmcvicker@google.com,
	semen.protsenko@linaro.org,
	alim.akhtar@samsung.com,
	s.nawrocki@samsung.com,
	tomasz.figa@gmail.com,
	cw00.choi@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 6/7] arm64: dts: exynos: gs101: define USI12 with I2C configuration
Date: Mon, 29 Jan 2024 17:46:05 +0000
Message-ID: <20240129174703.1175426-7-andre.draszik@linaro.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
In-Reply-To: <20240129174703.1175426-1-andre.draszik@linaro.org>
References: <20240129174703.1175426-1-andre.draszik@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On the gs101-oriole board, i2c bus 12 has various USB-related
controllers attached to it.

Note the selection of the USI protocol is intentionally left for the
board dts file.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

---
v2:
* reorder pinctrl-0 & pinctrl-names
* collect Reviewed-by: tags
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 30 ++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index e1bcf490309a..9876ecae0ad8 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -451,6 +451,36 @@ pinctrl_peric1: pinctrl@10c40000 {
 			interrupts = <GIC_SPI 644 IRQ_TYPE_LEVEL_HIGH 0>;
 		};
 
+		usi12: usi@10d500c0 {
+			compatible = "google,gs101-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x10d500c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0_PCLK_5>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_5>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric1 0x1010>;
+			samsung,mode = <USI_V2_NONE>;
+			status = "disabled";
+
+			hsi2c_12: i2c@10d50000 {
+				compatible = "google,gs101-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10d50000 0xc0>;
+				interrupts = <GIC_SPI 655 IRQ_TYPE_LEVEL_HIGH 0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				pinctrl-0 = <&hsi2c12_bus>;
+				pinctrl-names = "default";
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_5>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0_PCLK_5>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				status = "disabled";
+			};
+		};
+
 		pinctrl_hsi1: pinctrl@11840000 {
 			compatible = "google,gs101-pinctrl";
 			reg = <0x11840000 0x00001000>;
-- 
2.43.0.429.g432eaa2c6b-goog

