Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1486313266
	for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Nov 2025 14:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762784522; cv=none; b=VdmLDDpJn4pHYUzZ0t+WIM9MQZjKBBnkpFvncHRyXKf7cpqdRdrLp/7Qk2VYwLVeQO8ULfvTh6uL2Sy+68BdWUuFty0iUy1UCe7/9MsQAVmJhzMEwjy5uNEKfJq21VVY7jhDAVQasM70zLYZ5N3kHx9ILJIlDqbGRy0o1iJrFOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762784522; c=relaxed/simple;
	bh=jIypiDUl624lNEyYLbun0Yh5DHuTSkotJxPTbp5HxfU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gxOYu30ftykg0igd3pRUbgZaHvTZArO61eQ2GJeVKi5e9IIfbrJlUEj8JcLGIx8YXWCl6yRV/27uUzZOJEfOrnKZVxLVzNWHbZ147hD6H98fNdhYJqoYSzsKSo26xI/gu/AsUEIuT8/b1D3HDdJ0l0lzYS5OedMx+gPcE5MWmfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=czeVBVZ5; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="czeVBVZ5"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4775ae77516so36732425e9.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Nov 2025 06:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762784518; x=1763389318; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yOwFRvCEdZzkFfvfdm8z0oYu/8qYTs1V1OQGGoFSV3M=;
        b=czeVBVZ5oxwhWOiD5LN30GsD6cXa6BWk3vUWshw+398GNFtGMLu5cOgBPFyCplFrdT
         0R2o+NSQleoqdeXETpV5yZgSLzqI44ymC1CZbdtsoaR0vSeIJLRknLEQVvQdA9X9cuZb
         oVjDxHWco99GNm4avABzf23vXI2wRrbuSAkDZXqovLvNNvOfAVYwEJtjHXYkQR4h46A4
         IbIHIrLR4+tc45Qy0sfGuWD2txgM4K2yMRGyKGVpJuX4WZ952LqpvzT5ojjV+zv7h/Dv
         yaV2PhMEHETAtDmlp1F4CpQgjT7U0014D5vPNO6idaBk9EQ70LLYPjygXfTYw9cCF2hf
         viIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762784518; x=1763389318;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yOwFRvCEdZzkFfvfdm8z0oYu/8qYTs1V1OQGGoFSV3M=;
        b=EI6N8oLN0dNejs8HqtP/Z3WzlkFjM9c0+95lQafhxOVPtEDrv+g7BJyOnrAaT3N3a/
         l3+QN0QxMs/nCjSd2EB20OFa2QPnu3/1C69VJWliqRuv7cWt9jbUqmbxwbHorQ/xbAlf
         gzPkZ4eJvMkIc1vHxvMHpNeFr8lnh3zd1kHCr1HhPL6wjWXzqYAVNnH54bCa1B5eff6d
         bg0Eh1jt4HSFNQFbkyzWAWNA6UqEMnCSyDUtsslQPofqDrJx4ur7hHFojtjPRsnspPzV
         yNrmueyJd4ssFqm3JpLbOMhQeO5ooewQAf9NY/ufpv2delrq0qLTFx22C8JQsafoSoGn
         OGtg==
X-Forwarded-Encrypted: i=1; AJvYcCXqzvmH7PGQttealFqjsK6fOwGpRkWEy3Fb/zUFm03HQz2GWQYad5v0DPqLEocGSzyEn9BnywpzvYev8V7cA5Jnrw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2tmR63M1E746KoVFaLuBxNJ5y7+EFcTb+y5Te8qNAm7nDqE+3
	hkXglpKYOAcRisj31gSnb48p6nf8vThDVRh7xRbwvEyB3r6jfpagLD0Hzm2LX4+ZL5d78LP6zg1
	otxOPb2Q=
X-Gm-Gg: ASbGncupbrpfFCw8QrH3qY3w7LQV9bLltA3M/urbwRhL2otCFOcg52LOz8f4b8WtjkE
	al7hg+3VFqrWC3sTrO99p/7XSzYhte2wY98tOpMC1cRLAxjWr3FdKQfU0RQtuvuRVjgmQFm3hK8
	IHNfMo8GIprrTEE/3W+ES7Wfrea3VgLXZJZ02aCLdMnFcmhUQL1+gRH4/Pcs86I3G5IaE8gsv1s
	Q6r0TPvEhl7oyO++5P+YzMEZPJf2OjvoOrbBELvM6U88hXWlenzhvfZYL7mP2tCRUpqC2GxOJhF
	TUG29kFRMND5gYmOthEb28lgBXxAnZ8+va8C8+k7YntCVUZ/3wIARj6Koo+FAXKZf+w0obYZt7j
	ACgvb/8orSo/fxw55tlfgfZToP95gZ1+Spv1cIjXjQCVaY16/XEYp+VlMyGCZfmCBm3d+MqvCL4
	Jt8sejLPooBxxgjSru6y4IllxWQaOjuJlcjwWBhoHJ
X-Google-Smtp-Source: AGHT+IF2FY+sfpra6zGaJJU5705lujYWG3mUN0dR5cqOL38u/TK/JHtBicpV9yf2j7aNAokYl58Mbw==
X-Received: by 2002:a05:600c:4448:b0:477:7a62:9e5e with SMTP id 5b1f17b1804b1-4777a629f9bmr41454755e9.29.1762784517602;
        Mon, 10 Nov 2025 06:21:57 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([145.224.90.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4776a953414sm104369435e9.0.2025.11.10.06.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 06:21:57 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 10 Nov 2025 14:21:43 +0000
Subject: [PATCH v4 4/4] clk: samsung: gs101: Enable auto_clock_gate mode
 for each gs101 CMU
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-automatic-clocks-v4-4-8f46929f50b7@linaro.org>
References: <20251110-automatic-clocks-v4-0-8f46929f50b7@linaro.org>
In-Reply-To: <20251110-automatic-clocks-v4-0-8f46929f50b7@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6079;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=jIypiDUl624lNEyYLbun0Yh5DHuTSkotJxPTbp5HxfU=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpEfT8e0Iue7MCveOT7FhgBeWjwRUZfaZbi9SGQ
 Owj5idFyl2JAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaRH0/AAKCRDO6LjWAjRy
 uk7vD/93ZXmcGiRvOsKCrysJwj+fxuO+fcvsiFohPcxKlt3+A/McbgRi3oHMpg9lWgOWTu6e1Gv
 /tB6Yozt/J76iYstqgp6TJ5wGwCdloW73ctS72pQfUn8t9OrD19P065p3CyfXlU0uKFoF28JBlD
 o39taPk6KhsI5lOnS5fEZKNswPy2ao1eBxgo79CuiGk8Y/8LuWbzY68ZoDeOKqX38lgRUgue4cz
 hgbBwgAzaxHbbxZXHJkfnvPgm/q3fXgCXsvzXUOiJUTGzyykaAtK/F4y7TcsvgcX5U2xpyYq1Ap
 jcYXEBYjz/aA+p3bxpfZmBOofbnyBffw0jULPHIOdeUZrdH1ilnFq2jRf5NHnIjbRELI89lWdDl
 hZ/ozZ2oXGF+gNaKABGf2kFGPYYmRpJHG1oliFfS65/LdmLQVEIb7zxs4aPuWAT3OrHqYYlRskr
 SA9YXPepfCQpY5ef9ylXq2k555mdlKXtlrYwGlWIwdYtefxAzPfeGqlEmbwjyfpPW0OzNb/w5Jk
 5mUu/Swq3m2FmbJGUJKnN40FTEqViNN5zSoH91l60g0CC12UxpMouPBwL9jfJwj/9EvJypa1znI
 Iuyvce+nC5/6ywmLPGgREt43uu1+HvB1KiYr7sN1Vz8nABKYdIHFNKO/Oz2V/IfIGpKrmCQ5ttd
 Jq/m3267ddOcdlQ==
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
2.51.2.1041.gc1ab5b90ca-goog

