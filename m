Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6A41B85CC
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Dec 2024 07:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733384000; cv=none; b=SoyCGgX0HRriYfZXCriykXgSWLbLXbHQx7Cc5Z9PdKz7+wkn4u1xKzEVfRfbLrdaTQO/F49KjAxFT72pN3p0P/bDu+6oGwySxIZXhSaWX0yY+p0SmemT55s8BvUtAVpcqAvzZWUJpelKtQ7qsHaNFYOf00HT96Y3jY0gHXZpQHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733384000; c=relaxed/simple;
	bh=iFlGn8SYSQnS21b00+qwUeC5W1YHrazBnqPMlae/vqI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pnfWD44L6mwzPhciS2jcTqU7oHPNAO85fxdO+jI4Lm8Z73p7PldplbhUkgnZ028A23A3DcOTFTarCHwG8ROw5Cjd71PIWVzV8EeiB+VN539X7SUrjRo5jYE6NzymCGWOugS6HItJUarXrJR6kDCwG9P6iCs3IcYMUMTn5EkIc9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DehWK7TL; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DehWK7TL"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5cfddb70965so862743a12.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 Dec 2024 23:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733383996; x=1733988796; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6M6cTvNs7V+xqyuwhG0n9JcP4Mq9Zi3RChVjlFoyS9c=;
        b=DehWK7TLgdKUA5BElK0cDk1YkZUIHRRYi5bh8ZHNgc7HQHLpsXLrg50jphWxAmtmr8
         S0vJU0+Q+OFyRYH55utOZglhTZNFiIpRnAi8yCUQg7bbRmzLG7Ez0cawLpK/HmV6YIsL
         OICEcgGbostjgLDZqJ4JUBX3MZZzcnvOLgBuTrBXXtb3vtwPydJ7uQjxOOuS1Ovkt5FF
         O6rm8cwBEIKOLrVbjNwu7qPexJqmcz7CiqWep0SKPcrKHkNU947Sz/gkIOq1vIpE7S7b
         +Cp24nrpVe5RAb5oDmfnWpN54Qr8P/WyVUMJIHPKaXFAiFaEOfbZFQ8TgGboeBDStofT
         p/Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733383996; x=1733988796;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6M6cTvNs7V+xqyuwhG0n9JcP4Mq9Zi3RChVjlFoyS9c=;
        b=UPJ6Q/F2kUJ/eEx3uwJe08z228pCIl9/1LN2ZJQtd+IocfjeQHBocrf8ncBspHIDP6
         fpEsB3t42jXpLxtgiOWc39SRUcuDLPfh0mtk2HLJYP9eQSCfUQ8ne4HXazI4saR8mhU6
         Gd94WoDna87+22q6NhYpWD+b82pEUL02NUexG40IqR2L1ipteZLK10UJlYgeHv2joiAI
         JiT/n6TGU/LHfqh0sWDi2XlFLuuGwenBaVMYDOhNOV5ARMMrrOhe618HyUq4hRe4evbo
         cqwA/ckMumSYFGsBV+Dhn5QpckJ6Gflq0af9PQBx/1lp951xnb6+G00gnvQHbrWxDvo5
         OYeg==
X-Forwarded-Encrypted: i=1; AJvYcCV7zAVxKdwF1tQ7/M1sSLjKHOQM5MTQSqopSEczNkQr+Hu6+rzh+qIEtBvwQzIMpUOvwF2133YF5QAQBEn0flrUGw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJF+8u+HN8mD7U8h025xg+WNFros7sMxtwAz2GIgpakmHFsXTe
	Gf3oZnMqulnFQmgyY3PbLDAHS79MzfLxJiRIRonWTEwf2qdNutYFOnzraAL74vU=
X-Gm-Gg: ASbGncsr6iMcF8CrsPTR0JrYdzhwcSWyVSY/5WOHydw10k97o1GGkUVEc0s7nqDAtCX
	ASei+KJ3WODsYfgLJk3L2Yr9ByLWaIJUf6LI+wP1e2FMTXOTd8t689ImC/InEp+X2DFmeMrE68o
	c727L9ddAl16pbWHBgOEbm4CVjG4p0RMYZ61mtVq+g2fJrymQxwYr04C8dzPPAksytvEI0+QuGL
	nxlC4GzES7R2vQyAyqSkv5/SBp8giFO3edR7IZKuQjabwNY3wkIRqMRe8IaJJe112fAMHnGVINw
	2330xGvhkoXV7n0EgqEcDnAkJheB6zhMYQ==
X-Google-Smtp-Source: AGHT+IHuNjq0k6FYk7xK6t2GUtZ0TeRU7XN1ZF4Q/PTjjLe6Nsx4lZ862dPWiqXiDX4zZtdZApQooQ==
X-Received: by 2002:a17:906:2921:b0:aa5:aa3:8c45 with SMTP id a640c23a62f3a-aa5f7ecd65emr765500366b.48.1733383995984;
        Wed, 04 Dec 2024 23:33:15 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6260888casm53371766b.133.2024.12.04.23.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 23:33:15 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 05 Dec 2024 07:33:16 +0000
Subject: [PATCH v3 5/8] phy: exynos5-usbdrd: gs101: ensure power is gated
 to SS phy in phy_exit()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241205-gs101-phy-lanes-orientation-phy-v3-5-32f721bed219@linaro.org>
References: <20241205-gs101-phy-lanes-orientation-phy-v3-0-32f721bed219@linaro.org>
In-Reply-To: <20241205-gs101-phy-lanes-orientation-phy-v3-0-32f721bed219@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 stable@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0

We currently don't gate the power to the SS phy in phy_exit().

Shuffle the code slightly to ensure the power is gated to the SS phy as
well.

Fixes: 32267c29bc7d ("phy: exynos5-usbdrd: support Exynos USBDRD 3.1 combo phy (HS & SS)")
CC: stable@vger.kernel.org # 6.11+
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v2:
* add cc-stable and fixes tags (Krzysztof)
* collect tags
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index 2a724d362c2d..c1ce6fdeef31 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -1296,14 +1296,17 @@ static int exynos5_usbdrd_gs101_phy_exit(struct phy *phy)
 	struct exynos5_usbdrd_phy *phy_drd = to_usbdrd_phy(inst);
 	int ret;
 
+	if (inst->phy_cfg->id == EXYNOS5_DRDPHY_UTMI) {
+		ret = exynos850_usbdrd_phy_exit(phy);
+		if (ret)
+			return ret;
+	}
+
+	exynos5_usbdrd_phy_isol(inst, true);
+
 	if (inst->phy_cfg->id != EXYNOS5_DRDPHY_UTMI)
 		return 0;
 
-	ret = exynos850_usbdrd_phy_exit(phy);
-	if (ret)
-		return ret;
-
-	exynos5_usbdrd_phy_isol(inst, true);
 	return regulator_bulk_disable(phy_drd->drv_data->n_regulators,
 				      phy_drd->regulators);
 }

-- 
2.47.0.338.g60cca15819-goog

