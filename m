Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15CC42DC762
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Mar 2026 06:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772691123; cv=none; b=GoVuJ9+nmWHL4/3yMLFd6DhfURzIJfnhHjkqH7LerLyAPtSZXIHCaGNtd6RvzKnrWxLmrKA5DIdJftuq+K0w1n2hScb4eQfVlNcVE0/qITyk3r9gJADM3OYKvnlqsBk7tKQ/R85W5N3bgjkOmphHH3gI0wBJgi3TXbK1pRpWrPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772691123; c=relaxed/simple;
	bh=k+2eK86lvnhd0G39XcYd0Wo9v7NwbPnA00WtqszUSr0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EG1aVxQ0ck5xJbG9lxvWn0yaon3aAnfhoN/Wf2dPrXoJB/yrhjm92XYfwyIfmDCyIqi416KdWvpt5rFvNUNjaAg9p6Za8gtugrGuQNIwAg3JlSHKgCHne3Z90BKT8SyXha7DrK117pU8ysaWGCD1eC0ZrtBcGm3kYUnKUCAfucs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u4k2GzsZ; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u4k2GzsZ"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b940f962a82so34334966b.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 Mar 2026 22:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772691120; x=1773295920; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GJyveOpQYRN0Rj97xYSp2eMNn5Hi3Nxu7cTlokaFCRE=;
        b=u4k2GzsZuF9Bb9VgAvJB8IHq3AE+Kkvz9CufyLHj2pn6GljqJsfBwxfXil4+sfeCtk
         7xXCTBpAXwA0j8PYuxJvv8+w6IRzqh6RjHZvscpl9DbCJJaUNArLrCvsmpft43NgvxEo
         BNGzKN1hPMBHbad4cQG6WRc33Oko41paYqVZTN6YPl4oJfks1qVPXR5KVZQNYXgzPKQi
         M7AbjJ/BzXeewOTonn/R07cXKKbzj+vdvic6O6EPo+AucEShWTHp3OT0i3bpRevrxY8s
         /cggWdrWXFPTS2Plm6Gd4R4cG3z91Q9P9CQpR7EY43DodDkm6ioYqsTe8Voqy7aDaR7d
         xlSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772691120; x=1773295920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GJyveOpQYRN0Rj97xYSp2eMNn5Hi3Nxu7cTlokaFCRE=;
        b=J0gFbrXox+EpSG7UdYPcTku9MXRNyyNd5ZjxjPlhYup3Bh52SKvrbZBUfEMvOicPcJ
         gs83d2P63n70S94386qTIA0l9LzQlWF94WzPdJsTmpnfA8TmqqIG1E2kUw0VvIuFbSfZ
         SsQA5nmo6sLYJNkSLwP7H55xsGGtgQ5LtlawIkcyMyc6Dho7auECJ2JYXuL+0aTiTkU3
         25uGrfocNdlPjEnJLp52yatksBXJ/JVZWBKkf9oQtRQaI6sniLi17p4ACqAcqrVNeX6o
         gYjFuehktOGSo6qulLWXhoV+zFRBJBULl40R5HElVIe++P+OoZ0edI3tOa6kEYLj1KSL
         3fPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUI77vSKcLRDiwStjnkiElaH7zhZ5bfyO+1kHvon37jJN5pLKchm7FIxplFEZAKiPpaaeAJeJqgd6QgX/RaFCWBAw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXWjfaHWTfjGI92RiOr90EI0LFqGLQrDm3HKZJ29fzGp/nNSYs
	ePTO9/PQLFXWPTcYYprFJbQP484LichkzWBxqJLdswWB5ZJHFDPPMvfTUFjuQHVk5cA=
X-Gm-Gg: ATEYQzyepyaaq33zfgOWNrGHmeyWdt7OSU65ILjp5TslDxIxxLDZALkxrTC0WnutX73
	nUED9Mk3lHc/PIsD3AlR0k/fXdDG3ThZuGDVKyGMCaq0qtaceyz3zPvhRZRaWEWvC2WgPSMva+f
	W/qYx1lD5qrKf0bJOKnVUcFxQJDDuo4IHe1qZvbGnABlJeJzYaLi6IPK3fGKlou2zvQqn1Wckbd
	d3x24uKnPDlxDZ3ILB9LIVgtOnjqnrdk9UUcGZ1OOMkCO3GqmTdfYvpyiX6AvPIVRFKjoRYfP1w
	bz8U8TEgvNnrUoUc0UrvxIBrXRsdcMyZh/xJV3DUgRcvu5aAdRACw8sEIJr2F0CD1SPNjPVxgV7
	VrZC2p0bk9Bjyp+dxqEHbe34qFjwmJHW1nJOlRJYd0ubJQP8pszl3dDTnSK2ZSpDgbIc5Cxpagd
	dZMoC/PQGuQvgdJfV4O+eR1Yz5jqKZpX0/tMINM90uPIMnl7lA6k/VTvcSUOustjN6DYXJ0SN9Q
	Ree1T3FkrC70rU=
X-Received: by 2002:a17:906:209a:b0:b94:102d:243a with SMTP id a640c23a62f3a-b94102d2a92mr24981766b.37.1772691120288;
        Wed, 04 Mar 2026 22:12:00 -0800 (PST)
Received: from puffmais2.c.googlers.com (221.210.91.34.bc.googleusercontent.com. [34.91.210.221])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935aec3243sm849355966b.53.2026.03.04.22.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 22:11:59 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 05 Mar 2026 06:11:57 +0000
Subject: [PATCH v6 08/10] pmdomain: samsung: use dev_err() instead of
 pr_err()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260305-gs101-pd-v6-8-8cb953c1a723@linaro.org>
References: <20260305-gs101-pd-v6-0-8cb953c1a723@linaro.org>
In-Reply-To: <20260305-gs101-pd-v6-0-8cb953c1a723@linaro.org>
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
X-Mailer: b4 0.14.3

dev_err() gives us more consistent error messages, which include the
device. Switch to using dev_err().

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/pmdomain/samsung/exynos-pm-domains.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdomain/samsung/exynos-pm-domains.c
index 2214d9f32d59..41a232b3cdaf 100644
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
2.53.0.473.g4a7958ca14-goog

