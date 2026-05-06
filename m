Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1BBC3D4105
	for <linux-samsung-soc@vger.kernel.org>; Wed,  6 May 2026 23:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778110736; cv=none; b=Uf61ftYD4QgfFDQxNdsLJ8RQTM2czb399zSqaMXiAQylYzrBxwyK1pVsfvB+//PEEMYC3E9Y79zBGHgBlcuW7q1XLWCmU8293UY6rLslrr8s3NGvdcBStKw/hTFIN4j24VyrQoKVljgpbwfqI7cdUDWxOB2ZoWtFztKoUCTogd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778110736; c=relaxed/simple;
	bh=JXP8l6SZOlYJ3RZ86oWzg8ag9M+Lc2vnpFBpDW52rRs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OxTajmhRUCy3U+p4K2D8E1sm/ZBB5kOKlwrm9aB0iTIdW72fvt7upmWVA5BQ+8aE+bNqX1/l2spGHpkChFg8P3xoE3beJGPVMTKSf9PsgCn9IBpr0EVmS0nNppmLbzYFoiP0AfcqnHUo6VPdVmi08tWUnS7Yhz/24MKwjVBFFLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GAlYNfXx; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GAlYNfXx"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ba928852a5so1447395ad.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 May 2026 16:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778110734; x=1778715534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o3IG9Yp6Pjl+c9PKNtEae4TwSgGvYdWevGerwBQ6zPI=;
        b=GAlYNfXxTc9ptgfxgIe24oLzxnmYXnuS98ptuX6JSalg3PKzHrcLRe1srpSZ9erwbW
         n1QUQmwwqPaazKar0/z8r/kJsXiQefJFZfteRC1jEz+oD4uRw8GI7es7PeWFP3EzEs8E
         V+FYEEd168rRrmN6NLTNx93tbUK9DOfO3fMVVEkPeateB0IGSvgaosWXjORsjCzLWncJ
         9nFfejVz7JXNljQr0DooB7+MAwSywK1k+pqVIfAAXta/5kKAwDsdgkUI0ESM8CfrU6jH
         u+9IMZ9nmpLgE78ihsVPYe0ntkWuxD44JcrV+OTu4TGTVem90JUH990UlyAsn0uA5e0m
         uDxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778110734; x=1778715534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o3IG9Yp6Pjl+c9PKNtEae4TwSgGvYdWevGerwBQ6zPI=;
        b=scBzyPvlDsj4vBmlIcyxOWpW8KOzmrNGu3Grt/yU86YfZAMUWRZp16JYrM3/yn5wRU
         7KTcFqGr0X3+0fTswLL+IhSa56OflcFDK/2CuQA5B+i7DGDDHCBGWhMAEtre8iPANzBf
         H4YzIOCCHWzBcppJ1gUaGRSMdP8s1tSLwOd1zYNZGEfjZj46uRxXfY6VcD23bhTR+0bJ
         bt9NjmlNsKx8EA3Jue1sm/nyCsW2IAiaDM6KMjUX+mSJQdHmB7ned8Ac4jn+aJj6TuXY
         Kb6vfzMBt95Rqa5wzmVN1SJh0gq67ykSlp4x5yV9BvsDVws5fere2oWJRovdyAtYXfvQ
         J5BA==
X-Forwarded-Encrypted: i=1; AFNElJ/wwSf/CLR5RJTNCB3Y4Tvarhf50znumwgoNtRqPc47wSCwQlHY9EpNXNYt0IwtcAEyDOJtoGn+m6rLrU/APMWA2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvPAn0eSHeY9FYjICXUj9pOXKNSpsNGv+Mk8aiFAfeg/ist9F6
	uqKlYBQQ24y956sS9PerY2OlqZanr6n9NpUApEiqDXJNiXkFcUqAUXr0
X-Gm-Gg: AeBDiettl1RnYIrS5hH9SimfWlC38E+kYfD+lWQk3+wgKBlNgOrZpcU88ISYBXNXNMq
	RZWXPESE87NbakB9Cvzc7h4IgoQl6T9FWAUKj8JySFrdQFqu0nMG+xntOJPoc8ZnsQo2PORt3Qw
	DgwC3H9ad+W/jhymZtj8jun6JJkUdsFmDpBEq6FuEFv+HV2Wq/xm8h3Sx4Ueca5FlSlA7NXFFaS
	rMaA/u8GnHfnqI1Vv36lMJek0BWutQnXV1EmBj77lM7BQumZxD2wfsl11NG+9EtUGh/mIXRz8oQ
	i1utDT6c06sBkBQEViKosx9PvNkhD5zEzCYUbjKlU2zZfegxGlTttS55GTCIWZozXhaIcP6IsyK
	wAhC0BuP4/t1dmoqJBnJglKL/VIT3alypuTKh/oO24Rvsx7aSwpcS+2C2qcTCERfTL2RLNLVkT0
	jLmtwaLC4OjE/DVTOYHKsNvCsmiI0/bH7JmJMMm91JdMle+KUSWG7RPXsFYMFWZLxZ9lZzsSAWA
	2cVneb/0vi5wr20gGJ1cTY8ROfP8lRoD22IShyrxpQlYLghCdtoukia
X-Received: by 2002:a17:902:f650:b0:2b2:5258:a23d with SMTP id d9443c01a7336-2ba78f54b3dmr54071995ad.14.1778110734082;
        Wed, 06 May 2026 16:38:54 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2babaaef08bsm3471805ad.28.2026.05.06.16.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 16:38:53 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-samsung-soc@vger.kernel.org (open list:SAMSUNG SOC CLOCK DRIVERS),
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCHv2 2/3] clk: samsung: cpu: use kzalloc_flex
Date: Wed,  6 May 2026 16:38:32 -0700
Message-ID: <20260506233833.178357-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260506233833.178357-1-rosenp@gmail.com>
References: <20260506233833.178357-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use a flexible array member to combine allocations.

As kmemdup_array is really kcalloc + memcpy and kzalloc_flex kzalloc +
kcalloc, kzalloc and kcalloc combine leaving the memcpy.

Add __counted_by for extra runtime analysis. Remove fake const num_cfgs.
It needs to be assigned for __counted_by to work.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/clk/samsung/clk-cpu.c | 34 ++++++++++++++--------------------
 1 file changed, 14 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/samsung/clk-cpu.c b/drivers/clk/samsung/clk-cpu.c
index ffc33e5decf5..37cf47533dc6 100644
--- a/drivers/clk/samsung/clk-cpu.c
+++ b/drivers/clk/samsung/clk-cpu.c
@@ -101,11 +101,11 @@ struct exynos_cpuclk {
 	const struct clk_hw			*alt_parent;
 	void __iomem				*base;
 	spinlock_t				*lock;
-	const struct exynos_cpuclk_cfg_data	*cfg;
-	const unsigned long			num_cfgs;
+	unsigned long				num_cfgs;
 	struct notifier_block			clk_nb;
 	unsigned long				flags;
 	const struct exynos_cpuclk_chip		*chip;
+	struct exynos_cpuclk_cfg_data		cfg[] __counted_by(num_cfgs);
 };
 
 /* ---- Common code --------------------------------------------------------- */
@@ -660,10 +660,6 @@ static int __init exynos_register_cpu_clock(struct samsung_clk_provider *ctx,
 		return -EINVAL;
 	}
 
-	cpuclk = kzalloc_obj(*cpuclk);
-	if (!cpuclk)
-		return -ENOMEM;
-
 	parent_name = clk_hw_get_name(parent);
 
 	init.name = clk_data->name;
@@ -672,6 +668,17 @@ static int __init exynos_register_cpu_clock(struct samsung_clk_provider *ctx,
 	init.num_parents = 1;
 	init.ops = &exynos_cpuclk_clk_ops;
 
+	/* Find count of configuration rates in cfg */
+	for (num_cfgs = 0; clk_data->cfg[num_cfgs].prate != 0; )
+		num_cfgs++;
+
+	cpuclk = kzalloc_flex(*cpuclk, cfg, num_cfgs);
+	if (!cpuclk)
+		return -ENOMEM;
+
+	cpuclk->num_cfgs = num_cfgs;
+
+	memcpy(cpuclk->cfg, clk_data->cfg, num_cfgs * sizeof(*cpuclk->cfg));
 	cpuclk->alt_parent = alt_parent;
 	cpuclk->hw.init = &init;
 	cpuclk->base = ctx->reg_base + clk_data->offset;
@@ -687,29 +694,16 @@ static int __init exynos_register_cpu_clock(struct samsung_clk_provider *ctx,
 		goto free_cpuclk;
 	}
 
-	/* Find count of configuration rates in cfg */
-	for (num_cfgs = 0; clk_data->cfg[num_cfgs].prate != 0; )
-		num_cfgs++;
-
-	cpuclk->cfg = kmemdup_array(clk_data->cfg, num_cfgs, sizeof(*cpuclk->cfg),
-				    GFP_KERNEL);
-	if (!cpuclk->cfg) {
-		ret = -ENOMEM;
-		goto unregister_clk_nb;
-	}
-
 	ret = clk_hw_register(NULL, &cpuclk->hw);
 	if (ret) {
 		pr_err("%s: could not register cpuclk %s\n", __func__,
 		       clk_data->name);
-		goto free_cpuclk_data;
+		goto unregister_clk_nb;
 	}
 
 	samsung_clk_add_lookup(ctx, &cpuclk->hw, clk_data->id);
 	return 0;
 
-free_cpuclk_data:
-	kfree(cpuclk->cfg);
 unregister_clk_nb:
 	clk_notifier_unregister(parent->clk, &cpuclk->clk_nb);
 free_cpuclk:
-- 
2.54.0

