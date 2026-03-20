Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9DB36C9CB
	for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Mar 2026 21:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774041323; cv=none; b=EsXPHdHjhrpoPOgd/PS8sbCUSTLvAWWHyPhWJkYzLk89KFLX6r0a5IM2N6HIFrb7oWUnn8EZIq1pIj7xx6m08DJ36fYYkpsG4l3lYvfGzYRveU82+CK6NvOqtHfu+45/+9qK+8u1xOqD97qHfh48Kpxlhd5RWtispjRQO2bxcRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774041323; c=relaxed/simple;
	bh=dEU+HYL4TUwumpvS92ZlG5R5HRevhTdXiDojFGzKHrQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GNetCy1quh3FdgG84p8bCpcBFfk4y4cVq+Hhe3g+Ru2YE94Wcb2wNy36ApeegNoZ3qeK3VO4r5ryvqaNiFW3fOwrKXnWGV/WHkz/Ul6/iwsV6Jms31gYQiOt+oVWHQjd/9qEL4KNTp6kSYVT+iU0uejeyqAzJxFsJLhrXT2waYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D7qABObA; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D7qABObA"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-439bc14dcf4so2383531f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Mar 2026 14:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774041319; x=1774646119; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z9RV3BC7qTYEhYVVUcSNrC1vYSoZKUA0ZmqsXI7LOh0=;
        b=D7qABObAoGDRhhLk+D5vmA8P419PGsiK5yGrtkwcD3JVxZ7wczNEWqVEM2A3F9IJ42
         uoHm1iYVudSVZFdptiCOJrEihcXsLiPSZ4BitsyMg+lSBTdIefTawE3rqi6i/gOvXXJZ
         PPvg3d+yknSAUiCQwmZW7MeQP9tkYf16+3x49olTk3SrPkkW5IsiVBHPh0TwOAztL6kQ
         MxoRL1+F66Soqhjukow5qjzsiLXKsWtxrL7hSDfGQiivWCnmqoFExJ8MmalhLaE17of2
         iX5QkSIWlLiA+pC8eAOpZQKEfEDK8IC6WEB3LIGYDfzQlgQtSu5DYQi9BpbE8I9iBo6O
         dQUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774041319; x=1774646119;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z9RV3BC7qTYEhYVVUcSNrC1vYSoZKUA0ZmqsXI7LOh0=;
        b=JM8SxQO74w3Cn6wXKigEUIiL5cNpPio8nqkyz2J463ezFXIy0r/r5t2RqK1lk5tf8J
         q+EPtO50BjdnL1qLYIci3npFsV65fMrTz5CUuwAfcsVN5ia6Wzu3p/pVDDauaD8Zx588
         ORev8cktBG65jUVvJt9Q8vI3bKEo88pnx0sU3qRxq44DTVpYEh9UaG3xQ4s7XPmAJUzt
         irgA4/Xr6c5ywB8wBfNFx+dXAjqPobIDXBMLa/LUYGB/np0C5Y8oz6INq02TjFxNDOli
         9ZKdL8Vy4ATpYeJCCZPZ/eG7A7bjT3DNGnr7IFhfsZuuD35tHhZkAR58wY4r57tDWKz7
         taaA==
X-Forwarded-Encrypted: i=1; AJvYcCUieAH4ZW8B8WPOkFpcRwhDdC6EnBDYaMmN0Xgn25x6/09GtppfxNAiTWBiNl3YKsih4LR7JTvvwAOi5qDyzIlOjg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzmCZiMZ8swR4fL1YjKDjXENeMuWCxiwRG51BXapcZZ9AX/yYL
	QPXOE8MjiNRtm0AVHL5AH86auEVEYGe1XFvPzK2A7b5yHdV7SdvSjxd3Calt14Fe++s=
X-Gm-Gg: ATEYQzz9KNf/hkqhDKIOE3BKrr2sNolTF702cT5IRXUcdi5gSoiPPO3xYlF5HOQw40e
	JL0bkcjtYjQDaWWcvN8FJLQC90i/3vJdremYchbUChFwV8g7bR+ciJ90YWGf9H6/W8fsUP5ci6s
	xP+eR3IgJ2RQCfu2mqI2u73y7uVMZ1m9FqEjnBZcLIgI1icJeBtzU2pSRz2ftSdTCVrPR+7YIVt
	0MXeArc/4S4TmKYZBnNuiPW6r8VlQfKh0ahXOXSA29P86b1/CSMAJ0m7XKKdjN4qBRBrSHz1Lc1
	qrmJkhiDrWTP7lM7ODaTAOrUvBruv9V5x/9QUuRP7TeRDhS2hkW9iuxhXHI7vccmvHic4u+TXX6
	6IFQVwSixVEkpMlwra4c5P7JTXCvOQTkMaskzSkKZqm8ZjovzlUVfNiP1MyDZ8VnrfBnS8kgecX
	zZHkwkULIrgPipOgK11v3ZQ+SbC6zo7NqEpDYm7RezPpQlvLR0XtOs5u/3w/LUaRKa+uWs/h6az
	N+jEL858aKtNqo=
X-Received: by 2002:a05:6000:2011:b0:43b:4909:203c with SMTP id ffacd0b85a97d-43b6427d8c5mr8221726f8f.21.1774041319466;
        Fri, 20 Mar 2026 14:15:19 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.193.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703c27sm9702401f8f.18.2026.03.20.14.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 14:15:18 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Fri, 20 Mar 2026 21:15:14 +0000
Subject: [PATCH 2/5] clk: samsung: exynos850: Add APM-to-AP mailbox clock
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-exynos850-ap2apm-mailbox-v1-2-983eb3f296fc@linaro.org>
References: <20260320-exynos850-ap2apm-mailbox-v1-0-983eb3f296fc@linaro.org>
In-Reply-To: <20260320-exynos850-ap2apm-mailbox-v1-0-983eb3f296fc@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.3

Add APM mailbox clock for communicating between APM and main application
CPUs in CMU_APM unit. This clock is needed to access this mailbox
registers. This mailbox is used for ACPM communication between kernel
and APM co-processor.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 drivers/clk/samsung/clk-exynos850.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos850.c b/drivers/clk/samsung/clk-exynos850.c
index 56f27697c76b..eb9c80b60225 100644
--- a/drivers/clk/samsung/clk-exynos850.c
+++ b/drivers/clk/samsung/clk-exynos850.c
@@ -19,7 +19,7 @@
 
 /* NOTE: Must be equal to the last clock ID increased by one */
 #define CLKS_NR_TOP			(CLK_DOUT_CPUCL1_SWITCH + 1)
-#define CLKS_NR_APM			(CLK_GOUT_SYSREG_APM_PCLK + 1)
+#define CLKS_NR_APM			(CLK_GOUT_MAILBOX_APM_AP_PCLK + 1)
 #define CLKS_NR_AUD			(CLK_GOUT_AUD_CMU_AUD_PCLK + 1)
 #define CLKS_NR_CMGP			(CLK_GOUT_SYSREG_CMGP_PCLK + 1)
 #define CLKS_NR_CPUCL0			(CLK_CLUSTER0_SCLK + 1)
@@ -604,6 +604,7 @@ CLK_OF_DECLARE(exynos850_cmu_top, "samsung,exynos850-cmu-top",
 #define CLK_CON_GAT_GOUT_APM_APBIF_TOP_RTC_PCLK		0x2028
 #define CLK_CON_GAT_GOUT_APM_I3C_APM_PMIC_I_PCLK	0x2034
 #define CLK_CON_GAT_GOUT_APM_I3C_APM_PMIC_I_SCLK	0x2038
+#define CLK_CON_GAT_GOUT_APM_MAILBOX_APM_AP_PCLK	0x2060
 #define CLK_CON_GAT_GOUT_APM_SPEEDY_APM_PCLK		0x20bc
 #define CLK_CON_GAT_GOUT_APM_SYSREG_APM_PCLK		0x20c0
 
@@ -628,6 +629,7 @@ static const unsigned long apm_clk_regs[] __initconst = {
 	CLK_CON_GAT_GOUT_APM_I3C_APM_PMIC_I_SCLK,
 	CLK_CON_GAT_GOUT_APM_SPEEDY_APM_PCLK,
 	CLK_CON_GAT_GOUT_APM_SYSREG_APM_PCLK,
+	CLK_CON_GAT_GOUT_APM_MAILBOX_APM_AP_PCLK,
 };
 
 /* List of parent clocks for Muxes in CMU_APM */
@@ -698,6 +700,9 @@ static const struct samsung_gate_clock apm_gate_clks[] __initconst = {
 	     CLK_CON_GAT_GOUT_APM_APBIF_PMU_ALIVE_PCLK, 21, CLK_IS_CRITICAL, 0),
 	GATE(CLK_GOUT_SYSREG_APM_PCLK, "gout_sysreg_apm_pclk", "dout_apm_bus",
 	     CLK_CON_GAT_GOUT_APM_SYSREG_APM_PCLK, 21, 0, 0),
+	GATE(CLK_GOUT_MAILBOX_APM_AP_PCLK, "gout_mailbox_apm_ap_pclk",
+	     "dout_apm_func",
+	     CLK_CON_GAT_GOUT_APM_MAILBOX_APM_AP_PCLK, 21, 0, 0),
 };
 
 static const struct samsung_cmu_info apm_cmu_info __initconst = {

-- 
2.51.0

