Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58DE21CC5A
	for <linux-samsung-soc@vger.kernel.org>; Mon, 31 Mar 2025 23:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743462055; cv=none; b=oBhmMqXgpwyhMPStw9a8Iq5kGd1fALSh8726DpwktlTnQA7TYzEOwHXMeJzvP/e05s+QR9mXynxXpfP7reGZYTBw3BK4B0NgptZE8S23sg+6Gtt35Oxceb9NRxe3sU6PK8jtdSnemBrXepJeiVsWJxrhrnn3v67QVJv70eD0lSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743462055; c=relaxed/simple;
	bh=ne78zXxTrl/nYlmfq+K5BGZIbA2NVuWMAyqVxlQu7dM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=IvPnyF4XbM+MrEM64Jo6sCvnfUFiBQ4/dfVe6bS97IE18DfHSHaCqG9wVHI5a8q6O1QRIx5zRswXVIhjNrTYPrPNPRYJWy0AKxVRpARg5woIRtayLn9lsz7Dmjg1NYGKg1NFGWNe+gfg0tyRqdBSonnOl8vO1RHnLRFryDiDJlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Y5WDjYoc; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y5WDjYoc"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ff6943febeso7737472a91.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 31 Mar 2025 16:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743462053; x=1744066853; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ulmUmxoKn2frrsYltohW0CKthat5ISQxrYAQM4kkNLU=;
        b=Y5WDjYocQCKQxFtEcvnjtD24XNmswdrFDEnQtl/Q8tyJjxKjY535amD2qZLEwdZMlx
         EU3sS++ppNwK1sMfIJLzraSs2qkWLsi0V6rqvIEtguUE2fob4A4Mvt5gewz8pq9n3eb+
         xDHlAXhez0x7smWNYIwWEfZV/CqrxqOmSvaAERZetIVDs8qhqBVkS5kAhYJ7MqtOlOhW
         UCwpU8nt8NNEcQdiYVQUlzJXdveKU0dxOAQz6n4D752WbXgUD8ajcOLAPWb0H6ZDb6xY
         3zZWE46F5ofvD0Wg9kWFQKsBfeIRZvpCEgKkfhyowLSRe72oAce5lroeV6ajVrAt3QFP
         GbgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743462053; x=1744066853;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ulmUmxoKn2frrsYltohW0CKthat5ISQxrYAQM4kkNLU=;
        b=PL5qUWOY7IEcxTq/UuS6oGY3TXFCQas3xeO+0wVI0JEzeYXv5AlwrIksnVcJa8uxAl
         iS+sS8aYyqjOC8dDaa2e6w9mF27ypJ7XYuSeUUSEGjTLlxtkIJxJxkYHiNn6k3JQgfAJ
         w6BRKH8IGelimCq1OLin1iU+NKlk9bf7uF+UFkAw7B4Wpyr0Q1RL/lRc1XdXfTleP+vo
         O/gV5ipJazb05WR0ZD9ewdDo/KWAGrmYjtXvfEdGn5x+Mk2MDeT66xVH4FMYS/N/fFfV
         30tlwubPdfJoL1JatxCHVyHn1huXOI5xwVX33Mi3BqzamiluzeSVZNG33Qw11LaPedMQ
         1ACA==
X-Forwarded-Encrypted: i=1; AJvYcCU8+7oxT4z9FjJZhxPLMKTbLtvy6J/e1gI2pSqpLFc6DZyHc1i6f6Kfc+GL9r5UOsQaKXiJ9ARObBQwJGaalI06OA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxiOD77B95etl9ifT8fTKtKGb9SJmcprXCVcWqLUZ2aFkxB2/uD
	5KAGdGfzP/JaNws9s4F5+rE50kBS9VpIGgcOnHAeqdgRQ/sp7ycRTOQx0WiguAS7tVqZvKyxIdW
	tunHqQlW2gY6TrUM7KT+QxuaAmg==
X-Google-Smtp-Source: AGHT+IE5NyFQYus/tf1QYYAFIfVAMg9yb/cSsm8CoRrwBXhSWC0iBExikv4kLw7OwXIeyQY2hQdq59zsfug5q/X9xxE=
X-Received: from pjbsb5.prod.google.com ([2002:a17:90b:50c5:b0:2ff:4ba2:f3a5])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:1cc7:b0:2fa:1d9f:c80 with SMTP id 98e67ed59e1d1-3051c9752admr21092256a91.17.1743462053067;
 Mon, 31 Mar 2025 16:00:53 -0700 (PDT)
Date: Mon, 31 Mar 2025 16:00:27 -0700
In-Reply-To: <20250331230034.806124-1-willmcvicker@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250331230034.806124-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250331230034.806124-6-willmcvicker@google.com>
Subject: [PATCH v1 5/6] clocksource/drivers/exynos_mct: Add module support
From: Will McVicker <willmcvicker@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Saravana Kannan <saravanak@google.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	Donghoon Yu <hoony.yu@samsung.com>, Youngmin Nam <youngmin.nam@samsung.com>
Content-Type: text/plain; charset="UTF-8"

From: Donghoon Yu <hoony.yu@samsung.com>

On Arm64 platforms the Exynos MCT driver can be built as a module. On
boot (and even after boot) the arch_timer is used as the clocksource and
tick timer. Once the MCT driver is loaded, it can be used as the wakeup
source for the arch_timer.

Signed-off-by: Donghoon Yu <hoony.yu@samsung.com>
Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
[Original commit from https://android.googlesource.com/kernel/gs/+/8a52a8288ec7d88ff78f0b37480dbb0e9c65bbfd]
Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 drivers/clocksource/Kconfig      |  3 +-
 drivers/clocksource/exynos_mct.c | 47 +++++++++++++++++++++++++++-----
 2 files changed, 42 insertions(+), 8 deletions(-)

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index 487c85259967..e5d9d8383607 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -443,7 +443,8 @@ config ATMEL_TCB_CLKSRC
 	  Support for Timer Counter Blocks on Atmel SoCs.
 
 config CLKSRC_EXYNOS_MCT
-	bool "Exynos multi core timer driver" if COMPILE_TEST
+	tristate "Exynos multi core timer driver"
+	default y if ARCH_EXYNOS
 	depends on ARM || ARM64
 	depends on ARCH_ARTPEC || ARCH_EXYNOS || COMPILE_TEST
 	help
diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
index 21ded37137d7..da4460d8a0ba 100644
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
 
@@ -235,7 +237,7 @@ static cycles_t exynos4_read_current_timer(void)
 }
 #endif
 
-static int __init exynos4_clocksource_init(bool frc_shared)
+static int exynos4_clocksource_init(bool frc_shared)
 {
 	/*
 	 * When the frc is shared, the main processor should have already
@@ -507,7 +509,7 @@ static int exynos4_mct_dying_cpu(unsigned int cpu)
 	return 0;
 }
 
-static int __init exynos4_timer_resources(struct device_node *np)
+static int exynos4_timer_resources(struct device_node *np)
 {
 	struct clk *mct_clk, *tick_clk;
 
@@ -535,7 +537,7 @@ static int __init exynos4_timer_resources(struct device_node *np)
  * @local_idx: array mapping CPU numbers to local timer indices
  * @nr_local: size of @local_idx array
  */
-static int __init exynos4_timer_interrupts(struct device_node *np,
+static int exynos4_timer_interrupts(struct device_node *np,
 					   unsigned int int_type,
 					   const u32 *local_idx,
 					   size_t nr_local)
@@ -640,7 +642,7 @@ static int __init exynos4_timer_interrupts(struct device_node *np,
 	return err;
 }
 
-static int __init mct_init_dt(struct device_node *np, unsigned int int_type)
+static int mct_init_dt(struct device_node *np, unsigned int int_type)
 {
 	bool frc_shared = of_property_read_bool(np, "samsung,frc-shared");
 	u32 local_idx[MCT_NR_LOCAL] = {0};
@@ -688,15 +690,46 @@ static int __init mct_init_dt(struct device_node *np, unsigned int int_type)
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
+#ifdef MODULE
+static int exynos4_mct_probe(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+
+	if (of_machine_is_compatible("samsung,exynos4412-mct"))
+		return mct_init_ppi(np);
+
+	return mct_init_spi(np);
+}
+
+static const struct of_device_id exynos4_mct_match_table[] = {
+	{ .compatible = "samsung,exynos4210-mct" },
+	{ .compatible = "samsung,exynos4412-mct" },
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
+#else
 TIMER_OF_DECLARE(exynos4210, "samsung,exynos4210-mct", mct_init_spi);
 TIMER_OF_DECLARE(exynos4412, "samsung,exynos4412-mct", mct_init_ppi);
+#endif
+
+MODULE_DESCRIPTION("Exynos Multi Core Timer Driver");
+MODULE_LICENSE("GPL");
-- 
2.49.0.472.ge94155a9ec-goog

