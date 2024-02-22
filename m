Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B0911C82
	for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Feb 2024 03:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708570961; cv=none; b=EEohD9sIRM5z8cgS2KTYU2kMLC40IV3GW5QK0qtQoxPlPy6iq4LomLUlaob3Vamd0kfbv77SEIKsrnqYmmclyvxhvasJalPnjLMJnSUZn4JBb/wDTNh4kasT+96z0gfElB6uRL2vIH8IiLoeLZ/MNngq/c39Mf7/bF7QU/+joaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708570961; c=relaxed/simple;
	bh=CcFhAmCDJkEu5GxkEEK6E6NiHlXy/EqrzMtZ/fWu8Y0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=M6N72THcDrRPLpjX26C6UCiPBpcskclFRhd8PRPvnCBnCzaJ+64R2Ci5cGA/gbG5zChf4VjB+NrvgY0Fep25c8e4vT6LwhFA4Tx+OtELgrl1Wa0njq1rWa/o8mSEdMvpU+C5FAegy7lY0A8v8O15vVWEEQ2X9+x96ZRIokJhCSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Hk3WRaC/; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hk3WRaC/"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-59fc2666815so1745794eaf.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 21 Feb 2024 19:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708570958; x=1709175758; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zl+WacIm9QRXQC0Y5/uv+FIwM1YVxoD9Cr7x73AtUv0=;
        b=Hk3WRaC/12Bq7RPoYrz98cXzhpL7PqKSKJMsCkmlmYwt+SU00G8C+3hbwbIS55KJvf
         9qC2QcA2YA0QQ1FAEZZ6RNiindIOZ9ayQgUGbZpVQLoL6S7RuL96foc6Eve54HMa282E
         UrQ/c6R4ZdhdudoKy9Hs73LsoafRdKwbGoeeCfyUWp1mJfyVvwF2QVTry0cyJ+QyEuBc
         x/RC7Cvr3CaQyKZYEprfrD1mkIoR30M1Ey75dnQ3H18V6Z8hhbF3HGTtYLQnuaFdAGZj
         S4+pac1XCugBSMRsQagk4EzdJ3UaeI/Xww4llnaRfHfZ4sKLYmg+AZHu1YXRp2tuouQL
         qnMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708570958; x=1709175758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zl+WacIm9QRXQC0Y5/uv+FIwM1YVxoD9Cr7x73AtUv0=;
        b=w0BOGqupJQtWkMkFi/U1WC68aP/tGMQbGgoDsREa3Y7oxdD4GY8hTt1BBS3pwl+ffs
         b3qzmGOPyjsi+r+VfiWjlQgfxATlAMpBlS7mabfXa+gXgTv77cX6JD4xvy8rEDUpZhRq
         NSVGlC9JGLeDzubnvjpAH+5H029l7tg7gxyY3O+zuTE6o1CBXB2e+mNtW7A0gjG4Bi9x
         zpOboYqZvnvuGTTnggLGZ8wmjMCo+M4NOpyQRpgL3ItzcMYr+qs5E/VEmWjvC3FbOBoI
         gJfkLqNDr37lFrBJ4SNfj3dhC//mHxs89TcUGSLGv8MqnR6EyGETudZfgntOHqnpFg4+
         Y3Jg==
X-Forwarded-Encrypted: i=1; AJvYcCXsHqPUpaYDqnfuZUaTsoetsnqLITNHCUpJCviNP0UglBZDOphOOKvgwh1rxAdBaGqug0xvCa8UuZ5oJUYeY5D4KVBs0L6DahDixkL5iv/D5Pg=
X-Gm-Message-State: AOJu0Yx33L2Ci2njVXw6L++ZODDzXLRhXhhJPvTSHU/5WKl3OaNvaPlP
	3zsUaYgzKoGBIkgKNsNqGS6unCSKCXSi1y7aFvL/+WkVZpNJyYjmXkzNrURwwFs=
X-Google-Smtp-Source: AGHT+IH2HSioJXyNfPWhTv8Aki4+YIBLaNkslaAzYgx78hcG5wWTUzPaMZ6CmaxOILUiQ333qL2zzQ==
X-Received: by 2002:a4a:6116:0:b0:5a0:294d:dca4 with SMTP id n22-20020a4a6116000000b005a0294ddca4mr458878ooc.8.1708570958584;
        Wed, 21 Feb 2024 19:02:38 -0800 (PST)
Received: from localhost ([136.62.192.75])
        by smtp.gmail.com with ESMTPSA id k15-20020a056830168f00b006e12023de5fsm1900371otr.46.2024.02.21.19.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 19:02:38 -0800 (PST)
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
Subject: [PATCH v2 03/15] clk: samsung: Pull struct exynos_cpuclk into clk-cpu.c
Date: Wed, 21 Feb 2024 21:02:23 -0600
Message-Id: <20240222030235.27815-4-semen.protsenko@linaro.org>
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

Reduce the scope of struct exynos_cpuclk, as it's only used in clk-cpu.c
internally. All drivers using clk-pll.h already include clk.h as well,
so this change doesn't break anything.

No functional change.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
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

