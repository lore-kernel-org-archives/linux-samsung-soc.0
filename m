Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B21C316196
	for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Dec 2025 10:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766398955; cv=none; b=rDRinMLPFNuVtQZ1ALvxdWjx4Hz5u0VpeMpPUWHT6SndY1f2J3JjCxcC/4TEa22Q1RuYxjFFj4CLlf0JGDdywf2cwyBzFc815pGoyLRSJggoHvLjQJWxRK4tykkxmoynmDsdyMP2+PLZZKOApOWOcKsXl/GgpqCbuFzJkOUsoZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766398955; c=relaxed/simple;
	bh=/Z6zZxIOHE0bexMt7q7vSkBhyGsyTsuiXJos9cuRaKY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SS7HF45MyKkgBdVNutNvuVDvpmr3R1qOZmjyXJRnB6BOdkSJZk/XhDzpTSfHU7zHuEEPvoV6RUoRUJfheSyPFCFPWesjrZ7rVFTbhnOnzuz/doMb2hwY2HniQFrlsT1lZEbGb5UY6CtDOJmNUD3a5giyyDgqpe9AjKDSAlQMR2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lg47hCeS; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lg47hCeS"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42b3b0d76fcso2303800f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Dec 2025 02:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766398951; x=1767003751; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PT6Q5dW5KkgWP7tZaLfWqSYR2o+Foff/zTHPq2XLG/U=;
        b=lg47hCeSmMjUvQrEtb7Ezuxlb16OX7yrns6rgEIhkV5XxN1j/6gdcrGiWsJ900OeBr
         K6RoL5Tk347+AFFWB3yOlZHpa0Wo9fQzg05GSrZZ3ymbv5UOqDvRpCWaMz1ldebzN9FY
         kqMPeQLCIvSJC/HI2cdHm0IdbDjTHCPvFqmQ9ShQSZCpdLP+cP7M+8etUlL+hhwK2nNr
         FbN93hCpKdcvuf8uiboRFZpItxJUwUOr+XCXOTrRxQEAGwkUVWOdJa9/GYrc15d78G/x
         0dA+0ViljaUfRL2z7g9q+FiJKoFs74QIgpt98WhQwDvY7WG2RuUy3Zl9jkP8bDTtc/Ge
         oZwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766398951; x=1767003751;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PT6Q5dW5KkgWP7tZaLfWqSYR2o+Foff/zTHPq2XLG/U=;
        b=ijxCG8IxVmE5X2G5DzEnQpG8+k/TU1NYouFFxJ0sopjjkO8SFpPZSUlAQVDsU6bEks
         7aZIgvi07u6rxrnxOP/a39em8k8tKd1kqL6q6/WRjiorg4OGt1XxITX+LkntZR4edjlX
         91AsPLIe3MiCnlfA1qglBMfQyw9+NasfZzefYEJ5zPigv8WU0r8MDmeKmT5/zhsWHJbM
         5nDCVNlfIRofTqnLMwzBJXTwowso3B3NgokzIecQOL2BtlfBZE1Ogg6evqkDMGOlooey
         pDPPcdpvsXO42o9ZfBis/LMEpK8V79upg0lvbEp3aLWGGsLR4BH3VOVbfTo/DWDyElL7
         13Cg==
X-Forwarded-Encrypted: i=1; AJvYcCWo6EED4fcJGi3RDhvQKIEx/ota3XoUF0oXF/J50hjHXWtzPzGaglsZ+ChJa4zzV4+m7qtaSS+DqpiBsbwjhIzE1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWQPs7dK05jE4RcIWJ9sq8SC4inSJ9QnPR8H0iBvAqrWlRAnpz
	GLFFGwcHWOsHKS1RWihTmBW9fPIRC/9PhMlVQS6W2SAWoz7xAXMpaVspuzev2ZpHmmE=
X-Gm-Gg: AY/fxX6fgevJoPa8mbqi+0QRIOlFLruSh3YxDcLRGG7i/v/ymnx7hJl4eJSgA8nvl9y
	cH6ecX5lQEiYySCsvBiHcs7GLDCz1AIpYdKe0cFHxIYQlQI1A2z/4gQ0qxI6tG2ef1ph2FD7fsH
	Fs6ppCr/AVWv2V4L0ZHeXJnAfSHPjfnp2Eq00R4cYSo5PAmuuOyp5tptugVXHbeJFXF0fWKHbFI
	IG09Sh9YD+q2aHASAAw13yGd+VaUlFJMwfNH2CXTgFeVXHxRs01xVu4ujMnfqu1NyRmAz44HutY
	Gkudc0vAtdUI3HuIBo/93pgvtvMIbP0+157wBd646D210IZ4FsXM0jl01Uu9X1HD9wEdMHdEB0m
	VO3Ue80b8BBHxUU+hDGxDAZlR8t5JAbYeZ5hxtZTb3rklyQxVyBz4ZUD73pRA9G9tDu2SNeb94h
	NR+BpINBGkYKmS7T24vNCGF7ypGoYv56CeC37MuEQ=
X-Google-Smtp-Source: AGHT+IGxik5wZb6PJ3ZvxaBK6HnP18pgqXLZsVTlxUcURxM01dwk5X4GOejTSgcqBo9Mh0RevTTv5Q==
X-Received: by 2002:a05:6000:2203:b0:431:4c6:724d with SMTP id ffacd0b85a97d-4324e4fdb00mr12420505f8f.29.1766398950600;
        Mon, 22 Dec 2025 02:22:30 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([150.228.9.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82feasm21082813f8f.24.2025.12.22.02.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 02:22:29 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 22 Dec 2025 10:22:15 +0000
Subject: [PATCH v7 4/4] clk: samsung: gs101: Enable auto_clock_gate mode
 for each gs101 CMU
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-automatic-clocks-v7-4-fec86fa89874@linaro.org>
References: <20251222-automatic-clocks-v7-0-fec86fa89874@linaro.org>
In-Reply-To: <20251222-automatic-clocks-v7-0-fec86fa89874@linaro.org>
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
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6078;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=/Z6zZxIOHE0bexMt7q7vSkBhyGsyTsuiXJos9cuRaKY=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpSRve79sRE6Wiibe1gwos813YqTCmnceQ/Jgxj
 ODyrBDXma2JAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaUkb3gAKCRDO6LjWAjRy
 up+3EACCbn7AeVJ7SP/7s4uvGaRUCmaTr06pvM6zozJEYE+UeOH9TaLN9jslCVOvFFCAwS8b8tf
 NjFfpkUdp3yqWM6Nq0k79AKldDt85/ay/S8coqz4d/HxeJizxgKnnXUes1aYZgPk3Gj6qsCDzjP
 WigzwpGEZGeUWlEng5E6AX1p/GDo38haM4tasUTJSKJ9fIub8K3+HrMur/vncCKwR5o0Y/HQuPS
 I/1cNb559uo+JhGUmkpoMZFprCBxZquuOxL/YGas0tv7xP+rKXT9PhxI9Rn8YDh+TTAfc9C/X+t
 jCBIKqNUq4seCMq0JQsnRIKWklAmMvysUBZii0rTk1e2G6zKUXfmjEbplMIV+Y5ko6oWXTX7Rk9
 FeSvR7UAGlBM2zOgxAXszmYI6uOnIBL01bV7nE1Bc93DtbH1N8G9kboJcOiwzz/eXdD1kxEc+cC
 yAig1+wRjENdZhs9fTx4Ugmm+FhOR28v3peBDOZBi7XSgAxNKYgqbStE67MQxBjYT5/kt+beTlt
 7JXRW9/792mhNEBAL6VN+daYxGsD4gpJ8iCuO4FIHabBNke+wTv/35hZfI6HLy1WbprqkP3mp4P
 +22N9tplsARHac5+SPa1Pq+yW3EFdM0erf1ZuW1RoG3P3G4J5xpdJ8imcy758Dxo0iJ0YIQPWqV
 RZM4gcywVoUk0bg==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Enable auto clock mode, and define the additional fields which are used
when this mode is enabled.

/sys/kernel/debug/clk/clk_summary now reports approximately 308 running
clocks and 298 disabled clocks. Prior to this commit 586 clocks were
running and 17 disabled.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes in v4:
- Remove unnecessary header of_address.h (Peter)
---
 drivers/clk/samsung/clk-gs101.c | 55 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs101.c
index 70b26db9b95ad0b376d23f637c7683fbc8c8c600..8551289b46eb88ec61dd1914d0fe782ae6794000 100644
--- a/drivers/clk/samsung/clk-gs101.c
+++ b/drivers/clk/samsung/clk-gs101.c
@@ -26,6 +26,10 @@
 #define CLKS_NR_PERIC0	(CLK_GOUT_PERIC0_SYSREG_PERIC0_PCLK + 1)
 #define CLKS_NR_PERIC1	(CLK_GOUT_PERIC1_SYSREG_PERIC1_PCLK + 1)
 
+#define GS101_GATE_DBG_OFFSET 0x4000
+#define GS101_DRCG_EN_OFFSET  0x104
+#define GS101_MEMCLK_OFFSET   0x108
+
 /* ---- CMU_TOP ------------------------------------------------------------- */
 
 /* Register Offset definitions for CMU_TOP (0x1e080000) */
@@ -1433,6 +1437,9 @@ static const struct samsung_cmu_info top_cmu_info __initconst = {
 	.nr_clk_ids		= CLKS_NR_TOP,
 	.clk_regs		= cmu_top_clk_regs,
 	.nr_clk_regs		= ARRAY_SIZE(cmu_top_clk_regs),
+	.auto_clock_gate	= true,
+	.gate_dbg_offset	= GS101_GATE_DBG_OFFSET,
+	.option_offset		= CMU_CMU_TOP_CONTROLLER_OPTION,
 };
 
 static void __init gs101_cmu_top_init(struct device_node *np)
@@ -1900,6 +1907,11 @@ static const struct samsung_gate_clock apm_gate_clks[] __initconst = {
 	     CLK_CON_GAT_GOUT_BLK_APM_UID_XIU_DP_APM_IPCLKPORT_ACLK, 21, CLK_IS_CRITICAL, 0),
 };
 
+static const unsigned long dcrg_memclk_sysreg[] __initconst = {
+	GS101_DRCG_EN_OFFSET,
+	GS101_MEMCLK_OFFSET,
+};
+
 static const struct samsung_cmu_info apm_cmu_info __initconst = {
 	.mux_clks		= apm_mux_clks,
 	.nr_mux_clks		= ARRAY_SIZE(apm_mux_clks),
@@ -1912,6 +1924,12 @@ static const struct samsung_cmu_info apm_cmu_info __initconst = {
 	.nr_clk_ids		= CLKS_NR_APM,
 	.clk_regs		= apm_clk_regs,
 	.nr_clk_regs		= ARRAY_SIZE(apm_clk_regs),
+	.sysreg_clk_regs	= dcrg_memclk_sysreg,
+	.nr_sysreg_clk_regs	= ARRAY_SIZE(dcrg_memclk_sysreg),
+	.auto_clock_gate	= true,
+	.gate_dbg_offset	= GS101_GATE_DBG_OFFSET,
+	.drcg_offset		= GS101_DRCG_EN_OFFSET,
+	.memclk_offset		= GS101_MEMCLK_OFFSET,
 };
 
 /* ---- CMU_HSI0 ------------------------------------------------------------ */
@@ -2375,7 +2393,14 @@ static const struct samsung_cmu_info hsi0_cmu_info __initconst = {
 	.nr_clk_ids		= CLKS_NR_HSI0,
 	.clk_regs		= hsi0_clk_regs,
 	.nr_clk_regs		= ARRAY_SIZE(hsi0_clk_regs),
+	.sysreg_clk_regs	= dcrg_memclk_sysreg,
+	.nr_sysreg_clk_regs	= ARRAY_SIZE(dcrg_memclk_sysreg),
 	.clk_name		= "bus",
+	.auto_clock_gate        = true,
+	.gate_dbg_offset        = GS101_GATE_DBG_OFFSET,
+	.option_offset		= HSI0_CMU_HSI0_CONTROLLER_OPTION,
+	.drcg_offset		= GS101_DRCG_EN_OFFSET,
+	.memclk_offset		= GS101_MEMCLK_OFFSET,
 };
 
 /* ---- CMU_HSI2 ------------------------------------------------------------ */
@@ -2863,7 +2888,14 @@ static const struct samsung_cmu_info hsi2_cmu_info __initconst = {
 	.nr_clk_ids		= CLKS_NR_HSI2,
 	.clk_regs		= cmu_hsi2_clk_regs,
 	.nr_clk_regs		= ARRAY_SIZE(cmu_hsi2_clk_regs),
+	.sysreg_clk_regs	= dcrg_memclk_sysreg,
+	.nr_sysreg_clk_regs	= ARRAY_SIZE(dcrg_memclk_sysreg),
 	.clk_name		= "bus",
+	.auto_clock_gate        = true,
+	.gate_dbg_offset        = GS101_GATE_DBG_OFFSET,
+	.option_offset		= HSI2_CMU_HSI2_CONTROLLER_OPTION,
+	.drcg_offset		= GS101_DRCG_EN_OFFSET,
+	.memclk_offset		= GS101_MEMCLK_OFFSET,
 };
 
 /* ---- CMU_MISC ------------------------------------------------------------ */
@@ -3423,7 +3455,14 @@ static const struct samsung_cmu_info misc_cmu_info __initconst = {
 	.nr_clk_ids		= CLKS_NR_MISC,
 	.clk_regs		= misc_clk_regs,
 	.nr_clk_regs		= ARRAY_SIZE(misc_clk_regs),
+	.sysreg_clk_regs	= dcrg_memclk_sysreg,
+	.nr_sysreg_clk_regs	= ARRAY_SIZE(dcrg_memclk_sysreg),
 	.clk_name		= "bus",
+	.auto_clock_gate	= true,
+	.gate_dbg_offset	= GS101_GATE_DBG_OFFSET,
+	.option_offset		= MISC_CMU_MISC_CONTROLLER_OPTION,
+	.drcg_offset		= GS101_DRCG_EN_OFFSET,
+	.memclk_offset		= GS101_MEMCLK_OFFSET,
 };
 
 static void __init gs101_cmu_misc_init(struct device_node *np)
@@ -4010,6 +4049,10 @@ static const struct samsung_gate_clock peric0_gate_clks[] __initconst = {
 	     21, 0, 0),
 };
 
+static const unsigned long dcrg_sysreg[] __initconst = {
+	GS101_DRCG_EN_OFFSET,
+};
+
 static const struct samsung_cmu_info peric0_cmu_info __initconst = {
 	.mux_clks		= peric0_mux_clks,
 	.nr_mux_clks		= ARRAY_SIZE(peric0_mux_clks),
@@ -4020,7 +4063,13 @@ static const struct samsung_cmu_info peric0_cmu_info __initconst = {
 	.nr_clk_ids		= CLKS_NR_PERIC0,
 	.clk_regs		= peric0_clk_regs,
 	.nr_clk_regs		= ARRAY_SIZE(peric0_clk_regs),
+	.sysreg_clk_regs	= dcrg_sysreg,
+	.nr_sysreg_clk_regs	= ARRAY_SIZE(dcrg_sysreg),
 	.clk_name		= "bus",
+	.auto_clock_gate        = true,
+	.gate_dbg_offset        = GS101_GATE_DBG_OFFSET,
+	.option_offset		= PERIC0_CMU_PERIC0_CONTROLLER_OPTION,
+	.drcg_offset		= GS101_DRCG_EN_OFFSET,
 };
 
 /* ---- CMU_PERIC1 ---------------------------------------------------------- */
@@ -4368,7 +4417,13 @@ static const struct samsung_cmu_info peric1_cmu_info __initconst = {
 	.nr_clk_ids		= CLKS_NR_PERIC1,
 	.clk_regs		= peric1_clk_regs,
 	.nr_clk_regs		= ARRAY_SIZE(peric1_clk_regs),
+	.sysreg_clk_regs	= dcrg_sysreg,
+	.nr_sysreg_clk_regs	= ARRAY_SIZE(dcrg_sysreg),
 	.clk_name		= "bus",
+	.auto_clock_gate        = true,
+	.gate_dbg_offset        = GS101_GATE_DBG_OFFSET,
+	.option_offset		= PERIC1_CMU_PERIC1_CONTROLLER_OPTION,
+	.drcg_offset		= GS101_DRCG_EN_OFFSET,
 };
 
 /* ---- platform_driver ----------------------------------------------------- */

-- 
2.52.0.351.gbe84eed79e-goog

