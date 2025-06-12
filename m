Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5352036EC
	for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Jun 2025 13:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749735876; cv=none; b=NIOLklMKo8Mffg+VcNbHxn/N6sGZvLY1VxgCXEyuNv8I7E/ESFGiwC8bZfReQOdXWOcsxCupune9s4xEuu6p0bu+dKeKRdDqVFKSFuuBYSeLs8vdiFRAPbtnoSsHu4IBI9ElSyK4ZKaOHvQHl2b9tmUEdtVN2X8MyZytDE3pnIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749735876; c=relaxed/simple;
	bh=KY0F8+kc7mm5xaiPKfTg64NGT6LMQadpTVG2dcSzIOw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nW3qEvzujOSU0ns+Hpnu0UM6Pn1RyYaqz+2MEjOkUoWKeYw2HngxMhU2KyT4kk847ceMerzugjsuB/ePk7L1PCB7vQ+Wr+I+QP2O76bKNH4YnzuoszI19g74uKFu7dvAj25doQTGAKAk1dwsrkkb8RifDk1iP7lvqQyxTevMCt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HCl7eH8V; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HCl7eH8V"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a524caf77eso142463f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Jun 2025 06:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749735873; x=1750340673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6wLh0Bfznwrpy2ODyPunjDZzKz1nyvlK3wv3RxF8avk=;
        b=HCl7eH8VGSpLTUNUE4eIi4qwk82oC5GC5PFGItZPrQQ6zx1H6UGN+adbN/euJR7pMJ
         kldBJd6YpwBb4dNC9U8H/ro1FD9etHe0PmlBrGs4FZO9+CSXFRWg+9a8vKChOSs0kxzk
         rXlVYtjkOv9j/dsvCae+RqD8EenFNe6DVfQMZgP5wrsqwUJ40hiTgCST8oyVx1yxE4Z8
         KEs/2YRrDZV3Dqq8csZl2dEoG7GEH5milEdH6hAiHhliGIAJa67vMbqiFJwAXmMwLd/z
         m3VCzRaAAv68En7TeBD+zOHAHYREOIf59NYFGEhooHSd9qJ8O+QZL30SxUSstDLLg9OR
         V/eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749735873; x=1750340673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6wLh0Bfznwrpy2ODyPunjDZzKz1nyvlK3wv3RxF8avk=;
        b=at4or+7f5Y98e2NvmmIfnkAwtp8m1Q/W502HtAkBR3q04Oz3XhAXJeCLiW+QV9dLpn
         un//oShDXD3nifV7dsu/nsigxHp+klI3u/kuEeJrKfAvyyiYPTzgBlVWcovaE6E4o/G1
         /pr7YHm3kIVLtJ0QeX8KU9rj9TZBhpExMxDM0yf531ynvc7Yow8A1Rvdtmrl6v/emayL
         9a2keYl0OaLpe07t7/0jh8c9w9N6ArDZIj/EDAhTb8h2E8LgOLedq6TeKUJHwcZH3PVg
         XwCmhpwJmP97hsyCl7zcugBNhw45g0fOdShHM7fdPYWBwr98PYiylwK+Drd4mBL2zVE/
         NvFA==
X-Forwarded-Encrypted: i=1; AJvYcCU7M3+VLq1MzJTel/OC79ZwcN+nyoLkVVgQjtlQiT4EJIVPK6hTUfVFve+XFUYCWKLlmhfa/ngznmr/WjtzCDuDmw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYfDNHjrgsMULkMnCYRDxlDUxHSZcmPiQ5nHHFTKw7MJb1BDep
	7hZMbU/17JECTVeHzraiGZK8EFOJLbyg9g/HLtB4ZSwK4gs5vs8vJvAAm/eX5WpFGRg=
X-Gm-Gg: ASbGncvCdJnuiyitvo92EJzj1huZ6aJNgSJiJblpUda6VI6FvasCK7c0LTGOeNvfrh8
	7QsZkbcRup63Ss8o1SpRReniGlJn0CSNiM40nnbsDqdks6kHQH1ZfzUO/R0gDDkTA/dRnLsMoMZ
	/ok7hfbszF9wgM0ePXp/8ZBSyjXKAkX1ePNr9jRE9h4bSLyUbE8bm2DsObCevpVLlJMBOml+QsA
	qOqd2RZiB1zQ55jyf8cglcfrDg6GPpyqgsRU7th2kKwgODtBPQ09Pp7+PnT2+Ew6Y8tnmHCkgm4
	qhcfD1mL4vXP4jQqdDuscopV58ofusOVLLGbbzYhfG1qVBUcnqfBqvreOzSLfz0LYyUTShGb4A=
	=
X-Google-Smtp-Source: AGHT+IHtHbOKUROa0ve5oP7CqlT0tuVP3Uhvzz+OcfUoUTB8LdEAWIqsjOFYSVDtkpJs1KvalbK6XQ==
X-Received: by 2002:a05:6000:2409:b0:3a4:e740:cd6e with SMTP id ffacd0b85a97d-3a5586cbc4emr2389747f8f.8.1749735872804;
        Thu, 12 Jun 2025 06:44:32 -0700 (PDT)
Received: from kuoka.. ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a561976f13sm2053661f8f.4.2025.06.12.06.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:44:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: krzk@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	asahi@lists.linux.dev,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH 2/2] arm64: defconfig: Drop unneeded unselectable sound drivers
Date: Thu, 12 Jun 2025 15:44:23 +0200
Message-ID: <20250612134421.95782-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250612134421.95782-3-krzysztof.kozlowski@linaro.org>
References: <20250612134421.95782-3-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1290; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=KY0F8+kc7mm5xaiPKfTg64NGT6LMQadpTVG2dcSzIOw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoStm2S0PrTSvMJ4T068lWmaIsuO1xRYGmPZ7xW
 PrQgJMoVw2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaErZtgAKCRDBN2bmhouD
 17NtD/sG7Qwg74MQDSYs/mqC4KOD2fT4ykjXIqRK6biOw7HMjliCiQOw+XynSblUFD9TbDeyzqT
 wIL4LCWYQ6kd47NBX8GSUpB/ShaOaI09o8Nuy1Kvj8aEljhdiGp4ckeF295qq5RG3oWInFtoM5Y
 Ld1HGX2nOK137IibuLsWIZ2ZNYbWdHCfIu6ZJi2KGD016k91JQ7RHI5oe/O48vpG8smsfj88clN
 D+d+D7N3TACVgoKNVdvwcG++7BfJHe/0N0kc/KcYGAZHkZW0RxMRV5CRa5JTFFT8HcofN4enuDQ
 tAJvQkDehFT+nBaBrM7fcnC2yO1q7SPya558nohVVCvhDhTgxuZsMEkH+1HMhwKU9IrEePtSGLB
 kvhxRHRZkeRVjucthVP2BvwQTOyzfsdGGWN/h2bVSY03neVozbnN4xg1jtBDtGDYwQ09NmCpykW
 xuEhh8DUGiQXNfvIgZu2azW39j6MrXpfIPSpY3PUarMkn9Hu/YsUtylj9Nk85JewomYhwYmsdRK
 DoSNGbvJ2vuJG3IOsdCLweB/RzSo3K3RgXz1/OJMl5IcAnQX4zbf/k0QYip6Iz9mrwZNuP5asAc
 hMFMPaGNU2Lri7c8q57FPcMmeXna0xFDfiEBqGfP/ESJTFcH+68lzwGlgAhFImmUaNS3AcKdz38 7U6Cs+MlvUiIVcw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

SND_SOC_ES8328 is selected by SND_SOC_ES8328_I2C. SND_SOC_WCD939X is
selected by SND_SOC_WCD939X.  None of these are user-visible options so
their presence in defconfig is redundant.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: Sven Peter <sven@kernel.org>
Cc: Janne Grunau <j@jannau.net>
Cc: asahi@lists.linux.dev
Cc: linux-samsung-soc@vger.kernel.org
---
 arch/arm64/configs/defconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 14fcd0a85f5b..a47e1616b4ef 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1057,7 +1057,6 @@ CONFIG_SND_SOC_DA7213=m
 CONFIG_SND_SOC_ES7134=m
 CONFIG_SND_SOC_ES7241=m
 CONFIG_SND_SOC_ES8316=m
-CONFIG_SND_SOC_ES8328=m
 CONFIG_SND_SOC_ES8328_I2C=m
 CONFIG_SND_SOC_GTM601=m
 CONFIG_SND_SOC_MSM8916_WCD_ANALOG=m
@@ -1075,7 +1074,6 @@ CONFIG_SND_SOC_TLV320AIC32X4_I2C=m
 CONFIG_SND_SOC_TLV320AIC3X_I2C=m
 CONFIG_SND_SOC_WCD9335=m
 CONFIG_SND_SOC_WCD934X=m
-CONFIG_SND_SOC_WCD939X=m
 CONFIG_SND_SOC_WCD939X_SDW=m
 CONFIG_SND_SOC_WM8524=m
 CONFIG_SND_SOC_WM8904=m
-- 
2.45.2

