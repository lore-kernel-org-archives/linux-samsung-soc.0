Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4470E79E1
	for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Jun 2024 14:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718373871; cv=none; b=brwlHMgWyD9NmdsekWukH0NH0auIGWdGi3GRz2oSDXz2Hn4N4nRzyg14X2yZhLpxnQ3JMxYenaDEppyqwIgP0kV6OvBKjfj3TJN04iN/U5HUKVy8RtibtqLGp9ym44LUgGDN3wxFFGUuXGiKcZKZazwl/SQQerowtFC/Xe4pki4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718373871; c=relaxed/simple;
	bh=45+7DJ3Zi1zWTvH/h2mVbRQtLebXojIZJISifInGfi4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ifRXNWD0ZHIFhJaTsdtikZbaGV7Pz4rAC7JpAAz2FatLLxs2H9s4WTOuO/p8JyOM7+Ez21oRJ7DsX2ga2t2O3XCzZz/W1CKHvgobpfGyCDbzzXgJNDjW2nGCfO+8Phw3EXp/O8ZEQM7k0PuIQv7xIF0nr6x+fFOuBf4+kgJkTxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a2wzp2Bm; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a2wzp2Bm"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2ebd421a931so21731351fa.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Jun 2024 07:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718373867; x=1718978667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dl9kqcfGBwFy5H6BJGB/GnGPra5NWoxJWzdEPKFSvgU=;
        b=a2wzp2BmnQYvYGGhfrwoFvuBKlCiu/Ps2GMI3fq/xU+Kghph5lzN5XU5ebs6YqsfTH
         0EnfaCq8aF/rESGLivbKrI1BK4euPsjpdhuHL++J68MdVIimngXk4eTmkxS2ScHpeDqn
         Oy8kWBqnr/3fOgpfJcmHl6dscjWaVXgZnhiX/hUImPhj6bg4CTl8RV0x+nBlYj0yYve6
         Mlh9KdSfuFJB4Rg8Whu6vE7CzL/z2Mdk/QlZUGUid4VRfoEudD/MDHQnbuYXleCJ9ieL
         OzdEGaKb/nDzZ5X1WGzLyz5PxM8GM4+ewDkYHLWe75d1mjt7UsBM5ZPqdOui15Q6oJ4Y
         nOzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718373867; x=1718978667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dl9kqcfGBwFy5H6BJGB/GnGPra5NWoxJWzdEPKFSvgU=;
        b=PAx4ynVRQIdqDYLUAbQ5ERRn63/IbxjhDl4eSzeavWxPiALBOFDXYCNsuwhJvWtT5I
         u6pp5fvQphTNQsdJBCP+hiDEkMyXoGlj7NDiCSI+nl0fRbhB8yKr/hYUaZcLn2/+uoFa
         ySzGKe94ATa2Z4iJneZo5ke406G4QhR8PtDn65Tx8y9MekgIA6DEMBcd52pQb3UioCkx
         AAdHtgjUTTO1X4Ty0O+XFQytQe2b4hA4WwUSfSTCWXvwNjZxtJebT6S9vhGxI9T9hAyF
         5kbbvDwHzO1aYDoMG+4MSG45r8FEOUqh8af0qydCMjuxQQVUDvei62A17kKM3ty9i3E1
         FGbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVosBoEGuA+9/i9w6Fzh7nO2/uZ/ardiWV1WWvoxEX8EteleKeQKbgddWyU9diLGdTh6xYRSYi+tZqphUt4qwWnlGw5g+kehhzJ4uA7kMS2WhY=
X-Gm-Message-State: AOJu0Yx2wlPyO+6aMshe3HFp5bB4ZWb11cBp4a7tLG/J8PuAUPQbT2KC
	oVbswfbi2PBCikmQ9fjyfugph0ck6R5P/L5JE/lkz5I/IW+LxxOboL2wYlE6F6M=
X-Google-Smtp-Source: AGHT+IEQOuPOYPaM8o3aNWyvd8/zbnKHujN2cBZJn554KZZftzu74XY5xkUakXzxKrF6TPEHis8wFg==
X-Received: by 2002:a2e:2e0f:0:b0:2eb:f5ce:a0fa with SMTP id 38308e7fff4ca-2ec0e60cb34mr18675991fa.46.1718373867299;
        Fri, 14 Jun 2024 07:04:27 -0700 (PDT)
Received: from gpeter-l.lan ([2a0d:3344:2e8:8510::3aa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422f5f33ccesm61310525e9.3.2024.06.14.07.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 07:04:26 -0700 (PDT)
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
Subject: [PATCH 2/2] soc: samsung: exynos-pmu: update to use of_syscon_register_regmap()
Date: Fri, 14 Jun 2024 15:04:21 +0100
Message-ID: <20240614140421.3172674-3-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.45.2.627.g7a2c4fd464-goog
In-Reply-To: <20240614140421.3172674-1-peter.griffin@linaro.org>
References: <20240614140421.3172674-1-peter.griffin@linaro.org>
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
---
 drivers/soc/samsung/exynos-pmu.c | 38 ++++++++++++--------------------
 1 file changed, 14 insertions(+), 24 deletions(-)

diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index fd8b6ac06656..91d7f4121a72 100644
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
+	return syscon_node_to_regmap(np);
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

