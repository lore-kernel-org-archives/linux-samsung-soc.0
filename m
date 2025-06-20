Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF882ED14B
	for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Jun 2025 18:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750443475; cv=none; b=CD5UuLdTO45VWDBhHEZpnkaSsyidSUdDwa2cmBAIAWpQNerOVbOUKApBeRCJKweGvEhlN5FPA5RlGXqed2hyF/qSQfHheZoE844x05qyhWrh+QH2WaXTc8Ii2yawqamlMVwl2hmZj56ldTAoOIMnFbbXaSFxayGEMx7t8JYkFGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750443475; c=relaxed/simple;
	bh=T/EqHStdzh8UFb34W8fcy5u18Dotea7TgFACUbOw974=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=n0d3o1yGwfa2OGeviLFZLj3uwHiG2pyNkmFU/HXD2hrZq+irso7zI5j+zQC7GfVop4ltfLGqI7qsgsU/oMgTA6IErCn5HCdo3ynN4eycYCaGRVkYMY8udhHOvjJoDH6wdqrEkT+OWo5ALVd9qf7ukh8+Aa0NGBpuDGKIcCNnqHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Y8Hc605X; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y8Hc605X"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-74834bc5d37so3269002b3a.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Jun 2025 11:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750443472; x=1751048272; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gIL6fhkHdPNft8maVBpSOO544g+cE+WjCmwBaVe/EH4=;
        b=Y8Hc605XVCn3BaJsMEQu2SKODL6Q8rbpxf5rbkF8lhBJ/cGC0vIDnE+8EJQNwxEJkW
         669WuCmSsu7jKC3vNdEP6dDi3m81DYVYoli4Wl+e0zB+61hq1pYc54TSS+DYWyEfdmMA
         SNf4vAmB5fPisIpeLyEJ9zCuB3jAGiM5DnFONM7ETwk8zi0wl2tqFj6KmM7v5JZjuzGy
         sbn3435QBbcvU/2e1rkcKd2prxiQkzy/uM0CJ4AX+kW3Y2+MDvnZ0yAAzROGB4C1iScj
         xJuvf+FzsJnlbeBFoijpVqJo9ecqQzn8yoJdB6YSQUmyuNl5VEZMNSwCClcM76nCVZMb
         ksZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750443472; x=1751048272;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gIL6fhkHdPNft8maVBpSOO544g+cE+WjCmwBaVe/EH4=;
        b=ovw74CIaaaU/NorB39mB2vuGFqrCf84VLX/gTv4ASawjts7Zcsd9cywqHn6H/TvlV0
         lHpduhCQH9xxVVKtGvXPJ+qKVhTTDJxSB9n5oVlOzmp//PQbf6QIp/G1sEXaS79iwzdx
         bTyRGjBIVSbEH4sqNoy/6wGs+Ucz0NX5ttVCTVRpEUeJvMEQEGZfxGQpNYxRcY2GdjoL
         E7oCcEupMPYGTNbAL71SktAQ7f8PV/dVggeGFahY7jaaB0Lmft4HuKp4C8h9WkHvDnLd
         tAsDw2B/ZfiXelHBF36254oQA+tqcbyVg0yCE75fke82CyO9PXohWcFKj9lTzh+j1Qyb
         bmZg==
X-Forwarded-Encrypted: i=1; AJvYcCVnvFnpIjYf4epKJDCB7VAzxlLZ1sZaGyyEfKnymedY7JWQT/2wZYWgM+cDgSkAJ7MkpkOPwTivH8IeUdSShDZXew==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1sRr8/3EBzSBBFrucuL4rCt1+3fDZDn3AZ+Bdzj1ZoZlsr3pI
	DLAAfkU0dv/1UrUXF+8W3o7jkbvU7L+xAlqej/bdRcn5ZQ7i5cuND3pcAFcH5jWGMwkeGYU20Gk
	e5vhDgDtI3MoQgevo+kEXAU/D2AhkRA==
X-Google-Smtp-Source: AGHT+IHhcpS8jQBHaCeQUGg91BpHtXl20Xrh3qifc5fqLmdTGkugLkpf6jc5U6PsrNzkrlwp5dWtop0DbjdaRfbq1xg=
X-Received: from pfwy15.prod.google.com ([2002:a05:6a00:1c8f:b0:739:8cd6:c16c])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:b40b:b0:215:da29:149f with SMTP id adf61e73a8af0-22026e95593mr6335474637.25.1750443471998;
 Fri, 20 Jun 2025 11:17:51 -0700 (PDT)
Date: Fri, 20 Jun 2025 11:17:08 -0700
In-Reply-To: <20250620181719.1399856-1-willmcvicker@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250620181719.1399856-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.50.0.rc2.761.g2dc52ea45b-goog
Message-ID: <20250620181719.1399856-6-willmcvicker@google.com>
Subject: [PATCH v4 5/6] clocksource/drivers/exynos_mct: Add module support
From: Will McVicker <willmcvicker@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>
Cc: Will McVicker <willmcvicker@google.com>, Donghoon Yu <hoony.yu@samsung.com>, 
	Hosung Kim <hosung0.kim@samsung.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	John Stultz <jstultz@google.com>, Youngmin Nam <youngmin.nam@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Donghoon Yu <hoony.yu@samsung.com>

On Arm64 platforms the Exynos MCT driver can be built as a module. On
boot (and even after boot) the arch_timer is used as the clocksource and
tick timer. Once the MCT driver is loaded, it can be used as the wakeup
source for the arch_timer.

Signed-off-by: Donghoon Yu <hoony.yu@samsung.com>
Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
[original commit from https://android.googlesource.com/kernel/gs/+/8a52a8288ec7d88ff78f0b37480dbb0e9c65bbfd]
Reviewed-by: Youngmin Nam <youngmin.nam@samsung.com>
Tested-by: Youngmin Nam <youngmin.nam@samsung.com>
Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 drivers/clocksource/Kconfig      |  3 +-
 drivers/clocksource/exynos_mct.c | 51 ++++++++++++++++++++++++++------
 2 files changed, 44 insertions(+), 10 deletions(-)

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index 645f517a1ac2..d657c8ddc96b 100644
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
index 62febeb4e1de..5075ebe052a7 100644
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
@@ -652,7 +657,7 @@ static int __init exynos4_timer_interrupts(struct device_node *np,
 	return err;
 }
 
-static int __init mct_init_dt(struct device_node *np, unsigned int int_type)
+static int mct_init_dt(struct device_node *np, unsigned int int_type)
 {
 	bool frc_shared = of_property_read_bool(np, "samsung,frc-shared");
 	u32 local_idx[MCT_NR_LOCAL] = {0};
@@ -700,15 +705,43 @@ static int __init mct_init_dt(struct device_node *np, unsigned int int_type)
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
-TIMER_OF_DECLARE(exynos4210, "samsung,exynos4210-mct", mct_init_spi);
-TIMER_OF_DECLARE(exynos4412, "samsung,exynos4412-mct", mct_init_ppi);
+
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
+module_platform_driver(exynos4_mct_driver);
+
+MODULE_DESCRIPTION("Exynos Multi Core Timer Driver");
+MODULE_LICENSE("GPL");
-- 
2.50.0.rc2.761.g2dc52ea45b-goog

