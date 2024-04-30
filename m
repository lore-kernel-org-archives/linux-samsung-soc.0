Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020EB1292DB
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Apr 2024 09:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714470591; cv=none; b=ppMaJJKFLL3XiVkuwpG1GziG3eCAdkRZW4hQgJpciXpw3xTVRUenbDQ28UVU1+KWC1oYQBnR4MJHS3irh5fv5X/eE7O4ejCwJvd/XVArpne57ljBSGwcLbpHvxarrPVTmEkfR5rYFtO0BAzmDZCS3VefOjQ+yPjPLnbFUmzEOCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714470591; c=relaxed/simple;
	bh=13Fr4UEwIC36RkZaWaqe5teByY2xo8qLUQtGfXoOolQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FeDsY2ZLo77UP8opbq/ySZ2/oHHe/dMbABU0ChVhNSy8LeD2uIIZDB1aEkGQZJ6EzmxG5uPxVOUh03Tm5PysHqvoWcXg0Xrwbt86rdwHDdNVB7+GoOE7yAm5/kfLAIO/IwFsGvxGAqwYf7PyxSOFEqww3Wi49NQ9ifj8lHAEFFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gwKHOIhy; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gwKHOIhy"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a58872c07d8so1129815566b.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Apr 2024 02:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714470588; x=1715075388; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IW2Cb8PzWQGoPtLIM4Yb+ZUUwep8epdxp3AM6wmQKqM=;
        b=gwKHOIhyHbizNTw+NHNdmzGT3t/3AZSnodRJCJD8uKqS1yC/F9G+j0j/UmaETndhGi
         jxU0daVwONVXxqJ0z/QIkWAR6S88Wo0NaPro8i68jjmjV4+VLqUdrwfOpuGLERMXzfU9
         9CPXUjC6SMf4e3hsu23WGHQRIikfDFulfGYJimTpb6okLYz0XHEbdwOOvHgc9S966yPT
         l0BreJxm6HSra4mRklVy3gx54/i4mCws4Kt7tb7ncDKL3EX+hj1ylHWMZtz3XW1kD/JC
         iycBSMJ02og09ePtQpnCkyGjQ12RngVmIs9qgIPo2xdj7RsDIqw9SZrrfrrvsxurphvx
         m9Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714470588; x=1715075388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IW2Cb8PzWQGoPtLIM4Yb+ZUUwep8epdxp3AM6wmQKqM=;
        b=Y2AJmKYOKNLOvXVZUUKEB2TQJg/z4kiWdfZQAcMIGHVbUqfrfGVnrCxpim99nLtdlJ
         y3H3a2SCp9XK1KCgBbvU915UujfB5mn2XjN+LwyhpIBKiNB4/k++T7wgmzJqAWipQCSK
         qKQ+NS151W66E6mciEhVZ1sQlX4pwU1mkdNak6mACMaXFeVj/Xr0RjMP7WRSrfAgTUOZ
         5i7bEBOVXRwY0TPWt5lD+pX5io3T2ik4KVjgfc0W7feb+bmhvoGFmjL21UxaHTBnB0Lu
         00oYeCNMA9YikK9suegxHT4RBPlmjgO4UR4vMOBJjHRSdlwORnbsCs9A8l543YG1/NYi
         p5LQ==
X-Forwarded-Encrypted: i=1; AJvYcCW52l4WCMl1QLhwYmbtS6XTlgPhDUTDgpMnNZRlbQlrdgpsm9o1Tzkl9y74XMCOsaRDImsKUZT09vCcr19rc1iEdHGjDJhrszYHyZkLCnpB4EM=
X-Gm-Message-State: AOJu0YxBM7VkOBRrkxRmbTq6ZziRpW1cHoq6geF/k6Bfi4P2r5yixJOV
	WkMu3T/qBuIOBSViLy8C1klAOKU+vY6y4BZBt9lX0RlQ3fMHZj4lOtvLlMwZTQz0pa8Z2mFq3uv
	5LXw=
X-Google-Smtp-Source: AGHT+IGHfVUxz3QjTYfKVaZf1Fxq987xn6bX0DNIr56yMvAIWMlxJqcTpnRu05tSTpmhmv4zQ9O09Q==
X-Received: by 2002:a17:907:1ca4:b0:a58:e4df:4d1 with SMTP id nb36-20020a1709071ca400b00a58e4df04d1mr2642701ejc.13.1714470588413;
        Tue, 30 Apr 2024 02:49:48 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id dk21-20020a170907941500b00a55aee4bf74sm10981024ejc.79.2024.04.30.02.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 02:49:48 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 30 Apr 2024 10:49:47 +0100
Subject: [PATCH v2 2/4] arm64: dts: exynos: gs101: specify bus clock for
 pinctrl_peric[01]
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240430-samsung-pinctrl-busclock-dts-v2-2-14fc988139dd@linaro.org>
References: <20240430-samsung-pinctrl-busclock-dts-v2-0-14fc988139dd@linaro.org>
In-Reply-To: <20240430-samsung-pinctrl-busclock-dts-v2-0-14fc988139dd@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.12.4

This bus clock is needed for pinctrl register access to work. Add it.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index f2c7c2a4ce1c..8d4216cbab2e 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -370,6 +370,8 @@ sysreg_peric0: syscon@10820000 {
 		pinctrl_peric0: pinctrl@10840000 {
 			compatible = "google,gs101-pinctrl";
 			reg = <0x10840000 0x00001000>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_GPIO_PERIC0_PCLK>;
+			clock-names = "pclk";
 			interrupts = <GIC_SPI 625 IRQ_TYPE_LEVEL_HIGH 0>;
 		};
 
@@ -914,6 +916,8 @@ sysreg_peric1: syscon@10c20000 {
 		pinctrl_peric1: pinctrl@10c40000 {
 			compatible = "google,gs101-pinctrl";
 			reg = <0x10c40000 0x00001000>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_GPIO_PERIC1_PCLK>;
+			clock-names = "pclk";
 			interrupts = <GIC_SPI 644 IRQ_TYPE_LEVEL_HIGH 0>;
 		};
 

-- 
2.44.0.769.g3c40516874-goog

