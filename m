Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5104E14F75
	for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Feb 2024 03:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708570962; cv=none; b=UorKB/7T7XJqEA9WTLvBASKoaqY+En5VSG7yLHhoGpMx3+POKMNAAhxw1TRT7oHvRRarZHddhdS6JYnSGesKJV7dhnUK3k6NAl75K+OPlfu0l0NAnv4ja7PZ7PiOaO/IGx0k6AyS9Pzu32THytOg4UAFDoW8pY2tB29Alng/Zjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708570962; c=relaxed/simple;
	bh=4BIYBpub7umaVofmnwjSmDMnZ8tN6z9wJoCkm2qteKE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Xl1vfiJd07B+/xgBShAJCdl43tSncLvfiBFgWZOepH8m9RitZx1YrQua5PX9668hW0EItHmWwQki2IItrTpvVFPILCyxMF554/K21PvCKxULeQX6cmY5HOPDqZlwnwztnVhMT7zWckIj4LbYbHffgKYFvwGc0qX97wCa2um1x4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FkcT+Tfr; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FkcT+Tfr"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5a01ba2f815so531821eaf.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 21 Feb 2024 19:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708570959; x=1709175759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ID9ZSTbHJR/LMatneT/X93cat75UpJiqh+CbEK1RNJ4=;
        b=FkcT+TfrXwxutwEmc3pwnaI5ojB5v+W7lYJWCJjzyhGSsDZPhD70QjRReQO0kNdq01
         Q2ZtIhMLpuCs/bsFsUDdw3893aS2CcwB1+TZ1J8qYbV1GcUtDZ4VKi+p5zp9aKvAyBTd
         sajIOsGy8mdtmAvVRAKDAR5U5VKAT60AaqHnPdw5kIFXZpqRgi/ydetPlxcXtq6/0C7A
         A3GuljOjqMywEaTdAZcLPArNupc+78dlq0hvYiPyrrGj2wVUeq1farQYViF4fZ5P8xN/
         udpEozjcDijpqPERHlJIMPVg8fLPJrJi0bkVrPXJZZUSJFgN3BGg52pEI3mIpZptOXgi
         eZ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708570959; x=1709175759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ID9ZSTbHJR/LMatneT/X93cat75UpJiqh+CbEK1RNJ4=;
        b=niTF+61rAeeMv96IPOR3bikMkHg2pjMaVXv6Q4/T1PEwoZAJjyrgagIBKkYCMW6lD7
         CqPxp+recug0aruZHhYrUjSljTnPOQG0/1wMFc5IZTexfHTggxGnZ9MeoTLZEfO9hA9s
         X4NbX/TgAKQUqXI+2pbC9nEXJfR7j3IRDec2DbcPYYxnkz3uiyWvJb3q7bylcd5C1BNX
         bIK4uLJa9lv5OL1q5iB0/GKC9DNCU2YWOE205bvMWVF1Rh63dk1rIrEi7t7wIlxEx1Ur
         0y568+tz0lxVCzeUh0a9fvdm2xZMqpcz5/qzvK4gQI+lf/5DxOsD0h8iXnndl3o/ua8t
         ZtHg==
X-Forwarded-Encrypted: i=1; AJvYcCXVIjxT4JclslxRtTHd0mCfOsO2zJhwV1TQ2T7hiyEBGve9szSSKCeky9119YeJ8aCt8ZPiypUcaQQs+TWLlkeQSrehhjhOBwSG237M4LTVip4=
X-Gm-Message-State: AOJu0Yzeh2hFA9P4HpsejTPWeHaOeRho+Cq+3L4QvzvCk8bseI1RuGuX
	3bv+9FqcLBEiSQbCsmCoCvrieLFwHaM9SVwyKIJzNoxLj9dQcr0dAbW0n5LMplI=
X-Google-Smtp-Source: AGHT+IFOI2I/X/krm4AKtHSPidwLIM4wfZTExpCjliyiawzbQm1Fjl84HRe0rz4bKi2uvAxm8PLCAw==
X-Received: by 2002:a4a:9d09:0:b0:59f:9910:45ed with SMTP id w9-20020a4a9d09000000b0059f991045edmr18355684ooj.1.1708570959437;
        Wed, 21 Feb 2024 19:02:39 -0800 (PST)
Received: from localhost ([136.62.192.75])
        by smtp.gmail.com with ESMTPSA id l15-20020a4a350f000000b0059d7a60e4a6sm107750ooa.44.2024.02.21.19.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 19:02:39 -0800 (PST)
From: Sam Protsenko <semen.protsenko@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/15] clk: samsung: Reduce params count in exynos_register_cpu_clock()
Date: Wed, 21 Feb 2024 21:02:24 -0600
Message-Id: <20240222030235.27815-5-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240222030235.27815-1-semen.protsenko@linaro.org>
References: <20240222030235.27815-1-semen.protsenko@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pass CPU clock data structure to exynos_register_cpu_clock() instead of
passing its fields separately there. That simplifies the signature of
exynos_register_cpu_clock() and makes it easier to add more fields to
struct samsung_cpu_clock later. This style follows the example of
samsung_clk_register_pll().

No functional change.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v2:
  - none

 drivers/clk/samsung/clk-cpu.c | 46 +++++++++++++++++------------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/clk/samsung/clk-cpu.c b/drivers/clk/samsung/clk-cpu.c
index 6412fd2580e0..7b6fd331a7ec 100644
--- a/drivers/clk/samsung/clk-cpu.c
+++ b/drivers/clk/samsung/clk-cpu.c
@@ -432,16 +432,19 @@ static int exynos5433_cpuclk_notifier_cb(struct notifier_block *nb,
 
 /* helper function to register a CPU clock */
 static int __init exynos_register_cpu_clock(struct samsung_clk_provider *ctx,
-		unsigned int lookup_id, const char *name,
-		const struct clk_hw *parent, const struct clk_hw *alt_parent,
-		unsigned long offset, const struct exynos_cpuclk_cfg_data *cfg,
-		unsigned long num_cfgs, unsigned long flags)
+				const struct samsung_cpu_clock *clk_data)
 {
+	const struct clk_hw *parent, *alt_parent;
+	struct clk_hw **hws;
 	struct exynos_cpuclk *cpuclk;
 	struct clk_init_data init;
 	const char *parent_name;
+	unsigned int num_cfgs;
 	int ret = 0;
 
+	hws = ctx->clk_data.hws;
+	parent = hws[clk_data->parent_id];
+	alt_parent = hws[clk_data->alt_parent_id];
 	if (IS_ERR(parent) || IS_ERR(alt_parent)) {
 		pr_err("%s: invalid parent clock(s)\n", __func__);
 		return -EINVAL;
@@ -453,7 +456,7 @@ static int __init exynos_register_cpu_clock(struct samsung_clk_provider *ctx,
 
 	parent_name = clk_hw_get_name(parent);
 
-	init.name = name;
+	init.name = clk_data->name;
 	init.flags = CLK_SET_RATE_PARENT;
 	init.parent_names = &parent_name;
 	init.num_parents = 1;
@@ -461,10 +464,10 @@ static int __init exynos_register_cpu_clock(struct samsung_clk_provider *ctx,
 
 	cpuclk->alt_parent = alt_parent;
 	cpuclk->hw.init = &init;
-	cpuclk->ctrl_base = ctx->reg_base + offset;
+	cpuclk->ctrl_base = ctx->reg_base + clk_data->offset;
 	cpuclk->lock = &ctx->lock;
-	cpuclk->flags = flags;
-	if (flags & CLK_CPU_HAS_E5433_REGS_LAYOUT)
+	cpuclk->flags = clk_data->flags;
+	if (clk_data->flags & CLK_CPU_HAS_E5433_REGS_LAYOUT)
 		cpuclk->clk_nb.notifier_call = exynos5433_cpuclk_notifier_cb;
 	else
 		cpuclk->clk_nb.notifier_call = exynos_cpuclk_notifier_cb;
@@ -472,11 +475,16 @@ static int __init exynos_register_cpu_clock(struct samsung_clk_provider *ctx,
 	ret = clk_notifier_register(parent->clk, &cpuclk->clk_nb);
 	if (ret) {
 		pr_err("%s: failed to register clock notifier for %s\n",
-		       __func__, name);
+		       __func__, clk_data->name);
 		goto free_cpuclk;
 	}
 
-	cpuclk->cfg = kmemdup(cfg, sizeof(*cfg) * num_cfgs, GFP_KERNEL);
+	/* Find count of configuration rates in cfg */
+	for (num_cfgs = 0; clk_data->cfg[num_cfgs].prate != 0; )
+		num_cfgs++;
+
+	cpuclk->cfg = kmemdup(clk_data->cfg, sizeof(*clk_data->cfg) * num_cfgs,
+			      GFP_KERNEL);
 	if (!cpuclk->cfg) {
 		ret = -ENOMEM;
 		goto unregister_clk_nb;
@@ -484,11 +492,12 @@ static int __init exynos_register_cpu_clock(struct samsung_clk_provider *ctx,
 
 	ret = clk_hw_register(NULL, &cpuclk->hw);
 	if (ret) {
-		pr_err("%s: could not register cpuclk %s\n", __func__, name);
+		pr_err("%s: could not register cpuclk %s\n", __func__,
+		       clk_data->name);
 		goto free_cpuclk_data;
 	}
 
-	samsung_clk_add_lookup(ctx, &cpuclk->hw, lookup_id);
+	samsung_clk_add_lookup(ctx, &cpuclk->hw, clk_data->id);
 	return 0;
 
 free_cpuclk_data:
@@ -504,16 +513,7 @@ void __init samsung_clk_register_cpu(struct samsung_clk_provider *ctx,
 		const struct samsung_cpu_clock *list, unsigned int nr_clk)
 {
 	unsigned int idx;
-	unsigned int num_cfgs;
-	struct clk_hw **hws = ctx->clk_data.hws;
 
-	for (idx = 0; idx < nr_clk; idx++, list++) {
-		/* find count of configuration rates in cfg */
-		for (num_cfgs = 0; list->cfg[num_cfgs].prate != 0; )
-			num_cfgs++;
-
-		exynos_register_cpu_clock(ctx, list->id, list->name,
-			hws[list->parent_id], hws[list->alt_parent_id],
-			list->offset, list->cfg, num_cfgs, list->flags);
-	}
+	for (idx = 0; idx < nr_clk; idx++)
+		exynos_register_cpu_clock(ctx, &list[idx]);
 }
-- 
2.39.2

