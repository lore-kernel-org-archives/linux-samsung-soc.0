Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF770309F1D
	for <linux-samsung-soc@vger.kernel.org>; Thu,  2 Oct 2025 10:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759401183; cv=none; b=PDj87u0cac6iQuOeTur/0dBKVbomRa7LhtN4khj7MGqR/zmVYQSz2aXv+1CG69Y2fcYYwzjsV8MhypUWFwR42sof3MLr6F+1QZlLIkjU9nvpN8CVbj0VBdm7x58JklnNYgGrT8upU0JneMZEJMdwEaGqbmy5+mhusU3+2IcJGyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759401183; c=relaxed/simple;
	bh=xEpx8/54dwpVe22rhqA4AJ561NK5g8oeHotTXzwy+7I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q18M9tLcUqpyYW/FpG4CzsaJDKVMaXebPXXVWe3uqw+CrEMBDm9oszbvZDbt9JDn167SxVV1ier7XteIgORoCfkeB1liizZcB2Yv2GlZvCIh4unIfKbSBc6hBqgUsbZJwVibWZ6+n/VaAE/gE/W3K8AZa1IAPM0xVWmy7cPVkSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i1XwFXll; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i1XwFXll"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b3e234fcd4bso158874366b.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 02 Oct 2025 03:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759401180; x=1760005980; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=63qg0d8m1ZxWOzlA/0Gwqg93V/NGeUpYpl/r93eUFdc=;
        b=i1XwFXllV4vAn8UOLCe/p2XjGn2M8soSMN1aySBYFKYxeM1EQluBXFlkIkPapuuRHw
         T1vlcl3uuUTBQP/3uCkKqIWjDDZZjgLg7AZy1dGQ67dAc4XQ1nKXekpC8wGDmS6q22S8
         Df5T0Z+r7hk1TsajZCv2Y5SA4iV4CVdx4sjn+37GMVvt4mVB09IKtpbIV3F3REwHDCQj
         zldNfy2VQ/x+3h4JbFP1OSsbyAzZmk5PU+IHBYuRut2r3yiOywgzNtymRaydNnpfQ91O
         p71n7R38lmWY6A2/6Cr7oTTiNE6cREVmbn4EwdTYOCK9EeZVxrICuHT/J8cktcMC032j
         wM4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759401180; x=1760005980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=63qg0d8m1ZxWOzlA/0Gwqg93V/NGeUpYpl/r93eUFdc=;
        b=A/lBQiPdgRzHUEPfP/rFhLWhW+3EZ6eYk1XeNg1tcODRce2TVqRIw7V0xps6Xra1Ya
         9UIxQa/wuc6cySU9k3ILwO9mNkbjaYMOw3S5snYFmUvs9R/BDPzHIohbBjW2GXSypJVF
         TzlfjAItL55iZyBDI2CNUM0YRtHEOAd9jGtv/ITrlXrBCwOapOCSrHD6KG6uy7cEY47A
         NDyosR08aQ2/uTdQ1cEKaNuXJxJkfYTZYj17oSjfsl1xmAEltkWo42jq5rxdY8FKqHP4
         OWWr3tERGv9EqVE2IJkGRMHYym91R0y8xzhYDfw63W9mzBOpyEG5qe+kJTCKBDDtFrLI
         2TvQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1oPbRstqbTeNms/dWIWCyICgN2fG1r7iTaKZaf2fC80+oNvWwMEOQkqwXEau9XrytTJN8ToJH94VbP74GS8CMWA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZslfIIWXb8EmIrUQZO/OG8rA5mO+C658D7vLF38djBoWI4ZvA
	/BttmRO2xX0atTJXAorD0RZq8MrSxRuDVGtYY90hNhom8b9JQT5wcBfRWTeCzKXJTyZEYMvHKmZ
	hxJY2/vE=
X-Gm-Gg: ASbGncvU/ng7WGFsv+P3miQTleFicfVENBWdVJJXG+OwySsywlNFzIwd1tisPOf2k+i
	ryzw0en2o2fih4npTkMRHPaLYWovYWklW40gC+xionlbaYZRsCZ06zsID2yZcSA1BDdapbWfGiD
	8yrbuZXZA/pl5S3oo4NFWNY+JjYgCoU7X0o0Z3GKdZaOPjaGwPqdpwV+TCgdBGVpsWuaqIxn5bd
	3m5A+369X0ikYd72wB+sb0S8aU6bU2gOWXIJ7IHV8LRN7sD7Yj+215rEfN6vGixxMACH24RmyMq
	G2nTS+CPZ+QsnXnPgKXIqKgBtBtE5/Fh84QrLPAnAYagmxickc0AVFl5wfxcwlC/v0+NmjbHpW6
	oKqYlxzUdniLtHW7C+yUDvAQdYuFevuq+MdPw2kcnC138gNi+cXj5skLhe6yTLkxYmvJjcZyoXP
	GCwheGVc1newcAP/ZhbBIO4AbODdoKrqL7UmTI3yf1
X-Google-Smtp-Source: AGHT+IGxZCBahQVltdFOGvGloTZFkP3rum3vuta/+ZCokqpuSClzu28tF6ot9TrYBaOgogmM+n5Dvw==
X-Received: by 2002:a17:907:9446:b0:b04:3e43:eccc with SMTP id a640c23a62f3a-b46e632d6a2mr846196166b.40.1759401180048;
        Thu, 02 Oct 2025 03:33:00 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4871167172sm170262566b.65.2025.10.02.03.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 03:32:59 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 02 Oct 2025 11:32:57 +0100
Subject: [PATCH 1/3] soc: samsung: exynos-pmu: allow specifying read &
 write access tables for secure regmap
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251002-gs101-pmu-regmap-tables-v1-1-1f96f0920eb3@linaro.org>
References: <20251002-gs101-pmu-regmap-tables-v1-0-1f96f0920eb3@linaro.org>
In-Reply-To: <20251002-gs101-pmu-regmap-tables-v1-0-1f96f0920eb3@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
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
used on creation of the secure regmap.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/soc/samsung/exynos-pmu.c | 3 +++
 drivers/soc/samsung/exynos-pmu.h | 4 ++++
 2 files changed, 7 insertions(+)

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
index 0938bb4fe15f439e2d8bddeec51b6077e79a7e84..113149ed32c88a09b075be82050c26970e4c0620 100644
--- a/drivers/soc/samsung/exynos-pmu.h
+++ b/drivers/soc/samsung/exynos-pmu.h
@@ -27,6 +27,10 @@ struct exynos_pmu_data {
 	void (*pmu_init)(void);
 	void (*powerdown_conf)(enum sys_powerdown);
 	void (*powerdown_conf_extra)(enum sys_powerdown);
+
+	/* for the pmu_secure case */
+	const struct regmap_access_table *rd_table;
+	const struct regmap_access_table *wr_table;
 };
 
 extern void __iomem *pmu_base_addr;

-- 
2.51.0.618.g983fd99d29-goog

