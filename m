Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFDF32D0C92
	for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Oct 2025 05:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760333241; cv=none; b=HgU0zKwXXJ33XxUphE6zFJ0dnVrbZ8HVRfI6YcsqWIDHVPzLxXCWy+E0KlKAIArcbMXZKHUdnpD1Y3dqHr37Gooa6KzRsTfTx/CDz5NkYDp5ZY5M7l5SS7rZSJke8NOZJBGmvm2lBrw493U1xAvKaXO9wGRhQUbTWdRtIfPjFrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760333241; c=relaxed/simple;
	bh=vR9nKyPffL2VDU8rb6utkrmttWxZIF+kzlDY5Kd7Wjs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hqNE8NfB1CLF1de7KReZmj1GSUALvRVMeOzrCCNCtSay74S9h61fNtsJOw35mvpf9Y+rD/5fMu+dPP0ppgtPCLO7RYZlWR+KQawoQCm09v0SmQ9SrtN8lwWNzo3UDXTkEGOYRTb4Hgqyq8jqjeJkHcxD3gCuRjh9vNvwP6q6UF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X8eXP6hm; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X8eXP6hm"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-639fe77bb29so5808546a12.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Oct 2025 22:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760333238; x=1760938038; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7VJrEJBNZ6VriBGsN1UMBP9n7t2CYVLrBXMdoP5t8UM=;
        b=X8eXP6hmWxrqB/scWbXcJ6QM2ZtimGgPo5kqrumB7Uj1PJBa3N+VMthto/DZDdfOn/
         R8PW0fpLaurdC9VgAIzc0vlB5nqFoTB3vkfcoWMMRmnVgTPssyPNWEHP3TFdUUsl1RV7
         sOVKcEhRGJfwQ3uS0DKBCgz4F7U84d/srXUxlWK69TLJTod8bjxS3wUyAI97qavekS2g
         i69qm8jhM1yLJk6vJBU8bsmCLLgiJAYekQMGslGsMp7DMO3uAKv1u519NUS+rnKrReSj
         tj/Dn+0B3dZYBqmx4fTs/YYwxZ+w3zAICGipItF9lUPyX9PTsfBhEuE0PcF5I7b7pBLC
         3nlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760333238; x=1760938038;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7VJrEJBNZ6VriBGsN1UMBP9n7t2CYVLrBXMdoP5t8UM=;
        b=mADEQ54h2Ko1FC95+9Chkj9kmDavRkC1Y7RJdv22cfB4Ud3WT54M+MWeyCOMsEDLE6
         NTT5zurfpJVl36RhZBZC417vAFm/uJ0TFkg2UZ7RQJ56X4IuoRAk6lfQZkNRyQglseOB
         0A71LiKXM6iDKZ9C0KytjS8wnBc+dA6pptF5uTxOjLsTt62SDg+fZOfB3RNrXw9gke8M
         FzeV379hhKYIPAV+AizPehgQ5HB3fRDMDJ1KE8eskwJSbA3GWqajnTKZiL7kpRWHiP+U
         5JmY2Z71sR55MiYwAsN6WySUG/PspZYbeBO+r4kIAdzX5TZ5beYgFMH22SWfYPqiPp5+
         hdNw==
X-Forwarded-Encrypted: i=1; AJvYcCWRgesTvE2SWMyCV9gzB0uPSXvGkJ4es2Xtw3froUyCGMCcockgcPParcTXmVN6HkM7fpYcYZC+SqvI64kzEderaw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzjD/EYNvbv2dITajcgdzd3glDP28qlZhYPRDlzdRBv357LKKuZ
	m2zJWiaEzwJH4ORzv/5Px/hbwFVvfKk1A7zXx+OLZGoKLxCBU7/AXbZoZ6Zxik36IEg=
X-Gm-Gg: ASbGnctL0VrIejtf7Es8TgpkkGiK6qmu9Rc9unFzzZLVshekhUO4DaOSYWdom7WBvj4
	VUKz/tX74/IjirwlqlA1BTCgINPZqCL5IwjePTlQWJg/56/3cLGfPo6WXu3EZ1yih4/H2bkh20C
	mJ9ffwJeSjj3W2IdnA/0s7YhgRkXiJU1R0uVBOkwU7nn290AIOyOpwsv2UeVHbAna/bytHIxTmA
	Uh5jg7UuQYw6//TbSnZxcfjGvY0tOZYIpv0y+58Mlp5F2csW7GJzJzyFy6pJaf3Esu88YjcP99D
	FmRNt9HtpJUd1IcnbjD1Rg55QjhQTEnRaD7ewXN7vRmJcoug5ONAMywR9N8+K16c2JrGQ7bPw19
	VxugZoXUemx0tDn8BjY3Mg8G8OMneQtrlDr5e4lHgcwlDAp2ahHv+d6c5yhfQOdATjecnQSi7Lx
	D2UGFGw1lWcr95xNfbiAVtCHQ+vjUWzbdg95k=
X-Google-Smtp-Source: AGHT+IHUNo2sp45AF3K1U65pU1zYD6XjGU7jIcshwZlsBDQ3QedzAm3HkYPvI5oJO4ZrZSWC+P9Mgg==
X-Received: by 2002:a05:6402:350a:b0:63a:690:8080 with SMTP id 4fb4d7f45d1cf-63a069082a3mr13232653a12.6.1760333238273;
        Sun, 12 Oct 2025 22:27:18 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63b7334cb4bsm5392310a12.44.2025.10.12.22.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 22:27:17 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 13 Oct 2025 06:27:16 +0100
Subject: [PATCH v2] clk: samsung: clk-pll: simplify samsung_pll_lock_wait()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251013-samsung-clk-pll-simplification-v2-1-b9aab610878c@linaro.org>
X-B4-Tracking: v=1; b=H4sIALON7GgC/42NQQ6CMBBFr0K6dkxn1CiuvIdhUWEKE0tLWmw0h
 LtbOYHL95P/3qISR+GkrtWiImdJEnwB2lWqHYzvGaQrrEjTCbVGSGZML99D654wOQdJxsmJldb
 M5QoH1mQvNRISqSKZIlt5b4F7U3iQNIf42XoZf+vf6oyA0CF1bGs+Hx90c+JNDPsQe9Ws6/oFz
 htrRc0AAAA=
X-Change-ID: 20251001-samsung-clk-pll-simplification-3e02f8912122
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sam Protsenko <semen.protsenko@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

readl_relaxed_poll_timeout_atomic() has been updated in 2023 in
commit 7349a69cf312 ("iopoll: Do not use timekeeping in
read_poll_timeout_atomic()") to avoid usage of timekeeping APIs. It
also never used udelay() when no delay was given.

With the implementation avoiding timekeeping APIs, and with a caller
not passing a delay, the timeout argument simply becomes a loop
counter.

Therefore the code here can be simplified to unconditionally use
readl_relaxed_poll_timeout_atomic(). The difference being the last
argument, the timeout (loop counter). Simply adjust it to pass the
more generous counter in all cases.

This change also allows us to drop all code around the
pll_early_timeout variable as it is unused now.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Changes in v2:
- drop pll_early_timeout (Krzysztof)
- drop timekeeping.h
- collect tags
- Link to v1: https://lore.kernel.org/r/20251001-samsung-clk-pll-simplification-v1-1-d12def9e74b2@linaro.org
---
 drivers/clk/samsung/clk-pll.c | 41 ++++++++++-------------------------------
 1 file changed, 10 insertions(+), 31 deletions(-)

diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index 7bea7be1d7e45c32f0b303ffa55ce9cde4a4f71d..0a8fc9649ae2975b1b19669fd5192bae984aa57b 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -11,14 +11,12 @@
 #include <linux/iopoll.h>
 #include <linux/delay.h>
 #include <linux/slab.h>
-#include <linux/timekeeping.h>
 #include <linux/clk-provider.h>
 #include <linux/io.h>
 #include "clk.h"
 #include "clk-pll.h"
 
-#define PLL_TIMEOUT_US		20000U
-#define PLL_TIMEOUT_LOOPS	1000000U
+#define PLL_TIMEOUT_LOOPS	20000U
 
 struct samsung_clk_pll {
 	struct clk_hw		hw;
@@ -71,20 +69,11 @@ static int samsung_pll_determine_rate(struct clk_hw *hw,
 	return 0;
 }
 
-static bool pll_early_timeout = true;
-
-static int __init samsung_pll_disable_early_timeout(void)
-{
-	pll_early_timeout = false;
-	return 0;
-}
-arch_initcall(samsung_pll_disable_early_timeout);
-
 /* Wait until the PLL is locked */
 static int samsung_pll_lock_wait(struct samsung_clk_pll *pll,
 				 unsigned int reg_mask)
 {
-	int i, ret;
+	int ret;
 	u32 val;
 
 	/*
@@ -93,25 +82,15 @@ static int samsung_pll_lock_wait(struct samsung_clk_pll *pll,
 	 * initialized, another when the timekeeping is suspended. udelay() also
 	 * cannot be used when the clocksource is not running on arm64, since
 	 * the current timer is used as cycle counter. So a simple busy loop
-	 * is used here in that special cases. The limit of iterations has been
-	 * derived from experimental measurements of various PLLs on multiple
-	 * Exynos SoC variants. Single register read time was usually in range
-	 * 0.4...1.5 us, never less than 0.4 us.
+	 * is used here.
+	 * The limit of iterations has been derived from experimental
+	 * measurements of various PLLs on multiple Exynos SoC variants. Single
+	 * register read time was usually in range 0.4...1.5 us, never less than
+	 * 0.4 us.
 	 */
-	if (pll_early_timeout || timekeeping_suspended) {
-		i = PLL_TIMEOUT_LOOPS;
-		while (i-- > 0) {
-			if (readl_relaxed(pll->con_reg) & reg_mask)
-				return 0;
-
-			cpu_relax();
-		}
-		ret = -ETIMEDOUT;
-	} else {
-		ret = readl_relaxed_poll_timeout_atomic(pll->con_reg, val,
-					val & reg_mask, 0, PLL_TIMEOUT_US);
-	}
-
+	ret = readl_relaxed_poll_timeout_atomic(pll->con_reg, val,
+						val & reg_mask, 0,
+						PLL_TIMEOUT_LOOPS);
 	if (ret < 0)
 		pr_err("Could not lock PLL %s\n", clk_hw_get_name(&pll->hw));
 

---
base-commit: 2b763d4652393c90eaa771a5164502ec9dd965ae
change-id: 20251001-samsung-clk-pll-simplification-3e02f8912122

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

