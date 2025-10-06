Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042EE2DECCC
	for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Oct 2025 16:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759769018; cv=none; b=NW3xmVpp9P5bts7GXBGYfJAFRtY8sxOQAGLYK8fTuPRsgeD2VxhbcQyQaeVG0EBbN538YAkANzUVF4jON3ndjum1i0WGM08v01lwBJ57yHWeErf9OmwYWUX/6DOiZLKOTBanYyDxkLtsO21mKoELUK6YqCGe5150WqT31rkl1iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759769018; c=relaxed/simple;
	bh=vc8UBGPhuDSOYJ9/vAmaIt+O2yLpd9dPu2EvvobJfog=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a9bIQQP8oG9EgZPePQOxVc+JHMOoIVX+XlcREgFxnp37OHv1CfPRPTEnsnuew/iwMCEgfQGT9Bm76+QuxR1yqdIspdJSo4QCLMQ0qNrlV/QTjwqZO4BYo5d4E+FerffJ0v1mTUryFFINbnZ9Ud3HFVQpcsXfTz4JRJUPs9yExnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LEuvZG+A; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LEuvZG+A"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b3d50882cc2so990538966b.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Oct 2025 09:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759769012; x=1760373812; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xVe/h8oE+b7BSIsHHmcvuc3lfDEBo1cFpLLSAyL8B6I=;
        b=LEuvZG+AHWt3imcJMLDzZp/ILlABXXwELXQzDUo7k4DDKDVYxTXLYpVJAG7vHLCumJ
         M2DhzwzqjhLYu1rY5xehbPvTDVZ+UNZOsQqUeRddKm9uqPQ7rJE5HvnJgl1nTeZAoOoB
         5eiM3nmQoEBFajK1sKKW9CZRKR60i1kqtZr5raCyWigS50nrj1NQ3FvR6VnQetfGh5UX
         e96PId1m2u9hMRWDfoTgWU6/DixYLswDqPGqNh+Ee42cuBRR61Gq251qL+l72+DcjrPB
         z3qUtMuQzvdxUfimC3/CXEii9b9RCrSq2J+tcfS4UZalCriTQzZyj+4ON3y4pb6udTdH
         cTtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759769012; x=1760373812;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xVe/h8oE+b7BSIsHHmcvuc3lfDEBo1cFpLLSAyL8B6I=;
        b=RtbJtQHd6sPM+tdS/emwZ/QMhyGn7DJwskpaf/8KVjVhG9YVy5soeHLwTC3RNSEWOh
         JkzrFe+jP6GvqGsVBCFB7HLpdOtY63B7l0HTZ5kqk77OCze3TXnRBKmsSP4JwTwsm3zY
         Lh7zZ+ZniiNLhTSnaFouFpzNnbCMqv3k9OjGm/nk5PBLDWFmdBxqIMndN4+WRv52wqHs
         snOyiSN6PDxKBPQX6OMo0a5ilhN5DcBUHnmFWZmiO8t6gQfMWgwn2iXVwKZwAb3yHXXD
         zrlW6R4lPtZhm2jwytHAwI/2NYeMfK9bdPMXYXDDoERsRFlalRLdTdkRE2pyqna6HBy2
         nmLw==
X-Forwarded-Encrypted: i=1; AJvYcCUudyz/oiQhXS2p4a5P7QpTqv3KUvZXYOoQJZ8W4mVG2qgkEYIkPCEfmgvwVeROK2J2COXjXBhaH659C4geddyIfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3E/F8fUugfWnL4e89Zl8Xq0Ai98w0r5RSGiQHot/t7I7EYUTe
	BSMfBUad9p7hKuV6PlTBsKMPAWzMSHmL6PR4CebIqHw3wu/M8NlPaGyyk5oiqkr1Jjk=
X-Gm-Gg: ASbGnctltDpn4IgFf8fJTrnNI7PSgOObkLieytYUt0qlQ+O/rovIOm9+9S71+Apc2Se
	VJASepRHIN41+M9tD9IAh68hAzUsNglpWt7GYTnEogfGwbO/ICssBJAaLijD/PSZQpLmi5Bw6cX
	tAkB9v4hh66hbeRV92+s0pK6FHdRKgnOwz9S4ifPGuh7RgQj0MWNeiqRazvMDrqNvnXr5sY9mU0
	wVtJvZrboLdPeG0n6y4wc8kPzvxLEMTDLdT9IgFpfYzGZz+UC0gCSFEKmW5bKiDt3kSZ33+GgVk
	bnYI1UMx9uGNKCpo9RauvWv9cXEzQz7J4/AhlJjgVhZfZ6JRPPjkBahfPefjV1GJLFI/XrjIqcA
	S7hTh6kdNOJLR//YHV+Qe1zbP22jtpFT2cDOg3fKnTUGDxpg4r2oRlMGQXlEQmT8amWvk1XOtht
	yULk8YAXkp/+iqPohWEKWdCjugk2JXiM73IcWmZz1q
X-Google-Smtp-Source: AGHT+IHyfqUJ/1bbZ0b+uTuR4SP9fVf5ypcK6bma2PpVrFAj23Ekd8i6RkAsU0S6e1awiYiWiR2poA==
X-Received: by 2002:a17:907:3ea1:b0:b41:297c:f7bb with SMTP id a640c23a62f3a-b49c3639c42mr1623024966b.26.1759769012219;
        Mon, 06 Oct 2025 09:43:32 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b48652aa01esm1193841866b.2.2025.10.06.09.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 09:43:31 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 06 Oct 2025 17:43:34 +0100
Subject: [PATCH 08/10] pmdomain: samsung: try to get PMU (syscon) regmap
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251006-gs101-pd-v1-8-f0cb0c01ea7b@linaro.org>
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

On platforms such as Google gs101, direct mmio register access to the
PMU registers doesn't necessarily work and access must happen via a
(syscon) regmap created by the PMU driver instead.

Try to obtain this regmap using the parent node in DT in case this PD
is a child of the PMU and fall back to the traditional direct mmio
regmap otherwise.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/pmdomain/samsung/exynos-pm-domains.c | 58 ++++++++++++++++++----------
 1 file changed, 38 insertions(+), 20 deletions(-)

diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdomain/samsung/exynos-pm-domains.c
index 5a87802cff394945cb0202d08f2cf6bcbbcc774d..c1b5830b2ad3e8b272dcc8ebc364be49aa7fda7c 100644
--- a/drivers/pmdomain/samsung/exynos-pm-domains.c
+++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
@@ -12,6 +12,7 @@
 #include <linux/err.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
+#include <linux/mfd/syscon.h>
 #include <linux/pm_domain.h>
 #include <linux/of.h>
 #include <linux/pm_runtime.h>
@@ -107,17 +108,9 @@ static int exynos_pd_probe(struct platform_device *pdev)
 	struct of_phandle_args child, parent;
 	struct exynos_pm_domain *pd;
 	struct resource *res;
-	void __iomem *base;
 	unsigned int val;
 	int on, ret;
 
-	struct regmap_config reg_config = {
-		.reg_bits = 32,
-		.val_bits = 32,
-		.reg_stride = 4,
-		.use_relaxed_mmio = true,
-	};
-
 	pm_domain_cfg = of_device_get_match_data(dev);
 	pd = devm_kzalloc(dev, sizeof(*pd), GFP_KERNEL);
 	if (!pd)
@@ -128,25 +121,50 @@ static int exynos_pd_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	/*
-	 * The resource typically points into the address space of the PMU.
+	 * The resource typically points into the address space of the PMU and
+	 * we have to consider two cases:
+	 *   1) some implementations require a custom syscon regmap
+	 *   2) this driver might map the same addresses as the PMU driver
 	 * Therefore, avoid using devm_platform_get_and_ioremap_resource() and
-	 * instead use platform_get_resource() and devm_ioremap() to avoid
+	 * instead use platform_get_resource() here, and below for case 1) use
+	 * syscon_node_to_regmap() while for case 2) use devm_ioremap() to avoid
 	 * conflicts due to address space overlap.
 	 */
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res)
 		return dev_err_probe(dev, -ENXIO, "missing IO resources");
 
-	base = devm_ioremap(dev, res->start, resource_size(res));
-	if (!base)
-		return dev_err_probe(dev, -ENOMEM,
-				     "failed to ioremap PMU registers");
-
-	reg_config.max_register = resource_size(res) - reg_config.reg_stride;
-	pd->regmap = devm_regmap_init_mmio(dev, base, &reg_config);
-	if (IS_ERR(pd->regmap))
-		return dev_err_probe(dev, PTR_ERR(base),
-				     "failed to init regmap");
+	if (dev->parent &&
+	    of_device_is_compatible(dev->parent->of_node, "syscon")) {
+		pd->regmap = syscon_node_to_regmap(dev->parent->of_node);
+		if (IS_ERR(pd->regmap))
+			return dev_err_probe(dev, PTR_ERR(pd->regmap),
+					     "failed to acquire PMU regmap");
+
+		pd->configuration_reg = res->start;
+		pd->status_reg = res->start;
+	} else {
+		void __iomem *base;
+
+		const struct regmap_config reg_config = {
+			.reg_bits = 32,
+			.val_bits = 32,
+			.reg_stride = 4,
+			.use_relaxed_mmio = true,
+			.max_register = (resource_size(res)
+					 - reg_config.reg_stride),
+		};
+
+		base = devm_ioremap(dev, res->start, resource_size(res));
+		if (!base)
+			return dev_err_probe(dev, -ENOMEM,
+					     "failed to ioremap PMU registers");
+
+		pd->regmap = devm_regmap_init_mmio(dev, base, &reg_config);
+		if (IS_ERR(pd->regmap))
+			return dev_err_probe(dev, PTR_ERR(base),
+					     "failed to init regmap");
+	}
 
 	pd->pd.power_off = exynos_pd_power_off;
 	pd->pd.power_on = exynos_pd_power_on;

-- 
2.51.0.618.g983fd99d29-goog

