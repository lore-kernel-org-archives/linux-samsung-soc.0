Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C46726D4F8
	for <linux-samsung-soc@vger.kernel.org>; Thu,  9 Oct 2025 09:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760002293; cv=none; b=iBHmk2un/xLwJadQ7xS1HFziLND1veaBIo9hMPjTPHxFYwAGFdaTwuriesCtz1ANk5EXf2tasYhae5sWQJDDTggDYngElU5NELLIGWmjR9tfzUB/CUW2ekpR+Up/NYCtECgi4v58TmMrg7eYxKXsXPloXDykudPNEYfKZBm+3E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760002293; c=relaxed/simple;
	bh=hKOEli3CC73LXpkDN7O8qVN57wG2tCN4yTStwZ9/NHg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KJQKAFUHkghWzNOomzKZ2/+0XPnsKo5NdIZ7LG9+rotjXBHozKNiRGeB+UVUmqAO9nMef0kg92hX0epiOUZL9Lf1ejXf4TcGcCBlTKH34O78hZ1qN1WZjtJKk79s7vzDUq6KwFzW5R+Ikc/0kbRudyDYilZFeZhqtrEoeeJroAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D0z5bjfD; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D0z5bjfD"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b3c2db014easo147578966b.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Oct 2025 02:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760002289; x=1760607089; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BnZwMqT5Z3k14agLqjdrnk3P1X+gmQLWShTQkVnycRg=;
        b=D0z5bjfDliu8g4EhGn4bSHYCWp3rVKEfBBSALdlcM0UOx4ExOP7hiIlyxCy0sPZW2P
         dmkUwlYwaClktyuiDJ6SSPhQMA+NYL2pyMl1gpeqtgJq9qLO6l72arR+z3o45PQjrWaa
         sqiAdauwAOeKfFSAvHwyJ71w3N5zqEmzN8szTr73+SNTHc+iJXgQ4r5vsBuJS6ArCI6I
         4Zadfe8kG5V6GouuY1qejaHXwr71LCKBIJnt/eubENdb91eGZqx0dLtI2msFrLbg9HWi
         zddCa7o0czD6DjgGoqllumsV310zxiw8NmTDkOJ+DVlpVfq9ox3UG1QbBaMdYQCXXLrx
         quiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760002289; x=1760607089;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BnZwMqT5Z3k14agLqjdrnk3P1X+gmQLWShTQkVnycRg=;
        b=uo/7LUoU5BvxlV5k/fHHAUcr2GunoJOlIWMtNY5z3+KGYYFBSQZeek+r2RjdwkDml8
         0omq1GrtkRG0kJBa6y8Eg5trdgH+O9YPgjn+P+d/T4j590FlXzTemauPJ8stMP+do+Ho
         3qP5s0E+1jB8Xr7YKtK9cJ1PMhVwuILlukpX9a/FwjMAqiYgrzpPD09xey7mHOZQypeS
         wySDQDkOc6o6tljLQdHjiv2tENRTNAzP9satfRF6+kE4LBY7CEMlcP3TJ/x1hMC4zeqW
         KjEQJU7w1MX1817mzsRMR5hmUn4k2LVE4bHs2Ja0KELIj5oc1A9U/tY/rupSS0utFa+M
         1Y9A==
X-Forwarded-Encrypted: i=1; AJvYcCWFEsGLjR/+YmiYobqriCg4DxcpltOpn8XZ/DinmZo0XCqILgRx4Ib0GXN5TSnjMzHqsbEJ9SGGhhrmavq42VGD6A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yws98DX9RLYh4nxuMPPA8Ci82sdfisStbWMVClUAEGNtqyqRsOz
	OWeyck72wlfB3vbwEGOxDr85nsaNI2V+hP8HVHUwdR+wVwD5X+4eqdQMjUC8hl3aeC0=
X-Gm-Gg: ASbGncvy76XM835xKh64tqnnC2YXDnrc1NxbQ5A/I6MTTf3hp9o90KxwSCzQsNIugdF
	uyXBJ+CnWgk7J+oNh5xHL7lN1M9N/f2fOuFmAuIpzE4+Rf6i3N/rStUgj1kC5PBPnjU1bKwZ+Km
	yKiJjWLSSYTB0sfwdxhU/NUvphEn50lm4ywr+4iWciU8g1ue9StFRgxqsEH6At+OxyvkdVG1Lq7
	3qTMrhTXmuPgNTc5+ya+Iw0tCRKIH9UG3qQqPQhtV1R8vbf+SnsaUmueqpGYHfaKELdGuGXh1Vf
	034D0NF6qXklxtsQX5qOf79Sa1JojNl8KBIhWxUq3amYnj4CaDHxjK2RHWBcKWiLIKrFQZWUkol
	Z9z8FhmL91en7UURIAmh2Iri4bpZkLnoWnWTO52rQRefjZSDZJg9GLv5FnbkScTp9Q9rOi/eIXh
	iuHp9DsRUti37UaIR3/LiN0mtb6fdUdohCiTGtn8U/
X-Google-Smtp-Source: AGHT+IHA+lPS2DUQCATgDgIURdRFlX3C6OKochIcH8ifOEzHHA6ifhQXJjqURM+gkgnfCzyEiDrXWQ==
X-Received: by 2002:a17:907:94d0:b0:b04:7232:3e97 with SMTP id a640c23a62f3a-b50aa3921edmr743792266b.21.1760002289304;
        Thu, 09 Oct 2025 02:31:29 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486a173a41sm1855670766b.87.2025.10.09.02.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 02:31:28 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 09 Oct 2025 10:31:25 +0100
Subject: [PATCH v2 1/3] soc: samsung: exynos-pmu: allow specifying read &
 write access tables for secure regmap
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251009-gs101-pmu-regmap-tables-v2-1-2d64f5261952@linaro.org>
References: <20251009-gs101-pmu-regmap-tables-v2-0-2d64f5261952@linaro.org>
In-Reply-To: <20251009-gs101-pmu-regmap-tables-v2-0-2d64f5261952@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>
X-Mailer: b4 0.14.2

Accessing non-existent PMU registers causes an SError, halting the
system.

regmap can help us with that by allowing to pass the list of valid
registers as part of the config during creation. When this driver
creates a new regmap itself rather than relying on
syscon_node_to_regmap(), it's therefore easily possible to hook in
custom access tables for valid read and write registers.

Specifying access tables avoids SErrors for invalid registers and
instead the regmap core can just return an error. Outside drivers, this
is also helpful when using debugfs to access the regmap.

Make it possible for drivers to specify read and write tables to be
used on creation of the secure regmap by adding respective fields to
struct exynos_pmu_data. Also add kerneldoc to same struct while
updating it.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
v2:
* add regmap_access_table forward declaration (Sam)
* add kerneldoc for struct exynos_pmu_data (Sam)

The regmap_access_table forward declaration declaration triggers a
checkpatch warning: 'struct regmap_access_table should normally be
const'. In this case, it's just a forware declaration and the warning
can be ignored.
---
 drivers/soc/samsung/exynos-pmu.c |  3 +++
 drivers/soc/samsung/exynos-pmu.h | 30 ++++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index 22c50ca2aa79bf1945255ee6cc7443d7309b2573..9f416de03610b1727d8cc77616e5c87e2525cc69 100644
--- a/drivers/soc/samsung/exynos-pmu.c
+++ b/drivers/soc/samsung/exynos-pmu.c
@@ -635,6 +635,9 @@ static int exynos_pmu_probe(struct platform_device *pdev)
 		pmu_regmcfg = regmap_smccfg;
 		pmu_regmcfg.max_register = resource_size(res) -
 					   pmu_regmcfg.reg_stride;
+		pmu_regmcfg.wr_table = pmu_context->pmu_data->wr_table;
+		pmu_regmcfg.rd_table = pmu_context->pmu_data->rd_table;
+
 		/* Need physical address for SMC call */
 		regmap = devm_regmap_init(dev, NULL,
 					  (void *)(uintptr_t)res->start,
diff --git a/drivers/soc/samsung/exynos-pmu.h b/drivers/soc/samsung/exynos-pmu.h
index 0938bb4fe15f439e2d8bddeec51b6077e79a7e84..1658a55fe61c6fe70cc4cb0fcdcea2756096a268 100644
--- a/drivers/soc/samsung/exynos-pmu.h
+++ b/drivers/soc/samsung/exynos-pmu.h
@@ -13,11 +13,38 @@
 
 #define PMU_TABLE_END	(-1U)
 
+struct regmap_access_table;
+
 struct exynos_pmu_conf {
 	unsigned int offset;
 	u8 val[NUM_SYS_POWERDOWN];
 };
 
+/**
+ * struct exynos_pmu_data - of_device_id (match) data
+ *
+ * @pmu_config: Optional table detailing register writes for target system
+ *              states: SYS_AFTR, SYS_LPA, SYS_SLEEP.
+ * @pmu_config_extra: Optional secondary table detailing additional register
+ *                    writes for target system states: SYS_AFTR, SYS_LPA,
+ *                    SYS_SLEEP.
+ * @pmu_secure: Whether or not PMU register writes need to be done via SMC call.
+ * @pmu_cpuhp: Whether or not extra handling is required for CPU hotplug and
+ *             CPUidle outside of standard PSCI calls, due to non-compliant
+ *             firmware.
+ * @pmu_init: Optional init function.
+ * @powerdown_conf: Optional callback before entering target system states:
+ *                  SYS_AFTR, SYS_LPA, SYS_SLEEP. This will be invoked before
+ *                  the registers from @pmu_config are written.
+ * @powerdown_conf_extra: Optional secondary callback before entering
+ *                        target system states: SYS_AFTR, SYS_LPA, SYS_SLEEP.
+ *                        This will be invoked after @pmu_config registers have
+ *                        been written.
+ * @rd_table: A table of readable register ranges in case a custom regmap is
+ *            used (i.e. when @pmu_secure is @true).
+ * @wr_table: A table of writable register ranges in case a custom regmap is
+ *            used (i.e. when @pmu_secure is @true).
+ */
 struct exynos_pmu_data {
 	const struct exynos_pmu_conf *pmu_config;
 	const struct exynos_pmu_conf *pmu_config_extra;
@@ -27,6 +54,9 @@ struct exynos_pmu_data {
 	void (*pmu_init)(void);
 	void (*powerdown_conf)(enum sys_powerdown);
 	void (*powerdown_conf_extra)(enum sys_powerdown);
+
+	const struct regmap_access_table *rd_table;
+	const struct regmap_access_table *wr_table;
 };
 
 extern void __iomem *pmu_base_addr;

-- 
2.51.0.710.ga91ca5db03-goog

