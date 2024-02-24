Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C154D121
	for <linux-samsung-soc@vger.kernel.org>; Sat, 24 Feb 2024 20:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708806059; cv=none; b=IpPccnOe7iphUzwci9QM1Y5gMmDG2D0EnRnw4T6BBS+cggxWVIswiUZ+bquAp1cb/57fxl+imHQxmiBAZv0Wp7zUBZQdSVkLOG4zqZNbMo/ZQyAXHvrAhpLzxlE5ffg4KPBvx5jCTLlROe6QGgsSYlff+SZcPPXB6erPby7R1dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708806059; c=relaxed/simple;
	bh=fN7G3wPmBsJcgLlgsVKiAx8cGoftNtuuXTgf0LWnTHk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NeEK5UeYnNkR6QHO1cbRe3yVqS4D3CqduHWhzawNNddYDknj4p7T58WYY242Bcj3jK3pSvkmAyG4dCYWDGXmq36BlEgh7g3ug+d6pl6IAWsi+5LWg7WCI00L6JZ7j2yAkOUslXd4jR+8ni49gDWdZ7/CWGxEYeMDsNiv3ibWbWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dvSgK1nR; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dvSgK1nR"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-6e28bd74883so796759a34.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 24 Feb 2024 12:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708806056; x=1709410856; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T4GSfJijJ5j5tZLrOHCfmxmebAz3nZFw4CYMZ7bPECs=;
        b=dvSgK1nRbn7WRjpSKi8ySSRSfygHhpdwrNX4OcsRg7a4QmM24ZM9WN1mjOB5nnahj1
         r0MkgJJSqQ0NX1yzxS0iLsgdxmv8B0gfV3yI0WYnfRd2NHQU0Pywde1aDEkb/MHIgv1A
         K0IgdI1ehG8SSbyDhRJKvpaUJcbBnBK3XgfN164KYN7rVzfGkoHLF7p3E7S8J3tOboxF
         tigH5dQWR9dgDCBAXyv95b8pSez9lyyyk3EfR03GYdr6QXAPAuQb4kZIpgI33ltEExDd
         u7Yz9iv++1Ivp6kPea4TuzAYhi7JeIdy6YtyABBteo1YTb7m+lFP424IGBwhku43lsgY
         hhLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708806056; x=1709410856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T4GSfJijJ5j5tZLrOHCfmxmebAz3nZFw4CYMZ7bPECs=;
        b=e7vWZpLOhkkplVWu7YjSsCkXOJ6Hn/5LNEVO3yB2fbQNtbdnDm8da7e9Hqcn2mL4kS
         kVhzKsfpsNmCYtvtTl9E4Nku0xxqwdOqo6sR0uzQGj+7xXb4gIXQXMLrpN07osJMNL3A
         UufSWOLdToj43jP+L6Fimvq/+s9+0il5SD81zBkxEMW+pulCZaQe84dPFJmmkd88GJeL
         yexB7aPJOdWHte4SV4b7fsgLR4IY5+GCIcYO4Gh3m9xthzDOOhtqn/Ua/znR6Ke0cRuQ
         +X3Yl7/V7ecfUZxxwSrQpeiBVOx/KloHP2POLf8xRSQOJzWX9T2D/ReYf0jV6FCBW/p9
         ugzA==
X-Forwarded-Encrypted: i=1; AJvYcCXPuh7aMKi9VXINVf3NCFQC+n1b+OogBSvg24c/axq2t8hG4LTqr4clFPUgonZlHa9zaOa9ZXvf8qSJD7FGcg67+wjz3ET1CJq40kYRXQLyD28=
X-Gm-Message-State: AOJu0Yxaq97gsozW0vG2FfCR3OV5TBrpIwG8DGkzRsTnLKE8wGb64lyM
	oBncBVcc65A2UB+LpvF5/7WyWshB5Wud3DmRx72rgNvFQ/w35dY4OL2MVhGsOOs=
X-Google-Smtp-Source: AGHT+IFezpIvERjHD2pciFQcNjycbJTG/ZehyajyoyHMTJjZFoS0RTBxr/K78EmMg1zM64y7rVK69g==
X-Received: by 2002:a9d:754b:0:b0:6e4:527c:14b with SMTP id b11-20020a9d754b000000b006e4527c014bmr1191372otl.5.1708806056671;
        Sat, 24 Feb 2024 12:20:56 -0800 (PST)
Received: from localhost ([136.62.192.75])
        by smtp.gmail.com with ESMTPSA id t22-20020a0568301e3600b006e12266433csm407445otr.27.2024.02.24.12.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Feb 2024 12:20:56 -0800 (PST)
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
Subject: [PATCH v3 03/15] clk: samsung: Pull struct exynos_cpuclk into clk-cpu.c
Date: Sat, 24 Feb 2024 14:20:41 -0600
Message-Id: <20240224202053.25313-4-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240224202053.25313-1-semen.protsenko@linaro.org>
References: <20240224202053.25313-1-semen.protsenko@linaro.org>
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
Changes in v3:
  - none

Changes in v2:
  - none

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

