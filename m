Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F5E33345A
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Feb 2026 21:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770327760; cv=none; b=YfzCq8yOJ0PvthnkcvDrxWz2ryUCYwluIBJaTMiPq0oRqQn7soYYp5pg49yyG1oo7Gh8Jj/89iCR/8yRWKuD/n5h48I5xQCdZFo7acfEYh10GsTMGwMZPHfQP/fdMzyAwQK6lH6EPOwNYcZ0CUyinTrrr8DVx3kRrT97FE5vwG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770327760; c=relaxed/simple;
	bh=muoGqgWKhShCKcOO5yeZFs5XpYyP2mmge6a1cWmwLxc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y50pg4CbCSarg4NBcaJM4Afy+YviWec3woZ0bTOl08SDGodNCLJrRHx69osTFhyTRk9S8+shu0BeK5BEoTewNjIpy4kUGzB2pXHS+alRedTQXOYJ4W1nCkD0RxRpe+VOWkI/BXRtEWWXBiDuYhq2z/4+2EWEDR5edFX+kP4zWvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TvQ1U+Qj; arc=none smtp.client-ip=209.85.208.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TvQ1U+Qj"
Received: by mail-ed1-f66.google.com with SMTP id 4fb4d7f45d1cf-6505d141d02so2283156a12.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Feb 2026 13:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770327758; x=1770932558; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vUyvGkotnpd5Ix+9v7DeK25pCFRQ7XmZ5wApdtSkIE8=;
        b=TvQ1U+QjAlcmX3o/2cyrj3Eyg4kgj2VpSMmsayfEzYYUgEvegStnJzYP57PEHEtTrn
         QlKAFkDrJP/Ldh4N6AzYxdfVMVqpBAchspxn6fPaAlmr0PQEAwSD15HhbVGSQkAYhpN5
         wdgSOkjhA2Gxj/Y3OSZkNRwuO8w6NNsVKI3oY9YaVErgbnDQ3cfSYeiwV6I9s373deRK
         +H/CMLWiZzxCTLTMWMTqQjepgaODFdyr1UDXCdDNf/YVSr3M1WnWSt3XQg0txq4JWd9z
         3Py7Au+wil6WGy+c/s2JdpzykUzT/4fJrjT+e3ewt1RDnVIofP32MKpwTGtJPc5FvWiP
         qq2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770327758; x=1770932558;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vUyvGkotnpd5Ix+9v7DeK25pCFRQ7XmZ5wApdtSkIE8=;
        b=FQnPAundvzFxjyezh38S8Zff3N4GjNmH+6U9BS4TFfytM0D4M/lg+rTvyAdmwTruyD
         r0fUMQOrcaIHKU7iVnz2Ra18aEkcCckIol8XnWSZuEo4d3xSx0xml4QUSfm4zrLaz2Ye
         NuFxf/+irDMSxOcvBxXm8NwJC8jq0THOKK6Qfno788SJxD/32LTuJbKyE5zdFtPBAitA
         PLBwUAYZfgbpmmjhki3jDxVsTm2V85NzH6MvXttgQFERyhVhJc1ol4mpy0XrUj916l7I
         jZDH6qH7cxL2z90ptAMh4drQCFSvC++YYiAfcD6gVW/lJpQYd5s3k1XTTNI1SkBqIDTg
         RJew==
X-Forwarded-Encrypted: i=1; AJvYcCW0DloJSOY3gF8K5FUD+aSQZQ5I4gEImIwnjbKXFFcjS9tfTQxFoGtWy0H7jYUqxHaSVqnzwpAWe5AWEJ2KM39irw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ3K3KmB756tUfsamjtAlCy109qjs+9uo6iA3iF8BNNmv2ZljZ
	tAnLJA11tP3CShZspJyFpzqGuj+dXBIxOAM5IDozF5IayP0qf52j5Ndly32Aer7uYBU=
X-Gm-Gg: AZuq6aJBfqyol4f5774IREllIuzLoBmllGk8zQPS7aa6KTFuTtvh53lXJgr5WUIST6N
	93Vn6a5/ME8xbd+jOZcTREzXmUq483K9TL0oJ8IAUvKJz0nhLSShetsAVzM8hlxKpz6doCHFBCY
	EY+SRUKLe/Y1gxZETSTCTLzRX0K0+azbxsNRuwurynkz27kxZNTz3vraMDoqrOoMMKgLOerh0qV
	L9bI5ES4tmYWIQYKvUGX+urTRn5vHtegXRdvTlz+X8MPXxy06BI/eoh5ZHuNUOKzMyB0UN8Jr1y
	KIkBNbbntcfOHtnSJlNAemqo8w0KlH48P+x0yen5ZbpyfQGE/xptoPEt99++rRL8XQBvhF2Isqm
	1SGUtoM6lSvv10xRrkaI/BZF1TUoaMaLUe6LPvs5EyBJEvASMiRmZqHa/gf4r5zf9jexEwQuTl7
	z9JxsemvsxYMdnl1fGXEfxDjr00WH9iyUsyftRrAmDfc57MNU5mmZijx89e5ubizO0W8Ib4ohLH
	75Aww==
X-Received: by 2002:a17:906:f590:b0:b8d:c595:828 with SMTP id a640c23a62f3a-b8edf1c91fbmr25990966b.14.1770327757986;
        Thu, 05 Feb 2026 13:42:37 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8eda7a0074sm21859966b.18.2026.02.05.13.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 13:42:36 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 05 Feb 2026 21:42:36 +0000
Subject: [PATCH v5 08/10] pmdomain: samsung: use dev_err() instead of
 pr_err()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260205-gs101-pd-v5-8-ede49cdb57a6@linaro.org>
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
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2

dev_err() gives us more consistent error messages, which include the
device. Switch to using dev_err().

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/pmdomain/samsung/exynos-pm-domains.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdomain/samsung/exynos-pm-domains.c
index 2214d9f32d5967b60e84f68f4e99a725d66a39eb..41a232b3cdaf0f4be413b25d9373b99c6a3db602 100644
--- a/drivers/pmdomain/samsung/exynos-pm-domains.c
+++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
@@ -30,6 +30,7 @@ struct exynos_pm_domain_config {
  */
 struct exynos_pm_domain {
 	struct regmap *regmap;
+	struct device *dev;
 	struct generic_pm_domain pd;
 	u32 local_pwr_cfg;
 	u32 configuration_reg;
@@ -47,8 +48,9 @@ static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
 	pwr = power_on ? pd->local_pwr_cfg : 0;
 	err = regmap_write(pd->regmap, pd->configuration_reg, pwr);
 	if (err) {
-		pr_err("Regmap write for power domain %s %sable failed: %d\n",
-		       domain->name, power_on ? "en" : "dis", err);
+		dev_err(pd->dev,
+			"Regmap write for power domain %s %sable failed: %d\n",
+			domain->name, power_on ? "en" : "dis", err);
 		return err;
 	}
 
@@ -71,8 +73,8 @@ static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
 		/* Only return timeout if no other error also occurred. */
 		err = -ETIMEDOUT;
 	if (err)
-		pr_err("Power domain %s %sable failed: %d\n", domain->name,
-		       power_on ? "en" : "dis", err);
+		dev_err(pd->dev, "Power domain %s %sable failed: %d\n",
+			domain->name, power_on ? "en" : "dis", err);
 
 	return err;
 }
@@ -140,6 +142,8 @@ static int exynos_pd_probe(struct platform_device *pdev)
 	if (!pd)
 		return -ENOMEM;
 
+	pd->dev = dev;
+
 	pd->pd.name = exynos_get_domain_name(dev, np);
 	if (!pd->pd.name)
 		return -ENOMEM;

-- 
2.53.0.rc2.204.g2597b5adb4-goog

