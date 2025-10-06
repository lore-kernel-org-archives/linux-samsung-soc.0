Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B97E2DEA62
	for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Oct 2025 16:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759769016; cv=none; b=A/eal+ffpo6T2uthEZzkLwkKRbos31Au0jUf2lmt0f9f9v/zMLyCXxartBnyZ4A+WonzY/O5wEcPJOuxkCNhiz4N3S1+ONVFinLlKZWgwiVAp+8NHGk7JRufnisrU9ZCwJkJJYgAXtAnDM6iROZ19wk7nOZP6QaT+1RfyE6XxWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759769016; c=relaxed/simple;
	bh=lQFRfvIZm2QIrTnGZIlapJJgk3a/yMVJrj+Qv49vZDg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mitrezodrP8XyXpSIHKhovMyeEbsbHVNIOCFXpmTmodH0OkTdxJOwO2bZQ6qZCWHkCqoHP+eMPIKsgMfAYWybJceuU5vQegeri6H2XVVnWJQrattSlg39ibfS/fx4TmnYGTxmUBEA804DyXx3A6JQTTAf6HbhQb/qlvyaGcptDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bDDj6WTE; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bDDj6WTE"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b3e9d633b78so707878566b.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Oct 2025 09:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759769012; x=1760373812; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I0ZdGtbeD0twmfxFXcR2wb4AL4tjk6OMYa00kx/YCo4=;
        b=bDDj6WTEUFAoTklqJxVyDFsSrH4c+YN3JvKDUER3xlvL5UmJaTyfGwZX8NDgkpsiWx
         4327LWkeZOszgVNWFiriEPxcmMp/vPygim+aDK/yxc+IJjy/2B5T068WC6CtcGZWk6Nh
         Wou9zwNO5IFbdkTMzJN47xuKCwM+RXub76teAKKn+SJrvtUud7TRqiJhcFgJaEkvSqQ7
         zKLiVl0jRoNTUuLU7N8MHhrEE0Og6VEDAVAmNY7GifQiFCVVZCMjz4VvCbxqNGwKtj/i
         l2RWah3LIWmC27du6gLgY5I1ttGf0SU1QUtNZg9OTxNllQyehnDER81MWs5kV4Ao5gwU
         T5rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759769012; x=1760373812;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I0ZdGtbeD0twmfxFXcR2wb4AL4tjk6OMYa00kx/YCo4=;
        b=ehbe/mAMKqdhI0cmMtb5MlQ4otgYpHQtBeaehC+OBq0Lx/mdxYmBYCK9YbWSLxn1Wg
         /XpKe7ppQcTZMfaeDO9skwNJGhTr0K0hrYU617lLHYNHfp3BPNAIcXgB5KljEeNgeSZd
         /UD6TPzC2orVjWZGvfRrO7yMci5NQ3YkLH3OW0FOIU83OZRddQQ4HNbsJ1byNBKBqy5i
         MVlfAJ31FoDH8EaECTeolLnumXHTmCxee2dWUJjKPzCZvph7fOXIZ+ARI5H+pxMhiAml
         vUzS5W0Qz5lPneHhnTTWkntLhXeHrJ7MxbjAdLCwUYQWywM06VF5WVkqUDDRn29l6arS
         A+oA==
X-Forwarded-Encrypted: i=1; AJvYcCW3hotl92DsexrZp6pP0bLQq0rg6MSjlzgO+zHNl5iBZKlZXiuOHS0Bk70c8p8eSfZjndXx3slDWm7mQHN7+C7rkw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxagktG80bMMC3UY+aKbKEU819ygYc1A8VprO/3P0tOc368sAF5
	61z1mnGgTRUo7/Yiiaf+ZCn65IIKZ2yRPWxe8+m1HWjOp8Z/KvCE/mMKI1v/DUvveT0=
X-Gm-Gg: ASbGncsnLGaLjwWY5/t89kkJ+kJqEODcyct24RInQFdrQFAbBVUa/1Ad5kwOCZUJNSW
	vKnWCLqqKSzRnQzr8Jbf3d+7Zqi9CGWn7Te44b4yo4Y4D7M+5GHixCUc2zUa1Fqu9thwR42TyMl
	PW/4oH9qXOrbZxHaE+kij+c4kYlH2QUgY6T8yFQJrH7tpbixtLRXiCGIt2syyjSf3z5hCzz5DhM
	l2DnJhuzPBuOaUj8L7VMCRJ3A65+9RmRt6nYDCJ1OFaRG9GjExxsQgZvV18vyPKMDsjrnSsSw23
	zethevWsfuiflr5ak2cQtkfazbNtfHbYc96At2pE7karkWw74giHAJdllbXxmRuFKi2Np/FRhTy
	Vxc8ytk4q+OSyTRjuYqzvoklAeJmtmKYcHgN86rxc6QJWF7m2a8p5/avm7cilwaoHE22O4W6Dyn
	Tk9R5iVG8AKVCNWuW0eHboFivu5+Vn9D2JkyuAF18IgvaYhBR1EVI=
X-Google-Smtp-Source: AGHT+IEYfOZF1TQm9DGlW5kpM0S9/tKDSRvPCFa/7dsa/gaWYvJTuZDOfU68MoruhNwe6zCqc77lsg==
X-Received: by 2002:a17:907:a710:b0:b27:edf1:f638 with SMTP id a640c23a62f3a-b4f43106a07mr28397966b.23.1759769011758;
        Mon, 06 Oct 2025 09:43:31 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b48652aa01esm1193841866b.2.2025.10.06.09.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 09:43:31 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 06 Oct 2025 17:43:33 +0100
Subject: [PATCH 07/10] pmdomain: samsung: selectively handle enforced
 sync_state
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251006-gs101-pd-v1-7-f0cb0c01ea7b@linaro.org>
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

Unconditionally calling of_genpd_sync_state() causes issues on
platforms with child domains as the parent domain will be turned off
before the child domain was even registered during boot.

This in particular is an issue for the upcoming Google gs101 support -
all operations on child domains registered after the parent domain
misbehave.

Add a flag to the probe data to be able to sync_state conditionally
only, and enable that flag on the two platforms currently supported by
this driver.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/pmdomain/samsung/exynos-pm-domains.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdomain/samsung/exynos-pm-domains.c
index 638d286b57f716140b2401092415644a6805870e..5a87802cff394945cb0202d08f2cf6bcbbcc774d 100644
--- a/drivers/pmdomain/samsung/exynos-pm-domains.c
+++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
@@ -20,6 +20,7 @@
 struct exynos_pm_domain_config {
 	/* Value for LOCAL_PWR_CFG and STATUS fields for each domain */
 	u32 local_pwr_cfg;
+	unsigned int need_early_sync_state:1;
 };
 
 /*
@@ -69,10 +70,12 @@ static int exynos_pd_power_off(struct generic_pm_domain *domain)
 
 static const struct exynos_pm_domain_config exynos4210_cfg = {
 	.local_pwr_cfg		= 0x7,
+	.need_early_sync_state	= true,
 };
 
 static const struct exynos_pm_domain_config exynos5433_cfg = {
 	.local_pwr_cfg		= 0xf,
+	.need_early_sync_state	= true,
 };
 
 static const struct of_device_id exynos_pm_domain_of_match[] = {
@@ -179,7 +182,7 @@ static int exynos_pd_probe(struct platform_device *pdev)
 	 * reset during boot. As a temporary hack to manage this, let's enforce
 	 * a sync_state.
 	 */
-	if (!ret)
+	if (pm_domain_cfg->need_early_sync_state && !ret)
 		of_genpd_sync_state(np);
 
 	pm_runtime_enable(dev);

-- 
2.51.0.618.g983fd99d29-goog

