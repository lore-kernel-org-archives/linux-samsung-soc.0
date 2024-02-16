Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A93744369
	for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Feb 2024 22:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708122772; cv=none; b=b+HCc0vURPm8W/6Rl2P0VcGeplvn1sTr730U1JVEcZC9zEoBnQX+NBIer0rrB6EDAwa5RPJNkxrtJb3kye4i1lOGqO9v/4wzGSG8lbjp69JU2M0AiKmoc8X7GodYk2OARID+QQ7hPY9H9uVBA0LGGeuoDWZTW43FmwxDMRBHDk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708122772; c=relaxed/simple;
	bh=JAEN95vY95CVY9BjR9iBOZz5ov2YBs2UQvYjpLB+T+o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=grduD5YVmjlgWBi7NyJSQ7RL5h9Fj/Is0n+zTmONe+SwpQ+Y6Yj2a0F8ksJgb+WH7Cjh8e6TFxg9FdGoEmsLn8t6Uaq5ZkGXUsIEKOV7bbSaPEuxYIDTb+tTVb7sLYn8vD8y/aafLp2aPw2Q8BjohAV60KE5meTpbaMULXqoQNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vDy9gzHg; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vDy9gzHg"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-595b3644acbso1525871eaf.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Feb 2024 14:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708122769; x=1708727569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tzL3yrVQ7EYMi4vxTiKilEqboOfr+d/YL4WUplo587Y=;
        b=vDy9gzHgT+3KVJ+EVk8CWyLUkYttDUxjpKaqqUbLHw9lhIb8LXe/JL1XlOasErCR/H
         TcOPl6MYcDbmX6lyAIbxiQq0+ZhSCjoqvLZaYefhSzKD4v5WttYX0x31RmcXWc8JQ/d9
         joxYnbRyGIFEHkkWL4X80ldLc8J1njU0PdoFvS9G3gEYVXPmP2Wa0OjdI8jYY96Y9hg1
         nJcif81t7KWg0h5feGN5XKVml0MWHJJ9OYbYclloCfWpX/XhnvRfanBK6qrxCkR+q760
         uo+EU36CXGh942zWfF93ghEObPXoe1J1P9yzC5K3XHdeqJD+CtEUFhpmhaciKduzX0x5
         mYvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708122769; x=1708727569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tzL3yrVQ7EYMi4vxTiKilEqboOfr+d/YL4WUplo587Y=;
        b=biHmsc+regvVdoQBA69yOApUm9n6L490KxqP0h12LXczHqIl5u641Mmzr2CKLkRrbI
         T6coiMvlOMtlsKKbgHZLwaic5dxP+8E+Fuvk5w5IvXpQsayb6frG1rBXFkyYlci7Ogv5
         fTjyTfPgHKrbOFy3lJvUCHAgArgUCbbs/k5y+bxA0KE1rTO4Wy7P16bJ6YzX4hMsirI1
         Ui6frTPhaIum+Fb4Hsxu/u1k+VAbAS5dV/hY4htZI2K9q6/R779/XK/m3KvMTlCo/opz
         9MfgIV8BBgn+8jadNUhwnoiDxFOiLuFLDD8gcaZlChEJQNcjYZzXvv7/mzfMFhmTn2Yn
         mxqA==
X-Forwarded-Encrypted: i=1; AJvYcCU6TxcHiAUJnOJHVKOW6OZx98vXWxyqnLU2iubVatL1JtwPiYmw7l5iX0d+KZC3QrOOPGsBEw59x/Gf/FtfZPb7WYonKpbjnvw/P55m5pk0Pgg=
X-Gm-Message-State: AOJu0YwG/hQQVzGKsaTpUmg3YMaP9jIbNYJhwdg6twdmy3nphuA6Nd5f
	weUMMhyvW4fKskX3KJe+RMYjJt2cZLtagLSTAnErWWuagqFisHQHwxXW7dqpXHo=
X-Google-Smtp-Source: AGHT+IE47qB1FFruLDi1ghi4tpUXNIluSbg1sHmpPPxFdGOrp4k9vWFh8KecxOmYQn6OvBTPrC2wKg==
X-Received: by 2002:a05:6870:ac2c:b0:21e:63a1:b530 with SMTP id kw44-20020a056870ac2c00b0021e63a1b530mr1452890oab.15.1708122769193;
        Fri, 16 Feb 2024 14:32:49 -0800 (PST)
Received: from localhost ([136.62.192.75])
        by smtp.gmail.com with ESMTPSA id mt13-20020a0568706b0d00b0021a60bb6f2dsm201925oab.2.2024.02.16.14.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 14:32:48 -0800 (PST)
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
Subject: [PATCH 04/16] clk: samsung: Reduce params count in exynos_register_cpu_clock()
Date: Fri, 16 Feb 2024 16:32:33 -0600
Message-Id: <20240216223245.12273-5-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240216223245.12273-1-semen.protsenko@linaro.org>
References: <20240216223245.12273-1-semen.protsenko@linaro.org>
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

