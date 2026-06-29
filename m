Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18AA37F730
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jun 2026 03:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782703549; cv=none; b=pJThn7C9GsuMZlFvdUU44tcxd5YOR8M9V/n6HdbclrnD79aNxKxGBICkD6ooM1kEF6HEdYZa/38H7zqBVWryuNjffWI/O6V3sfTdtg1jZF+7BYStmS/4VQJvaSkLrPj5O1lKGDFo/el9XaMFc16VRDM12W0gpj6+gzj4XABtOyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782703549; c=relaxed/simple;
	bh=JXP8l6SZOlYJ3RZ86oWzg8ag9M+Lc2vnpFBpDW52rRs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sG00JoGJ80dU4/x0t1sIGPq859QBff3YVC/EmRMFMi+VCKznYnRw4GyUjRdu4w/4vQndSitK6o5ZTE2PjhmD7RWMcPfa40Sq41meX+JWus5e9l/XaOzQKfOwwg92Fox2gnrdK0UoHZju4NWTz54eRzxbZHarbNmH5Rl/2PNNZjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZjfTpbM2; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZjfTpbM2"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8475eca3a66so639149b3a.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 28 Jun 2026 20:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782703546; x=1783308346; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o3IG9Yp6Pjl+c9PKNtEae4TwSgGvYdWevGerwBQ6zPI=;
        b=ZjfTpbM2M/CUQT/bbrx7V6a1X5PgPt8xFgCQDbW5ZV7ZgqH3EeX79H+yG9KbBvqZ3u
         FosDl0qkUuQlVsSrcZs2fscAIW6JnFAdYVxItTR3OIu8AfIdHuLHF9w3fFbBnBlR+Gbo
         4lPFV2yRBl4vpfOqaEtJx6eSaFoLNhCOaV4AKYlaQ+8JwlIs9CS8c6m2dt5G5aRPvSoT
         wcpQBPI3wx1uLBXmd4lu2N5df+tgrtIfGOedOKbTMhHf0emlN9WjQzLpOOp7yV+R4IJc
         EKCUhr8gLxBOAzLiMGnFzYxx6fr3lwPhRpxDEviw3eePlV2snmT3oiCaBE/OqtYwie5l
         yCfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782703546; x=1783308346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o3IG9Yp6Pjl+c9PKNtEae4TwSgGvYdWevGerwBQ6zPI=;
        b=ce78Xi96aExz5oT5P1qF/Wdqj1QkY8WmhUi74IoPqCoEf3TuB52n9q4ZS0xs+uOawo
         S15CmLSDAC3MeSQG+TNAiRtkISHN/z9FpLXmys5L7XZL/K+e8iW/vsyWkF6JV2lgi16U
         rp84NMNLelnAtqL24OQQvLsIpBbSL8RaGmxx4/ydUFfAMvrZzSxVuy5Qpa7YYupPU2Te
         zcLfupiLrecHSMl1YBVk8R4srwIWI0Z8HzS+DyCU6bCqA0/0HjYoBLnRW1gloJemUEoV
         Yrn0jbCl0vxMqUbz1IpBSpqRqpAtAwfrJr4ZboZDMbIp6vcN/pcf0dQMOKwtMsT8/I+0
         df1Q==
X-Forwarded-Encrypted: i=1; AFNElJ8IJhDTyfP/x9ShbgaStBmObaEL71KpH7rhXJUiVpQy6RejIsXox0e/DMilhfMAfxcd3Ar0xpD+U+o6vIxl6sVs1A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0Tuv1tPE7/9MHLzzZGPS1jlfZJG4blYchIgtJv6hQxdgycxeR
	d4YlMSTjgB/jmCqnj4huH77KtQgK1VJCY58mkbbaFKqYpEUXdBBBj/29
X-Gm-Gg: AfdE7ckKMYosKzkFTZ+Mt9Rv2Cc2DIeWK5cX3JZwnC9XKOSvHWr2GD4OgmMdhsRx2tb
	E0bhJPktymF721scc1b+DE24xT8sqhZJiAQJFnKUc1y6eG6Nu5/uuY+vyTL2TbUtg6aVbm0/Aqd
	cPKotL+WX55UV5/QsWeLsz0QvEG9p705+tTGoXfxGE2bP9R9SjY3zpnJYOc8jJLOWYEfu1Z045D
	Z05b/pLYr82q4m1YiVicHiBJtD5+PicSe95nxRTSxQIz8CwICgwZ56s1J4kP1rctnjd7erZ+7ek
	DbSlrO0o/fnQx8Y14DZ2vYueUFispgu2fqoAX76ZCR+SUnhk3A16Pycr2y/ATq1vV8PV0Mrimc3
	wKeWATNef0zS60W5k69AaVcpE7ou872fm42qwhrEEhoFFyFLogyyPMKUV2/2gGUAf5AQ1D53RWo
	UXOngY1LYYR7Zrn2PulYX+OLXx9pcQSfpVpbtuFczf58tQSaGvAfOGWYyqa8bnwW4syf6Qydj8n
	mqsyzWqrQ==
X-Received: by 2002:a05:6a00:ad06:b0:82f:9407:d167 with SMTP id d2e1a72fcca58-845b3b89881mr15596736b3a.38.1782703546147;
        Sun, 28 Jun 2026 20:25:46 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-846c7f659ddsm1921771b3a.32.2026.06.28.20.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 20:25:45 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-samsung-soc@vger.kernel.org (open list:SAMSUNG SOC CLOCK DRIVERS),
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be|_ptr)?\b)
Subject: [PATCHv3 2/3] clk: samsung: cpu: use kzalloc_flex
Date: Sun, 28 Jun 2026 20:25:39 -0700
Message-ID: <20260629032540.2331559-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260629032540.2331559-1-rosenp@gmail.com>
References: <20260629032540.2331559-1-rosenp@gmail.com>
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

