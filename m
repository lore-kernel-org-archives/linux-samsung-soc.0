Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA2734F275
	for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Nov 2025 18:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763664183; cv=none; b=bhAru+LyQYe+c38M63FLuaf/C6xucPQLWQEgOZPC7kEw9f2YlQiQGzMbUeKGbKeDGdTmNp0Ia+X4B/BbxfIZHNPjRnFN7fkiTfVAgMEckOPG5wfTvb9Dz8z5/UqRxnJP4fuV5zb/4JJpXoje3P69QWFRobdtaQQg8fehxq+zI9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763664183; c=relaxed/simple;
	bh=Lgs6szvmIjWdxADOFBIkAezHEVnva2pxFGhSnDvsil8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Gw8UrCFIaHMNdUbRtVcqPJM8uNHsW9p479siFFfyx84Th15cllSWuEBnLdJsEVggAJeq3WKTdPUx2iYlii5S0ExNczxXWBtpcctzpjEQqzzs4lKLpN1hy3NYdNam2iIhRH+X9j/AX+5u4vjc2zd5e03/GdgaeSeZ25PRGO9hLhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TA3YrxYJ; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TA3YrxYJ"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-297f3710070so31905275ad.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Nov 2025 10:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763664180; x=1764268980; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7ZhynQ1C+Qi97UwkIs4tb4ijOuArkDPdVuCjShevDQ4=;
        b=TA3YrxYJ7L7wl5Lsh5PfVkWHeh42cOvbqU4b9vpkJX+ALM6WoC++Vl+KChSL9dm8Ne
         c0kv+b6Rh6AK0gAGa4FkM72bk/GOd1Ystzt4LmN4DSPltm1hqmrD94U+3uqaewfQoEj+
         4FXPfbwPkvlA4FPwOy/KuyNMX/iP0PP62zMd1aNeRnsO4nU4PBt3fdhb+pz/ADEkiLFf
         hy/ghJ2amZuHGpaz2EJKUiY5VDMJmeUuy7hEjJPgiHCH6pRq+QSRrLk0u9926Qb26eKL
         693OPxXzWwF/KSaAHn8tS/irbkjPmU5Gcb+dt2gB5a5o33Vk088dPP43V0+Ydhs1DivG
         1Qhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763664180; x=1764268980;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7ZhynQ1C+Qi97UwkIs4tb4ijOuArkDPdVuCjShevDQ4=;
        b=XQ9VWlc1RuxN6cmEmJWg8simvdfOBgyUIZFuG29sUKhSrNtfA67LWQlCUF33mPw72r
         2hM6fPf8kdEXure9tu/r8BUN/EB1HtnZmGgDutPr+wS9vWcZQ4RpxJ1WYLTfGJMsTraL
         QCo4nlAwHPEYMJpLMgYZnfm6n4BL/eC2IKqcr0eUiftcsGEa+a1s8BYr4uy+bi9m1h3H
         kE6w+2qFPnf2+WudXMpqpsWaWO8FwaMgeQ25aVF5m0Ksy2PhCuJW1SeL944ub1INFGB2
         CPI/5ROf+RbNV0SwBVt3P9TA787DCzS442CfQoDv9qO5irjjhg3ERZ4n1oEVBxTtGKCD
         b9FQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQ+DA93WzmZbZ2YpFR629ColmZ9VKiV58oUmUYirVYPfIxx6MAd2TGpofNJXT4X8EGs6pdEHfJaFA1Ql4n+oROMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkDn2MX4WbCOYKtLFas1s99i7lKN+YLQIP2oFm749O9LqRjYPY
	PfjoQIuJlgPLixz6CjS0jUDQ2cz7Zd1LZMzltwKEGUxd5nDtmHvpMDvjzJmeqlxdjX/9Yfqr9Ms
	ru6DESZthgKV0+ni42n57kyY/mcDO2g==
X-Google-Smtp-Source: AGHT+IEt/Rnu04z2aH9Z9OLNbqRP/pUTKYo+u1/ArFiPePsuZbsDWIhlzIUZmUyy2hjC5k2QI/TnRwU+QRzQbAqqPns=
X-Received: from plgu3.prod.google.com ([2002:a17:902:e803:b0:290:d4a1:13cb])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:1a44:b0:258:f033:3ff9 with SMTP id d9443c01a7336-29b5b0fe951mr55111265ad.48.1763664180062;
 Thu, 20 Nov 2025 10:43:00 -0800 (PST)
Date: Thu, 20 Nov 2025 18:42:33 +0000
In-Reply-To: <20251120184242.1625820-1-willmcvicker@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251120184242.1625820-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.52.0.rc2.455.g230fcf2819-goog
Message-ID: <20251120184242.1625820-6-willmcvicker@google.com>
Subject: [PATCH v6 5/6] clocksource/drivers/exynos_mct: Add module support for ARM64
From: Will McVicker <willmcvicker@google.com>
To: Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, Donghoon Yu <hoony.yu@samsung.com>, 
	Hosung Kim <hosung0.kim@samsung.com>, Rob Herring <robh@kernel.org>, 
	John Stultz <jstultz@google.com>, Youngmin Nam <youngmin.nam@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, 
	kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Donghoon Yu <hoony.yu@samsung.com>

On Arm64 platforms the Exynos MCT driver can be built as a module. On
boot (and even after boot) the arch_timer is used as the clocksource and
tick timer. Once the MCT driver is loaded, it can be used as the wakeup
source for the arch_timer.

Signed-off-by: Donghoon Yu <hoony.yu@samsung.com>
Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
[original commit from https://android.googlesource.com/kernel/gs/+/8a52a8288ec7d88ff78f0b37480dbb0e9c65bbfd]
Reviewed-by: Youngmin Nam <youngmin.nam@samsung.com> # AOSP -> Linux port
Tested-by: Youngmin Nam <youngmin.nam@samsung.com> # AOSP -> Linux port
Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 drivers/clocksource/Kconfig      |  3 +-
 drivers/clocksource/exynos_mct.c | 62 ++++++++++++++++++++++++++++----
 2 files changed, 57 insertions(+), 8 deletions(-)

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index ffcd23668763..9450cfaf982f 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -451,7 +451,8 @@ config ATMEL_TCB_CLKSRC
 	  Support for Timer Counter Blocks on Atmel SoCs.
 
 config CLKSRC_EXYNOS_MCT
-	bool "Exynos multi core timer driver" if COMPILE_TEST
+	tristate "Exynos multi core timer driver" if ARM64
+	default y if ARCH_EXYNOS || COMPILE_TEST
 	depends on ARM || ARM64
 	depends on ARCH_ARTPEC || ARCH_EXYNOS || COMPILE_TEST
 	help
diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
index fece6bbc190e..55ce1d0b648e 100644
--- a/drivers/clocksource/exynos_mct.c
+++ b/drivers/clocksource/exynos_mct.c
@@ -15,9 +15,11 @@
 #include <linux/cpu.h>
 #include <linux/delay.h>
 #include <linux/percpu.h>
+#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_irq.h>
 #include <linux/of_address.h>
+#include <linux/platform_device.h>
 #include <linux/clocksource.h>
 #include <linux/sched_clock.h>
 
@@ -217,6 +219,7 @@ static struct clocksource mct_frc = {
 	.mask		= CLOCKSOURCE_MASK(32),
 	.flags		= CLOCK_SOURCE_IS_CONTINUOUS,
 	.resume		= exynos4_frc_resume,
+	.owner		= THIS_MODULE,
 };
 
 /*
@@ -241,7 +244,7 @@ static cycles_t exynos4_read_current_timer(void)
 }
 #endif
 
-static int __init exynos4_clocksource_init(bool frc_shared)
+static int exynos4_clocksource_init(bool frc_shared)
 {
 	/*
 	 * When the frc is shared, the main processor should have already
@@ -336,6 +339,7 @@ static struct clock_event_device mct_comp_device = {
 	.set_state_oneshot	= mct_set_state_shutdown,
 	.set_state_oneshot_stopped = mct_set_state_shutdown,
 	.tick_resume		= mct_set_state_shutdown,
+	.owner			= THIS_MODULE,
 };
 
 static irqreturn_t exynos4_mct_comp_isr(int irq, void *dev_id)
@@ -476,6 +480,7 @@ static int exynos4_mct_starting_cpu(unsigned int cpu)
 	evt->features = CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT |
 			CLOCK_EVT_FEAT_PERCPU;
 	evt->rating = MCT_CLKEVENTS_RATING;
+	evt->owner = THIS_MODULE;
 
 	exynos4_mct_write(TICK_BASE_CNT, mevt->base + MCT_L_TCNTB_OFFSET);
 
@@ -511,7 +516,7 @@ static int exynos4_mct_dying_cpu(unsigned int cpu)
 	return 0;
 }
 
-static int __init exynos4_timer_resources(struct device_node *np)
+static int exynos4_timer_resources(struct device_node *np)
 {
 	struct clk *mct_clk, *tick_clk;
 
@@ -539,7 +544,7 @@ static int __init exynos4_timer_resources(struct device_node *np)
  * @local_idx: array mapping CPU numbers to local timer indices
  * @nr_local: size of @local_idx array
  */
-static int __init exynos4_timer_interrupts(struct device_node *np,
+static int exynos4_timer_interrupts(struct device_node *np,
 					   unsigned int int_type,
 					   const u32 *local_idx,
 					   size_t nr_local)
@@ -653,7 +658,7 @@ static int __init exynos4_timer_interrupts(struct device_node *np,
 	return err;
 }
 
-static int __init mct_init_dt(struct device_node *np, unsigned int int_type)
+static int mct_init_dt(struct device_node *np, unsigned int int_type)
 {
 	bool frc_shared = of_property_read_bool(np, "samsung,frc-shared");
 	u32 local_idx[MCT_NR_LOCAL] = {0};
@@ -701,15 +706,58 @@ static int __init mct_init_dt(struct device_node *np, unsigned int int_type)
 	return exynos4_clockevent_init();
 }
 
-
-static int __init mct_init_spi(struct device_node *np)
+static int mct_init_spi(struct device_node *np)
 {
 	return mct_init_dt(np, MCT_INT_SPI);
 }
 
-static int __init mct_init_ppi(struct device_node *np)
+static int mct_init_ppi(struct device_node *np)
 {
 	return mct_init_dt(np, MCT_INT_PPI);
 }
+
+#ifdef CONFIG_ARM
+/* Note, legacy ARM 32-bit systems depend on the MCT as the only clocksource
+ * which requires this driver to be initialized very early. We need to keep this
+ * special condition until we can transparently support modular and early init
+ * timers.
+ */
 TIMER_OF_DECLARE(exynos4210, "samsung,exynos4210-mct", mct_init_spi);
 TIMER_OF_DECLARE(exynos4412, "samsung,exynos4412-mct", mct_init_ppi);
+#else
+static int exynos4_mct_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	int (*mct_init)(struct device_node *np);
+
+	mct_init = of_device_get_match_data(dev);
+	if (!mct_init)
+		return -EINVAL;
+
+	return mct_init(dev->of_node);
+}
+
+static const struct of_device_id exynos4_mct_match_table[] = {
+	{ .compatible = "samsung,exynos4210-mct", .data = &mct_init_spi, },
+	{ .compatible = "samsung,exynos4412-mct", .data = &mct_init_ppi, },
+	{}
+};
+MODULE_DEVICE_TABLE(of, exynos4_mct_match_table);
+
+static struct platform_driver exynos4_mct_driver = {
+	.probe		= exynos4_mct_probe,
+	.driver		= {
+		.name	= "exynos-mct",
+		.of_match_table = exynos4_mct_match_table,
+	},
+};
+
+static __init int exynos_mct_init(void)
+{
+  return platform_driver_register(&exynos4_mct_driver);
+}
+module_init(exynos_mct_init);
+
+MODULE_DESCRIPTION("Exynos Multi Core Timer Driver");
+MODULE_LICENSE("GPL");
+#endif /* CONFIG_ARM */
-- 
2.52.0.rc2.455.g230fcf2819-goog

