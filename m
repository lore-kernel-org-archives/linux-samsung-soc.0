Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469B0366565
	for <linux-samsung-soc@vger.kernel.org>; Fri,  9 Jan 2026 17:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767979652; cv=none; b=RfjTNE2eBT9XjX1kV2s9H5Ut94nJr6qLL7BEoNulTEKTph965yqKtabi3vP9Dh1mIZV464sm3xTYOEFDRLJVQw/kfPQVfrXNKZkLUU62PtqYqhLRLZp+S6WS/4i07xLbOSf4WCmZGXMP6uP9Ajb4v2snMBrA+xmWIuh+mOQoLQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767979652; c=relaxed/simple;
	bh=3XB3rMBEqCsmj4gX8Pmw1bT8hVT6cvRuYvHSnPFCz3s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M+f7h5c4538NlMYKI533pt1bqbkNLvwTn67uJ2KZrb/VaXDADKu8YfOQDmBlETrNzZqU1u5JzxzHCHl5/QtCH5lOu2hSkiVW3Zxhlt6WvL3Rfcadz6AOyXhUnc7P9Q+pY+805CvoGl/Kn3jxoSdwkS0UgaHRQStOn+sBOtIadUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m+cVGiwz; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m+cVGiwz"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6505cbe47d8so7198990a12.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 09 Jan 2026 09:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767979648; x=1768584448; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CzsMqHkuItNSEK91yT7JYcig8ensUusvETOGKZjIn/o=;
        b=m+cVGiwzVy50HHFWafJpfKkxDqnIPk+pUvXyS2WvfbbXXInByQrC/jlLyrRgLyZCZt
         b82s5RDkS8r82mnQw2RZtNelsxUswh0dtGojFu0FeEpaPCq63eN2nw/ski21gruNTQ4x
         FaXtETwUjiUXZgOnrWBXNFTG1ggOtEjAQq07zs2jOL4IlgvbWAy1/y0rlEzR8AdOa2kT
         tKueycSnmrqo/Wz8dD9n0ZMXVshPAJAuH0W7qZQcjx/H8qmXpPP2iZ/XF7gl5Goh+SeK
         6C7fCUrciAnvVFs4wt1KheQ3p9T1EmjEFdO9aQ8kxdZpjxub9ChMV5J9vanZlvVyC/DD
         Y43g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767979648; x=1768584448;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CzsMqHkuItNSEK91yT7JYcig8ensUusvETOGKZjIn/o=;
        b=H12m8xO3B++bHpOa/35e2XiZBTm17c2dK9FwsnqjNIiLYlTTwFBva1b+vXHQZ84ZEC
         4IuYLgBVApEvxk707AFSvFfCbMAj/APy7REWScWc5QMcqBAfR4og4JM45sQHM0NKzBol
         eUGvXSz4EWTm9F2p5UQZVhCCiYYwGpnpB6S5cledqs6bRWQNKtcXz7azoPYKrYPr2lUa
         lMczxQeFWmolovNErtFWnyH5r31x5YqUxN7fGfWfYQyF9sThoQJpKWzIbc6Pq40zL1ok
         2bzCvG/MTsLEtKV/Yo4OC4Y5rt+0X6419XgCkMa8DSNCF4C/ZIQC1yvPwNDdRrtEAt53
         h5NA==
X-Forwarded-Encrypted: i=1; AJvYcCXzdMfXlp8dLeFvbvdqoA9fpQ3Dw5/GQ1jPIJozmWoYuYPOJUBDZl9ioASPGYit53uJ8qiEBFbfBj7hJsYASJEHBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJkINkmjPLPZQ/hCF9KNy3TJCX6be1rwL3lYXgSOWcauTDQ0Sp
	FGQfe+sVEWD6UM6qX05tw6aLhx3QXqYI8/jRBJM47VXZ/ZSvDbdHVDRrXbal+qXj7es=
X-Gm-Gg: AY/fxX4Tx5Q07p15RD/1/Mr3A4f+1b6Scr80NyZJecsDY11ttfKkS7kkbf1InXTY8Cy
	Ry2oS0TWg+2yuPC0V8T8CrZxgtaKZU19+oOsVal3L8mfhNcelCn8VsxfSb9jpTH0wu5TsP/EuEz
	qU5S88cnlDbCVpnhjZF48RkWxp8ldcQvUpUd3KEjNhbP5ob4ZqPcZdBIKwQYWwGnaK6VSa+oAHt
	+BtiQJX/r8gFLlL5hfvFnoW09JfTn1TUahYAg2n6+hEGNXFdZyQ4HJTRKBc8T2V+FVY2LU3kaci
	auFhvfuR7kAt1u1KJW33f8Mk2gB/AKuNr+xUdMfe/mBwvnn4wC1RxjHgVK3uh8/EJs0wNvwfFzO
	EwybBUEC1HNTUn9O8rxHcOpuawQVNexjI1iZuSfSkvaTdT19knYjCd1pZo3Xz7TVz9hUIdW31Kz
	SsNxB/AJYOK70uKoEc9zbGwLHbfarEY6Pxs5Ktuz5Kw6N8w1sEyGYKU/bWwsED0WAGMFTMv2IFV
	6i7pw==
X-Google-Smtp-Source: AGHT+IHfU+cxEUkm2kF/kOQsRd2ooDJ4uR4ri7MEIyFQqUrf3Okb1axWOyo618duvh8QSiexZtQrng==
X-Received: by 2002:a05:6402:13cd:b0:64d:1ce9:54b7 with SMTP id 4fb4d7f45d1cf-65097e4cf0amr8994867a12.18.1767979648255;
        Fri, 09 Jan 2026 09:27:28 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507be651a4sm10642182a12.16.2026.01.09.09.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 09:27:27 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 09 Jan 2026 17:27:25 +0000
Subject: [PATCH 3/3] clk: samsung: allow runtime PM with auto clock gating
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260109-clk-samsung-autoclk-updates-v1-3-2394dcf242a9@linaro.org>
References: <20260109-clk-samsung-autoclk-updates-v1-0-2394dcf242a9@linaro.org>
In-Reply-To: <20260109-clk-samsung-autoclk-updates-v1-0-2394dcf242a9@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>, 
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

When automatic clock gating is enabled, runtime PM (RPM) isn't entered
even if enabled for a CMU if a sysreg clock exists and is provided by
this CMU (as is generally the case).

The reason is that this driver acquires a CMU's sysreg registers using
syscon_regmap_lookup_by_phandle() which ends up preparing the sysreg
clock. Given the sysreg clock is provided by this CMU, this CMU's usage
count is therefore bumped and RPM can not be entered as this CMU never
becomes idle.

Switch to using device_node_to_regmap() which doesn't handle resources
(the clock), leaving the CMU's usage count unaffected.

Note1: sysreg clock handling is completely removed with this commit
because sysreg register access is only required during suspend/resume.
In the runtime suspend case, we would have to enable the clock to read
the registers, but we can not do that as that would cause a resume of
this driver which is not allowed. This is not a problem because we
would only need to handle the clock manually if automatic clock gating
wasn't enabled in the first. This code is only relevant if automatic
clock gating is enabled, though.

Fixes: 298fac4f4b96 ("clk: samsung: Implement automatic clock gating mode for CMUs")
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/clk/samsung/clk.c | 92 +++++++++++++++++++++++++++++++++++------------
 drivers/clk/samsung/clk.h |  2 ++
 2 files changed, 71 insertions(+), 23 deletions(-)

diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
index 9f68f079fd552f8dfb6898dbfb47dec0e84c626c..6515df81fcbc79b90f5262843e67575f6a4e0dda 100644
--- a/drivers/clk/samsung/clk.c
+++ b/drivers/clk/samsung/clk.c
@@ -9,11 +9,13 @@
  */
 
 #include <linux/slab.h>
+#include <linux/clk.h>
 #include <linux/clkdev.h>
 #include <linux/clk-provider.h>
 #include <linux/io.h>
 #include <linux/mfd/syscon.h>
 #include <linux/mod_devicetable.h>
+#include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/regmap.h>
 #include <linux/syscore_ops.h>
@@ -489,6 +491,50 @@ void __init samsung_cmu_register_clocks(struct samsung_clk_provider *ctx,
 		samsung_clk_register_cpu(ctx, cmu->cpu_clks, cmu->nr_cpu_clks);
 }
 
+static int samsung_get_sysreg_regmap(struct device_node *np,
+				     struct samsung_clk_provider *ctx)
+{
+	struct device_node *sysreg_np;
+	struct clk *sysreg_clk;
+	struct regmap *regmap;
+	int ret;
+
+	sysreg_np = of_parse_phandle(np, "samsung,sysreg", 0);
+	if (!sysreg_np)
+		return -ENODEV;
+
+	sysreg_clk = of_clk_get(sysreg_np, 0);
+	if (IS_ERR(sysreg_clk)) {
+		ret = PTR_ERR(sysreg_clk);
+		/* clock is optional */
+		if (ret != -ENOENT) {
+			pr_warn("%pOF: Unable to get sysreg clock: %d\n", np,
+				ret);
+			goto put_sysreg_np;
+		}
+		sysreg_clk = NULL;
+	}
+
+	regmap = device_node_to_regmap(sysreg_np);
+	if (IS_ERR(regmap)) {
+		ret = PTR_ERR(regmap);
+		pr_warn("%pOF: Unable to get CMU sysreg: %d\n", np, ret);
+		goto put_clk;
+	}
+
+	ctx->sysreg_clk = sysreg_clk;
+	ctx->sysreg = regmap;
+
+	of_node_put(sysreg_np);
+	return 0;
+
+put_clk:
+	clk_put(sysreg_clk);
+put_sysreg_np:
+	of_node_put(sysreg_np);
+	return ret;
+}
+
 /* Each bit enable/disables DRCG of a bus component */
 #define DRCG_EN_MSK	GENMASK(31, 0)
 #define MEMCLK_EN	BIT(0)
@@ -499,32 +545,32 @@ void samsung_en_dyn_root_clk_gating(struct device_node *np,
 				    const struct samsung_cmu_info *cmu,
 				    bool cmu_has_pm)
 {
+	int ret;
+
 	if (!ctx->auto_clock_gate)
 		return;
 
-	ctx->sysreg = syscon_regmap_lookup_by_phandle(np, "samsung,sysreg");
-	if (IS_ERR(ctx->sysreg)) {
-		pr_warn("%pOF: Unable to get CMU sysreg\n", np);
-		ctx->sysreg = NULL;
-	} else {
-		/* Enable DRCG for all bus components */
-		regmap_write(ctx->sysreg, ctx->drcg_offset, DRCG_EN_MSK);
-		/* Enable memclk gate (not present on all sysreg) */
-		if (ctx->memclk_offset)
-			regmap_write_bits(ctx->sysreg, ctx->memclk_offset,
-					  MEMCLK_EN, 0x0);
-
-		if (!cmu_has_pm)
-			/*
-			 * When a CMU has PM support, clocks are saved/restored
-			 * via its PM handlers, so only register them with the
-			 * syscore suspend / resume paths if PM is not in use.
-			 */
-			samsung_clk_extended_sleep_init(NULL, ctx->sysreg,
-							cmu->sysreg_clk_regs,
-							cmu->nr_sysreg_clk_regs,
-							NULL, 0);
-	}
+	ret = samsung_get_sysreg_regmap(np, ctx);
+	if (ret)
+		return;
+
+	/* Enable DRCG for all bus components */
+	regmap_write(ctx->sysreg, ctx->drcg_offset, DRCG_EN_MSK);
+	/* Enable memclk gate (not present on all sysreg) */
+	if (ctx->memclk_offset)
+		regmap_write_bits(ctx->sysreg, ctx->memclk_offset,
+				  MEMCLK_EN, 0x0);
+
+	if (!cmu_has_pm)
+		/*
+		 * When a CMU has PM support, clocks are saved/restored via its
+		 * PM handlers, so only register them with the syscore
+		 * suspend / resume paths if PM is not in use.
+		 */
+		samsung_clk_extended_sleep_init(NULL, ctx->sysreg,
+						cmu->sysreg_clk_regs,
+						cmu->nr_sysreg_clk_regs,
+						NULL, 0);
 }
 
 /*
diff --git a/drivers/clk/samsung/clk.h b/drivers/clk/samsung/clk.h
index b1192ca03db5035cc485771ff5597cf132234a2a..deb426fbb0942f21b63c583f0ad55738239b04e4 100644
--- a/drivers/clk/samsung/clk.h
+++ b/drivers/clk/samsung/clk.h
@@ -21,6 +21,7 @@
  * @reg_base: virtual address for the register base
  * @dev: clock provider device needed for runtime PM
  * @sysreg: syscon regmap for clock-provider sysreg controller
+ * @sysreg_clk: clock for sysreg access, if required
  * @lock: maintains exclusion between callbacks for a given clock-provider
  * @auto_clock_gate: enable auto clk mode for all clocks in clock-provider
  * @gate_dbg_offset: gate debug reg offset. Used for all gates in auto clk mode
@@ -33,6 +34,7 @@ struct samsung_clk_provider {
 	void __iomem *reg_base;
 	struct device *dev;
 	struct regmap *sysreg;
+	struct clk *sysreg_clk;
 	spinlock_t lock;
 	bool auto_clock_gate;
 	u32 gate_dbg_offset;

-- 
2.52.0.457.g6b5491de43-goog

