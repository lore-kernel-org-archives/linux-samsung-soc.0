Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0582415AE
	for <linux-samsung-soc@vger.kernel.org>; Sat, 27 Jan 2024 00:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706315830; cv=none; b=N7Ii8sgUnra2b4aPrMmuL2US1Hv8EO0jTOS9iRq9W2XETQ2Q67a0Q9VpV61eFxKgKfBVXYytu0xLfT1xPDoT1oz4DqgT9dGYZ8Di0K0kPbk0xJeWLP0vI4ElhrP3cFSclpwf2HWXSy7WPPS+Ox/hhA8wAAi1oU01NGLfjBPmgcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706315830; c=relaxed/simple;
	bh=/GiPFN5+QIgnjdQBA8vewMsdqYN795L0TQdClULeVuM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Iu+aqsusMxl8k0xF3IHhrHPxeycBTpimT7x2qNL3fr8Uu0RIug1xVpWIAiqXqYmx+RtNXRh8iCZN7u55VyAtod9PkVh7Bx/Nu1jxrV2DB8e4EA9PjIvVvjNidMxq/PttqZbjfxyOHuOves4dvl76iYVQmF3E76J+5JWwrx/GFR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lefWfPh9; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lefWfPh9"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a2f22bfb4e6so177121166b.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jan 2024 16:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706315826; x=1706920626; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FJ73thBf2vHveKg87OgpLBqSvGw1l2TtG/ztHfLjlvM=;
        b=lefWfPh9GJ/MjcuUN9BLLLcXibRBb96oAnzt1TY9nJ1kZ5oH/4K2PR12QnRGcCAdYb
         W7PvQrENEd0ZgVeDQS1lAbfrPK3EPpLorTp/0uuqjTVj6fJh+aq1OYykrXXoUVDKz0Ye
         YX3JsMziNduUB9xj5IirWfX4Ek2iTb32e2rkTnxnmOu/60HwuQkvMFa6wCQ0JGSDzHhN
         yd0GJ4078Bv1vmfkywqrd0sFlPeRl7RjDml3LwOk2PeBXz9TOQjDMaw7eX/5hK9TeDr9
         WvTohVDWERztZwTFcH9/flZZ9iWXIAVdTA9YPOY4NwaXU9J0uQZDJKhfr8dhlF0ZqFqJ
         i5vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706315826; x=1706920626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FJ73thBf2vHveKg87OgpLBqSvGw1l2TtG/ztHfLjlvM=;
        b=jfTIuwUY+nM6WeiS0k2Nmut3WwnvRShYscakOm5y5q2KPQgHT+2xEwgKDwMxjQi2M9
         TrdnX+Cq8gCze+9bNQufMEy0jLMqI5HlrucpR0bkOOicrMqZEYdgvbVSCjMSYIgMoyir
         RsToAPTODfXhMjgzZV1z4xwQ0czOgKybwUYFA5kPRrUQ39WvSeFVcrMX5MJ3LPwSZVVN
         MM9wCIGx53Qs7tPTRTxWvc/aF+VEvBC+bpZ7vMSgItKOraGkY9Dc+TuPbDOgwVqGfhVf
         i3vq1voV/ZXA8CZ+WlntHnOn1rD+deq7YkWXSN8MwsYYQraYyxGbp4RzJjD3RxDSqN+4
         9N8A==
X-Gm-Message-State: AOJu0YwDjnpGYzBH9HcHpLVXvaoOblGeQlqA/qBTB/DYWYKl5ing4LSZ
	itn4NpI6GBvAcWHoZctMtQSTLgDJyNQHYJ/driCIkLZwNEHTmzpf3/Kpp0QZVoU=
X-Google-Smtp-Source: AGHT+IF62xxAOQKXenjs9SveeU52YIbIa7O0bn1bom9ZOgfi70BpL/1L08c0EOj83Fz3C5giIBjR4w==
X-Received: by 2002:a17:906:8308:b0:a31:3745:33fb with SMTP id j8-20020a170906830800b00a31374533fbmr530874ejx.51.1706315826128;
        Fri, 26 Jan 2024 16:37:06 -0800 (PST)
Received: from puffmais.c.googlers.com.com (229.112.91.34.bc.googleusercontent.com. [34.91.112.229])
        by smtp.gmail.com with ESMTPSA id vi1-20020a170907d40100b00a2f48a43c3esm1152235ejc.7.2024.01.26.16.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 16:37:05 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>
To: peter.griffin@linaro.org,
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
	mturquette@baylibre.com,
	sboyd@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 3/5] arm64: dts: exynos: gs101: use correct clocks for usi8
Date: Sat, 27 Jan 2024 00:35:52 +0000
Message-ID: <20240127003607.501086-4-andre.draszik@linaro.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
In-Reply-To: <20240127003607.501086-1-andre.draszik@linaro.org>
References: <20240127003607.501086-1-andre.draszik@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Wrong pclk clocks have been used in this usi8 instance here. For USI
and I2C, we need the ipclk and pclk, where pclk is the bus clock.
Without it, nothing can work.
It is unclear what exactly is using USI8_USI_CLK, but it is not
required for the IP to be operational at this stage, while pclk is.
This also brings the DT in line with the clock names expected by the
usi and i2c drivers.

Update the DTSI accordingly.

Fixes: 6d44d1a1fb62 ("arm64: dts: exynos: gs101: define USI8 with I2C configuration")
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index bc251e565be6..e5b665be2d62 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -380,7 +380,7 @@ usi8: usi@109700c0 {
 			ranges;
 			#address-cells = <1>;
 			#size-cells = <1>;
-			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_CLK_PERIC0_USI8_USI_CLK>,
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_7>,
 				 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_7>;
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric0 0x101c>;
@@ -397,7 +397,7 @@ hsi2c_8: i2c@10970000 {
 				pinctrl-names = "default";
 				pinctrl-0 = <&hsi2c8_bus>;
 				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_7>,
-					 <&cmu_peric0 CLK_GOUT_PERIC0_CLK_PERIC0_USI8_USI_CLK>;
+					 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_7>;
 				clock-names = "hsi2c", "hsi2c_pclk";
 				status = "disabled";
 			};
-- 
2.43.0.429.g432eaa2c6b-goog

