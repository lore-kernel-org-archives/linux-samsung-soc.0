Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7723570B8;
	Tue,  9 Sep 2025 18:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757441221; cv=none; b=Pkekunzu7idFAjlPuzM0diJq/6CPBm42mF24k2RQy6hzvU+htGAzQrHmvAH0Z+FBtoHLO24BQ7+Z2W4lTArKvOKiJKX4LjnImjP95TtU9BVdwltjs3xrM7f+LNlJsYmeqPqYnECHFvxBPPivjXWcK7Z9eqvJIbhDLUXr8n/594o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757441221; c=relaxed/simple;
	bh=COUUp+dytOaa4h0pvUMtk0BvGhM37JjC6rq+LUDaqtA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=enzhmKBC7rcCpokxz6uv7HGD1wsuWfjGe2osNe1vQE/Jw7OYo0TJY0EKcklT4rGdB+i5dluYFPBTKSQ6wyX4Di+1o7kzh0LVw/+pOqE3NPRGi4rhV9aQFzWzuz9OJYLCfyVfxswLj4/EIdoz4cJ4ztccd2i357ap/oa/EhWWqZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g6tg5HaR; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g6tg5HaR"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-32b6108f2d5so4295576a91.3;
        Tue, 09 Sep 2025 11:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757441219; x=1758046019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lC2S89uWVd4kKLJY+Z3L6fWfhN36m0m3rdw9eQ0mhyM=;
        b=g6tg5HaRn2pY6C4v6V0IH2GCiA8s3Y8lskDauOEpHv+HEA+3KlSWB1zcZWKQyQOF15
         VajrP5nZ0LFmERX86zybdrBYoNJHcRG3atgJ3VcALZdYTzTpsRIEvhNxMgXMua4GG3yy
         IYCEd49MYbzBFVmr65ifHhn1kyYCpEdo4B90PJ/p9tQ7GoW/2diJLiiSYWjzJdR29+GB
         6j6sTjOtpCL6u54IXruFOKMQBk6fVcZIUfOGKJSet3SOBdP59EP0VaqoVasKLzNtkn2r
         tjacWEiRSh4ySCddtVlGGw7QNXLs9IkMEmRqxp5XEFDqwgiylnaxTzEnG8KZdD8WhGsr
         gyvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757441219; x=1758046019;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lC2S89uWVd4kKLJY+Z3L6fWfhN36m0m3rdw9eQ0mhyM=;
        b=wIdMNYBb6g/sRDH58UU0+58u28c8jbcTjp29GIYKTeF1pGFX143nkr0k91PDIu8Gr4
         WzXeDugPtfYu8Q62oWXL2Ely6lfUrQVwDw2mYf5xuPwBtD/ukhnNBScWJpJXNKYTnqQj
         nflT28IDkB6EZaKYzB0SCad5N08DBB7CyAz7WAmEl9YycxmYUMrJ4a8LsAi+YFrNA3/b
         bbL2LV5XJyLW1kROrzVkg0Z+KvmF1AJnAT0LlMtnIVCwsoQ7elqGL/qt2Bk+18KOb41+
         NSUomY4/UtSTzOx8nLif5wx3vMUubu6roYK213KLvFiE8dgI7gN8edO+FzynNUWWZnma
         garA==
X-Forwarded-Encrypted: i=1; AJvYcCV46ybBpYz3WL1e+ZUzVFFpatn56V3cSVRr1ce/7IeZBfr/6fWO2JRkDwymMIC63VZULh8A8G6U+9QZqYjM@vger.kernel.org, AJvYcCVHKamF1TokTle2W8pjQYh66vLCJaAAjTIWn+SfSeyQ798340MBIJt0mTH2twpH6NaxpRTySDGY6Pp8X/lUkZeFOsE=@vger.kernel.org, AJvYcCWlxiSAMWwrdyrPWasuvwx6Ult0+1G27QTMvzKXwSqmRkxaXHsz8HvbMexBQXZaYCA5iwEeHPd7SqI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEevcqO9OrUmTCmVVxSUmC4dwkHIt+UTcl4ZWZEmMSzLXUnk9J
	KJBW113ogEEnKUz6BglXdBGT/+OI4EMWc5041XoHNYP05EDBSUJzNnO+
X-Gm-Gg: ASbGncvWXgn35fFnX2yGXrBe12D7EtIv3bWapZhOy0n8Q6pCjUhkpVsaP31ADCjcAIO
	7KiEi8GMldXelmhOorK9ScR5thbQkosuLG+KXhhwQA4KWoks1iGSyKFvaCHNhzMgfodEsfqwyyT
	hjtbA5c7wOrkgsXP93+8XtCn7zheStXHg10he7hvLrIGbGRNWiy1KYXG2KMg3t6B4IfnfsZPkUZ
	RkajUxDS6yedl9LYSXjeSfLVegIll2fZCrK2GeujJQ/dj1JXSe+0QLRR09eADC1shRCPK4dK/tt
	M/SRmm2q/FnbHKHUKVxW0P5YhIk3bkrYV3Ql+1PZae79eyLAFWET8VdQ9ibMRvPfDd+okcL0BBo
	B8ANf2bryia7MvljcVxBTmB75OraXwYg=
X-Google-Smtp-Source: AGHT+IEQ8Fdk0HbZvmKlziMWHOi6q7YSOReqEYtXvWbMeLz8O2VLpBEy5+WUL5qEMmSebQfRgcmeeQ==
X-Received: by 2002:a17:90b:3dcc:b0:329:e9da:35d0 with SMTP id 98e67ed59e1d1-32d43ef5112mr14793775a91.5.1757441218843;
        Tue, 09 Sep 2025 11:06:58 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.216])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-327da8e7186sm35182693a91.16.2025.09.09.11.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 11:06:58 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-samsung-soc@vger.kernel.org (open list:SAMSUNG SOC CLOCK DRIVERS),
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v1] clk: samsung: exynos5420: Add support for power control registers
Date: Tue,  9 Sep 2025 23:36:49 +0530
Message-ID: <20250909180652.7130-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As per the Exynos5422 user manual, settings for the PWR_CTRL, PWR_CTRL2,
PWR_CTRL_KFC, and PWR_CNTL_KFC registers manage ARM clock down and up
configurations for idle and standby states.

The Exynos5422's dynamic clock frequency down feature enables automatic
clock down when all CPU cores are in Wait For Event (WFE) or
Wait For Interrupt (WFI) states, utilizing this feature in standby
configurations.

These modifications enhance the power management capabilities of the
Exynos542x by providing finer control over the ARM clock behavior in
various states.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/clk/samsung/clk-exynos5420.c | 111 +++++++++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index a9df4e6db82fa..ce4c554eb59f1 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -8,6 +8,7 @@
  */
 
 #include <dt-bindings/clock/exynos5420.h>
+#include <linux/bitfield.h>
 #include <linux/slab.h>
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
@@ -29,6 +30,8 @@
 #define CLKOUT_CMU_CPU		0xa00
 #define SRC_MASK_CPERI		0x4300
 #define GATE_IP_G2D		0x8800
+#define PWR_CTRL		0x1020
+#define PWR_CTRL2		0x1024
 #define CPLL_LOCK		0x10020
 #define DPLL_LOCK		0x10030
 #define EPLL_LOCK		0x10040
@@ -139,10 +142,50 @@
 #define KPLL_CON0		0x28100
 #define SRC_KFC			0x28200
 #define DIV_KFC0		0x28500
+#define PWR_CTRL_KFC		0x29020
+#define PWR_CTRL2_KFC		0x29024
 
 /* NOTE: Must be equal to the last clock ID increased by one */
 #define CLKS_NR			(CLK_DOUT_PCLK_DREX1 + 1)
 
+/* Below definitions are used for PWR_CTRL settings */
+#define PWR_CTRL_ARM2_RATIO_MASK       GENMASK(30, 28)
+#define PWR_CTRL_ARM_RATIO_MASK        GENMASK(18, 16)
+#define PWR_CTRL_DIVARM2_DOWN_ENB      BIT(9)
+#define PWR_CTRL_DIVARM_DOWN_ENB       BIT(8)
+#define PWR_CTRL_USE_STANDBYWFE_ARM_CORE3  BIT(7)
+#define PWR_CTRL_USE_STANDBYWFE_ARM_CORE2  BIT(6)
+#define PWR_CTRL_USE_STANDBYWFE_ARM_CORE1  BIT(5)
+#define PWR_CTRL_USE_STANDBYWFE_ARM_CORE0  BIT(4)
+#define PWR_CTRL_USE_STANDBYWFI_ARM_CORE3  BIT(3)
+#define PWR_CTRL_USE_STANDBYWFI_ARM_CORE2  BIT(2)
+#define PWR_CTRL_USE_STANDBYWFI_ARM_CORE1  BIT(1)
+#define PWR_CTRL_USE_STANDBYWFI_ARM_CORE0  BIT(0)
+
+#define PWR_CTRL2_DIVARM2_UP_ENB       BIT(25)
+#define PWR_CTRL2_DIVARM_UP_ENB        BIT(24)
+#define PWR_CTRL2_DUR_STANDBY2_MASK    GENMASK(23, 16)
+#define PWR_CTRL2_DUR_STANDBY1_MASK    GENMASK(15, 8)
+#define PWR_CTRL2_UP_ARM2_RATIO_MASK   GENMASK(6, 4)
+#define PWR_CTRL2_UP_ARM_RATIO_MASK    GENMASK(2, 0)
+
+/* Below definitions are used for PWR_CTRL_KFC settings */
+#define PWR_CTRL_KFC_RATIO_MASK       GENMASK(21, 16)
+#define PWR_CTRL_KFC_DIVKFC_DOWN_ENB       BIT(8)
+#define PWR_CTRL_KFC_USE_STANDBYWFE_ARM_CORE3  BIT(7)
+#define PWR_CTRL_KFC_USE_STANDBYWFE_ARM_CORE2  BIT(6)
+#define PWR_CTRL_KFC_USE_STANDBYWFE_ARM_CORE1  BIT(5)
+#define PWR_CTRL_KFC_USE_STANDBYWFE_ARM_CORE0  BIT(4)
+#define PWR_CTRL_KFC_USE_STANDBYWFI_ARM_CORE3  BIT(3)
+#define PWR_CTRL_KFC_USE_STANDBYWFI_ARM_CORE2  BIT(2)
+#define PWR_CTRL_KFC_USE_STANDBYWFI_ARM_CORE1  BIT(1)
+#define PWR_CTRL_KFC_USE_STANDBYWFI_ARM_CORE0  BIT(0)
+
+#define PWR_CTRL2_KFC_DIVKFC_UP_ENB        BIT(24)
+#define PWR_CTRL2_KFC_DUR_STANDBY2_MASK    GENMASK(23, 16)
+#define PWR_CTRL2_KFC_DUR_STANDBY1_MASK    GENMASK(15, 8)
+#define PWR_CTRL2_KFC_UP_ARM_RATIO_MASK    GENMASK(5, 0)
+
 /* Exynos5x SoC type */
 enum exynos5x_soc {
 	EXYNOS5420,
@@ -1574,6 +1617,72 @@ static const struct of_device_id ext_clk_match[] __initconst = {
 	{ },
 };
 
+static void __init exynos5420_core_down_clock(void)
+{
+	unsigned int tmp;
+
+	/*
+	 * Enable arm clock down (in idle) and set arm divider
+	 * ratios in WFI/WFE state.
+	 */
+	tmp = (FIELD_PREP(PWR_CTRL_ARM2_RATIO_MASK, 7) |
+		FIELD_PREP(PWR_CTRL_ARM_RATIO_MASK, 7) |
+		PWR_CTRL_DIVARM_DOWN_ENB |
+		PWR_CTRL_DIVARM2_DOWN_ENB |
+		PWR_CTRL_USE_STANDBYWFE_ARM_CORE3 |
+		PWR_CTRL_USE_STANDBYWFE_ARM_CORE2 |
+		PWR_CTRL_USE_STANDBYWFE_ARM_CORE1 |
+		PWR_CTRL_USE_STANDBYWFE_ARM_CORE0 |
+		PWR_CTRL_USE_STANDBYWFI_ARM_CORE3 |
+		PWR_CTRL_USE_STANDBYWFI_ARM_CORE2 |
+		PWR_CTRL_USE_STANDBYWFI_ARM_CORE1 |
+		PWR_CTRL_USE_STANDBYWFI_ARM_CORE0);
+
+	writel_relaxed(tmp, reg_base + PWR_CTRL);
+
+	/*
+	 * Enable arm clock up (on exiting idle). Set arm divider
+	 * ratios when not in idle along with the standby duration
+	 * ratios.
+	 */
+	tmp = (PWR_CTRL2_DIVARM2_UP_ENB | PWR_CTRL2_DIVARM_UP_ENB |
+		FIELD_PREP(PWR_CTRL2_DUR_STANDBY2_MASK, 3) |
+		FIELD_PREP(PWR_CTRL2_DUR_STANDBY1_MASK, 3) |
+		FIELD_PREP(PWR_CTRL2_UP_ARM2_RATIO_MASK, 3) |
+		FIELD_PREP(PWR_CTRL2_UP_ARM_RATIO_MASK, 2));
+
+	writel_relaxed(tmp, reg_base + PWR_CTRL2);
+
+	/*
+	 * Enable arm clock down (in idle) and set kfc divider
+	 * ratios in WFI/WFE state.
+	 */
+	tmp = (FIELD_PREP(PWR_CTRL_KFC_RATIO_MASK, 7) |
+		PWR_CTRL_KFC_DIVKFC_DOWN_ENB |
+		PWR_CTRL_KFC_USE_STANDBYWFE_ARM_CORE3 |
+		PWR_CTRL_KFC_USE_STANDBYWFE_ARM_CORE2 |
+		PWR_CTRL_KFC_USE_STANDBYWFE_ARM_CORE1 |
+		PWR_CTRL_KFC_USE_STANDBYWFE_ARM_CORE0 |
+		PWR_CTRL_KFC_USE_STANDBYWFI_ARM_CORE3 |
+		PWR_CTRL_KFC_USE_STANDBYWFI_ARM_CORE2 |
+		PWR_CTRL_KFC_USE_STANDBYWFI_ARM_CORE1 |
+		PWR_CTRL_KFC_USE_STANDBYWFI_ARM_CORE0);
+
+	writel_relaxed(tmp, reg_base + PWR_CTRL_KFC);
+
+	/*
+	 * Enable arm clock up (on exiting idle). Set kfc divider
+	 * ratios when not in idle along with the standby duration
+	 * ratios.
+	 */
+	tmp = (PWR_CTRL2_KFC_DIVKFC_UP_ENB |
+		FIELD_PREP(PWR_CTRL2_KFC_DUR_STANDBY2_MASK, 3) |
+		FIELD_PREP(PWR_CTRL2_KFC_DUR_STANDBY1_MASK, 3) |
+		FIELD_PREP(PWR_CTRL2_KFC_UP_ARM_RATIO_MASK, 2));
+
+	writel_relaxed(tmp, reg_base + PWR_CTRL2_KFC);
+}
+
 /* register exynos5420 clocks */
 static void __init exynos5x_clk_init(struct device_node *np,
 		enum exynos5x_soc soc)
@@ -1649,6 +1758,8 @@ static void __init exynos5x_clk_init(struct device_node *np,
 				ARRAY_SIZE(exynos5800_cpu_clks));
 	}
 
+	exynos5420_core_down_clock();
+
 	samsung_clk_extended_sleep_init(reg_base,
 		exynos5x_clk_regs, ARRAY_SIZE(exynos5x_clk_regs),
 		exynos5420_set_clksrc, ARRAY_SIZE(exynos5420_set_clksrc));

base-commit: cf6fc5eefc5bbbbff92a085039ff74cdbd065c29
-- 
2.50.1

