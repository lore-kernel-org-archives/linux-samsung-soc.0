Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B96C202C27
	for <linux-samsung-soc@vger.kernel.org>; Sun,  9 Mar 2025 18:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741546575; cv=none; b=L/2Gm5Q/NDUV/z7WTOzGEpwhMgiVycFUEy95jsEvKl7Ut0bPW5B/xDMiBB+QTgFCc2vjndew7laaLN4cXXLnZUBDSfop9AEalYGyq7kBjA9+N+lYaGUXl1gq6yPtT5rPb1vY0iyqHQiCeQfvNczCvvoRj4AIJAImWA7pL3hXApQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741546575; c=relaxed/simple;
	bh=uvZ2+a6S6JpYckvLd3vN4y/XaCLyyGT9gNpQQ8dNmeI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YLURa2LWOzpPy4DXqeESJRTVZ/VmItu6fohFihEcAMbUmFRi3Xw3Dsod/8ttorBgFdGHBd7wxXps3uqbhk9lKNfxGBf3WSg3+rYWop7K9Rg/R48Rnxf5AaPEdY5VdnfU3qui5klJfnGWf9/Id0kxgQhVvhrPlAjh2KfOevEFjiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DBaHtTha; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DBaHtTha"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3913290f754so151721f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 09 Mar 2025 11:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741546572; x=1742151372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MrmBWLsc0A2hxy4AAIuONWnJt2T5epZ91diVlTxUCPM=;
        b=DBaHtTha2b/oWM/5kev9UR3vSTFF7JN5KsUd+aOeu5Kh6l8CFDshFMMB/uVBYqcG/e
         EL8maSl4wz4adQgxLK0/n1X4EBpUSfyIRRiJHHGH3hY5al7zIkqrgFihNlpZoTwNxkLG
         +7gGfGHMzqq3L0E8Hw/TKr3bZuMPvuKax9qoOI6cvVcfaAFtWlqJ01CfYNOPrXaSEFWI
         rnr98X2PznkqveXqJELLbG3s28TcZVvOEcSjiBdEd2CnZGyQDvIGmtXXAwC/YHPGJbLM
         /0hOTnpSsuwcfh/1zTT4yUELdJnJBTmk/EmoKg+v3APt4xQ77awktHN0szbx6iT2btSt
         BxRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741546572; x=1742151372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MrmBWLsc0A2hxy4AAIuONWnJt2T5epZ91diVlTxUCPM=;
        b=rYpfmYYRbIB16dQnWVfMfgHKpismhWT9oE+DUhRmDoJl31kT/Mj1y0O6SqPSt+CTcf
         71wXHtsexc3Zz4hG9MME2Y77Q77nDsOcPK0inHPTRI3Y3RPSV9J8pUjjHktBf2ENkhsC
         WuoyG83WntnGEVqzDubKFaqc250++TbuWeYcnQltwNwN2qEfORgYyE9u/k6Ewg7Htb0a
         4vKzXcpg1+fHgotbwTYs5e0wnIoqFK9/cgmF3O5/NhUu84piO0xfxKwo/2UuK76d8Ozw
         9b57NGC+SphSpKSRIkdZF0YcjoZP1fvrW4BKrNAeHlypLjfEkPuc820YQZj3YTKM4RUQ
         a/TA==
X-Forwarded-Encrypted: i=1; AJvYcCWiiaQbl9zAT33ryte7PqXsGGfPij8li2CQ64kxYFyiBrMxtMnIPbyQlgJ/okcKTNHbINVttksdFrQKpqwso/bq7w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxffuEPKAF0VWWr23lpGuHP0I7gHTvZZjv8YeIa9XsEWuiLnvxm
	UNubKlZVUVQu9RL8zqaUdV/5nv0GpcutCmD59D1lAP+aPgrrRlxSxNsigG/w+pk=
X-Gm-Gg: ASbGncubwbgjxCz7eWUFHhPenlCRRNKGW1dnqh5owBDOqVnluQTTwDOg4b0u8icLQvy
	8j3br03vYBXSLKj+2MTQGdJlvY5UlyYKC5Q4eivh6lB0N6MoW81bSvPMN3VKwM50cwyMQUYTtkr
	V2hzsdwhLUJdreq4oQp5IWM17f3QMLwsl/MFyEigrAkN/2wKVXUaawqrqN1x5J8pv2C8+mWH5yV
	0adYVa7dw3GWXq0xfDmkPEhJsTIqnS/XxHXAcYyG9sicVXU8dlyjC80FWmCBg3ZxRkDQbPnqpYi
	T6k6EEK2pv/UL5t6kJeFvw4Psgpu3+hyy/GjYCp3zonDEkNcvxw/VhQi3io=
X-Google-Smtp-Source: AGHT+IEKpRHbbGfEM98G+jT1dTf4FeQB+l3gBVL1qFl0csub7dukLp0ucTCxODN6l+bL/aW/iBduNQ==
X-Received: by 2002:a05:600c:5122:b0:43b:c0fa:f9e5 with SMTP id 5b1f17b1804b1-43ce6eb5ab2mr15192015e9.4.1741546571601;
        Sun, 09 Mar 2025 11:56:11 -0700 (PDT)
Received: from krzk-bin.. ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43cee22c13fsm44263945e9.40.2025.03.09.11.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 11:56:11 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [GIT PULL 4/4 PATCH] arm64: defconfig: enable ACPM protocol and Exynos mailbox
Date: Sun,  9 Mar 2025 19:55:58 +0100
Message-ID: <20250309185601.10616-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250309185601.10616-1-krzysztof.kozlowski@linaro.org>
References: <20250309185601.10616-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tudor Ambarus <tudor.ambarus@linaro.org>

Enable the Samsung Exynos ACPM protocol and its transport layer, the
Exynos mailbox driver. Samsung Exynos platforms implement ACPM to
provide support for PMIC, clock frequency scaling, clock configuration
and temperature sensors.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Link: https://lore.kernel.org/r/20250207-gs101-acpm-dt-v4-4-230ba8663a2d@linaro.org
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index cb7da4415599..18f96796298c 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -264,6 +264,7 @@ CONFIG_IMX_SCU=y
 CONFIG_QCOM_TZMEM_MODE_SHMBRIDGE=y
 CONFIG_QCOM_QSEECOM=y
 CONFIG_QCOM_QSEECOM_UEFISECAPP=y
+CONFIG_EXYNOS_ACPM_PROTOCOL=m
 CONFIG_GNSS=m
 CONFIG_GNSS_MTK_SERIAL=m
 CONFIG_MTD=y
@@ -1403,6 +1404,7 @@ CONFIG_HWSPINLOCK_QCOM=y
 CONFIG_TEGRA186_TIMER=y
 CONFIG_RENESAS_OSTM=y
 CONFIG_ARM_MHU=y
+CONFIG_EXYNOS_MBOX=m
 CONFIG_IMX_MBOX=y
 CONFIG_OMAP2PLUS_MBOX=m
 CONFIG_PLATFORM_MHU=y
-- 
2.43.0

