Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED54326924
	for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Nov 2025 14:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763129830; cv=none; b=gspcTncdT3BouUlZgTQlEMmeGXSpaSzqloyTPIypl+1k/R3BSQYTxFGKEJ64kb6/5H7szUsRdy24ex6CM8Es7PjdmF8AuxlEA5uBZ5joHmPMjKHWURDtZ63mCYZWfIZn/m26k2k4pfANxO65KYC44dIOCFmhiCBWMafPI9j3h9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763129830; c=relaxed/simple;
	bh=MKpewkNORbzAchE7rOq+25/zxxY9N/8QM3gYPecQu2A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Aw5ccsXM8KVCV+3AgxeVRYTOvZZ+Fk+vRjXHb5cDFpY02vfO0sNN4gJ4w5udkNpmXZMuBYwjOT+3E7GhitmZxAJJRBnOImv9WIVCGsZTqc2W65fb5fLM4BcuOV0qw6XoBTZj1LopvtQ9u96Ulq/bzT+jp9fLEYU6MPLyUeLxTTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZQAARk+L; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZQAARk+L"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-42b38de7940so1229319f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Nov 2025 06:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763129826; x=1763734626; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=izrTMD0huWeNRknL/GAHd/+r7uT+qo4tnd5Axn/4bzo=;
        b=ZQAARk+L8r2QWoNIGy4x6c806Qak/afdbwsAVRt7Idx6ubN6YUqqKKN6M2d/adwx/I
         2wtmu0jkNwwqA9sThzVS14XhlgUHIrxoSRISbIhO59JUjImUsigoyXko3nruo7n3/iaF
         LV2AX3Ojovkq4RCviuAzEXX39pGEkMvZyHL4AXXjE+AxdnrSopbM0XeF3/xDPk5aIFcP
         +wdSkrUAkJYtGGhw2YIzol1IT2be25zQ+OVgrV8wqR//sSRHGIAc/U6WB49OTpPv6yUy
         YBpBn/jHZ43F2Z7eI1pcoJUKoarJ8CjQiD/DhaklxbnpBaofvKm33IV6L4HQ3+Q4RACL
         dhIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763129826; x=1763734626;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=izrTMD0huWeNRknL/GAHd/+r7uT+qo4tnd5Axn/4bzo=;
        b=aYdnrIozBti6wK3Lx1yy10QKFZ9dZHUC10QebSpVpefJbHZAm83VQH0vfOhXHLLBbF
         JrcwkOZ392s0GUzGyn5HREJkjR4H3JyRwpcrmlrPvaAzQIUDou61fIZHVMKATjLWtXVE
         Ct/hHT7UE6uWRWGBid5N399YpqtZPnVXmXbjCjxikwckCF6oVQya5kO4vh4oB54lvF7e
         SSt2xGIIVEhuQXHVOfODqiiaHVdD8IhJFVmxKJLR6SZyCsnkJcsuiMEbQdQNR5e2qO6F
         d3wHxNJi2dr57X+HE4noh7AaOVZlXXko2lB1owyZMGOKF/m/6K12ZJz/fgJFnXr/XErR
         VGhg==
X-Forwarded-Encrypted: i=1; AJvYcCVTvAl5wHNWDvJu/mQy5WiE6G6o1ePFREsVuIEZPu9Vc1Qh8heJgtMHVZ9/Lyu4H73MBRjMm4KwFqCrd6RGlRhQdA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEv2eVg98vmOZsPp89m3BkrOblLtWzyIs1a033l2H7AAMsbkv5
	r+at7kp1S7yOQ6t0tZ4bEUAt8K4baChXuf4K7FM5vPL0CEHbc8gzvFfu+ewarZVEAaA=
X-Gm-Gg: ASbGncvcBawWuz0a2QX2+pwqDJaeyOJPhlXik3uzBEh81aRINIsmY63cMieDWd2Kiko
	ZjvOZheuMAyxqBaR83jDYB9TwgNEGTQY9VWs5Awxuw0/SrTKCurx9I5UDpzyj468B2apoFcz1ny
	8gvbfQEcrH1SZ95FmPYCtu2dODR+gPBQVUWTkG+Ta7Hdee53zzXlqFXJgAcEos/dqOFEpdoBH8C
	tylFEASn1SVJl8lJwpeov1X6T2WheveJaQPwKSrcUN9B94hUEcXGCLpm83Khy2prALB49c55Ig9
	wfk8Z9ayNeuOI0AvuDZfGHBxAgLZ8q56DM+22AphZfqQmuzfbPIfXc/cJHFqyRCZ/dBzwpAtY4a
	2PlGpuFFNBA8O5UxEgyr6pAMfmO+nphBivHfh4mbq6ejIjQPpw+SRsDB3cIMINlIdgvtKQUpMHZ
	pB90Xmt+rIFg00kiI3SoKhxuei91+7MQ==
X-Google-Smtp-Source: AGHT+IH96TxZeOefX8+SY8uloxCFq2LKDEjHOXQ7zqlH0Jw8f3vwrEecayPgVM4Hu/FkPGbODo1b8g==
X-Received: by 2002:a05:6000:2509:b0:42b:4803:75e8 with SMTP id ffacd0b85a97d-42b5937335fmr2978794f8f.43.1763129825971;
        Fri, 14 Nov 2025 06:17:05 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([145.224.65.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f21948sm10150958f8f.43.2025.11.14.06.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 06:17:05 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 14 Nov 2025 14:16:51 +0000
Subject: [PATCH v5 4/4] clk: samsung: gs101: Enable auto_clock_gate mode
 for each gs101 CMU
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-automatic-clocks-v5-4-efb9202ffcd7@linaro.org>
References: <20251114-automatic-clocks-v5-0-efb9202ffcd7@linaro.org>
In-Reply-To: <20251114-automatic-clocks-v5-0-efb9202ffcd7@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6082;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=MKpewkNORbzAchE7rOq+25/zxxY9N/8QM3gYPecQu2A=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpFznZjRn7B08lXbfeHCgvZruDuguZEiCYDtEZS
 G6Sh7bBJoGJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaRc52QAKCRDO6LjWAjRy
 utPTD/4p8UJafm5z3n3XNt0BjCf+MReD7ndnIAJlkxzL9tG0v7gAUB8VT7IHK+rdTOuHBtKT0RQ
 SI1kX0hDDlVkGwi6OLZHK7tjqtyzdMy4Xo23R1MmHvl3NPOx9rytFuMEJrOEdxDstjbq6eqA9y/
 bgt8VkED8iWLgDGTb1ONPkhhyXTiomMYxJItr9G8GU7PChZOGwcuMqww3xu88CFWId0O9xK5aif
 +Ns6ID7pcOeSU8upN564uKZRBeQOEskxWnZuf2ucuMnD41DP17B/vBcKJqJhBs4L2BkalLGDKPk
 /dN9k3u+YxK3dYPq1u1I01D9FAbYYv3rE3zy8U4Dume5HlFZULcooAAUwYsYM9Q8reX4EtnW9Sm
 PijR3oY6A6VYn2/HzbVPuoagtV0WWAYMtdHkQ+2jxYJei9CvqVZZI4b6hZ595CtZUngeA3WY6vp
 RNm+saZuAbHfsd6W0OIrdErK6hxh8c0Ziwt9o0kXSU5QV/ggB9dHe5+lQyTIW+XLzaHrwrnkgDt
 fQfKd1lBICfMNTqUbR7rq9UEkjAR20tip3tWMmhUJQ3NdnUQsR8r1cc6vX+bI5vnYDbhYsW1kh4
 ggAJJRfQpoCGUwXXE2DzWytdrvE+JUKtRlfYlTtnSHtrCYIDFdEn2X46xUwWbqA14CvAfbIAd1s
 DcDh9yE70fsUFvA==
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
2.52.0.rc1.455.g30608eb744-goog

