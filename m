Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6D9369960
	for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Oct 2025 15:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760630335; cv=none; b=GLm0TVwBNkJXrLp2E5B1K54zBqzdzx3HIt/NLsL7a/mVumstOHx4McmqDjo6fggLmDpOX2NRV/B1wnF8GSlRA/v2XSfJn+TmhfX0+R45kzTjzCujbqnv8y4pIwMA5MQ5kW4n2NSEaadG0TqvzvVAa6cf30XZTTO0PtAsgBhoW0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760630335; c=relaxed/simple;
	bh=Fd87VBZVE3t1XdL1M5TOtbrUL4Nhx964dcSf7oJuDP4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SPdoG6trv00yljpCVtH4fjEOQDVaZW8+yRBOtTAsWEYLJkTaBwossIi3ADiXKWW9MJHzAp3thWHB0tIJ/VRU4lys7UMbn2UaDILJLZzz8lQt41Fi0QvYS/CKAJwnKR4TTA6Z2+MlBwGbIovMS4+1iqoG1x5kI+cDbf+G7LptUpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QcyYNosJ; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QcyYNosJ"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b3d196b7eeeso161329766b.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Oct 2025 08:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760630331; x=1761235131; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9AiSVlBoay/rNWhpOjfQNUl48vUimN757HYzsRqcO8g=;
        b=QcyYNosJ2XqJqTociiw/mwfLg3izOLLGeYVG5xfxTFZsjIrc7oItjvyEjW2bz9SCLT
         vvCeXLm30mz3F2qeJCQKfX9Yldbh/7Z0s6R8zFYSuDiJ6UYOerReojxBMomzwOsEZQss
         xgXmscTsca9BihgTFoEFXWBkIhhp+bmf1/G4DTGw9YyNLn5sV3P4v7oQ8Q/so+FoVmpo
         j1lJHQDh4XP0QYYd+Ye9oNUSNBMe/7liAnv/NavKuVdUuIUynaH9RTgNZ0ENSmWs4eFv
         ThtT3j80SMqFOyAoGKjKSZDTdcdX+shXwjh8mRgQ5nxWORBwH5qepcprVDqO8LEFB1n4
         3wiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760630331; x=1761235131;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9AiSVlBoay/rNWhpOjfQNUl48vUimN757HYzsRqcO8g=;
        b=wYg0OSRkk6K7xBRTSo2ldB60qMVDMqw+Qq/xMex3PjdmQoK1gPQs0PA3EmH7edmPbr
         CP5d8nqxhcja4SLX96hqhjUgyE//0PmpTM0IoMu4PZ1PSxyEGKNB6A26eTPOQPxq9RlB
         WD5BI/GMLDLLUfLiKV9HZlpZKRN7y468GoagG8LG4XgwcTCpF1Qm/Z7YMUtsRBhKBH+m
         5/g24YFDzZDUcDCNBEA0NWZ9DBqEEAx17/WwQGBLbY1zIeL2Z/nfgfyKuMG1MOnL+BFe
         TAl1u0hynidHsFoTpJOlRB9dtT9wye/L/SCvsYbEnQThLDMQCarwPzygcxiBK8IWX7iL
         YkwA==
X-Forwarded-Encrypted: i=1; AJvYcCX3EXzzqw+aaN8H6T/kI9jhWCJALTOphfWERK16rQbD6hOU1Q+kP+/c7lizX6CJ+8I25C/mbYSY3UhT0Ozov2XpwA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyE8lMmwx1XSLIE6RzXdaCkIKQI5SFA/5lIX1+frczoiVk13Y/r
	JcgiMLbtDTpTQF/p9ighhijbf83YkQjLPEzMkkmM+eW8TjvJugnD87z64/gTtSESAVg=
X-Gm-Gg: ASbGncsf117YKKnuOSj+g/dJpz0hVpXcg11Fz261peOuw7XaCpqZtiDa3Etn8MduXQX
	e3N8D8er2i5TFUiFMPZM1Fcu+IclIYJZy5NzoylE8aheQcL18ZY29OqK9OUI2IjPs06bKdIAWnr
	6wXvF9jUA3Row2nrilT7Q6aUDnNvOT7MY5rNiEbmql9IGbW8ecgCfmkt7QrcReQ2IE+uELEMKxV
	2ESAiCEwKoiUJMQyR8jmZqzDhzX+EC/vpuYBNhRFBeDv8tka5+yEiFz/zSujn/uuPMdQAVyWcoq
	zjItLvAg3TSJcwuL9pqR/561WF3ttfRZacLMR7C023x39zbMHySv6c11QdMyAisgmoYKgzcvtX/
	duyOZud1cC2+hcpzbyJyrFW/wT3zeLJxCAQ4CIWZ3fp+0utbnPzmq3VX+Qxmf39OFInn4DwC3JV
	CNGZEm6fQ2cnKnsaZSbj0XVa1jw19WaKlJYIXgIPeBqjTyh8Td8jH8gWS5EBTS
X-Google-Smtp-Source: AGHT+IGPO+2Zewf0zB4l3rydvFCKk2iYa8qO/BfCMfzqYngcvlnWd8aJbjMUPzhsP0bqvo/AOWVLUg==
X-Received: by 2002:a17:907:728d:b0:b3f:f6d:1daa with SMTP id a640c23a62f3a-b647443cf06mr45875966b.37.1760630330042;
        Thu, 16 Oct 2025 08:58:50 -0700 (PDT)
Received: from puffmais2.c.googlers.com (254.48.34.34.bc.googleusercontent.com. [34.34.48.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5ccccb4811sm549021666b.56.2025.10.16.08.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 08:58:49 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 16 Oct 2025 16:58:40 +0100
Subject: [PATCH v3 07/10] pmdomain: samsung: don't hardcode offset for
 registers to 0 and 4
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251016-gs101-pd-v3-7-7b30797396e7@linaro.org>
References: <20251016-gs101-pd-v3-0-7b30797396e7@linaro.org>
In-Reply-To: <20251016-gs101-pd-v3-0-7b30797396e7@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
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
2.51.0.788.g6d19910ace-goog

