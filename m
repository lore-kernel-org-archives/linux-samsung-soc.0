Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9545E3446C4
	for <linux-samsung-soc@vger.kernel.org>; Thu,  2 Apr 2026 02:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775096433; cv=none; b=Gkg1a2FJlQEilfpBrsuA9D7M8NZk+ixWIhf3acog6a3Y/ahOLOZ03+awdm9fRYsuMJxcIh5kzZYXS0vpoDgvfuwKrwVamPg+Fz8ZMru7HK603lhI9LT0M8F+1sym6CPr4bp8fhgNLWtGmRVKDM7k1QSNOB6EiaFaRGrMlo5qCAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775096433; c=relaxed/simple;
	bh=3crEO+O89xHnAa9Qv2tmtZDwzd9lKKYN3FD110HX30o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K7FGxxAhr5S+/IS1dNtezKQikVVFcLjBYafR8fW3loAKrV8JkicaXhbt6ekNoI8kwsO7nvQpYsN8pPjQcZQzTZdtLrtUH07VpaYV2MCDPqfmdE3NhevO5K3YGelBx/J7Shtv7VewFCQvbGCHfaz5y+RTq6Xlnm9uR17fFaX5WbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W3Zc8f2O; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W3Zc8f2O"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48891776099so214555e9.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 01 Apr 2026 19:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775096430; x=1775701230; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZXxuQ24FqzoAKF907nAmIWTd8J/1fw9cSv99fr9M97Y=;
        b=W3Zc8f2OLkS9VvTh4QuFfE7szRa3l2eqqbWwgAjn3qtW8C89Hhr5uj9FefKPw3LROR
         GKtU684io/ZJ71Q+CX9+rbZU1ivICPtcq/T/17KMp8T1GQPal3kvlnUGDunm+0I8bAkN
         sQf51CiaeCgvHHNiWhJG7/Sx3ZZwVzBfvWgTV8Qi6xpGaTDSOoBO4x95Wdq2WJx9bRGB
         WY0tUDfEMlKtIPxphLqN2ieb3Aq/qebr9aLE2jYunEB7+3rzjE1ldBVFeUBX+j1xY3j6
         kfaDnso6JVgiSynu3NCrEZNKV+NFHWcLmgizVL5yDT35c2/j3Nar9Hc+b6Yu9spcuWXM
         26Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775096430; x=1775701230;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZXxuQ24FqzoAKF907nAmIWTd8J/1fw9cSv99fr9M97Y=;
        b=F0ryERkOiDRfSCk5RbLjeLwpbMpt5zpUwCU3yzNuwlTlQZ5VU9f3rpNF8NIOBwFf/P
         ToR3JApbfemKTaI0MgjKMsWifUdtMYIKzvvwNifaBCcT6Wf/zjhes0YPh6GGQCd/ZcFT
         jr8O0ZP8bF6woSU0nHK4vY+9XA4YAF8ZTDgv/Ut7HajbknU1c6IeIbMcW1YHWaJWe6+S
         vhivAN/kxTFicaLV4UHRsH45xFNFFzrn9ON1+ONTRGEhHd/CCf4vNjs8f5Zxg47wt4T1
         NoP1u+tTyFvILIrXvtzXLsj32EuNhpKP8vTymlvDTR6/GeYDF1EsgSi2cmguOvnC/thC
         VZUg==
X-Forwarded-Encrypted: i=1; AJvYcCXg/UcQG52bryuMDaIHSLP9HUeR0SDgOIb3glM/G7SBeDLy23e4xzO4UnkP5xB4r4v7RU9D+fRQEOu4wgY4Cw22dA==@vger.kernel.org
X-Gm-Message-State: AOJu0YykBfcb5ar//cpcQ8JU8A5MRZPwG4ycpnidqBkrr0JdD6NjtzpD
	lGjV7aGHN9UNuWVpQjLn61QymglKc4paJDx3BjF+kyWyQi/SLkDC79xAtgFKmm9FzHQ=
X-Gm-Gg: ATEYQzzAhopwreS5+ECAKz2R1odnApk6XSNkHATrv3CXaackuBmog5OLUBbw93MJski
	3jSCkdp5g8HgMjukO6WpS++EdQU6dCzsE4BjkgeRMefu7kFwtUmVzPyhPoSJ25eCjtCBD61swDg
	+Eke8cF8yy4ObCpM5/n2Gd2snE2KAjRiEQYPYE/pMfg+zbGPNYOiB+O5PFfr3jBIzxVZMMnZ2ga
	3FqCmSGqt11kbKm7cLCToYdrxieS07//tPdtQvXFr+Yut4ecRpDzISJNJ36gfsxMZM52svUQHnJ
	GWeFx3tC967guZz0l4EvwR8MuUd3nKTBtJfz+nuf312pxNGwroid9jJEmsG8xFaMD9hek3ps+UO
	vwo/CdfXU7vjnFgS9PQPXEXonbN3eIinArijGGgPgnifyRDfJc2IZdE4n3MDufVY5ciFhS+ycrE
	BF73DI92y1lknvgKNmaQBakdgUaBRX54hzGprOD7N8pxtvfrldZHaAXw/rAGrRU80tep4mESeKQ
	yPv774Qy3Atccon
X-Received: by 2002:a05:600c:310b:b0:485:531d:28b9 with SMTP id 5b1f17b1804b1-4888b769851mr25032405e9.14.1775096429980;
        Wed, 01 Apr 2026 19:20:29 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887aacb88fsm56379725e9.2.2026.04.01.19.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 19:20:28 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 02 Apr 2026 03:20:16 +0100
Subject: [PATCH v2 3/3] arm64: dts: exynos850: Add ap2apm mailbox
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-exynos850-ap2apm-mailbox-v2-3-ca5ffdff99d4@linaro.org>
References: <20260402-exynos850-ap2apm-mailbox-v2-0-ca5ffdff99d4@linaro.org>
In-Reply-To: <20260402-exynos850-ap2apm-mailbox-v2-0-ca5ffdff99d4@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.3

Add mailbox node that describes AP-to-APM mailbox, that can be
used for communicating with APM co-processor on Exynos850 SoCs.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos850.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index cb55015c8dce..fcb665ccc7ae 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -298,6 +298,15 @@ cmu_apm: clock-controller@11800000 {
 			clock-names = "oscclk", "dout_clkcmu_apm_bus";
 		};
 
+		ap2apm_mailbox: mailbox@11900000 {
+			compatible = "samsung,exynos850-mbox";
+			reg = <0x11900000 0x1000>;
+			clocks = <&cmu_apm CLK_GOUT_MAILBOX_APM_AP_PCLK>;
+			clock-names = "pclk";
+			interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells = <0>;
+		};
+
 		cmu_cmgp: clock-controller@11c00000 {
 			compatible = "samsung,exynos850-cmu-cmgp";
 			reg = <0x11c00000 0x8000>;

-- 
2.51.0

