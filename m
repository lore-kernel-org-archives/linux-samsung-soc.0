Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064D931AF2D
	for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Oct 2025 21:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761773447; cv=none; b=a2by7E9TWvpqWxpvggnD9hD+DBabtw5wrudwX6+zBhhkS8ExOPBaFpHSH9wl7fvrbF1LJGme1DWheI/WouMzmDRL8wmEy1WWJ2EDEpX9TMlcQ8lEX3+ar7LKtjdPPOr3nVhVRfZzTFGQQRN3OyMWlBBP/BRzSoIFLI4gIGFFrUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761773447; c=relaxed/simple;
	bh=oM4kL/PXCK2EPatzGpk867zg8TyU+43TUg05bDgKThA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e98kbU7tefuKCWJcLACdpRm/GAFTPziDtWfM4WUju5Ak/l1IzldPxXf55/AM22MF3UpiTDCWdN2JK6R1seDLudcl89QwGNpan7oDH2qDzdhfUXH9EqcGoM8PBHgq5O4Hxc5sXzIUMOn/7unG0TngHtLHWUBm7hKAKWf5QfcQeB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kpQH43vS; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kpQH43vS"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4270a3464bcso239869f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Oct 2025 14:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761773443; x=1762378243; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZFhpMv0TS5z8Ka1Q09jnxxHQC5OXHmjo9VvdfZH94aA=;
        b=kpQH43vSVGPaS8MuW/rJmks9W1PLXnSfNjdCDq8P/yG05PntsiTt+KzqaJ6BRDtcGr
         dCulFsqqBNm3NxlaqO4k7IRehheIH6pwwc7ad2HzVSFrDOxQn2UowjQ2LBhP2HCpw6At
         hdy7ptBrVYIDrm4HVpGwClFOYIV9wScGgK/jRBhIIMe7k1JFzuXQv8xcniIWN2J0ooMG
         qXvvpdCUKunRWaf/cLYLFqck0iabbrpvWrq1fyPtQPmUkRa+Zsyqdj1vMGmuAxnJmog0
         Zagiq4jkR4WnXG0ZBYpQhwunxfaRPaMvamwgn9Gj9YEBhKgikYZ5MyCFsJv8Aw/3mXwF
         Y7xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761773443; x=1762378243;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZFhpMv0TS5z8Ka1Q09jnxxHQC5OXHmjo9VvdfZH94aA=;
        b=cabHh+qw9yEikMYJhlof+TE6I8ozse5MwkS4PcZZ8o8CWcofBonvOULid+PTZNdfxb
         urTHvUoH70v3fiweb9FTkicXNA8/88kKEDeMvu/FSVzqFPSASecsa0m0Ko7ydHeL0TkG
         xqYQaUDaiFUC+o7oRHB48JmbMurHZGS8jyHB5Rax8TNjgQ9ioE4wbPnDP7S8uKeeu+Kv
         3QJJGG2Gjt5D4zlkaz+1znPXGPbHy0fzbljS1F9eTZ+GUJbnOUxggAuvIys4X02gozBn
         FLuEv4RVoKs6mIquqq+Xy+VfEAKPxVdmMT74Ovp7gx756XALd+/GEjS5nO41kBy4kNTH
         kRJg==
X-Forwarded-Encrypted: i=1; AJvYcCU36cb1xrZ1GJepvuwYUy2I8zdkY2eOcKzGOCch5P6hKcLnCE1/rQy/DOaj/G1g2U3ExhOeZvFYKSssKOPgB4Qdwg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqdSSfNYTDzUaE9z8NjkDLhJ5QBMytgAH1pP0uzQfUM+mdcQii
	XuH45O1ujl7VXShrDFA5qC+WlvBjAhedWh+10FqVZ6QU2Rt3JaXka0mlge5To9qGOQc=
X-Gm-Gg: ASbGnctEigd2BBKW7HlbHJ2ELO0qQZadhYlgiOgtB6Wb+ynbbpFRX2mc+GSMVY8SXHV
	JK7MJIdoZCKIaKKDMOFUi5Gt6HDQ1OSoYlZ3b1vTPEWKNnn6TgSXqVjrEdQv8Uih4gMGQt5zrEb
	UTaQTGd+vKjxdqAq1MlyVukyozfgzGiJqfJEdJFVLqQ0SJ3tMBYvkgyZuS2iIMMyh2JBNYSGdJs
	JvmD0eW830GrwNLVCi1hCop8M7NuRmo1clShSVmCUx1Y/4flk+wEWiUWbQqUr4Qyk+U3GIxEP3G
	miZPA7n6MKT9TJEQvTahlp0Ev0kbK2Yh+dRvnVIfZyrn99lP+5f3O436gsO6YYpeeXfpn52CTWo
	upkDK+MqZ1DAnrwUdiDN2lu8T+Vzjt/t4MHmAbmknKnLLkr2gQ/Xe99JDLvOYIv117aSHcjeXEp
	uHDDlcFu3f2BsC8kFX9Ax9JNS5iriAjA==
X-Google-Smtp-Source: AGHT+IHVKBgjvBcg1f/6q88hadZlvNZkx1IaeehmFQmwK/82FK+KqLJA2Oi5GwkBpiXwwokUglXnGg==
X-Received: by 2002:a05:6000:2006:b0:427:847:9d59 with SMTP id ffacd0b85a97d-429b4c9ee68mr1094202f8f.45.1761773443210;
        Wed, 29 Oct 2025 14:30:43 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.90.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952b7b43sm28573457f8f.6.2025.10.29.14.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 14:30:42 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 29 Oct 2025 21:29:25 +0000
Subject: [PATCH v2 4/4] clk: samsung: gs101: Enable auto_clock_gate mode
 for each gs101 CMU
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-automatic-clocks-v2-4-f8edd3a2d82b@linaro.org>
References: <20251029-automatic-clocks-v2-0-f8edd3a2d82b@linaro.org>
In-Reply-To: <20251029-automatic-clocks-v2-0-f8edd3a2d82b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6237;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=oM4kL/PXCK2EPatzGpk867zg8TyU+43TUg05bDgKThA=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpAod4kOXb2zATBSZi/XvWQU+uUmKxKhl+dduVU
 SSmHS8LRxaJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaQKHeAAKCRDO6LjWAjRy
 uvt4D/9OY4nx/ssfdyJfQsLWXa4i/pTsHM7F9uszUzRBnrjQQ8G6kzTI0gS4k5L+My4tHiYMzIg
 IB9D9hhN9dLM4lhsnR+cQDd6A8yFp5izu78n0pVC93sJe0ESdXmVI/0eEkHB9oCTcvhyPp8smOl
 j/tgdTiLclBB7KnLoe6bBRZTfy2Y6b91xIoyaDLuE1jRdln8b2h5zlE2XubIUqitTFSXlNacfI0
 r7PoQY646CnLo51RpsRpPsKDXqwEqegI0o7/0St4GPkXiKq532mUyegf89RZJe3SdfPUJFqZfN2
 5hRgje4cyWgXU1UDlbhUW4rkToPhpQODp4Aqp+CSa+yY+lutEFmNMpuYGMyLPHLzwzTY8Ek98it
 lE7IfuKN2+nKIiGyWsNjvSGHlLj8qNEQoBezUGShZBcecEHf+lddPfohia2mYmgka0LH6guH/c5
 J0wiZvDPJkGkPK7f2T87KG/8UEqYxpKbQJhWQOm3nlC7/SS+fbLcmalHoP2t0pAOTLr3+gA+w4B
 nNyBRayv7yVqytIVVDpX1FMkL2OR+FKX3BaW3eDS5saHqVp1ReNDyuaN4vEGi9E9rNANrqZ4xiB
 NgV+ZVB+k4exZjd6D4sJQyZJcavHSJhcLX7jjaHLTs67kilnRJh9Iu/ksj7enAiNZ6igT/vA4v6
 bTu4W3eS7BVVodw==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Enable auto clock mode, and define the additional fields which are used
when this mode is enabled.

/sys/kernel/debug/clk/clk_summary now reports approximately 308 running
clocks and 298 disabled clocks. Prior to this commit 586 clocks were
running and 17 disabled.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/clk/samsung/clk-gs101.c | 56 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs101.c
index 70b26db9b95ad0b376d23f637c7683fbc8c8c600..68c5ed8f0fe1cac5169313b6ec705f9eec44ff53 100644
--- a/drivers/clk/samsung/clk-gs101.c
+++ b/drivers/clk/samsung/clk-gs101.c
@@ -9,6 +9,7 @@
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/platform_device.h>
 
 #include <dt-bindings/clock/google,gs101.h>
@@ -26,6 +27,10 @@
 #define CLKS_NR_PERIC0	(CLK_GOUT_PERIC0_SYSREG_PERIC0_PCLK + 1)
 #define CLKS_NR_PERIC1	(CLK_GOUT_PERIC1_SYSREG_PERIC1_PCLK + 1)
 
+#define GS101_GATE_DBG_OFFSET 0x4000
+#define GS101_DRCG_EN_OFFSET  0x104
+#define GS101_MEMCLK_OFFSET   0x108
+
 /* ---- CMU_TOP ------------------------------------------------------------- */
 
 /* Register Offset definitions for CMU_TOP (0x1e080000) */
@@ -1433,6 +1438,9 @@ static const struct samsung_cmu_info top_cmu_info __initconst = {
 	.nr_clk_ids		= CLKS_NR_TOP,
 	.clk_regs		= cmu_top_clk_regs,
 	.nr_clk_regs		= ARRAY_SIZE(cmu_top_clk_regs),
+	.auto_clock_gate	= true,
+	.gate_dbg_offset	= GS101_GATE_DBG_OFFSET,
+	.option_offset		= CMU_CMU_TOP_CONTROLLER_OPTION,
 };
 
 static void __init gs101_cmu_top_init(struct device_node *np)
@@ -1900,6 +1908,11 @@ static const struct samsung_gate_clock apm_gate_clks[] __initconst = {
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
@@ -1912,6 +1925,12 @@ static const struct samsung_cmu_info apm_cmu_info __initconst = {
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
@@ -2375,7 +2394,14 @@ static const struct samsung_cmu_info hsi0_cmu_info __initconst = {
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
@@ -2863,7 +2889,14 @@ static const struct samsung_cmu_info hsi2_cmu_info __initconst = {
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
@@ -3423,7 +3456,14 @@ static const struct samsung_cmu_info misc_cmu_info __initconst = {
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
@@ -4010,6 +4050,10 @@ static const struct samsung_gate_clock peric0_gate_clks[] __initconst = {
 	     21, 0, 0),
 };
 
+static const unsigned long dcrg_sysreg[] __initconst = {
+	GS101_DRCG_EN_OFFSET,
+};
+
 static const struct samsung_cmu_info peric0_cmu_info __initconst = {
 	.mux_clks		= peric0_mux_clks,
 	.nr_mux_clks		= ARRAY_SIZE(peric0_mux_clks),
@@ -4020,7 +4064,13 @@ static const struct samsung_cmu_info peric0_cmu_info __initconst = {
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
@@ -4368,7 +4418,13 @@ static const struct samsung_cmu_info peric1_cmu_info __initconst = {
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
2.51.1.851.g4ebd6896fd-goog

