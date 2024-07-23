Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CBAE15748A
	for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Jul 2024 16:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721752395; cv=none; b=TRcPwSkleR4lS3xko7mZnScf8oUufNafXXVviaWUj4ZSZ4630bXdgehACRwxXaWjAPObTcnHyd03oNwi8uM8swX8U7TqpL15/0R134svaP5aGIOHeI4P4wyKeTHGhX/0B84+htgu9vfBDxSuA3xrhJYwxfmy747RKPwloOr6Fps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721752395; c=relaxed/simple;
	bh=p+vDVT3sVxbC5O6pG5Jqdi2C8YJpba39Vmv1jbtymgs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lbG7JZ2sbRF2nDswtrYC9DXQ2ggrYyfbymSCK2LVS3trZVo/R1SOxRnA79ucEfXD1Om2S5+zPYWB5iLYT+LUjeEyVViRD+5qyJ76yZiyMEbtHXIj11FNK3X0SnXuDRXNWFxUOzXUC730L+bEXoGtqOkjCHCUp5ov4pGOIFtDB6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TqdYegSz; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TqdYegSz"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-260e8c98cc2so3021514fac.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Jul 2024 09:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721752392; x=1722357192; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PdY3KgxTtiJXPxjyXybVLM1uY/tucI7CySN4GBUoBCg=;
        b=TqdYegSzbYbk88OUdBArdqqpctG+narpZzuLXm5J/n8Qa0+e/lAi/D4OWW6apBXEww
         zIGLvlcKWmmMHmQMUUj5yrv5IGGi6yJDPhkNtwf53mXxbsHI0htiY9ObkrLhdvADB8bV
         7VtyqlyNIiokkdocZrZsxVJ0R7an7hXIEqehoSeTnw4GPIg+aOAXl1Aki6e1IcUP7BNp
         9vGkXysmMPZzSJaryQe20ZSpnmXfi8K6MZSxzzh2ABR8vmGNYRwbXB0jrG6jYCJXpRMw
         APzrKIOdtMtQeggdXKEhXo422ShrTGFjUSkAvcHGp27nM0bwGRc84Cj8zC3G8R2RrbcZ
         BI3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721752392; x=1722357192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PdY3KgxTtiJXPxjyXybVLM1uY/tucI7CySN4GBUoBCg=;
        b=a1OCO1kW21aLTLDAtz2kjo1ONJBXWSKYPxx/Ti93YmP/m0uPOdNIpRf9e0XaMqKQVN
         QhISAWyZ8CqJ5aSMlZlG+vLb6VRVkJMcp77UaGrnAbNX04038vyD8Hx8mTYQjjqgvQc8
         sws65AwFO1FcWJPIOjVdS3x3y7kwb1dHg2s/oit0qR2Xft45BeS6S9nzGQqVAecci1qW
         jTNfmAv0nvISTbWWwqInEJ0fE1HSJvVpHoGRhiPP13UYFvMXlEhDhz2VB0A3FoOqAx1I
         rAy4zQgqamxBgK1QRrvsGsBIYWwpuUrHWH7I9W381GzkFCubwufb7sjfw9zJvQx9Lj5G
         K9Yg==
X-Forwarded-Encrypted: i=1; AJvYcCVwopYkbgrwuiKaYcdKxCa0ZJM5IC+WS/pHtmw7uYXCCweVJH0miY/r9UHrVPNqx/6jlQJ1Iu3fuxvtVhcmv4cUlpYt3aHjFETalGDWhcvE8WQ=
X-Gm-Message-State: AOJu0YzzX2Q2BG9M5mQdJyxC0vyrwQxYbMhffd+06/8GOfwK1uom8+tj
	aZMOx+KLNrhZEdWVpuT/9sDRY9tV6Rbl8Gj0w79beS/5P2AnncK9huhHz93KH90=
X-Google-Smtp-Source: AGHT+IEPaVMzHCT8IN1kBlhYBPMyRD/ur/7HPDJtgHd3pnd2Iz+exktN3oy/a1T2KPvG2IeXeQZ6zg==
X-Received: by 2002:a05:6870:4205:b0:261:f30:fda3 with SMTP id 586e51a60fabf-2638df3318amr10459852fac.21.1721752392424;
        Tue, 23 Jul 2024 09:33:12 -0700 (PDT)
Received: from localhost ([136.62.192.75])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2610c7ce708sm2199570fac.25.2024.07.23.09.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 09:33:12 -0700 (PDT)
From: Sam Protsenko <semen.protsenko@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Mateusz Majewski <m.majewski2@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/2] clk: samsung: exynos850: Add TMU clock
Date: Tue, 23 Jul 2024 11:33:11 -0500
Message-Id: <20240723163311.28654-2-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240723163311.28654-1-semen.protsenko@linaro.org>
References: <20240723163311.28654-1-semen.protsenko@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add TMU PCLK clock in CMU_PERI unit. It acts simultaneously as an
interface clock (to access TMU registers) and an operating clock which
makes TMU IP-core functional.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 drivers/clk/samsung/clk-exynos850.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos850.c b/drivers/clk/samsung/clk-exynos850.c
index 6215471c4ac6..e00e213b1201 100644
--- a/drivers/clk/samsung/clk-exynos850.c
+++ b/drivers/clk/samsung/clk-exynos850.c
@@ -28,7 +28,7 @@
 #define CLKS_NR_HSI			(CLK_GOUT_HSI_CMU_HSI_PCLK + 1)
 #define CLKS_NR_IS			(CLK_GOUT_IS_SYSREG_PCLK + 1)
 #define CLKS_NR_MFCMSCL			(CLK_GOUT_MFCMSCL_SYSREG_PCLK + 1)
-#define CLKS_NR_PERI			(CLK_GOUT_WDT1_PCLK + 1)
+#define CLKS_NR_PERI			(CLK_GOUT_BUSIF_TMU_PCLK + 1)
 #define CLKS_NR_CORE			(CLK_GOUT_SPDMA_CORE_ACLK + 1)
 #define CLKS_NR_DPU			(CLK_GOUT_DPU_SYSREG_PCLK + 1)
 
@@ -1921,6 +1921,7 @@ static const struct samsung_cmu_info mfcmscl_cmu_info __initconst = {
 #define CLK_CON_GAT_GATE_CLK_PERI_HSI2C_0	0x200c
 #define CLK_CON_GAT_GATE_CLK_PERI_HSI2C_1	0x2010
 #define CLK_CON_GAT_GATE_CLK_PERI_HSI2C_2	0x2014
+#define CLK_CON_GAT_GOUT_PERI_BUSIF_TMU_PCLK	0x2018
 #define CLK_CON_GAT_GOUT_PERI_GPIO_PERI_PCLK	0x2020
 #define CLK_CON_GAT_GOUT_PERI_HSI2C_0_IPCLK	0x2024
 #define CLK_CON_GAT_GOUT_PERI_HSI2C_0_PCLK	0x2028
@@ -1957,6 +1958,7 @@ static const unsigned long peri_clk_regs[] __initconst = {
 	CLK_CON_GAT_GATE_CLK_PERI_HSI2C_0,
 	CLK_CON_GAT_GATE_CLK_PERI_HSI2C_1,
 	CLK_CON_GAT_GATE_CLK_PERI_HSI2C_2,
+	CLK_CON_GAT_GOUT_PERI_BUSIF_TMU_PCLK,
 	CLK_CON_GAT_GOUT_PERI_GPIO_PERI_PCLK,
 	CLK_CON_GAT_GOUT_PERI_HSI2C_0_IPCLK,
 	CLK_CON_GAT_GOUT_PERI_HSI2C_0_PCLK,
@@ -2068,6 +2070,9 @@ static const struct samsung_gate_clock peri_gate_clks[] __initconst = {
 	GATE(CLK_GOUT_GPIO_PERI_PCLK, "gout_gpio_peri_pclk",
 	     "mout_peri_bus_user",
 	     CLK_CON_GAT_GOUT_PERI_GPIO_PERI_PCLK, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_BUSIF_TMU_PCLK, "gout_busif_tmu_pclk",
+	     "mout_peri_bus_user",
+	     CLK_CON_GAT_GOUT_PERI_BUSIF_TMU_PCLK, 21, 0, 0),
 };
 
 static const struct samsung_cmu_info peri_cmu_info __initconst = {
-- 
2.39.2

