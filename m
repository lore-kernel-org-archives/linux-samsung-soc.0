Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB122DEA6E
	for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Oct 2025 16:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759769016; cv=none; b=G2APSGfaLEYqSXhyg7lbyiwrRYo7rWnCdjSZhu9tznx8JWOTc1BbdEmd0vr2Sxvj3BQIX66YVY1QZwIXZncFHOJt0ko4XoxjczLGsOy/n5iOTXdGf0XXwPPVEkKtG3B+cynwSnQe1cuS5GCJ6Mwwn8oZSj7HqcS1SnQpX8dSWI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759769016; c=relaxed/simple;
	bh=geIKgWF2ALweoM3YZgXz0Zorhb0jTxVcchCl54bV0Og=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LDpbFFY/BYV4ACMP54QavRBbZQvXoUhkV7QuS1yEZ4dw2tTe1gbpVRs1PCcPGoDbnecJ5/6M0qWuXRurDKCrEGTE2HZ0p+crbSlTX2bw69ina9++jVqJanCd7Nrz4eDxAYkntuuvZJ4vbKm5CaBlBTzZqA3n/sWub+AyI0LG0IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wFEHqKBd; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wFEHqKBd"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b3b3a6f4dd4so960699866b.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Oct 2025 09:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759769011; x=1760373811; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TxwnlAP3n5M7cyJiouK6nx2qCN8Hw+Sbnl76f2YXigk=;
        b=wFEHqKBdBeQ2ei8jpQHWd7l6Tm/e7UCOh5/su4FIFADv9zrzduqO4UJQ3Cx5yX4K9A
         klcDvD6QWcrLTQGJvrIay1XWz3nJ4GKsC8xHIangXHXKcpmBFKD5ytX65mXaGD15yTl7
         +e0SoNE4SuBDUHin48IYvlwrti9QYXrGSrCHrxnvmKnObFuWB19st0oDeD9PQubGOLn0
         IdPdnvo+xS+qMhRu2/6vo2In9CFADENDaII3X2OjBvSvfPBzUD7uwv14MlS4Lwdi8/jX
         DZJ7EUbB4WuldhwMVvL+TkfCkh9YCxqBMXwhmOjU1+qcWKxhCogEPo/7K2tdyHG1ZHXf
         j5Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759769011; x=1760373811;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TxwnlAP3n5M7cyJiouK6nx2qCN8Hw+Sbnl76f2YXigk=;
        b=ouELC+LqF6mq9CYYL5F9yOHSjoJfTa4n/Z5KLaw9yeruWBMAgAJAETll7TiQtxPGFj
         Risa3a8ek+YRYIvs4mnk5Fjxda9hI5XJ1IzhyvsNVPCDdd437CJP6s+5fd0s1yS5RNTx
         Oop0Kjx1V8t2chTQkMj0nnQGhp3nNw8wU05zoecV8pqcz2EifR2ILpY5y/fhWy08nxWG
         7I0W0eLmnaiqg1UBgQ/ClDRB7R9/wSiTQXqb6ae9uz7vrNrWmneEhH8sBorb8IhIFDTY
         KXsefeR2u3z5tCWZLGfH3751dlPaazUF9w3SVRqFvY7hc/zD2Cq6/lkrDKOg5I2gkBp8
         bP3g==
X-Forwarded-Encrypted: i=1; AJvYcCXDOYhW5ULEZdlHZNwBVw2MWEQiOQxheChPsp+FQVzdKpkx/auCdVtiE5/HegzNalbPFz9KA0/c2+KknNTRKEFxYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZEy/vB1wFcM5ukkaproeDP569FP5qZHDuvAF2BQmHi8squ04a
	HyfubZipP3MHx724C+kSVbEOPPayWKFXbw280N6Mr5aEjpVStL97ALDhRRYLNf0nH2Q=
X-Gm-Gg: ASbGncubUm+PL1OqOIT43DSWi5zPiimNmiZX6Ag4Wyd4RMJABDnVrfGu56pNtYn9ePX
	XGNzffhaYgDwECOp/BwVutsR8aDi4RldZcVPxEfWtuzwScNrMT2PpYgQuhg1ck5WNVXKvaS5M/H
	1/2bZhfKBYyOF5mJIKnqWYuaGRxuQu7sdb2FjMm8Peah6ndBLP45sQXlwykToWyXtebukgNK5PO
	GvnhsortvnNWwk0GBBgozdd6HAxo8k0aqhGdYl/u6BKwr5K/BSyTY6DVKSERRO1PKkacpahmKTN
	+bsGJda0pvyV5Sf5qEPJcs3OZocnnBopZeDRUFbwwrwWrC2/rkqfv37eGAkXtNJI2P3GRYFZdW+
	GJSmf67Kt9kLsG2AL255Db3bRuzAyzFAelZBmY+84RdRfIDud9TKmTKmo5acnE402MezssQHekC
	fAnxbUEdFa1SLtUUY8HUZSj6FGlkng4bLwccIKj4nC
X-Google-Smtp-Source: AGHT+IE6Qi3Ngqwo98RrZzSI9Sk/ybN3uGg/1PQQF+EI33WkQU1ToLbh1rIvJ4g1vAv9PRSJV5XHUQ==
X-Received: by 2002:a17:906:c108:b0:b45:66f6:6a17 with SMTP id a640c23a62f3a-b49c429cf5emr1502411466b.45.1759769011299;
        Mon, 06 Oct 2025 09:43:31 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b48652aa01esm1193841866b.2.2025.10.06.09.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 09:43:30 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 06 Oct 2025 17:43:32 +0100
Subject: [PATCH 06/10] pmdomain: samsung: don't hardcode offset for
 registers to 0 and 4
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251006-gs101-pd-v1-6-f0cb0c01ea7b@linaro.org>
References: <20251006-gs101-pd-v1-0-f0cb0c01ea7b@linaro.org>
In-Reply-To: <20251006-gs101-pd-v1-0-f0cb0c01ea7b@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

On platforms such as Google gs101, direct mmio register access to the
PMU registers doesn't necessarily work and access must happen via a
(syscon) regmap created by the PMU driver instead.

When such a regmap is used it will cover the complete PMU memory region
rather than individual power domains. This means the register offsets
for the configuration and status registers will have to take the power
domain offsets into account, rather than unconditionally hardcoding 0
and 4 respectively.

Update the code to allow that.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/pmdomain/samsung/exynos-pm-domains.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdomain/samsung/exynos-pm-domains.c
index 431548ad9a7e40c0a77ac6672081b600c90ddd4e..638d286b57f716140b2401092415644a6805870e 100644
--- a/drivers/pmdomain/samsung/exynos-pm-domains.c
+++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
@@ -29,6 +29,8 @@ struct exynos_pm_domain {
 	struct regmap *regmap;
 	struct generic_pm_domain pd;
 	u32 local_pwr_cfg;
+	u32 configuration_reg;
+	u32 status_reg;
 };
 
 static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
@@ -41,11 +43,11 @@ static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
 	pd = container_of(domain, struct exynos_pm_domain, pd);
 
 	pwr = power_on ? pd->local_pwr_cfg : 0;
-	err = regmap_write(pd->regmap, 0, pwr);
+	err = regmap_write(pd->regmap, pd->configuration_reg, pwr);
 	if (err)
 		return err;
 
-	err = regmap_read_poll_timeout(pd->regmap, 0x4, val,
+	err = regmap_read_poll_timeout(pd->regmap, pd->status_reg, val,
 				       (val & pd->local_pwr_cfg) == pwr,
 				       100, 1 * USEC_PER_MSEC);
 	if (err)
@@ -146,8 +148,10 @@ static int exynos_pd_probe(struct platform_device *pdev)
 	pd->pd.power_off = exynos_pd_power_off;
 	pd->pd.power_on = exynos_pd_power_on;
 	pd->local_pwr_cfg = pm_domain_cfg->local_pwr_cfg;
+	pd->configuration_reg += 0;
+	pd->status_reg += 4;
 
-	ret = regmap_read(pd->regmap, 0x4, &val);
+	ret = regmap_read(pd->regmap, pd->status_reg, &val);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to read status");
 

-- 
2.51.0.618.g983fd99d29-goog

