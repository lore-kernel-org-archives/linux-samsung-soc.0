Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6AEC1AB8F0
	for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Jun 2024 11:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718882696; cv=none; b=Tc5XCsn8K4XrBlQ8wgKGxLtPGJhD1ihbchB+Uby3DKf0bf8X6YkZIkv8udTo5SCFgFZG6B0agt4uVg/6lHCkzv9aNtuIYFkQLQAPTfD1J9RxXSI6YEzm6ymZITH+N4v+TsW2o9qTlRmglSfgjYMDERYiaI9KKSU5EboH3klP/Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718882696; c=relaxed/simple;
	bh=Xq7Y5OxTOhqlbSsF4ClvHT17sw2kze9goC5POMsbHvM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tfmOYWfad3sE371kOUh94S/SG85CTNDHj9CCF8BHPfV9UDvAaMeEy5m56qNFZAHoo8in1GkX/HrXsPv9H8EfRsCV7eF/jEjgu4Zjprl66dWnUvqjQCEHaCi1MeH9BYkLRJEMFV4KBth+6sN3yd5vfu27y9GunHtKivOUnHeOPlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E5vT/r8o; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E5vT/r8o"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-421cd1e5f93so6118325e9.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Jun 2024 04:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718882692; x=1719487492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GTdnj0h4hO88f5E9a81SRTfb2IoRwa/RVBQI7iSQd1U=;
        b=E5vT/r8oLipiL+q35t4z3mjIDird5oNvwqko1UUwxd6NDfZgMUYNyGcCuMy5Yb9/lY
         TX7hAISu8Xpql0uilLrAJvJA5Acodttck+aDlniBjaSasLEjh71V38Gr4HDfVAFKpfie
         dVaUvheFCZvBlx47MWnziF+UZd9CtuK+bE8p9oP2neJez4q72IfIphD7dB+CS8TMxgwB
         pkTOhXHWgDxXE7ZC+Ify6EQo6FygGXyzlLy2hCv2nNllyGqhIYtDexhFH5LKvuEs3rOg
         uJk4AVkVSUeqdW8RJUoIslHHCF71cgGdQlii9lGn50oWU1yfwDjxumLTXIMGF11UkddP
         vHDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718882692; x=1719487492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GTdnj0h4hO88f5E9a81SRTfb2IoRwa/RVBQI7iSQd1U=;
        b=a04bitvjBRrMP/ox1KraTy3ZkkhHC4gyFaJ3FU1iruehBWUZAUym5tkeUqvyLcDQPq
         R6VFYNDxmZwIPpXE9iPez7cM1bX2rY9nC3sQpfCCPg/TmgmXLn+5Buv92MYRCUD6QbhA
         HkvBwogbf5kL7VmktSkVD9jN/x9rGph1vK7mORFJSdeeLZyOO+3/q91CrJ51r4kvV9mc
         RITio7OvdmJRXbGn/fbMxbtTQXP76XOgJXrmPSQIU+FzgRtGg2nPs8jb1ozSAHxGJ6ZW
         ysD4lFvYVqzZ8rLsBXqBuqzbWNFrt4TsygWwP4vof9P20sCkjjp9AmP3M7jGU/GEvadH
         PrnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFOdgowPPutCF2GkMbFIWTwBcRHXJzpAvamBKLnNgF4zWwR27QFgci1d9Sj8p9DxneTz183IpQ/vqqU4E/RnSbRrZI2yUB4vFQFpicYdAJepM=
X-Gm-Message-State: AOJu0YzvgQ1KDEQsVxbRTu2hnkTXKxw5b7lZUTLq4BQcWVdC+Cx4+ndP
	Fj39VrCg4UwCY8qIqA0OmkCLJ8RbBMYPrRjVTx48DhozadOhx/eUeiKs+DnsYVaqjBYWtX2iw3Z
	4
X-Google-Smtp-Source: AGHT+IG0bmj/clv7a657zIPzp9MmvrFRbSd49FscT10OF1XmC+kRwLR3I33eOqChc4j25jNWe1YVvw==
X-Received: by 2002:a5d:4687:0:b0:360:7c63:53cf with SMTP id ffacd0b85a97d-363177a1dcamr3799891f8f.19.1718882692152;
        Thu, 20 Jun 2024 04:24:52 -0700 (PDT)
Received: from gpeter-l.lan ([2a0d:3344:2e8:8510::3aa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3647bf3092csm2025371f8f.97.2024.06.20.04.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 04:24:51 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
To: lee@kernel.org,
	arnd@arndb.de,
	krzk@kernel.org,
	alim.akhtar@samsung.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	semen.protsenko@linaro.org,
	kernel-team@android.com,
	Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v2 2/2] soc: samsung: exynos-pmu: update to use of_syscon_register_regmap()
Date: Thu, 20 Jun 2024 12:24:46 +0100
Message-ID: <20240620112446.1286223-3-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.45.2.627.g7a2c4fd464-goog
In-Reply-To: <20240620112446.1286223-1-peter.griffin@linaro.org>
References: <20240620112446.1286223-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For SoCs like gs101 that need a special regmap, register this with
of_syscon_register_regmap api, so it can be returned by
syscon_regmap_lookup_by_phandle() and friends.

For SoCs that don't require a custom regmap, revert back to syscon
creating the mmio regmap rather than duplicating the logic here.

exynos_get_pmu_regmap_by_phandle() api is also updated to retrieve
the regmap via syscon. The exynos_get_pmu_regmap_by_phandle() api
is kept around until fw_devlink support for syscon property is added
for the pinctrl-samsung driver that also runs at postcore_initcall
level.

All other exynos client drivers can revert back to
syscon_regmap_lookup_by_phandle().

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes since v1:
 - pass pmu_np (not np) to syscon_node_to_regmap() (reported by William)
Link to v1: https://lore.kernel.org/linux-arm-kernel/20240614140421.3172674-3-peter.griffin@linaro.org/
---
 drivers/soc/samsung/exynos-pmu.c | 38 ++++++++++++--------------------
 1 file changed, 14 insertions(+), 24 deletions(-)

diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index fd8b6ac06656..624324f4001c 100644
--- a/drivers/soc/samsung/exynos-pmu.c
+++ b/drivers/soc/samsung/exynos-pmu.c
@@ -204,16 +204,6 @@ static const struct regmap_config regmap_smccfg = {
 	.reg_update_bits = tensor_sec_update_bits,
 };
 
-static const struct regmap_config regmap_mmiocfg = {
-	.name = "pmu_regs",
-	.reg_bits = 32,
-	.reg_stride = 4,
-	.val_bits = 32,
-	.fast_io = true,
-	.use_single_read = true,
-	.use_single_write = true,
-};
-
 static const struct exynos_pmu_data gs101_pmu_data = {
 	.pmu_secure = true
 };
@@ -290,7 +280,6 @@ EXPORT_SYMBOL_GPL(exynos_get_pmu_regmap);
 struct regmap *exynos_get_pmu_regmap_by_phandle(struct device_node *np,
 						const char *propname)
 {
-	struct exynos_pmu_context *ctx;
 	struct device_node *pmu_np;
 	struct device *dev;
 
@@ -316,9 +305,7 @@ struct regmap *exynos_get_pmu_regmap_by_phandle(struct device_node *np,
 	if (!dev)
 		return ERR_PTR(-EPROBE_DEFER);
 
-	ctx = dev_get_drvdata(dev);
-
-	return ctx->pmureg;
+	return syscon_node_to_regmap(pmu_np);
 }
 EXPORT_SYMBOL_GPL(exynos_get_pmu_regmap_by_phandle);
 
@@ -355,19 +342,22 @@ static int exynos_pmu_probe(struct platform_device *pdev)
 		regmap = devm_regmap_init(dev, NULL,
 					  (void *)(uintptr_t)res->start,
 					  &pmu_regmcfg);
+
+		if (IS_ERR(regmap))
+			return dev_err_probe(&pdev->dev, PTR_ERR(regmap),
+					     "regmap init failed\n");
+
+		ret = of_syscon_register_regmap(dev->of_node, regmap);
+		if (ret)
+			return ret;
 	} else {
-		/* All other SoCs use a MMIO regmap */
-		pmu_regmcfg = regmap_mmiocfg;
-		pmu_regmcfg.max_register = resource_size(res) -
-					   pmu_regmcfg.reg_stride;
-		regmap = devm_regmap_init_mmio(dev, pmu_base_addr,
-					       &pmu_regmcfg);
+		/* let syscon create mmio regmap */
+		regmap = syscon_node_to_regmap(dev->of_node);
+		if (IS_ERR(regmap))
+			return dev_err_probe(&pdev->dev, PTR_ERR(regmap),
+					     "syscon_node_to_regmap failed\n");
 	}
 
-	if (IS_ERR(regmap))
-		return dev_err_probe(&pdev->dev, PTR_ERR(regmap),
-				     "regmap init failed\n");
-
 	pmu_context->pmureg = regmap;
 	pmu_context->dev = dev;
 
-- 
2.45.2.627.g7a2c4fd464-goog

