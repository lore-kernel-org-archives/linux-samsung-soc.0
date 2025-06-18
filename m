Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7BC266F15
	for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Jun 2025 21:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750280957; cv=none; b=iwnALf7TiY8ZmfX5Yc1Zgy9OwJrxVapJZCP9cCjI79mOyWhQ8b3tvgIlJ21fQ/eiYXSkW7mmW0UE7dcdjQ9VWsURhF6SIPxl3oE93JrXWcYimGtE7cesJKKiRhF8NxF2oSYSTdtJ0olbwPYiuw5QEWv3eP73pZRf7P16tOP91no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750280957; c=relaxed/simple;
	bh=T/EqHStdzh8UFb34W8fcy5u18Dotea7TgFACUbOw974=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ErU5tHBbA0Zl034Z+QhCWOCfyfhfB4I3Fo3AQ4THIBMHquvuuswfgSHzta8Ze1vkFIk0RZC59C1uWA9/msTv7DWPW094TLANSjQgdgu1673uS4Na3hHRUoTNJLZluPOTl9YZOwIimnjGmzUAfsH3wOgjXNyDG9Wn9okpxl6Xx/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=w07BWVr+; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="w07BWVr+"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b2eeff19115so153418a12.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Jun 2025 14:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750280955; x=1750885755; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gIL6fhkHdPNft8maVBpSOO544g+cE+WjCmwBaVe/EH4=;
        b=w07BWVr+Tv/+1Zd3s9diduB2T2ei6et1nJvxX/lYDc0mXDrpdtaI0AwtT0e/qpuBP9
         rfKRxK32LFWALyHw3+XBRg6SuK2E090fzF/mAzGP+Avpqamfi/BTivRnkH45uyJHefzZ
         Bp2QA+e8gwDq9ZpO2cGA2ZYfWXitwCSweiIih8/4rJ6Y28LGnH5MFDOnTVYRdpNL4Cym
         Q+RmF/+3tFRFGcXYP1fOjeM+ua1m0f27vjxrKzPam6XG0PCN/ultufvfCne/A5MUP6iq
         Y94ahYkPz7bcztr2FW+KvVORqLt/HAMoaNeM7m9HBqSdniYqMQr9Ti3JS5ZeersRTtFd
         DR+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750280955; x=1750885755;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gIL6fhkHdPNft8maVBpSOO544g+cE+WjCmwBaVe/EH4=;
        b=KotVGoX0gCiDJ2I5iEfYks7eG25Xtg7mWnS9VBZc/KghK4CXVmwNrfwWnpVHpF8NO/
         0fgj1NOKluBYKXGeFPfZOyPqmQVIHjU8ya4mYPTIxoXp/IOGHGH50Z4X8wbG9MvZw/ZK
         4eBF+oAug96PGRhnFNEoBtbMcE0Dal3ZbiPlMOYwL/ZtflMHgtSTOjufBEEV0z1cGGS6
         DP6TVDvfIi4J3k9T65KdYgMtUUrKfs+QLTNN7cSBNK5lXmZT8WP4aIVF26AXMbLa3417
         TQijoRatbuA/i3fM/sNZxAlGHUMlZm8BTR4U1UsJBwwd7wZc4zBCPQFjnlV1s0W/lBAd
         5SQg==
X-Forwarded-Encrypted: i=1; AJvYcCWmHF81RUYCK8gR8e3fChFyK/s7KjOCGoc7KWSrhkjf3SZz5qRlZ3zkvMES4L8oiqGDuNIEXaIYwF3ljlxmciXM7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwouNRvyuCJS5MGX9de188F/SZ/Ytn+MSZ1Dxulu1vpJanN69BO
	/J7zmUQ7w+YUjUtfscbmD2GyBY2dthIpFv3zn6Uqhg4NwWRu1CZ4uRBI+kQuwYF90kgZnhkvOp+
	af8yhHBf11G1Yq43dAblCqyse6tFymA==
X-Google-Smtp-Source: AGHT+IHdDjzxdo1HGP6QlVRrnKT5gA9M5OvibMCONxm3z96cNU3S1Z/hLsGC6B3so+Cuoqve4t9KC+tV0xkkJdypmqk=
X-Received: from pjb7.prod.google.com ([2002:a17:90b:2f07:b0:312:f650:c7aa])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2d48:b0:312:db8:dbdc with SMTP id 98e67ed59e1d1-313f1ce6893mr29225313a91.20.1750280955670;
 Wed, 18 Jun 2025 14:09:15 -0700 (PDT)
Date: Wed, 18 Jun 2025 14:08:42 -0700
In-Reply-To: <20250618210851.661527-1-willmcvicker@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250618210851.661527-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.50.0.rc2.761.g2dc52ea45b-goog
Message-ID: <20250618210851.661527-6-willmcvicker@google.com>
Subject: [PATCH 5/6] clocksource/drivers/exynos_mct: Add module support
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

