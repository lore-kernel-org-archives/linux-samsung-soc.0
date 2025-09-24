Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB9E30C61D
	for <linux-samsung-soc@vger.kernel.org>; Wed, 24 Sep 2025 15:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758726678; cv=none; b=S3ObtkY0zRRsUMBMEf2vqdqZXiDcBMc6MBT9azJWjByqia+jOcFP/vu6n8cwaA8bbVIrrZpSuzTVzyZL52VIWsKu+vLYaw3qRmHtCDl4hE5l9bMBlu9/mrG9bs7dewuG4hhzD5dEfBCGTpBPHDtbH7wLCJ5UGHLRphpguT7kO88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758726678; c=relaxed/simple;
	bh=xIpVlqe4DgqHRCmW3A7H3ri8twq/hpgQwg/JQ3/NwCA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UPngzBbBvfXuAc9mm2ykS6FpvUb47zyhS3bkIY9/PHlRBHUgSjAekVtKsEy+zEmjF/1rLuR8d2iHk7+UHM/S2E21WIXnmFAh6P+kj9JMP2gRUz3AveY9SvkzDzzeXx+IEpsZNBpha7K2is122AtdII2/wblgq7Amw6hW34hDa3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NnQ7WPoh; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NnQ7WPoh"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-46e1cc6299cso21197075e9.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 24 Sep 2025 08:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758726674; x=1759331474; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5s4FpMZhs2JDSa9c1gCTflWw3s59360Z3ANCY77Ti6w=;
        b=NnQ7WPohdgVlptg3OytPDzjTtCLALbezoa8X2iyQsY+kE6LXXKjgKqzFkfIvmNcN6W
         OtPSwxoQnvjVZS+iJboMKlxSTg58ytl2JmPI8kbgYtEjX5FpqiM+KThg1r6g9KPpHFUY
         sdtmuvmXpKmr6sHOQ0OKCIRIclo62cnJa39ppPMzJs9Aokd90KjsyR1fs07hqXmBaafK
         XR/MMeYP7c48WD0WPWE668HuoBoraGSzkBS3Qi/T778Pa4EiV76CzHJWMOZdWD+1q08N
         ysZueqek0FqjoFQLyV9RGzGiYFQZfchEksjzwHbTsWDlrA6mbHRG1vPtuNvBspMFXJsm
         HlNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758726674; x=1759331474;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5s4FpMZhs2JDSa9c1gCTflWw3s59360Z3ANCY77Ti6w=;
        b=PkLRyCQ8a0pvsoAXOosfk7Q4XnvdU/JZ4ppJsfxmkDCK61XTZy5LufFPpVYscOV6FA
         OYdj3W83Pb2761LAEDdsEPmUn06yE402x0hBMI3qf7ilOc8QoeSBeaud3Dfld7OhsMaE
         hZ8Pc8bEmPRcJATgkz3UEyoB3/ReVHRVnPbRhPCwJZcz4VEHKHwP7LKWVj/x08qsXnG8
         jjaKeHL+BbXplBh+6/bnwfI2QYHGVzg981GnctRmiaIeZ55H6hingpq4mhRne2oYEXGs
         vfsZ7LjV9Ugv0/ZhPvUPy7XjiZOSkzCIbjPKWz7tDhFihyxZIUr9/CR9WrosYEnkXmck
         wOeg==
X-Forwarded-Encrypted: i=1; AJvYcCUdUfgIm2jGQENqNcZKglCixyt4L0BikQhvWLWcd59evDzfF8XaD6eJORGc91x22OrJzhWUo1E5VFyW97ac2KMroA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLxleXzMhtvEL0osnA4vvysY3e8OWwYTRFEsPseWjvHdFjCTR7
	Y1rtJ/V+rHHl2ddmED2hZ/mK4SWpVpXl2JcC6YtVT+Ef85lYEwBd+O1bvgyzkJ1XtfY=
X-Gm-Gg: ASbGncuLNVv7htWgNAEV+WUX27m+0/G0SrW7M0F0R3mxIXmv1Kr6DrdzPby0sUAtH64
	veOCfN3auSo495g5N0eZvJOyFJWvGzUET1YNbSU82YdK1uHffkRsLxAoCsDlZkYsY+SuWpg6fuo
	VFMHvWyIlsfzcKYFRBMjScRmKXt1Rz9uQqvQUdb6aUv0QlE9COzT5QDd4Lr9KRlmzW4pe5YYCIH
	LPOYmqaMIULApO4715NsRQEqLtIjUOaDrEOkkJmCXFbkfu8sFvMXYGKAKA5IncTLti6zNusPoe4
	qEougv4TDeltHmFKstFMoWHEzlFMa8GBUI1jlUyRdU/rsmvAFvVL9GypKha76zqortrC4MO7SYF
	aBNAs/8siDt/FpnVsqCttnR3j3jkPcLzlIYSDKnWHD3MfhsVpR13S+0pIZTuMZu3EuRWoWhOnZB
	k=
X-Google-Smtp-Source: AGHT+IHqxep/cc4oLyuE3HkDZXgTyzUFzuxNas67CCOIgFLvhkPXSKwzO0M1vA4oarAwjHeMAdt19w==
X-Received: by 2002:a05:600c:46cc:b0:45d:7d88:edcd with SMTP id 5b1f17b1804b1-46e32a030cbmr2096795e9.30.1758726673765;
        Wed, 24 Sep 2025 08:11:13 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e2a7c8531sm36045145e9.0.2025.09.24.08.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 08:11:13 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 24 Sep 2025 15:11:04 +0000
Subject: [PATCH v5 5/5] arm64: defconfig: enable Exynos ACPM clocks
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-acpm-clk-v5-5-4cca1fadd00d@linaro.org>
References: <20250924-acpm-clk-v5-0-4cca1fadd00d@linaro.org>
In-Reply-To: <20250924-acpm-clk-v5-0-4cca1fadd00d@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758726668; l=946;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=xIpVlqe4DgqHRCmW3A7H3ri8twq/hpgQwg/JQ3/NwCA=;
 b=T1W9QO6+wC3/3UAC8KME30JBVVpkIcd/QWetlJFmV0a29DJ0ch+9QIyJk/3CeLRIN/rq+eDDL
 Wp7i7Gau7g5C0/rIp8NH9P+T+1wyVZVtps9in7VOZIRgtRa7ujunkW0
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Enable the Exynos ACPM clocks driver. Samsung Exynos platforms
implement ACPM to provide support for clock configuration, PMIC
and temperature sensors.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Tested-by: Peter Griffin <peter.griffin@linaro.org> # on gs101-oriole
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e3a2d37bd10423b028f59dc40d6e8ee1c610d6b8..646097e94efe7f1a18fb59d5b6dfc6268be91383 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1458,6 +1458,7 @@ CONFIG_CLK_GFM_LPASS_SM8250=m
 CONFIG_SM_VIDEOCC_8450=m
 CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
 CONFIG_CLK_RENESAS_VBATTB=m
+CONFIG_EXYNOS_ACPM_CLK=m
 CONFIG_CLK_SOPHGO_CV1800=y
 CONFIG_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_OMAP=m

-- 
2.51.0.536.g15c5d4f767-goog

