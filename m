Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3472D3E5EE2
	for <linux-samsung-soc@vger.kernel.org>; Sat, 13 Jun 2026 12:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781354212; cv=none; b=V9XmRkniMeSpY5J6R8M8Jx6QWUCK1yDWHuIxN8mKhP98b6dU0lkcRrVPbRdx/DolzT4y803tTxDtGSfXLrZtrnVM+fuSj1PD652KDTqUN5k7QDwFELWlROO5nVUkZJ9CLgNizxSQXfiUSPdzsmncmta5kqVJ6TNyW0Kin/a0XCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781354212; c=relaxed/simple;
	bh=8QsT5qMevIWG1r4CekVOQr7GSa6vcMhLRdQO614ENU8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ozy6hroTg2L7CtYs223rW4WIUCD1nGIpCMzvzpVc6tSQjieaB9t8MJiHtQtTbb5ohajxQ4m8cnQTQN1T3epPpUdCzPOjSCmbs2jJ/HC3BzjYP8A+k6giNMMtjVkmiKBqk1Rti5uN7cgehg/35Bg9l2BKtL+YZscbbE57o3Aun2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j1NxmSFz; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j1NxmSFz"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-304e83724bfso2814528eec.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 13 Jun 2026 05:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781354210; x=1781959010; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k4USlR/wTC53+DK1xOyOVELLpPn6dQVqos5QLqbfQPM=;
        b=j1NxmSFzOiqZf8mWZ/7Cn7e3K6qMkGJeV445+HSmYdOymJZZouuwPoaI+qwwC4P+A5
         hC9bMLQ6R0KaNe0Uh/rRiSwhVgYJfQArTBrjW8Ke+a0E/qJDbOMpDa6vayChXcgkwnUP
         HM1alEEx3o+ZDEOOnVZ63IPgGKoMwmPwCSDh8NTqkxb7y9Z+AhdYEG7A+yt1q7iyHd+K
         hp0mFvRYwXOfSQ6Tfiljmr3skCXH3p8C6di+v/MDOAWTV/r4d05OLqRv+zWjijZq8fVJ
         fB9W3p3XJXg1h1yyfnIgpEB5TPaZxKPY+uCswsHqVLNtIRBkCGsSz0jou9YrjnIA9hct
         R/ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781354210; x=1781959010;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k4USlR/wTC53+DK1xOyOVELLpPn6dQVqos5QLqbfQPM=;
        b=LYYQ+mFeXAJzb4FuNW7YcTA3pfMjLPEQ/Afd88C7gL3E3HjFhtjKlqyJkfQpub4CHZ
         U8luZtbfHlz4gSZBXOyIK51wVInlvR8zMDiOojqyKt1Bxvlf9zmv9O3T8HWunZUIQcZ1
         v5x0cVdWbqd3gN4BL4iAsQ1juC0nQjAgsZi49REP28RR4VCROg5W09Tez4UwDvjgVy5y
         ek3RsW0NxJ7F8QHHHdYpUKeCch30xoTmadaOyspIKdvUpSfg819T2Vtx5kIHBoLhYgDF
         lg7vNWK1Rrc+OMUzLbp8P8LcKDvv+cUdHEtlv/zp6wwzc2cld3eIiVj19WjM9xqCWl+x
         eX8A==
X-Gm-Message-State: AOJu0YzDQ3LhpI6r8Z5oSwf8/q6fZ9V8gmvmldQc8zKlNJXIf5Llg/UF
	guF1viayumbz/vb/x2SCxAkI+UCFyf7gDPEP6vedvqo/ZpRptLlYA5FF
X-Gm-Gg: Acq92OH1VCyJvSMUf2schSx8LsqmftTwlbhf9SPyJP0aAeFl7f/EXz8t6bYITLPhg0z
	sDs6TF4knSbLPyJ71WFlv2FIwoo1JLxM0udAYcigrCwp9GeftaTAR6/jKfDC6LG82prPWgHSoAE
	NJaDILIPAMyL75zYGpIbF1yB2rhZELZVENEumGtFae/BvrZwfdXkjX+Yani3E07zz158yYIxuHv
	sIhBXYgm2piobECP9aNeWSDPOKUgwAlLNw5O6faOgoqm1WgmvmwTBOvjW0isHzDK3FvWpACW2Gs
	dursu3A9FKSsSprsgJ8E7SVmpFHA3nJdBN2Jrdjkdvtquh838XIg86YzU48NIEqdajG29gu07GT
	xmk+hr6clSRWG9zPeTkk9TuG32c0tZptu0coiUMivLXWFT3bmP9BJIVTVy59pYFINAvfdOkrIkH
	MrvP9NY9LsXgYZqMrmwOk0d5Ln0fUc
X-Received: by 2002:a05:7300:d513:b0:304:54d6:20f3 with SMTP id 5a478bee46e88-3081ff3da47mr3614433eec.4.1781354210099;
        Sat, 13 Jun 2026 05:36:50 -0700 (PDT)
Received: from [127.0.0.1] ([38.252.222.142])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081eb95450sm9176630eec.28.2026.06.13.05.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 05:36:49 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Sat, 13 Jun 2026 07:36:18 -0500
Subject: [PATCH v3 3/3] clk: samsung: exynos990: Fix PERIS gate clock
 parents
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260613-exynos990-peris-fix-v3-v3-3-2b230db78ae4@gmail.com>
References: <20260613-exynos990-peris-fix-v3-v3-0-2b230db78ae4@gmail.com>
In-Reply-To: <20260613-exynos990-peris-fix-v3-v3-0-2b230db78ae4@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781354194; l=3772;
 i=wachiturroxd150@gmail.com; s=20250819; h=from:subject:message-id;
 bh=8QsT5qMevIWG1r4CekVOQr7GSa6vcMhLRdQO614ENU8=;
 b=ihYZln6EC8btrpTxULgjKOmfDRIQxFeQLj9PPzVgyazaKnnRWT2mIMsb9cFanykEkbWDFuL65
 zqMsltsBrMjDXF5b8zKilor295hReYlHkfEKHOAhh2CJsa00CRG/Fkx
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=qNvcL0Ehm3chrW9jFA2JaPVgubN5mHH//uriMxR/DlI=

Correct eight PERIS gate clock parents to match the hardware clock
tree and reorder the GIC mux parents so mout_peris_bus_user is the
default source.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 drivers/clk/samsung/clk-exynos990.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos990.c b/drivers/clk/samsung/clk-exynos990.c
index ee3566b8e57c..df5928833b23 100644
--- a/drivers/clk/samsung/clk-exynos990.c
+++ b/drivers/clk/samsung/clk-exynos990.c
@@ -2551,7 +2551,7 @@ static const unsigned long peris_clk_regs[] __initconst = {
 
 /* Parent clock list for CMU_PERIS muxes */
 PNAME(mout_peris_bus_user_p)		= { "oscclk", "mout_cmu_peris_bus" };
-PNAME(mout_peris_clk_peris_gic_p)	= { "oscclk", "mout_peris_bus_user" };
+PNAME(mout_peris_clk_peris_gic_p)	= { "mout_peris_bus_user", "oscclk" };
 
 static const struct samsung_mux_clock peris_mux_clks[] __initconst = {
 	MUX(CLK_MOUT_PERIS_BUS_USER, "mout_peris_bus_user",
@@ -2584,15 +2584,15 @@ static const struct samsung_gate_clock peris_gate_clks[] __initconst = {
 	     CLK_CON_GAT_GOUT_BLK_PERIS_UID_RSTNSYNC_CLK_PERIS_BUSP_IPCLKPORT_CLK,
 	     21, 0, 0),
 	GATE(CLK_GOUT_PERIS_CLK_PERIS_OSCCLK_CLK,
-	     "gout_peris_clk_peris_oscclk_clk", "mout_peris_bus_user",
+	     "gout_peris_clk_peris_oscclk_clk", "oscclk",
 	     CLK_CON_GAT_CLK_BLK_PERIS_UID_RSTNSYNC_CLK_PERIS_OSCCLK_IPCLKPORT_CLK,
 	     21, 0, 0),
 	GATE(CLK_GOUT_PERIS_CLK_PERIS_GIC_CLK,
-	     "gout_peris_clk_peris_gic_clk", "mout_peris_bus_user",
+	     "gout_peris_clk_peris_gic_clk", "mout_peris_clk_peris_gic",
 	     CLK_CON_GAT_GOUT_BLK_PERIS_UID_RSTNSYNC_CLK_PERIS_GIC_IPCLKPORT_CLK,
 	     21, 0, 0),
 	GATE(CLK_GOUT_PERIS_AD_AXI_P_PERIS_ACLKM,
-	     "gout_peris_ad_axi_p_peris_aclkm", "mout_peris_bus_user",
+	     "gout_peris_ad_axi_p_peris_aclkm", "mout_peris_clk_peris_gic",
 	     CLK_CON_GAT_GOUT_BLK_PERIS_UID_AD_AXI_P_PERIS_IPCLKPORT_ACLKM,
 	     21, CLK_IGNORE_UNUSED, 0),
 	GATE(CLK_GOUT_PERIS_OTP_CON_BIRA_PCLK,
@@ -2600,19 +2600,19 @@ static const struct samsung_gate_clock peris_gate_clks[] __initconst = {
 	     CLK_CON_GAT_GOUT_BLK_PERIS_UID_OTP_CON_BIRA_IPCLKPORT_PCLK,
 	     21, 0, 0),
 	GATE(CLK_GOUT_PERIS_GIC_CLK,
-	     "gout_peris_gic_clk", "mout_peris_bus_user",
+	     "gout_peris_gic_clk", "mout_peris_clk_peris_gic",
 	     CLK_CON_GAT_GOUT_BLK_PERIS_UID_GIC_IPCLKPORT_CLK,
 	     21, CLK_IS_CRITICAL, 0),
 	GATE(CLK_GOUT_PERIS_LHM_AXI_P_PERIS_CLK,
-	     "gout_peris_lhm_axi_p_peris_clk", "oscclk",
+	     "gout_peris_lhm_axi_p_peris_clk", "mout_peris_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_PERIS_UID_LHM_AXI_P_PERIS_IPCLKPORT_I_CLK,
 	     21, CLK_IGNORE_UNUSED, 0),
 	GATE(CLK_GOUT_PERIS_MCT_PCLK,
-	     "gout_peris_mct_pclk", "mout_peris_clk_peris_gic",
+	     "gout_peris_mct_pclk", "mout_peris_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_PERIS_UID_MCT_IPCLKPORT_PCLK,
 	     21, 0, 0),
 	GATE(CLK_GOUT_PERIS_OTP_CON_TOP_PCLK,
-	     "gout_peris_otp_con_top_pclk", "mout_peris_clk_peris_gic",
+	     "gout_peris_otp_con_top_pclk", "mout_peris_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_PERIS_UID_OTP_CON_TOP_IPCLKPORT_PCLK,
 	     21, 0, 0),
 	GATE(CLK_GOUT_PERIS_D_TZPC_PERIS_PCLK,
@@ -2624,7 +2624,7 @@ static const struct samsung_gate_clock peris_gate_clks[] __initconst = {
 	     CLK_CON_GAT_GOUT_BLK_PERIS_UID_TMU_SUB_IPCLKPORT_PCLK,
 	     21, 0, 0),
 	GATE(CLK_GOUT_PERIS_TMU_TOP_PCLK,
-	     "gout_peris_tmu_top_pclk", "mout_peris_clk_peris_gic",
+	     "gout_peris_tmu_top_pclk", "mout_peris_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_PERIS_UID_TMU_TOP_IPCLKPORT_PCLK,
 	     21, 0, 0),
 	GATE(CLK_GOUT_PERIS_OTP_CON_BIRA_OSCCLK,

-- 
2.54.0

