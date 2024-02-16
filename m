Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F23E148305
	for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Feb 2024 22:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708122772; cv=none; b=gDfpKKOU0OQRivOwtBmx/MW2nwRJPvyo51RdPbmcptPnTr9a9NUE7COqVilsQczydX9CcpMj2ByTrkwb8mIY/ZP7FrNDd3NSowcVHd3ZfF+5N0OQPx6tToe4VqKo2E6E9zqa5lJNk6cyXe+NWU8u8W67UlSe8Yvtq83KU6quTOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708122772; c=relaxed/simple;
	bh=+fQChFJcYp8jj7UhaXy8j1dFeHPJZY+1zRRcdznyYwM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=n8YyOpx51xYOUKvwlgBn/5ZWEOVWaSnTFvoC3zWhVIlp/IDhss1uWTBiM/LDVgSawIAnsjfWy6qsRZSd49AxS3ZX/dEh6/17Dw63fNx5PpnEbvbzkwoHekMkdwVZMvCwsPPuiHEXU9U7CmhLTcL1Qy6+zPNRmH/I8I9PZksbtlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HriQnBiL; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HriQnBiL"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-6e2d8a21b79so1075879a34.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Feb 2024 14:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708122768; x=1708727568; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qYcm4iJ3mR2A37/LSJBHbBeWlNo0peHIDmGfwHsrh+Y=;
        b=HriQnBiLZhHO3Evd9ttC6aqCG7TVXsLB+5ddCn8NaqL5Hln4h2QqCTdmQk5eUiBjiu
         reUHatxClTj11I4O6JoQw/tERhmwIHt39CDXUJXN/0CA0FU/6cUwEDf1R3ln6qyqoxQP
         mu4jSsWtnKFSjl0V0ZgzqTNQ0uqLYBKXE3jFgjnYRnB+5RsH8yyFfRYArg1E74sXPZTc
         0zn8PL1AmYvGedzvYF2E2dxdZDL9dO9foYNAojT5JP7nCUTYgYVoGdgyhpZc6hYRG2PJ
         hjWoCP4T0yCaPyNssqf/mlFmaJ63kxHooo5DPjNZ0GWxusROdR8kMtfQzxH8My05flxz
         Emqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708122768; x=1708727568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qYcm4iJ3mR2A37/LSJBHbBeWlNo0peHIDmGfwHsrh+Y=;
        b=aDSnNQFAdygvD/rSS3ves8qNsd8d0Vj5PuKtA7KKpgCQWLaFbuZNYZXtMjCTkRmtNY
         coJMKplxwDIq+GbBox3YQ2UAVE9GH3f4i65LZQd1IBeOyh8vdd4aql4L8H3HFR8f4bg4
         kr5iLfGMq24D/VAfRaB52+ZaGzEZQSEgMtHGAddz2+FSDUQ9451EONqCt25fcbECpfBl
         c66UlMISk5y7UtdGz6WbbhRZ4Wkx5v2P357hesj5YUjjaJFhGFgjeKkVHc5CDzcaSMDc
         TDk/s48g4UuQhm47EHLQaZ3EEJ660xTFSMcur2oA2VtokNpl0h7dpol5FpoSe+D/9v8x
         cwAQ==
X-Forwarded-Encrypted: i=1; AJvYcCV202SwECaY41IWwVwlNlZ4gJOG/vBzLAccGoZ1ouyZ2bp5rFSeU9MOUdnW+7SDQsmya9v4tOJqSoQ2pbHipi6KN/GvdPTC0nHliJh3dNBtYYE=
X-Gm-Message-State: AOJu0YxFgffpklPbL4hwBpJQ+Yh3Eu/5FYYgX9yvYQ8FTNpxi3qRiS7F
	r5wgVEEQiSccrVQomQeFfGKJOeham9EN36AHKeGYV6/8ec3yxRLhH8OeTqxcgP0=
X-Google-Smtp-Source: AGHT+IG5usWWuC05SJ1LiQq1mXPRGdfpc9cnTnEuYnyX99oRrWX3v74t1yyKDMb8eWaqJE3G7KVCPQ==
X-Received: by 2002:a05:6830:1158:b0:6e4:31e7:c158 with SMTP id x24-20020a056830115800b006e431e7c158mr4959777otq.19.1708122768363;
        Fri, 16 Feb 2024 14:32:48 -0800 (PST)
Received: from localhost ([136.62.192.75])
        by smtp.gmail.com with ESMTPSA id e24-20020a9d63d8000000b006e2e95e852csm140473otl.3.2024.02.16.14.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 14:32:47 -0800 (PST)
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
Subject: [PATCH 03/16] clk: samsung: Pull struct exynos_cpuclk into clk-cpu.c
Date: Fri, 16 Feb 2024 16:32:32 -0600
Message-Id: <20240216223245.12273-4-semen.protsenko@linaro.org>
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

Reduce the scope of struct exynos_cpuclk, as it's only used in clk-cpu.c
internally. All drivers using clk-pll.h already include clk.h as well,
so this change doesn't break anything.

No functional change.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 drivers/clk/samsung/clk-cpu.c | 29 +++++++++++++++++++++++++
 drivers/clk/samsung/clk-cpu.h | 41 +++++------------------------------
 2 files changed, 35 insertions(+), 35 deletions(-)

diff --git a/drivers/clk/samsung/clk-cpu.c b/drivers/clk/samsung/clk-cpu.c
index e02730776aaa..6412fd2580e0 100644
--- a/drivers/clk/samsung/clk-cpu.c
+++ b/drivers/clk/samsung/clk-cpu.c
@@ -34,6 +34,8 @@
 #include <linux/slab.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
+
+#include "clk.h"
 #include "clk-cpu.h"
 
 #define E4210_SRC_CPU		0x0
@@ -64,6 +66,33 @@
 #define DIV_MASK_ALL		GENMASK(31, 0)
 #define MUX_MASK		GENMASK(2, 0)
 
+/**
+ * struct exynos_cpuclk - information about clock supplied to a CPU core
+ * @hw:		handle between CCF and CPU clock
+ * @alt_parent:	alternate parent clock to use when switching the speed
+ *		of the primary parent clock
+ * @ctrl_base:	base address of the clock controller
+ * @lock:	cpu clock domain register access lock
+ * @cfg:	cpu clock rate configuration data
+ * @num_cfgs:	number of array elements in @cfg array
+ * @clk_nb:	clock notifier registered for changes in clock speed of the
+ *		primary parent clock
+ * @flags:	configuration flags for the CPU clock
+ *
+ * This structure holds information required for programming the CPU clock for
+ * various clock speeds.
+ */
+struct exynos_cpuclk {
+	struct clk_hw				hw;
+	const struct clk_hw			*alt_parent;
+	void __iomem				*ctrl_base;
+	spinlock_t				*lock;
+	const struct exynos_cpuclk_cfg_data	*cfg;
+	const unsigned long			num_cfgs;
+	struct notifier_block			clk_nb;
+	unsigned long				flags;
+};
+
 /*
  * Helper function to wait until divider(s) have stabilized after the divider
  * value has changed.
diff --git a/drivers/clk/samsung/clk-cpu.h b/drivers/clk/samsung/clk-cpu.h
index 0164bd9ad021..ee57f3638fed 100644
--- a/drivers/clk/samsung/clk-cpu.h
+++ b/drivers/clk/samsung/clk-cpu.h
@@ -8,7 +8,12 @@
 #ifndef __SAMSUNG_CLK_CPU_H
 #define __SAMSUNG_CLK_CPU_H
 
-#include "clk.h"
+/* The CPU clock registers have DIV1 configuration register */
+#define CLK_CPU_HAS_DIV1		BIT(0)
+/* When ALT parent is active, debug clocks need safe divider values */
+#define CLK_CPU_NEEDS_DEBUG_ALT_DIV	BIT(1)
+/* The CPU clock registers have Exynos5433-compatible layout */
+#define CLK_CPU_HAS_E5433_REGS_LAYOUT	BIT(2)
 
 /**
  * struct exynos_cpuclk_cfg_data - config data to setup cpu clocks
@@ -28,38 +33,4 @@ struct exynos_cpuclk_cfg_data {
 	unsigned long	div1;
 };
 
-/**
- * struct exynos_cpuclk - information about clock supplied to a CPU core
- * @hw:		handle between CCF and CPU clock
- * @alt_parent:	alternate parent clock to use when switching the speed
- *		of the primary parent clock
- * @ctrl_base:	base address of the clock controller
- * @lock:	cpu clock domain register access lock
- * @cfg:	cpu clock rate configuration data
- * @num_cfgs:	number of array elements in @cfg array
- * @clk_nb:	clock notifier registered for changes in clock speed of the
- *		primary parent clock
- * @flags:	configuration flags for the CPU clock
- *
- * This structure holds information required for programming the CPU clock for
- * various clock speeds.
- */
-struct exynos_cpuclk {
-	struct clk_hw				hw;
-	const struct clk_hw			*alt_parent;
-	void __iomem				*ctrl_base;
-	spinlock_t				*lock;
-	const struct exynos_cpuclk_cfg_data	*cfg;
-	const unsigned long			num_cfgs;
-	struct notifier_block			clk_nb;
-	unsigned long				flags;
-
-/* The CPU clock registers have DIV1 configuration register */
-#define CLK_CPU_HAS_DIV1		(1 << 0)
-/* When ALT parent is active, debug clocks need safe divider values */
-#define CLK_CPU_NEEDS_DEBUG_ALT_DIV	(1 << 1)
-/* The CPU clock registers have Exynos5433-compatible layout */
-#define CLK_CPU_HAS_E5433_REGS_LAYOUT	(1 << 2)
-};
-
 #endif /* __SAMSUNG_CLK_CPU_H */
-- 
2.39.2

