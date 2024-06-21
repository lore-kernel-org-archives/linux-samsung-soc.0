Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE7B173356
	for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Jun 2024 11:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718970954; cv=none; b=axyGcwga07hzHj4dtR1zHHAbwSFaUMPW/w+X8+nVBr3gUQpLYzsCmkF9JPnkOQgv9/LmMTKJLF6IzvwntuDp6afPonNoKCZ7g40jl9rDgwEwSZNeUyv2LsbWAD9ZcJKengp0twe6lxFtRyT/0UAIKvCWoQtH/nI/HQP5eBjBe0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718970954; c=relaxed/simple;
	bh=vKPWK8/0GsBKUW/GP+s7u4nJI5WtPNaGSvLrCRfAjSY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Su33GHSY/2ui/wWZLIc9KPF8uK8oz1gIWoTCDZfg47KHXG2TK42jgNK82hDtOCqPSmRZVkldh+5bCwK7Kz9V1JTELYkVNTP9xKP4XCNG3dLMz0mLJyGvOCLz+dr4quTj02JP/5WXckpVrDhFoR4oc4LO0FHitkaoPxxn2gQrkA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V01Hk8jn; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V01Hk8jn"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52caebc6137so1992936e87.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Jun 2024 04:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718970950; x=1719575750; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LsZYfymlFvkNaC7UR+89xyL8YV5RjgSwqJCekyf0v2g=;
        b=V01Hk8jnEF3o7LOCz8OEy3JzHXigQgo/woThlFA2XVxRoO9wmjSyv4Gvn7663/i2F0
         LVlO77LU/Wm4DUpl1dOmYcZYvV0NuDdWMjUimUyYD4Bwkow6RyeBxKvTR/ZE98AXK1pg
         AJ/RirDXTddioo5nxuR2PdmfUOEnfSiwBUPjGUscG/UU2ABYYLOqT5fiL8CUJbjT0O1N
         zxiOZSA8/KaFq7y3rLFkYt1WvEMYSQJFLJR6SVIHGHt2QbSBkBFez8Da/dv6KR7d8zai
         B7pa186oMxBIqdxY8sBVZQakAiXJC/hRj4+u9jHT8Nv/eLmcNkOAmn2K71Bb77DPrWhw
         DQgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718970950; x=1719575750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LsZYfymlFvkNaC7UR+89xyL8YV5RjgSwqJCekyf0v2g=;
        b=KHyMoKiRtj8hPsoWwQAhQXlWo1xU0lOmmB/cF6Jc6IALMmmuiO1RaLwxEJcYyuCgyq
         kjqUfZTFuqjI0UZXoHBXSJviC58QSmkqi5CTW22i2ltJAzoN6DvpLL5ruLxiF1NWVPHv
         oannf0vjSBpUJ3Ki1GHApQJeJlOO/LFjw58TL26lS4UDnzbkg6tokUC+INEcqNmviRcd
         MUjZQGwMZt05Uq5Y7XWlMoBtBZ49TjFXl11FE+WKYNzBnris+Avt05ADPdykhwOkCIIr
         5RM69i/Y2T/1oPboYI9eCsAu1dc2ZprfY+HUO/5K2M8b8PLw4C2ZcHUhxCoztKEb3dCM
         KXGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtRdl1WsRsRkY82ThvkJxr1mycyYRnLyLNnx32aLpWfeDUweQy/dWj8wnPNm+4DbVooWmxAZsDIakP8d6giNqL5R1JYWO9tI4HK6slMCYQ+Mg=
X-Gm-Message-State: AOJu0YwVA8aNgMd3thcCXUSGt9N2pV/bSMhabIuGCeD1ZvHX3RWlCxmA
	3Bh/Zal+M77Kh9r/oSK3sFsH86wwfGNhEtIAFyNWVyDbYpwx9tIFzRCtsNzr7Kw=
X-Google-Smtp-Source: AGHT+IFGgH1vCBp0//n23+QcNNqzHrghhJighi2ENZGyzTBy64LZfl2gFclPwco/HnFbFKAV9o2QbA==
X-Received: by 2002:ac2:52b2:0:b0:52b:796e:66a5 with SMTP id 2adb3069b0e04-52ccaaa2607mr4436785e87.66.1718970950311;
        Fri, 21 Jun 2024 04:55:50 -0700 (PDT)
Received: from gpeter-l.lan ([2a0d:3344:2e8:8510::3aa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d208dcesm60386725e9.31.2024.06.21.04.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 04:55:49 -0700 (PDT)
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
Subject: [PATCH v3 2/2] soc: samsung: exynos-pmu: update to use of_syscon_register_regmap()
Date: Fri, 21 Jun 2024 12:55:44 +0100
Message-ID: <20240621115544.1655458-3-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.45.2.741.gdbec12cfda-goog
In-Reply-To: <20240621115544.1655458-1-peter.griffin@linaro.org>
References: <20240621115544.1655458-1-peter.griffin@linaro.org>
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
Changes in v2:
 - None
 - Link to v2: https://lore.kernel.org/linux-arm-kernel/20240620112446.1286223-3-peter.griffin@linaro.org/

Changes since v1:
 - pass pmu_np (not np) to syscon_node_to_regmap() (reported by William)
 - Link to v1: https://lore.kernel.org/linux-arm-kernel/20240614140421.3172674-3-peter.griffin@linaro.org/
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
2.45.2.741.gdbec12cfda-goog

