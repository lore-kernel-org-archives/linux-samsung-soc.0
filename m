Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0832149000
	for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Feb 2024 22:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708122775; cv=none; b=fzCuSGtP9wM8qA4C9N4GZO/IZmstcDpx8ALhjp/T7n1VHFh2Rxj03P19H717MAg7akHbJKgX0rZ2mva1AZwlBRsj8E7KiG0ZL0vXhEgXdFvirbfHl45w472aBPDlRjb6n5jKe4461jq5IQtb5yygUj6v5QpgN0Mtqdw75EVm8c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708122775; c=relaxed/simple;
	bh=1peV2N9hxDmggLKdh7aFERIj95Gt9U9ZGNpYQuU+WrQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WoirG4JFhuh76xyawTJ/gIOWj5/xmhOXw29T1iJICsST+TGfaSYqtqPoxzNMJnL3ObohLcBcWEuCGstBFIQ7Br9Ck8H/4oS7Di867irLU94NzhzbvZyQ9F/8Lw+whi+N0FRqlrFRTaDsnHfhA6np9fl28sBMVS3sUQH7v5iJVHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qHY9ftYJ; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qHY9ftYJ"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6e2db19761fso1166195a34.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Feb 2024 14:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708122771; x=1708727571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tfRvgXqx0o89/jIPwVq9FOvHNq0zNnYAgZUMMD+pgCc=;
        b=qHY9ftYJgEEml1e0A0ue2EqDJzRSgZJLOgxS4LjBiek6b9tjyttURAWUayZMDsb+RB
         8//ZQGd2cct5/aQMuMknyXRnVxrCsOaT1LI/oHhcW7HSiROpC8PYgx/kr/CrsuPb6v1B
         vRfU5nQuYBb5UPaPjp4AfC45gs2gDNK9baw/yL07Be3o5a3HxXeKdXCSLb/x4R//Xmrf
         JI67WS06FgxIKN70HGwbRtIKvhbp2YOy0S9LJ0St8BShIiu1+ymqfYBLkyTBw1ljq3J9
         kX3fEMLFd0JdFxv1XYMqIBQlFyiq5alqUTiVfBc8amRpGyJtWvhoUtl4yXKV45gg+8ZX
         NK1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708122771; x=1708727571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tfRvgXqx0o89/jIPwVq9FOvHNq0zNnYAgZUMMD+pgCc=;
        b=szyY4MtLU3sbF8rXCEi7wPTR1aUoEc58a/WRWTmC2aa63UsVHWGr6/05svgIqI9S6c
         RRlkYLsG2rLSsW3JUi9JpCfGIwI9frfx3PE8D8LLwuCQuhTX4BGDbQOdh0o/vSK6zWvg
         eD3tAcqTzjhtt4MWi3s142vANZJ0/nQAJp3gT/dBR3c+w6TsYk7YMUmyGBUmFG4oiO90
         A+W7KBgVP+34dDuz6iRdHkq8tm8TeE7Ht0iWMSjBJgA+CXknMYCHokCnX7KkleG5b0BE
         vgRKCNXVPWVMqA8SsvcIxn/zMX7alf+ekhFu0KmhH22xKGm4E1pcTHK6Ym0AQs/gRJAJ
         eN3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUjYLxlNf40SWS0aMf5IwqDSbfsIQiIWRMwlkjDw1idWtBolvbFvZldW6KJ7M9axfCFMpmM/PHyzogctI8bYbeEU1l3YXMo/iQv9C0KUMekE4s=
X-Gm-Message-State: AOJu0Yw6x9A4ydfzTKS7+/BRdPSHTchB0ENAUyT6pCHfqTbsC+n050Sx
	eg9LVVnXVfm0ifGfQZ+g+MTBYnJdZfBfB6ytiIWDacmbTtd4u2sSOdsh3xJxwp4=
X-Google-Smtp-Source: AGHT+IF7bibVE1W3KD3RSDLPJfujDyjjy+ib1uB5sIYPvE+GAkA1MctPfQz7bt1SnSx9MsQsSyXlHQ==
X-Received: by 2002:a9d:7ccd:0:b0:6e2:e7d7:d6b8 with SMTP id r13-20020a9d7ccd000000b006e2e7d7d6b8mr6408623otn.9.1708122771683;
        Fri, 16 Feb 2024 14:32:51 -0800 (PST)
Received: from localhost ([136.62.192.75])
        by smtp.gmail.com with ESMTPSA id r12-20020a05683001cc00b006e130365f5esm139136ota.34.2024.02.16.14.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 14:32:51 -0800 (PST)
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
Subject: [PATCH 07/16] clk: samsung: Pass actual clock controller base address to CPU_CLK()
Date: Fri, 16 Feb 2024 16:32:36 -0600
Message-Id: <20240216223245.12273-8-semen.protsenko@linaro.org>
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

The documentation for struct exynos_cpuclk says .ctrl_base field should
contain the controller base address. But in reality all Exynos clock
drivers are passing CPU_SRC register address via CPU_CLK() macro, which
in turn gets assigned to mentioned .ctrl_base field. Because CPU_SRC
address usually already has 0x200 offset from controller's base, all
other register offsets in clk-cpu.c (like DIVs and MUXes) are specified
as offsets from CPU_SRC offset, and not from controller's base. That
makes things confusing and not consistent with register offsets provided
in Exynis clock drivers, also breaking the contract for .ctrl_base field
as described in struct exynos_cpuclk doc. Rework all register offsets in
clk-cpu.c to be actual offsets from controller's base, and fix offsets
provided to CPU_CLK() macro in all Exynos clock drivers.

No functional change.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 drivers/clk/samsung/clk-cpu.c        | 24 ++++++++++++------------
 drivers/clk/samsung/clk-exynos3250.c |  2 +-
 drivers/clk/samsung/clk-exynos4.c    |  9 ++++++---
 drivers/clk/samsung/clk-exynos5250.c |  4 ++--
 drivers/clk/samsung/clk-exynos5420.c | 16 ++++++++--------
 drivers/clk/samsung/clk-exynos5433.c | 10 ++++------
 6 files changed, 33 insertions(+), 32 deletions(-)

diff --git a/drivers/clk/samsung/clk-cpu.c b/drivers/clk/samsung/clk-cpu.c
index d550a4bb632f..a59949990919 100644
--- a/drivers/clk/samsung/clk-cpu.c
+++ b/drivers/clk/samsung/clk-cpu.c
@@ -125,12 +125,12 @@ static void wait_until_mux_stable(void __iomem *mux_reg, u32 mux_pos,
 
 /* ---- Exynos 3/4/5 -------------------------------------------------------- */
 
-#define E4210_SRC_CPU		0x0
-#define E4210_STAT_CPU		0x200
-#define E4210_DIV_CPU0		0x300
-#define E4210_DIV_CPU1		0x304
-#define E4210_DIV_STAT_CPU0	0x400
-#define E4210_DIV_STAT_CPU1	0x404
+#define E4210_SRC_CPU		0x200
+#define E4210_STAT_CPU		0x400
+#define E4210_DIV_CPU0		0x500
+#define E4210_DIV_CPU1		0x504
+#define E4210_DIV_STAT_CPU0	0x600
+#define E4210_DIV_STAT_CPU1	0x604
 
 #define E4210_DIV0_RATIO0_MASK	GENMASK(2, 0)
 #define E4210_DIV1_HPM_MASK	GENMASK(6, 4)
@@ -271,12 +271,12 @@ static int exynos_cpuclk_post_rate_change(struct clk_notifier_data *ndata,
 
 /* ---- Exynos5433 ---------------------------------------------------------- */
 
-#define E5433_MUX_SEL2		0x008
-#define E5433_MUX_STAT2		0x208
-#define E5433_DIV_CPU0		0x400
-#define E5433_DIV_CPU1		0x404
-#define E5433_DIV_STAT_CPU0	0x500
-#define E5433_DIV_STAT_CPU1	0x504
+#define E5433_MUX_SEL2		0x208
+#define E5433_MUX_STAT2		0x408
+#define E5433_DIV_CPU0		0x600
+#define E5433_DIV_CPU1		0x604
+#define E5433_DIV_STAT_CPU0	0x700
+#define E5433_DIV_STAT_CPU1	0x704
 
 /*
  * Helper function to set the 'safe' dividers for the CPU clock. The parameters
diff --git a/drivers/clk/samsung/clk-exynos3250.c b/drivers/clk/samsung/clk-exynos3250.c
index a02461667664..bf149fae04c3 100644
--- a/drivers/clk/samsung/clk-exynos3250.c
+++ b/drivers/clk/samsung/clk-exynos3250.c
@@ -775,7 +775,7 @@ static const struct exynos_cpuclk_cfg_data e3250_armclk_d[] __initconst = {
 
 static const struct samsung_cpu_clock exynos3250_cpu_clks[] __initconst = {
 	CPU_CLK(CLK_ARM_CLK, "armclk", CLK_MOUT_APLL, CLK_MOUT_MPLL_USER_C,
-			CLK_CPU_HAS_DIV1, 0x14200, e3250_armclk_d),
+		CLK_CPU_HAS_DIV1, 0x14000, e3250_armclk_d),
 };
 
 static void __init exynos3_core_down_clock(void __iomem *reg_base)
diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
index 4ec41221e68f..d5b1e9f49d8b 100644
--- a/drivers/clk/samsung/clk-exynos4.c
+++ b/drivers/clk/samsung/clk-exynos4.c
@@ -1252,17 +1252,20 @@ static const struct exynos_cpuclk_cfg_data e4412_armclk_d[] __initconst = {
 
 static const struct samsung_cpu_clock exynos4210_cpu_clks[] __initconst = {
 	CPU_CLK(CLK_ARM_CLK, "armclk", CLK_MOUT_APLL, CLK_SCLK_MPLL,
-			CLK_CPU_NEEDS_DEBUG_ALT_DIV | CLK_CPU_HAS_DIV1, 0x14200, e4210_armclk_d),
+		CLK_CPU_NEEDS_DEBUG_ALT_DIV | CLK_CPU_HAS_DIV1, 0x14000,
+		e4210_armclk_d),
 };
 
 static const struct samsung_cpu_clock exynos4212_cpu_clks[] __initconst = {
 	CPU_CLK(CLK_ARM_CLK, "armclk", CLK_MOUT_APLL, CLK_MOUT_MPLL_USER_C,
-		CLK_CPU_NEEDS_DEBUG_ALT_DIV | CLK_CPU_HAS_DIV1, 0x14200, e4212_armclk_d),
+		CLK_CPU_NEEDS_DEBUG_ALT_DIV | CLK_CPU_HAS_DIV1, 0x14000,
+		e4212_armclk_d),
 };
 
 static const struct samsung_cpu_clock exynos4412_cpu_clks[] __initconst = {
 	CPU_CLK(CLK_ARM_CLK, "armclk", CLK_MOUT_APLL, CLK_MOUT_MPLL_USER_C,
-			CLK_CPU_NEEDS_DEBUG_ALT_DIV | CLK_CPU_HAS_DIV1, 0x14200, e4412_armclk_d),
+		CLK_CPU_NEEDS_DEBUG_ALT_DIV | CLK_CPU_HAS_DIV1, 0x14000,
+		e4412_armclk_d),
 };
 
 /* register exynos4 clocks */
diff --git a/drivers/clk/samsung/clk-exynos5250.c b/drivers/clk/samsung/clk-exynos5250.c
index 8ebe6155d8b7..58df80de52ef 100644
--- a/drivers/clk/samsung/clk-exynos5250.c
+++ b/drivers/clk/samsung/clk-exynos5250.c
@@ -776,8 +776,8 @@ static const struct exynos_cpuclk_cfg_data exynos5250_armclk_d[] __initconst = {
 };
 
 static const struct samsung_cpu_clock exynos5250_cpu_clks[] __initconst = {
-	CPU_CLK(CLK_ARM_CLK, "armclk", CLK_MOUT_APLL, CLK_MOUT_MPLL, CLK_CPU_HAS_DIV1, 0x200,
-			exynos5250_armclk_d),
+	CPU_CLK(CLK_ARM_CLK, "armclk", CLK_MOUT_APLL, CLK_MOUT_MPLL,
+		CLK_CPU_HAS_DIV1, 0x0, exynos5250_armclk_d),
 };
 
 static const struct of_device_id ext_clk_match[] __initconst = {
diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index 199843f12ae5..bd7b304d2c00 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -1555,17 +1555,17 @@ static const struct exynos_cpuclk_cfg_data exynos5420_kfcclk_d[] __initconst = {
 };
 
 static const struct samsung_cpu_clock exynos5420_cpu_clks[] __initconst = {
-	CPU_CLK(CLK_ARM_CLK, "armclk", CLK_MOUT_APLL, CLK_MOUT_MSPLL_CPU, 0, 0x200,
-			exynos5420_eglclk_d),
-	CPU_CLK(CLK_KFC_CLK, "kfcclk", CLK_MOUT_KPLL, CLK_MOUT_MSPLL_KFC, 0, 0x28200,
-			exynos5420_kfcclk_d),
+	CPU_CLK(CLK_ARM_CLK, "armclk", CLK_MOUT_APLL, CLK_MOUT_MSPLL_CPU, 0,
+		0x0, exynos5420_eglclk_d),
+	CPU_CLK(CLK_KFC_CLK, "kfcclk", CLK_MOUT_KPLL, CLK_MOUT_MSPLL_KFC, 0,
+		0x28000, exynos5420_kfcclk_d),
 };
 
 static const struct samsung_cpu_clock exynos5800_cpu_clks[] __initconst = {
-	CPU_CLK(CLK_ARM_CLK, "armclk", CLK_MOUT_APLL, CLK_MOUT_MSPLL_CPU, 0, 0x200,
-			exynos5800_eglclk_d),
-	CPU_CLK(CLK_KFC_CLK, "kfcclk", CLK_MOUT_KPLL, CLK_MOUT_MSPLL_KFC, 0, 0x28200,
-			exynos5420_kfcclk_d),
+	CPU_CLK(CLK_ARM_CLK, "armclk", CLK_MOUT_APLL, CLK_MOUT_MSPLL_CPU, 0,
+		0x0, exynos5800_eglclk_d),
+	CPU_CLK(CLK_KFC_CLK, "kfcclk", CLK_MOUT_KPLL, CLK_MOUT_MSPLL_KFC, 0,
+		0x28000, exynos5420_kfcclk_d),
 };
 
 static const struct of_device_id ext_clk_match[] __initconst = {
diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
index 6bfc5d0cd924..d3779eefb438 100644
--- a/drivers/clk/samsung/clk-exynos5433.c
+++ b/drivers/clk/samsung/clk-exynos5433.c
@@ -3700,9 +3700,8 @@ static const struct exynos_cpuclk_cfg_data exynos5433_apolloclk_d[] __initconst
 
 static const struct samsung_cpu_clock apollo_cpu_clks[] __initconst = {
 	CPU_CLK(CLK_SCLK_APOLLO, "apolloclk", CLK_MOUT_APOLLO_PLL,
-			CLK_MOUT_BUS_PLL_APOLLO_USER,
-			CLK_CPU_HAS_E5433_REGS_LAYOUT, 0x200,
-			exynos5433_apolloclk_d),
+		CLK_MOUT_BUS_PLL_APOLLO_USER, CLK_CPU_HAS_E5433_REGS_LAYOUT,
+		0x0, exynos5433_apolloclk_d),
 };
 
 static const struct samsung_cmu_info apollo_cmu_info __initconst = {
@@ -3945,9 +3944,8 @@ static const struct exynos_cpuclk_cfg_data exynos5433_atlasclk_d[] __initconst =
 
 static const struct samsung_cpu_clock atlas_cpu_clks[] __initconst = {
 	CPU_CLK(CLK_SCLK_ATLAS, "atlasclk", CLK_MOUT_ATLAS_PLL,
-			CLK_MOUT_BUS_PLL_ATLAS_USER,
-			CLK_CPU_HAS_E5433_REGS_LAYOUT, 0x200,
-			exynos5433_atlasclk_d),
+		CLK_MOUT_BUS_PLL_ATLAS_USER, CLK_CPU_HAS_E5433_REGS_LAYOUT,
+		0x0, exynos5433_atlasclk_d),
 };
 
 static const struct samsung_cmu_info atlas_cmu_info __initconst = {
-- 
2.39.2

