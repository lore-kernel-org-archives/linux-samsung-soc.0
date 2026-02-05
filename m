Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D9C332ED1
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Feb 2026 21:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770327758; cv=none; b=GI3sAEPHqXnoME0vn4s8SKPbxZ+XtgQDan0ZVkCnguHQVq629kThwtweSn4o+4GF6/xVT2gU7XtadDqHB721jCB3tQyIbekpX8mSTLm6dVpk/ExpV5VCwCdy5d0PL76wi3pdBiENYzc6Edpb2eebs9CopLtiTLBPYDgJuuDYHpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770327758; c=relaxed/simple;
	bh=ag+OpFUI/evpy8D/9ZA2w9zHnROGSMhtoNgkmIN0fCI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XIxMAb50oOQV/1mGdIhvnqAjiNnmLeUDJV6ley0Z+kkjbyKi4vREiXXKajpCsCw7WLkH3Z2OxDFITyJz4Wpd2pmvTvje7RkGSXAlR98hZVg5ZaoetqpRJ4BYMi0YDxhdFZXnKFet90E2eda+IpfCwx+Ynu4F4BHucvoR0JM2+MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IV+uOhUZ; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IV+uOhUZ"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b8845cb580bso1881166b.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Feb 2026 13:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770327756; x=1770932556; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O8LU1GPEC/wTQLbGFIndFfoESZHedB29NJZQNfhisd4=;
        b=IV+uOhUZwrJM/ifN1UujoHo6dfCb+Eh4ON4AAOL3qMLsvVUi2C/qVuzVzwo1NDZHYm
         OL4XDK8v3BuJ8W/+DLfjQYJSWWqlCGlTBnetN+dVLAKQvt547JNklmJ5drfd1nPHFA+3
         r+hdxHk+3l1T0CqAJv6oQURfxr9yyBhu61fYO4/nWzUkbPVoTzHrPJt7shskxjFRY4Az
         3b7HnoK7fGRhL3hNGd4/80nrdq7beuU+/ntqC6kuzx1mSJWA2FPCOChzgtJOhev2+Yk5
         rhCYgAxI6wmbAkwEsJU6ghuXG7f/HyM7GV5eIqydZVG/yTc4TIcKmFrV51Sp0QhGUHk7
         AD8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770327756; x=1770932556;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O8LU1GPEC/wTQLbGFIndFfoESZHedB29NJZQNfhisd4=;
        b=gaNEX5dXt3Su0f00VbW69juKY+m4IKnW9SSyrBPGgnL0IQV/SXx3NbiG2ttY9BXB4T
         4uMb2D5DFuIfs1fF15fSCXtKrMIsbl3j/ZPRfVd+qMpBrunwL272FQiSAUxGQjifHTZu
         qnkJShzNBSzsoadsCLPB2hVojeHfFyYhfsRteafh0ofJz+N8cbYNzXADKq6TWtqfXkMM
         Gue+kqdloL3ATFHUHn7CGfjCwmdDME4V7NW5uWKxcN+jGc44DyWOSDBJnIsTi0m/Gw+9
         06p9Ujj/sZNdmhixFpnuc5gylVf6nqXTuqBznotkN93R7IGFAWSWxRNWGKsfkuyrm2R/
         ZGRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWK7RQ/Wqj5pV5QbE3R3ZkNYmq8SQkhHctm1c6leZ/KJoJfEpqXrF6u0LBZH9FA7v9RJLqS4F666NB+4+4Rkzly/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhfWP+e8uXfIOvPvWzdhsGJJTDs73gyPVfgrIb4j8q/REaruhr
	BK3b8YG1a0ZBWHzbUNm4ZHd3C7GLs92JuQaH89QqVnJaeJwnofG4FoJwvbxqVh+9+3o=
X-Gm-Gg: AZuq6aKs+plqot2GZZ4NgXdN5C6RxJNC1SNtEz0K3QRXRmfsIQBJX8iaFCjB5kDHUL5
	n5KjjupBjdD0shhUkK/pKv9hELVEbeeTlaB0B0BqlzFMvNkPyq70TWet3NLWpFQQpWjcSiRiwdc
	FCzoS5gGjnZn6xYXjA8OjOHxHdqDp/EtY6uFfWin/JX0eUQE5QGWm0fMR7hiVvm5al74uRyyyaU
	X0+s6qURZLqHTBE5kH3fk5XGUaa9Q0AVsyhUWzBwCES4X7c+XuF4JFDJBb3l2HMXc5kPppYxK3p
	bWDeAYzDRyDSlOl9WBqWSpP9imYygwqzJpwOJGSk8GNWu1d5pV2GL/NFr8cIz/GnK2aMBVw/0ui
	1tedp3XV6XRuWHogW6L/BKuNo+EdalPvKkjWff9ARkucxP9i7C9diYRN2XNvSnLSaQCfjRCkpvD
	bmGNU9qXmrNUABoIQbBnst1tPFrJ4q7pI13BcMxn5DqWt+CNBgcwE0hKo7KTZ0SStEDv0SB9JGH
	4pLaQ==
X-Received: by 2002:a17:907:2da6:b0:b87:117f:b6f9 with SMTP id a640c23a62f3a-b8edf174430mr23264966b.8.1770327756177;
        Thu, 05 Feb 2026 13:42:36 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8eda7a0074sm21859966b.18.2026.02.05.13.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 13:42:35 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 05 Feb 2026 21:42:34 +0000
Subject: [PATCH v5 06/10] pmdomain: samsung: don't hard-code offset for
 registers to 0 and 4
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260205-gs101-pd-v5-6-ede49cdb57a6@linaro.org>
References: <20260205-gs101-pd-v5-0-ede49cdb57a6@linaro.org>
In-Reply-To: <20260205-gs101-pd-v5-0-ede49cdb57a6@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
X-Mailer: b4 0.14.2

On platforms such as Google gs101, direct mmio register access to the
PMU registers doesn't necessarily work and access must happen via a
regmap created by the PMU driver instead.

When such a regmap is used it will cover the complete PMU memory region
rather than individual power domains. This means the register offsets
for the configuration and status registers will have to take the power
domain offsets into account, rather than unconditionally hard-coding 0
and 4 respectively.

Update the code to allow that.

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/pmdomain/samsung/exynos-pm-domains.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdomain/samsung/exynos-pm-domains.c
index 3bcba7d38ac1572ef4bc2f4052c904dd6c4a7bfd..8df46b41f9bc8f0b2a03300169a4b52457faaf4d 100644
--- a/drivers/pmdomain/samsung/exynos-pm-domains.c
+++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
@@ -30,6 +30,8 @@ struct exynos_pm_domain {
 	struct regmap *regmap;
 	struct generic_pm_domain pd;
 	u32 local_pwr_cfg;
+	u32 configuration_reg;
+	u32 status_reg;
 };
 
 static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
@@ -41,7 +43,7 @@ static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
 	pd = container_of(domain, struct exynos_pm_domain, pd);
 
 	pwr = power_on ? pd->local_pwr_cfg : 0;
-	err = regmap_write(pd->regmap, 0, pwr);
+	err = regmap_write(pd->regmap, pd->configuration_reg, pwr);
 	if (err) {
 		pr_err("Regmap write for power domain %s %sable failed: %d\n",
 		       domain->name, power_on ? "en" : "dis", err);
@@ -53,7 +55,7 @@ static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
 	while (timeout-- > 0) {
 		unsigned int val;
 
-		err = regmap_read(pd->regmap, 0x4, &val);
+		err = regmap_read(pd->regmap, pd->status_reg, &val);
 		if (err || ((val & pd->local_pwr_cfg) != pwr)) {
 			cpu_relax();
 			usleep_range(80, 100);
@@ -164,6 +166,8 @@ static int exynos_pd_probe(struct platform_device *pdev)
 	pd->pd.power_off = exynos_pd_power_off;
 	pd->pd.power_on = exynos_pd_power_on;
 	pd->local_pwr_cfg = pm_domain_cfg->local_pwr_cfg;
+	pd->configuration_reg += 0;
+	pd->status_reg += 4;
 
 	/*
 	 * Some Samsung platforms with bootloaders turning on the splash-screen
@@ -174,7 +178,7 @@ static int exynos_pd_probe(struct platform_device *pdev)
 	    of_device_is_compatible(np, "samsung,exynos4210-pd"))
 		exynos_pd_power_off(&pd->pd);
 
-	ret = regmap_read(pd->regmap, 0x4, &val);
+	ret = regmap_read(pd->regmap, pd->status_reg, &val);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to read status");
 

-- 
2.53.0.rc2.204.g2597b5adb4-goog

