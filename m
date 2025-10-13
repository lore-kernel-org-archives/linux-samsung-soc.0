Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1117F309EFF
	for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Oct 2025 20:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760388724; cv=none; b=IpF0eQ/IQlfDV1XMIgwTKjlmFuXihLUYLJxnxVMATA0NyFiOc2n2xx7yCDhiIWbkyq1gtLTXvtQt5m0fydZW9FnlwXKEaBbJrHVO6Z6BngLnFp93IN6uQ8uvdC8j7DT4MOa+T8eqHTxy6BciP9etNecTCKL1RfJi6hY4H3135FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760388724; c=relaxed/simple;
	bh=Ym8vCysBLoJ40+kDpr/WtUBHATMuXi23reAInWYceEw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ryj3BfRs1Ks7ODqKezznM26Rc/4nr4g7GFt6LWcT3YlsW9EJidLed3FkcjAepEhiGLCoJZxUHsQ14oR5PaIiZIhIIj4utSNS2YdKTRUSJFr743zJ6VpmXPyrJ3vJ6vbNzpyIclABqVz0TgXC/kItNP9Xbaq2iOPANXsfkip7Sj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uwXHRWkC; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uwXHRWkC"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-46e33b260b9so37786795e9.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Oct 2025 13:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760388718; x=1760993518; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9H9MiozjVAraJ7In45dSCy6Jr4t/hsVVZHkS/OGXWdc=;
        b=uwXHRWkCSFPiCxt37VfWXqSrJ4cFJYXclP4e5gopLERGMVf1X17pG1OnsLFjt7ejFD
         JQjgZMLu4IWgRMDOw5x0kkgWaXna10cns1rYvF5sRiFPoowjhBusyzd+N/Sqb+QrJof4
         nnO+keOxhCrE38Pm/5iEb9adpy5Y4EDmKzug7NtD0kCprgC8wNSS5PckBvfyQr0KJgsC
         B1Wc0GifE+XQ1ON1E9zba1NK/ppetmODzTgA2HUP/ZP8M+IDXtmwEJKJSkC3PEGXU28B
         uMvv98bBkONveEA+aOtRImYZ6s3aP4FJOpTjL2zEd7pSATD0WM4hu2H5/oOnKd5JNM9n
         QNWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760388718; x=1760993518;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9H9MiozjVAraJ7In45dSCy6Jr4t/hsVVZHkS/OGXWdc=;
        b=NIgIZeynJ++KOwffnmr1f3rq/RFmaQ5iM7ofUBVcNzusr/JEWWOAiDI2IAEWg2UZYV
         Yf/EcV2zaQIKSWqfr7PYYbJ8tMMXdj+UIkQh0VLqVcKU5idtOc4VDNPm89/n6D6l2k3L
         uo1eFodExDhhPs6aK6mPDWu4I75/zDcEbEi07spyYdy6kQCxNWNWieykq/zwBfAGnUDN
         X6wzD7m8vufpYiMAqL6YvQQqSTLkXxV4ArSqsyLRX25fcns24sawpCiT9CFRyz6BuWAk
         5NQI1PPmGiRCHYAuIoP+vKE9c4Vy7Wf1vLlsac0z0rv9EzOemQT4o8g+YHXjFNAmFr+u
         vPhA==
X-Forwarded-Encrypted: i=1; AJvYcCUPDPPD5wYtysOyY5sm5fFwx+Bc+p4I9RuKjTJSRQ1Krq5IRSWhwfBDFYuYxLkpUNz//0XuO6Y0++GQ3YPRB+h3wg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXupK9otx5QrAfmHCtxPI43u3gkiu4rpoBFRzCB6F80Rb6QkAx
	nT9NtFmu5mmJhIYADzt6pzNHaAzgOyUua0t5rPq/dVmt+bzwxIR9YoFak2miJmDb1N4=
X-Gm-Gg: ASbGnct4W6+2dmnzd22j2yCy+o4/kJcbYes/YTThSG4ctJvqupC8vRONtj6lXk5Q5aG
	jZZp0LB2V1qafZtrxo9h8iIzjOJFLJSaEJhsoRSOEC8iuy8cAPqTp5iuDpHgzRjnZxdZL+DC6d5
	+86i0i+M+smxVpVG1XFrcp5bsnA8dHdI71kTp9CbGLIEgeqqHUO1BtiXNYu8yZAXixCIi9tPyrF
	4vYmGl9nt183bNIzyGV9ulxux0mMk1bWBwp6nDQ11QATbjMqZ/gG74gcQUMEmUY4YSn4ATd5ELM
	BGns7LqUdk07ROeFse4YRwy9BnLvojV87qi2DAV8jwdhnZCnHt6CxQLXF7I4vXpDwLhqs63eN83
	Fql+uCwB9h/uCYAOMOdXr3exf7ehS+z+BT9jNTGREmadHo7wIZWU9yzj2wEkcAR5+m8Myui+Jt8
	x4niPkaEmAyQ==
X-Google-Smtp-Source: AGHT+IHDVs1nvXLQnhleF6DKwQoP/clrvBH8p6GRp2/vTjevF+HQ7I3eZkfYuLH6K2lyIphV2P49cg==
X-Received: by 2002:a05:600c:1e87:b0:46e:4b89:13d9 with SMTP id 5b1f17b1804b1-46fa9a22e67mr153630895e9.0.1760388718164;
        Mon, 13 Oct 2025 13:51:58 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.67.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fab3e3206sm133512615e9.4.2025.10.13.13.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 13:51:57 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 13 Oct 2025 21:51:36 +0100
Subject: [PATCH 7/9] clk: samsung: Implement automatic clock gating mode
 for CMUs
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-automatic-clocks-v1-7-72851ee00300@linaro.org>
References: <20251013-automatic-clocks-v1-0-72851ee00300@linaro.org>
In-Reply-To: <20251013-automatic-clocks-v1-0-72851ee00300@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=22830;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=Ym8vCysBLoJ40+kDpr/WtUBHATMuXi23reAInWYceEw=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBo7WZZf2vra0fyzEG0AASuRtYUZ0wXFjQgNpOtG
 Aej8bmzpCaJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaO1mWQAKCRDO6LjWAjRy
 ujCRD/4wKepY1AXlxC6Qcd9L5oVfJ91PyFfn7SVk72d0kRTi+1LESgDpEqQCO7KuKwwn4o8T+H/
 eb2If2RqrxjGo2+ePjGMQr9BSxA2aKVA8SDIdYuoazHzGeFOvXSrfNboGgKxdoSGqe1AWkS7x7G
 xVVonflwJz8zNZelj+/HljiupC7TvoGTxPTDKNYSQ3BCgxXjHIWHZNonWSFxUPAFefO+BYPj+yi
 SQAgAsiNxkghGI0I9ro4u1/qrkN6bmm2NRCoo/U6nx6YDlkfQ9sDFOv9Uu20zHft3FUmKgnQQwq
 TQgMSzx8ye3mRJuQhmcr/OFSpXVTLXVPwId6e8O52Z26nfzBG07wWVGYbX1xD/q+2kl8yyWN3N9
 w8JiIP84az73fCWDpc+ELEkMpcc/pUHgUbCegzcJe4VQsKR9vw6yzNcpvMJ1ItV5xMvJ2vKvoeW
 2Z0C3ASCF0zaXMZBl6FadBeBikE/+mCCoCZfJLCjiOqFL/fmb5hyyoVPo3lnzQ86GABXqAWw/Fp
 EasGUS+hvD/EWosV4lrJnGHiYzCITKFyaZSx9zRHw6MqVv3AQIiBrC35MUD22VooB9+4cnUnC6N
 38Eaz0xsPlJQjLP1Zxk9eekasmV1a+hcJh4GSEjj1MbHwfkXWVXLt0Y30nvsu3olXLWVQ7EtOfe
 nOejaKlzUQ1E54Q==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Update exynos_arm64_init_clocks() so that it enables the automatic clock
mode bits in the CMU option register if the auto_clock_gate flag and
option_offset fields are set for the CMU.

The CMU option register bits are global and effect every clock component in
the CMU, as such clearing the GATE_ENABLE_HWACG bit and setting GATE_MANUAL
bit on every gate register is only required if auto_clock_gate is false.

Additionally if auto_clock_gate is enabled the dynamic root clock gating
and memclk registers will be configured in the corresponding CMUs sysreg
bank. These registers are exposed via syscon, so the register
suspend/resume paths are updated to handle using a regmap.

As many gates for various Samsung SoCs are already exposed in the Samsung
clock drivers a new samsung_auto_clk_gate_ops is implemented. This uses
some CMU debug registers to report whether clocks are enabled or disabled
when operating in automatic mode. This allows
/sys/kernel/debug/clk/clk_summary to still dump the entire clock tree and
correctly report the status of each clock in the system.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/clk/samsung/clk-exynos-arm64.c   |  47 +++++++--
 drivers/clk/samsung/clk-exynos4.c        |   6 +-
 drivers/clk/samsung/clk-exynos4412-isp.c |   4 +-
 drivers/clk/samsung/clk-exynos5250.c     |   2 +-
 drivers/clk/samsung/clk-exynos5420.c     |   4 +-
 drivers/clk/samsung/clk.c                | 161 ++++++++++++++++++++++++++++---
 drivers/clk/samsung/clk.h                |  49 +++++++++-
 7 files changed, 244 insertions(+), 29 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos-arm64.c b/drivers/clk/samsung/clk-exynos-arm64.c
index bf7de21f329ec89069dcf817ca578fcf9b2d9809..c302c836e8f9f6270753d86d7d986c88e6762f4f 100644
--- a/drivers/clk/samsung/clk-exynos-arm64.c
+++ b/drivers/clk/samsung/clk-exynos-arm64.c
@@ -24,6 +24,16 @@
 #define GATE_MANUAL		BIT(20)
 #define GATE_ENABLE_HWACG	BIT(28)
 
+/* Option register bits */
+#define OPT_EN_DBG			BIT(31)
+#define OPT_UNKNOWN			BIT(30)
+#define OPT_EN_PWR_MANAGEMENT		BIT(29)
+#define OPT_EN_AUTO_GATING		BIT(28)
+#define OPT_EN_MEM_PM_GATING		BIT(24)
+
+#define CMU_OPT_GLOBAL_EN_AUTO_GATING	(OPT_EN_DBG | OPT_UNKNOWN | \
+	OPT_EN_PWR_MANAGEMENT | OPT_EN_AUTO_GATING | OPT_EN_MEM_PM_GATING)
+
 /* PLL_CONx_PLL register offsets range */
 #define PLL_CON_OFF_START	0x100
 #define PLL_CON_OFF_END		0x600
@@ -37,6 +47,8 @@ struct exynos_arm64_cmu_data {
 	unsigned int nr_clk_save;
 	const struct samsung_clk_reg_dump *clk_suspend;
 	unsigned int nr_clk_suspend;
+	struct samsung_clk_reg_dump *clk_sysreg_save;
+	unsigned int nr_clk_sysreg;
 
 	struct clk *clk;
 	struct clk **pclks;
@@ -82,13 +94,28 @@ static void __init exynos_arm64_init_clocks(struct device_node *np,
 	if (!reg_base)
 		panic("%s: failed to map registers\n", __func__);
 
+	if (cmu->auto_clock_gate && cmu->option_offset) {
+		/*
+		 * Enable the global automatic mode for the entire CMU.
+		 * This overrides the individual HWACG bits in each of the
+		 * individual gate, mux and qch registers.
+		 */
+		writel(CMU_OPT_GLOBAL_EN_AUTO_GATING,
+		       reg_base + cmu->option_offset);
+	}
+
 	for (i = 0; i < reg_offs_len; ++i) {
 		void __iomem *reg = reg_base + reg_offs[i];
 		u32 val;
 
 		if (cmu->manual_plls && is_pll_con1_reg(reg_offs[i])) {
 			writel(PLL_CON1_MANUAL, reg);
-		} else if (is_gate_reg(reg_offs[i])) {
+		} else if (is_gate_reg(reg_offs[i]) && !cmu->auto_clock_gate) {
+			/*
+			 * Setting GATE_MANUAL bit (which is described in TRM as
+			 * reserved!) overrides the global CMU automatic mode
+			 * option.
+			 */
 			val = readl(reg);
 			val |= GATE_MANUAL;
 			val &= ~GATE_ENABLE_HWACG;
@@ -219,7 +246,7 @@ void __init exynos_arm64_register_cmu(struct device *dev,
  * Return: 0 on success, or negative error code on error.
  */
 int __init exynos_arm64_register_cmu_pm(struct platform_device *pdev,
-					bool set_manual)
+					bool init_clk_regs)
 {
 	const struct samsung_cmu_info *cmu;
 	struct device *dev = &pdev->dev;
@@ -249,7 +276,7 @@ int __init exynos_arm64_register_cmu_pm(struct platform_device *pdev,
 		dev_err(dev, "%s: could not enable bus clock %s; err = %d\n",
 		       __func__, cmu->clk_name, ret);
 
-	if (set_manual)
+	if (init_clk_regs)
 		exynos_arm64_init_clocks(np, cmu);
 
 	reg_base = devm_platform_ioremap_resource(pdev, 0);
@@ -280,14 +307,18 @@ int exynos_arm64_cmu_suspend(struct device *dev)
 	struct exynos_arm64_cmu_data *data = dev_get_drvdata(dev);
 	int i;
 
-	samsung_clk_save(data->ctx->reg_base, data->clk_save,
+	samsung_clk_save(data->ctx->reg_base, NULL, data->clk_save,
 			 data->nr_clk_save);
 
+	if (data->ctx->sysreg)
+		samsung_clk_save(NULL, data->ctx->sysreg, data->clk_save,
+				 data->nr_clk_save);
+
 	for (i = 0; i < data->nr_pclks; i++)
 		clk_prepare_enable(data->pclks[i]);
 
 	/* For suspend some registers have to be set to certain values */
-	samsung_clk_restore(data->ctx->reg_base, data->clk_suspend,
+	samsung_clk_restore(data->ctx->reg_base, NULL, data->clk_suspend,
 			    data->nr_clk_suspend);
 
 	for (i = 0; i < data->nr_pclks; i++)
@@ -308,9 +339,13 @@ int exynos_arm64_cmu_resume(struct device *dev)
 	for (i = 0; i < data->nr_pclks; i++)
 		clk_prepare_enable(data->pclks[i]);
 
-	samsung_clk_restore(data->ctx->reg_base, data->clk_save,
+	samsung_clk_restore(data->ctx->reg_base, NULL, data->clk_save,
 			    data->nr_clk_save);
 
+	if (data->ctx->sysreg)
+		samsung_clk_restore(NULL, data->ctx->sysreg, data->clk_save,
+				    data->nr_clk_save);
+
 	for (i = 0; i < data->nr_pclks; i++)
 		clk_disable_unprepare(data->pclks[i]);
 
diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
index cc5c1644c41c08b27bc48d809a08cd8a006cbe8f..26ac9734722d1e7ed8ec3f1c0a956f26e32b92d4 100644
--- a/drivers/clk/samsung/clk-exynos4.c
+++ b/drivers/clk/samsung/clk-exynos4.c
@@ -1378,15 +1378,15 @@ static void __init exynos4_clk_init(struct device_node *np,
 	if (soc == EXYNOS4212 || soc == EXYNOS4412)
 		exynos4x12_core_down_clock();
 
-	samsung_clk_extended_sleep_init(reg_base,
+	samsung_clk_extended_sleep_init(reg_base, NULL,
 			exynos4_clk_regs, ARRAY_SIZE(exynos4_clk_regs),
 			src_mask_suspend, ARRAY_SIZE(src_mask_suspend));
 	if (exynos4_soc == EXYNOS4210)
-		samsung_clk_extended_sleep_init(reg_base,
+		samsung_clk_extended_sleep_init(reg_base, NULL,
 		    exynos4210_clk_save, ARRAY_SIZE(exynos4210_clk_save),
 		    src_mask_suspend_e4210, ARRAY_SIZE(src_mask_suspend_e4210));
 	else
-		samsung_clk_sleep_init(reg_base, exynos4x12_clk_save,
+		samsung_clk_sleep_init(reg_base, NULL, exynos4x12_clk_save,
 				       ARRAY_SIZE(exynos4x12_clk_save));
 
 	samsung_clk_of_add_provider(np, ctx);
diff --git a/drivers/clk/samsung/clk-exynos4412-isp.c b/drivers/clk/samsung/clk-exynos4412-isp.c
index fa915057e109e0008ebe0b1b5d1652fd5804e82b..772bc18a1e686f23b11bf160b803becff6279637 100644
--- a/drivers/clk/samsung/clk-exynos4412-isp.c
+++ b/drivers/clk/samsung/clk-exynos4412-isp.c
@@ -94,7 +94,7 @@ static int __maybe_unused exynos4x12_isp_clk_suspend(struct device *dev)
 {
 	struct samsung_clk_provider *ctx = dev_get_drvdata(dev);
 
-	samsung_clk_save(ctx->reg_base, exynos4x12_save_isp,
+	samsung_clk_save(ctx->reg_base, NULL, exynos4x12_save_isp,
 			 ARRAY_SIZE(exynos4x12_clk_isp_save));
 	return 0;
 }
@@ -103,7 +103,7 @@ static int __maybe_unused exynos4x12_isp_clk_resume(struct device *dev)
 {
 	struct samsung_clk_provider *ctx = dev_get_drvdata(dev);
 
-	samsung_clk_restore(ctx->reg_base, exynos4x12_save_isp,
+	samsung_clk_restore(ctx->reg_base, NULL, exynos4x12_save_isp,
 			    ARRAY_SIZE(exynos4x12_clk_isp_save));
 	return 0;
 }
diff --git a/drivers/clk/samsung/clk-exynos5250.c b/drivers/clk/samsung/clk-exynos5250.c
index e90d3a0848cbc24b2709c10795f6affcda404567..f97f30b29be7317db8186bac39cf52e1893eb106 100644
--- a/drivers/clk/samsung/clk-exynos5250.c
+++ b/drivers/clk/samsung/clk-exynos5250.c
@@ -854,7 +854,7 @@ static void __init exynos5250_clk_init(struct device_node *np)
 		PWR_CTRL2_CORE2_UP_RATIO | PWR_CTRL2_CORE1_UP_RATIO);
 	__raw_writel(tmp, reg_base + PWR_CTRL2);
 
-	samsung_clk_sleep_init(reg_base, exynos5250_clk_regs,
+	samsung_clk_sleep_init(reg_base, NULL, exynos5250_clk_regs,
 			       ARRAY_SIZE(exynos5250_clk_regs));
 	exynos5_subcmus_init(ctx, ARRAY_SIZE(exynos5250_subcmus),
 			     exynos5250_subcmus);
diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index a9df4e6db82fa7831d4e5c7210b0163d7d301ec1..1982e0751ceec7e57f9e82d96dcbadce1f691092 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -1649,12 +1649,12 @@ static void __init exynos5x_clk_init(struct device_node *np,
 				ARRAY_SIZE(exynos5800_cpu_clks));
 	}
 
-	samsung_clk_extended_sleep_init(reg_base,
+	samsung_clk_extended_sleep_init(reg_base, NULL,
 		exynos5x_clk_regs, ARRAY_SIZE(exynos5x_clk_regs),
 		exynos5420_set_clksrc, ARRAY_SIZE(exynos5420_set_clksrc));
 
 	if (soc == EXYNOS5800) {
-		samsung_clk_sleep_init(reg_base, exynos5800_clk_regs,
+		samsung_clk_sleep_init(reg_base, NULL, exynos5800_clk_regs,
 				       ARRAY_SIZE(exynos5800_clk_regs));
 
 		exynos5_subcmus_init(ctx, ARRAY_SIZE(exynos5800_subcmus),
diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
index dbc9925ca8f46e951dfb5d391c0e744ca370abcc..07b2948ae7ea48f126ab420be57d8c2705979464 100644
--- a/drivers/clk/samsung/clk.c
+++ b/drivers/clk/samsung/clk.c
@@ -12,8 +12,10 @@
 #include <linux/clkdev.h>
 #include <linux/clk-provider.h>
 #include <linux/io.h>
+#include <linux/mfd/syscon.h>
 #include <linux/mod_devicetable.h>
 #include <linux/of_address.h>
+#include <linux/regmap.h>
 #include <linux/syscore_ops.h>
 
 #include "clk.h"
@@ -21,19 +23,29 @@
 static LIST_HEAD(clock_reg_cache_list);
 
 void samsung_clk_save(void __iomem *base,
+				    struct regmap *regmap,
 				    struct samsung_clk_reg_dump *rd,
 				    unsigned int num_regs)
 {
-	for (; num_regs > 0; --num_regs, ++rd)
-		rd->value = readl(base + rd->offset);
+	for (; num_regs > 0; --num_regs, ++rd) {
+		if (base)
+			rd->value = readl(base + rd->offset);
+		if (regmap)
+			regmap_read(regmap, rd->offset, &rd->value);
+	}
 }
 
 void samsung_clk_restore(void __iomem *base,
+				      struct regmap *regmap,
 				      const struct samsung_clk_reg_dump *rd,
 				      unsigned int num_regs)
 {
-	for (; num_regs > 0; --num_regs, ++rd)
-		writel(rd->value, base + rd->offset);
+	for (; num_regs > 0; --num_regs, ++rd) {
+		if (base)
+			writel(rd->value, base + rd->offset);
+		if (regmap)
+			regmap_write(regmap, rd->offset, rd->value);
+	}
 }
 
 struct samsung_clk_reg_dump *samsung_clk_alloc_reg_dump(
@@ -227,6 +239,82 @@ void __init samsung_clk_register_div(struct samsung_clk_provider *ctx,
 	}
 }
 
+#define ACG_MSK GENMASK(6, 4)
+#define CLK_IDLE GENMASK(5, 4)
+static int samsung_auto_clk_gate_is_en(struct clk_hw *hw)
+{
+	u32 reg;
+	struct clk_gate *gate = to_clk_gate(hw);
+
+	reg = readl(gate->reg);
+	return ((reg & ACG_MSK) == CLK_IDLE) ? 0 : 1;
+}
+
+/* enable and disable are nops in automatic clock mode */
+static int samsung_auto_clk_gate_en(struct clk_hw *hw)
+{
+	return 0;
+}
+
+static void samsung_auto_clk_gate_dis(struct clk_hw *hw)
+{
+}
+
+static const struct clk_ops samsung_auto_clk_gate_ops = {
+	.enable = samsung_auto_clk_gate_en,
+	.disable = samsung_auto_clk_gate_dis,
+	.is_enabled = samsung_auto_clk_gate_is_en,
+};
+
+struct clk_hw *samsung_register_auto_gate(struct device *dev,
+		struct device_node *np, const char *name,
+		const char *parent_name, const struct clk_hw *parent_hw,
+		const struct clk_parent_data *parent_data,
+		unsigned long flags,
+		void __iomem *reg, u8 bit_idx,
+		u8 clk_gate_flags, spinlock_t *lock)
+{
+	struct clk_gate *gate;
+	struct clk_hw *hw;
+	struct clk_init_data init = {};
+	int ret = -EINVAL;
+
+	/* allocate the gate */
+	gate = kzalloc(sizeof(*gate), GFP_KERNEL);
+	if (!gate)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = name;
+	init.ops = &samsung_auto_clk_gate_ops;
+	init.flags = flags;
+	init.parent_names = parent_name ? &parent_name : NULL;
+	init.parent_hws = parent_hw ? &parent_hw : NULL;
+	init.parent_data = parent_data;
+	if (parent_name || parent_hw || parent_data)
+		init.num_parents = 1;
+	else
+		init.num_parents = 0;
+
+	/* struct clk_gate assignments */
+	gate->reg = reg;
+	gate->bit_idx = bit_idx;
+	gate->flags = clk_gate_flags;
+	gate->lock = lock;
+	gate->hw.init = &init;
+
+	hw = &gate->hw;
+	if (dev || !np)
+		ret = clk_hw_register(dev, hw);
+	else if (np)
+		ret = of_clk_hw_register(np, hw);
+	if (ret) {
+		kfree(gate);
+		hw = ERR_PTR(ret);
+	}
+
+	return hw;
+}
+
 /* register a list of gate clocks */
 void __init samsung_clk_register_gate(struct samsung_clk_provider *ctx,
 				const struct samsung_gate_clock *list,
@@ -234,11 +322,21 @@ void __init samsung_clk_register_gate(struct samsung_clk_provider *ctx,
 {
 	struct clk_hw *clk_hw;
 	unsigned int idx;
+	void __iomem *reg_offs;
 
 	for (idx = 0; idx < nr_clk; idx++, list++) {
-		clk_hw = clk_hw_register_gate(ctx->dev, list->name, list->parent_name,
-				list->flags, ctx->reg_base + list->offset,
+		reg_offs = ctx->reg_base + list->offset;
+
+		if (ctx->auto_clock_gate && ctx->gate_dbg_offset)
+			clk_hw = samsung_register_auto_gate(ctx->dev, NULL,
+				list->name, list->parent_name, NULL, NULL,
+				list->flags, reg_offs + ctx->gate_dbg_offset,
 				list->bit_idx, list->gate_flags, &ctx->lock);
+		else
+			clk_hw = clk_hw_register_gate(ctx->dev, list->name,
+				list->parent_name, list->flags,
+				ctx->reg_base + list->offset, list->bit_idx,
+				list->gate_flags, &ctx->lock);
 		if (IS_ERR(clk_hw)) {
 			pr_err("%s: failed to register clock %s\n", __func__,
 				list->name);
@@ -276,10 +374,11 @@ static int samsung_clk_suspend(void)
 	struct samsung_clock_reg_cache *reg_cache;
 
 	list_for_each_entry(reg_cache, &clock_reg_cache_list, node) {
-		samsung_clk_save(reg_cache->reg_base, reg_cache->rdump,
-				reg_cache->rd_num);
-		samsung_clk_restore(reg_cache->reg_base, reg_cache->rsuspend,
-				reg_cache->rsuspend_num);
+		samsung_clk_save(reg_cache->reg_base, reg_cache->sysreg,
+				 reg_cache->rdump, reg_cache->rd_num);
+		samsung_clk_restore(reg_cache->reg_base, reg_cache->sysreg,
+				    reg_cache->rsuspend,
+				    reg_cache->rsuspend_num);
 	}
 	return 0;
 }
@@ -289,8 +388,8 @@ static void samsung_clk_resume(void)
 	struct samsung_clock_reg_cache *reg_cache;
 
 	list_for_each_entry(reg_cache, &clock_reg_cache_list, node)
-		samsung_clk_restore(reg_cache->reg_base, reg_cache->rdump,
-				reg_cache->rd_num);
+		samsung_clk_restore(reg_cache->reg_base, reg_cache->sysreg,
+				    reg_cache->rdump, reg_cache->rd_num);
 }
 
 static struct syscore_ops samsung_clk_syscore_ops = {
@@ -299,6 +398,7 @@ static struct syscore_ops samsung_clk_syscore_ops = {
 };
 
 void samsung_clk_extended_sleep_init(void __iomem *reg_base,
+			struct regmap *sysreg,
 			const unsigned long *rdump,
 			unsigned long nr_rdump,
 			const struct samsung_clk_reg_dump *rsuspend,
@@ -319,6 +419,7 @@ void samsung_clk_extended_sleep_init(void __iomem *reg_base,
 		register_syscore_ops(&samsung_clk_syscore_ops);
 
 	reg_cache->reg_base = reg_base;
+	reg_cache->sysreg = sysreg;
 	reg_cache->rd_num = nr_rdump;
 	reg_cache->rsuspend = rsuspend;
 	reg_cache->rsuspend_num = nr_rsuspend;
@@ -334,6 +435,12 @@ void samsung_clk_extended_sleep_init(void __iomem *reg_base,
 void __init samsung_cmu_register_clocks(struct samsung_clk_provider *ctx,
 					const struct samsung_cmu_info *cmu)
 {
+	ctx->auto_clock_gate = cmu->auto_clock_gate;
+	ctx->gate_dbg_offset = cmu->gate_dbg_offset;
+	ctx->option_offset = cmu->option_offset;
+	ctx->drcg_offset = cmu->drcg_offset;
+	ctx->memclk_offset = cmu->memclk_offset;
+
 	if (cmu->pll_clks)
 		samsung_clk_register_pll(ctx, cmu->pll_clks, cmu->nr_pll_clks);
 	if (cmu->mux_clks)
@@ -353,6 +460,31 @@ void __init samsung_cmu_register_clocks(struct samsung_clk_provider *ctx,
 		samsung_clk_register_cpu(ctx, cmu->cpu_clks, cmu->nr_cpu_clks);
 }
 
+/* Enable Dynamic Root Clock Gating of bus components*/
+void samsung_en_dyn_root_clk_gating(struct device_node *np,
+				    struct samsung_clk_provider *ctx,
+				    const struct samsung_cmu_info *cmu)
+{
+	if (ctx && !ctx->auto_clock_gate)
+		return;
+
+	ctx->sysreg = syscon_regmap_lookup_by_phandle(np, "samsung,sysreg");
+	if (!IS_ERR_OR_NULL(ctx->sysreg)) {
+		regmap_write(ctx->sysreg, ctx->drcg_offset, 0xffffffff);
+		/* not every sysreg controller has memclk reg*/
+		if (ctx->memclk_offset)
+			regmap_write_bits(ctx->sysreg, ctx->memclk_offset, 0x1, 0x0);
+
+		samsung_clk_extended_sleep_init(NULL, ctx->sysreg,
+						cmu->sysreg_clk_regs,
+						cmu->nr_sysreg_clk_regs,
+						NULL, 0);
+	} else {
+		pr_warn("%pOF: Unable to get CMU sysreg\n", np);
+		ctx->sysreg = NULL;
+	}
+}
+
 /*
  * Common function which registers plls, muxes, dividers and gates
  * for each CMU. It also add CMU register list to register cache.
@@ -374,11 +506,14 @@ struct samsung_clk_provider * __init samsung_cmu_register_one(
 	samsung_cmu_register_clocks(ctx, cmu);
 
 	if (cmu->clk_regs)
-		samsung_clk_extended_sleep_init(reg_base,
+		samsung_clk_extended_sleep_init(reg_base, NULL,
 			cmu->clk_regs, cmu->nr_clk_regs,
 			cmu->suspend_regs, cmu->nr_suspend_regs);
 
 	samsung_clk_of_add_provider(np, ctx);
 
+	/* sysreg DT nodes reference a clock in this CMU */
+	samsung_en_dyn_root_clk_gating(np, ctx, cmu);
+
 	return ctx;
 }
diff --git a/drivers/clk/samsung/clk.h b/drivers/clk/samsung/clk.h
index 18660c1ac6f0106b17b9efc9c6b3cd62d46f7b82..b719e057f45489e9d92ba54031fe633a8c9264ce 100644
--- a/drivers/clk/samsung/clk.h
+++ b/drivers/clk/samsung/clk.h
@@ -12,6 +12,7 @@
 
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
+#include <linux/regmap.h>
 #include "clk-pll.h"
 #include "clk-cpu.h"
 
@@ -19,13 +20,25 @@
  * struct samsung_clk_provider - information about clock provider
  * @reg_base: virtual address for the register base
  * @dev: clock provider device needed for runtime PM
+ * @sysreg: syscon regmap for clock-provider sysreg controller
  * @lock: maintains exclusion between callbacks for a given clock-provider
+ * @auto_clock_gate: enable auto clk mode for all clocks in clock-provider
+ * @gate_dbg_offset: gate debug reg offset. Used for all gates in auto clk mode
+ * @option_offset: option reg offset. Enables auto mode for clock-provider
+ * @drcg_offset: dynamic root clk gate enable register offset
+ * @memclk_offset: memclk enable register offset
  * @clk_data: holds clock related data like clk_hw* and number of clocks
  */
 struct samsung_clk_provider {
 	void __iomem *reg_base;
 	struct device *dev;
+	struct regmap *sysreg;
 	spinlock_t lock;
+	bool auto_clock_gate;
+	u32 gate_dbg_offset;
+	u32 option_offset;
+	u32 drcg_offset;
+	u32 memclk_offset;
 	/* clk_data must be the last entry due to variable length 'hws' array */
 	struct clk_hw_onecell_data clk_data;
 };
@@ -310,6 +323,7 @@ struct samsung_cpu_clock {
 struct samsung_clock_reg_cache {
 	struct list_head node;
 	void __iomem *reg_base;
+	struct regmap *sysreg;
 	struct samsung_clk_reg_dump *rdump;
 	unsigned int rd_num;
 	const struct samsung_clk_reg_dump *rsuspend;
@@ -338,7 +352,14 @@ struct samsung_clock_reg_cache {
  * @suspend_regs: list of clock registers to set before suspend
  * @nr_suspend_regs: count of clock registers in @suspend_regs
  * @clk_name: name of the parent clock needed for CMU register access
+ * @sysreg_clk_regs: list of sysreg clock registers
+ * @nr_sysreg_clk_regs: count of clock registers in @sysreg_clk_regs
  * @manual_plls: Enable manual control for PLL clocks
+ * @auto_clock_gate: enable auto clock mode for all components in CMU
+ * @gate_dbg_offset: gate debug reg offset. Used by all gates in auto clk mode
+ * @option_offset: option reg offset. Enables auto clk mode for entire CMU
+ * @drcg_offset: dynamic root clk gate enable register offset
+ * @memclk_offset: memclk enable register offset
  */
 struct samsung_cmu_info {
 	const struct samsung_pll_clock *pll_clks;
@@ -364,8 +385,16 @@ struct samsung_cmu_info {
 	unsigned int nr_suspend_regs;
 	const char *clk_name;
 
+	const unsigned long *sysreg_clk_regs;
+	unsigned int nr_sysreg_clk_regs;
+
 	/* ARM64 Exynos CMUs */
 	bool manual_plls;
+	bool auto_clock_gate;
+	u32 gate_dbg_offset;
+	u32 option_offset;
+	u32 drcg_offset;
+	u32 memclk_offset;
 };
 
 struct samsung_clk_provider *samsung_clk_init(struct device *dev,
@@ -415,6 +444,7 @@ struct samsung_clk_provider *samsung_cmu_register_one(
 
 #ifdef CONFIG_PM_SLEEP
 void samsung_clk_extended_sleep_init(void __iomem *reg_base,
+			struct regmap *sysreg,
 			const unsigned long *rdump,
 			unsigned long nr_rdump,
 			const struct samsung_clk_reg_dump *rsuspend,
@@ -426,17 +456,32 @@ static inline void samsung_clk_extended_sleep_init(void __iomem *reg_base,
 			const struct samsung_clk_reg_dump *rsuspend,
 			unsigned long nr_rsuspend) {}
 #endif
-#define samsung_clk_sleep_init(reg_base, rdump, nr_rdump) \
-	samsung_clk_extended_sleep_init(reg_base, rdump, nr_rdump, NULL, 0)
+#define samsung_clk_sleep_init(reg_base, sysreg, rdump, nr_rdump)	   \
+	samsung_clk_extended_sleep_init(reg_base, sysreg, rdump, nr_rdump, \
+					NULL, 0)
 
 void samsung_clk_save(void __iomem *base,
+			struct regmap *regmap,
 			struct samsung_clk_reg_dump *rd,
 			unsigned int num_regs);
 void samsung_clk_restore(void __iomem *base,
+			struct regmap *regmap,
 			const struct samsung_clk_reg_dump *rd,
 			unsigned int num_regs);
 struct samsung_clk_reg_dump *samsung_clk_alloc_reg_dump(
 			const unsigned long *rdump,
 			unsigned long nr_rdump);
 
+void samsung_en_dyn_root_clk_gating(struct device_node *np,
+				struct samsung_clk_provider *ctx,
+				const struct samsung_cmu_info *cmu);
+
+struct clk_hw *samsung_register_auto_gate(struct device *dev,
+		struct device_node *np, const char *name,
+		const char *parent_name, const struct clk_hw *parent_hw,
+		const struct clk_parent_data *parent_data,
+		unsigned long flags,
+		void __iomem *reg, u8 bit_idx,
+		u8 clk_gate_flags, spinlock_t *lock);
+
 #endif /* __SAMSUNG_CLK_H */

-- 
2.51.0.760.g7b8bcc2412-goog

