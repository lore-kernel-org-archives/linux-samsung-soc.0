Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4E82DEA61
	for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Oct 2025 16:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759769016; cv=none; b=kYQzFaVNXEwu0RynHO0eEtTl4EOgNYIF0dv512ykZM/nedHRBhNyLXFIkXVHOBMVTh7DBwc9lzGDx04B/fu6OjQqTPbo94DZhWv8XzKy5htppIj4W/6hLs+m3fwLu9jQblXK2ai4fcuy2sOEH/7waHB6TzIJZag7wu4FZk6k/zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759769016; c=relaxed/simple;
	bh=F1uL+g8fHIdluDJ17bb7cBAahVnwEqXe7c0YoRzXMUc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lfw4cMp6SbGXWXONaIsOPnlvey6cMOnaB+5OHJdHfViFAdjehtXRnCBpxlUJLRnNzrvkWLm1uK0IpEy9OMhRnPDNQuo/3ivfGDxAsud1CPH16KZNQMiHOiIx+KaxdspTcpqJTxG2RmNoQaDFdcAYDeQlC8IfIpiAiFRmatK3Mik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LmDDOGB7; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LmDDOGB7"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b463f986f80so743214666b.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Oct 2025 09:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759769011; x=1760373811; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6WkKVU8kwH4FiIJkp0DFrv47tH1tikibDwgyehQFExE=;
        b=LmDDOGB7GKg+D5zNzk161J9w9e0PqNDyaEI9HNsDaljwYGSIu6cV4nHwu98Ln2/Z3w
         XG4+PxnxnexQ77blutt7xbk22BBL0I/8Z1CuUVfPODz8W8UF1VLd3sIZWNN4AAERbwFL
         qbozblaHYi/bVMEOz+rSlHolH/zKLgCsczCHpTDU6amCHbFw1UUeaZ8QPxPCrpw6zuAy
         xdTqIdQJJtsubFhcFt6cV4PwNn+RUdJyNqGUYUL2iPdLXEC8wPYQK50cKd2ctxtgwzXn
         IaEYNq2Oz8j06aKQDmRL81I3ia17NUgOhPQLcORYjj/9c3/8P7Au5X7wPGsHpvM9vMtC
         ldNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759769011; x=1760373811;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6WkKVU8kwH4FiIJkp0DFrv47tH1tikibDwgyehQFExE=;
        b=qKjbwAoFwj/DYvSWr83P2s/6ZZIWyfYA2mbEpZbjkTEp0PSoDfXZI2R0wZ71vunyQ6
         A7V/3WrJnHin+ioOWNZRVyGib4Ogi++ClCounYgwhc8gq02xsbH/FTk8VCG4CuPHtXj8
         Ih1WOHhRREyq25VOY6zKwcBn6FWfotCNcelhpo17Ny9g7YFz2bHW/YWhdQL9MerG4mbS
         SI2whU8N4rvVfe3P1ffClrUf+AwZuxvAbWNMAXIJdRG+IuUftvMYQ8N+kLbuwnnhH/Ze
         yP1wnw/8cUDhXpzQsIrPHiD0bQYOi9kWG5jjvzBpdseubtAAY2vPcz7+whYkPHuTVPt/
         U++g==
X-Forwarded-Encrypted: i=1; AJvYcCXxC7yr5aAs9jMnmqJmF9u5TFOS+aj1u4AQundiH2I/GEPDYwg5Ti+eqQnV7LJ/0FRY9EFH8u1fcs2WErz27kbVng==@vger.kernel.org
X-Gm-Message-State: AOJu0YyX/ehQaZ+cEPrxezCzHyTnuSoWEUYtPIVz1UYACQMuyCXLq8TS
	0FMLmgY33lcidyeI7gcnxctbOBYZBxdOgzp8vmMsJibkgJ+aCfuhiwoX0cmyOAMeC9I=
X-Gm-Gg: ASbGncsu4OAyVB71LnZF7h9rwEtJzUKyW+4oy2gd2a6KvjS58eiAQvQibol9EcWWNNq
	nazxyHnjuRv3MxerzEuvs9u6o40GbdMFuC1r/dTR1bXy/Ez0qW+kCr56jZ0LlbmAukChLBsh054
	b2ZAmm8IOW68rQiO+dpyPVtymMZVJZF1xJiBacRPYvlz37hKIGeD5vfomFDzOJAvsKA8mvD7KZi
	4kdFagkLLax7m6JrhBQgxeBRPOlXi7PaezLGSOzSbyOkPBhJ8mZRT3+n9Ww1W8dP7qU++gjV1zq
	LxWvLpXF3v1FhBVRZv4nfhQKKpz+e+X9iPH6b7EfmLGnJza3mvY90cpoY//2I1FTFOSuIDa190N
	PzuQCX5F1VcczJjg+e83zGE0fVsc8Fat7bvhHu+YLl43xj6apskP3DDhacl8vXhoJXV7bHnL7hl
	gqd4YtLvA1+hEyWKopStu9NdjsDSbuVeTT40SYH/Lk+1XhMoKxXE8=
X-Google-Smtp-Source: AGHT+IEG8W4Fgu15EAWixutgpzICMiJaZUNK8COlNrHcpfllaPfZ5W35myiVDFya7fewpU3c0gC6vw==
X-Received: by 2002:a17:907:2da6:b0:b2b:59b5:ae38 with SMTP id a640c23a62f3a-b49c2761ad2mr1799899866b.40.1759769010845;
        Mon, 06 Oct 2025 09:43:30 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b48652aa01esm1193841866b.2.2025.10.06.09.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 09:43:30 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 06 Oct 2025 17:43:31 +0100
Subject: [PATCH 05/10] pmdomain: samsung: convert to
 regmap_read_poll_timeout()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251006-gs101-pd-v1-5-f0cb0c01ea7b@linaro.org>
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

Replace the open-coded PD status polling with
regmap_read_poll_timeout(). This change simplifies the code without
altering functionality.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/pmdomain/samsung/exynos-pm-domains.c | 29 ++++++++--------------------
 1 file changed, 8 insertions(+), 21 deletions(-)

diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdomain/samsung/exynos-pm-domains.c
index 383126245811cb8e4dbae3b99ced3f06d3093f35..431548ad9a7e40c0a77ac6672081b600c90ddd4e 100644
--- a/drivers/pmdomain/samsung/exynos-pm-domains.c
+++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
@@ -13,7 +13,6 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/pm_domain.h>
-#include <linux/delay.h>
 #include <linux/of.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
@@ -35,7 +34,8 @@ struct exynos_pm_domain {
 static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
 {
 	struct exynos_pm_domain *pd;
-	u32 timeout, pwr;
+	unsigned int val;
+	u32 pwr;
 	int err;
 
 	pd = container_of(domain, struct exynos_pm_domain, pd);
@@ -45,25 +45,12 @@ static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
 	if (err)
 		return err;
 
-	/* Wait max 1ms */
-	timeout = 10;
-	while (timeout-- > 0) {
-		unsigned int val;
-
-		err = regmap_read(pd->regmap, 0x4, &val);
-		if (err || ((val & pd->local_pwr_cfg) != pwr)) {
-			cpu_relax();
-			usleep_range(80, 100);
-			continue;
-		}
-
-		return 0;
-	}
-
-	if (!err)
-		err = -ETIMEDOUT;
-	pr_err("Power domain %s %sable failed: %d\n", domain->name,
-	       power_on ? "en" : "dis", err);
+	err = regmap_read_poll_timeout(pd->regmap, 0x4, val,
+				       (val & pd->local_pwr_cfg) == pwr,
+				       100, 1 * USEC_PER_MSEC);
+	if (err)
+		pr_err("Power domain %s %sable failed: %d (%#.2x)\n",
+		       domain->name, power_on ? "en" : "dis", err, val);
 
 	return err;
 }

-- 
2.51.0.618.g983fd99d29-goog

