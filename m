Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9153035A930
	for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Jan 2026 12:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768824543; cv=none; b=WIJ7toQ1ukv93WL1k2Hgxekuuuo91aOLrpZAFKROWJRYQQXoc9vuccpnmqiWK5WVEz/Fpo6P6lvstAD9gW2Ah9E4RTEcZGX4vTq2b+U+KLdAlNN7HR1r67QwLm88nRxMfSmccxOPZHZ3LAwsCylpoVV0DffAl2x02mmcqbw3tco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768824543; c=relaxed/simple;
	bh=glFQ4Oo7aFXvg4qCxUzDyhw63Eric2ZNI22jQtPmJhg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Oz8jEsAqHIMDD31WtlnBPXXIhLjJWxWU+gm74J1aw/pQwRli/WoJsfQese3p+StV5Z0VxTKHIpMsifXzKXEeYnIGKFijhdIL54dS7o29J8fGt3hjAUUOINa6FwzGpzQEi/2hjKUwmrZtyrXYEDHC99ymRM5FdpsPhO+xJJal+nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RZb3CUCH; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RZb3CUCH"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-432d2c7a8b9so3691415f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Jan 2026 04:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768824538; x=1769429338; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lathu7eoQ9hnN88L9AXE9/ZDnozq7El9GXLKl/+ubdI=;
        b=RZb3CUCHS8XY/w6prvniPZsJeLa0F3ecDqlXKS5V18u1ARwlecbTcvfkMSSNc4zo2e
         UufpYWCk8WYq83Icb5O9z6Ilv47FMH77Q+RTgM6IusnK+ht1cE+t7wwyS07BtmIMQNEY
         zI+xu/b3CCv8fxsv9Z3+vLTeBwyKifeuKRg+4pct0sYuqz2X4NTmsPhitNF82Kg1auTn
         zbQZC1CBLDmCSrh9hR0uhM9xC2D/0whgDNNNeDOz7NOf+FCh1Nai1DFMHvbQ7dJem49c
         kdswX6eFkJ6Ek5/OZ9Vi1JYIQlkgLIgTaY5ktp53Rx7wdG+TdEXrHFmml+idHlmiyUnQ
         yk4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768824538; x=1769429338;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Lathu7eoQ9hnN88L9AXE9/ZDnozq7El9GXLKl/+ubdI=;
        b=JvlQhYKrkeNO+nQPk1IcBPhkWztjdHdxbgOIuS22M5cBdmRFxtvhhId8NRjhbkHd1F
         XzZWmVR9N9o20V1f0F5+ZUB/+j+O0cDW+KdXaapLnzLpfPvsxBpnpvM6W3Knj1H11fD+
         EZ1hWh/07lFG3xk86LgDbk0m62fZUmkkU6z/NSEfx9CYPA+RQxciY2Qyi2mXT0l+dphL
         v5iNz7Dlk0jXYU6WWq60MUih/WfSg1C3sDw0MiqHLXhcmBYGMoVDQYxtDWgTqByHIq1E
         /ssrjQtV3UjrrMkRnYjcE3wAiFo1RSRlcAhFkz3l9nFOpd7dB7C9KRVkdqlb9F7Mjy8L
         XZIg==
X-Forwarded-Encrypted: i=1; AJvYcCXWOY1FOwrpyIgtea6isWZSdTibJBR/JZpcxbGN8YuNvXcE7bdewziQMl8ijWs2gD03SE3DP3BYohn4ZIEGRnvkvA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+inFmbcJtH3To9xKNcM2iF9rjbjsgf7dIS42shoMmMHrV2oai
	HHzxWpNM2H58Dw2BcsTSG85VgSdrgH9NPv5AAEe1+hHzr5ENqJyg0CWIv5gznghM08Y=
X-Gm-Gg: AZuq6aIxA/dCOEnqJ2N/7rwifLQkJop0AVuAzJro93mrHsHMWsWOlOcplk6OAQYJKbb
	jDxSKEUcJ9IfWaEMLI852olgj6MivfSG3iUx8HCFMczv1rvnygtAiVd1n9OgtoYJUFCUukwpBxf
	YYsfm9P1E36ssVO1iH2HTsL5S4L2GZfWY79bYjQdxYIWOlMU5pKMDD9G/Q0PYkQqhVHPkxVUoVX
	83aSYIOoLIk2iudIKzIHJoaYY6RgZgnID4EUvKSzaigPTIuZrqA1i8BkipFARWBi+hEn/SctTD5
	UK7PXZ4czh0/TlPs3w/whLRUKNthct+MeITtRkCBHxHzt6YxD4sMr0c5znsrSSh84v58R+FO1+V
	UNxEclyCu6fpI1BozNRur/u9Shfc6Mu2VlX4r7workn4ffNuclFjXdNvycZ9A8FaIHMQv0LAM3/
	jBj02OgFi8I5lLcoTH+RwRpdNPMpuMFNVyoTnUA1pn8+1qyu5/TUsiLhZYRHP9LQH8BzVxAw==
X-Received: by 2002:a05:6000:144b:b0:431:8f8:7f2f with SMTP id ffacd0b85a97d-4356a07743emr11227404f8f.34.1768824538122;
        Mon, 19 Jan 2026 04:08:58 -0800 (PST)
Received: from ta2.c.googlers.com (164.102.240.35.bc.googleusercontent.com. [35.240.102.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356997e664sm20698421f8f.30.2026.01.19.04.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 04:08:57 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 19 Jan 2026 12:08:53 +0000
Subject: [PATCH v2 7/7] arm64: defconfig: enable Exynos ACPM thermal
 support
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-acpm-tmu-v2-7-e02a834f04c6@linaro.org>
References: <20260119-acpm-tmu-v2-0-e02a834f04c6@linaro.org>
In-Reply-To: <20260119-acpm-tmu-v2-0-e02a834f04c6@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: willmcvicker@google.com, jyescas@google.com, shin.son@samsung.com, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768824532; l=868;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=glFQ4Oo7aFXvg4qCxUzDyhw63Eric2ZNI22jQtPmJhg=;
 b=jGWmIQ3VJe/OIr58mGBQinzVZCX659HJK8MtuuaHM01fhgkcacEuB8bWVtLq4hLL7aAt8CY7o
 ND/UZrRnDGbDYAMpf2MIYS7MwKUlOKLihzJnMnIfQ6vWHwzkx5s2HTQ
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Enable the Exynos ACPM thermal driver (CONFIG_EXYNOS_ACPM_THERMAL)
to allow temperature monitoring and thermal management on Samsung
Exynos SoCs that use the Alive Clock and Power Manager (ACPM)
protocol.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 45288ec9eaf7365427d98195c48e2f8065a8bb1b..68fefe4bf49501500362fcb0b490a684ea469b26 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -752,6 +752,7 @@ CONFIG_BCM2711_THERMAL=m
 CONFIG_BCM2835_THERMAL=m
 CONFIG_BRCMSTB_THERMAL=m
 CONFIG_EXYNOS_THERMAL=y
+CONFIG_EXYNOS_ACPM_THERMAL=m
 CONFIG_TEGRA_SOCTHERM=m
 CONFIG_TEGRA_BPMP_THERMAL=m
 CONFIG_GENERIC_ADC_THERMAL=m

-- 
2.52.0.457.g6b5491de43-goog

