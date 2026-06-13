Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E9E3C2B82
	for <linux-samsung-soc@vger.kernel.org>; Sat, 13 Jun 2026 05:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781328043; cv=none; b=Vyi5l8ykUUZ4Rf44CQ7XXXrnqUvCjTq9yeHRUgdqkD0Z92PMQYLAgZRU9k0NhLQQ8BGAvqpKegjd92qA8fkE28mF9Ny7a0agnp8yc5YFQxgT9tEOvSTQwCctpNi876uf9CMhAJeoeB4DfsrXWMXvxxuQBqd87Soc/Ks6mEFE17c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781328043; c=relaxed/simple;
	bh=7Mhi088K4JbmXLsghbRGkWUhMJ0OIYyxUcPPBdeO4Vw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gA+Fl9inLPF1f7jQOSz/C4SaUUvCGMg9MKzVP6Hh5YHl4RyzL+pgUpwVpZ0qhgYHSLh1Vi52eqhdt5Mga3pFfILKlQZuu01xY64YBsFl1t/eNoqkYrof2VuIJwkws7NCH1mDwZYANVKhbSDSO9aVREsqsxX3A4tEz9W/tghUhLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gCYC7lDT; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gCYC7lDT"
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-963b70c2678so1070842241.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Jun 2026 22:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781328039; x=1781932839; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ovyq5VY0HrDmnxwXqGTum6kqu484G9zPMiuaByi5weY=;
        b=gCYC7lDTN801y/iu2x/gJc/DhEJBlyKCyocihcH8aTNbvx0NlNiIzcfTbbofjgEBAC
         KV0JztAm/0x/of6ejVeJKdKGqHk+Rknhz71MJPx0+Tq2nfesuF1+DmKXyhf76KSMJTJ/
         z/CItGnrcs/dpS6/Qg82K3EpJNwJA9zgL0A1u71K1MGCfNLRGz58zHqA/v113S26Z1m4
         kNVjTJxwv5/dzVwf8CpU01tXc47Ge2IdiB0rq5PzGSQpztVeh+YbWxksmbbbaword5iW
         PtkNEP0jWKa1V3Rf2NM2GDjClY9k7dbUNRxflNSWpYiRKxpkp6ff/5dQQCUbs0plyj4j
         vZgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781328039; x=1781932839;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ovyq5VY0HrDmnxwXqGTum6kqu484G9zPMiuaByi5weY=;
        b=l/dVvF3Gc8hsP5vAQV8BO84Cm8ke/zLMnivTTj+ggD3F9ROo9Y7oKRtQhqY2DukVV4
         PtegvDA/VjWe8fPmXFvkOKDNdicR70FRuOB6EZqAu9sryA4Q5EQI6+Tgh5Ez8M8Paopq
         2zhITIhCpu0Is7ntdTJR+PDtkIQZZRSUDeA9UOzkdQ2JhN/idNpcFdLozJu/GphVIxJy
         xexnvUJ9Ei38jg1N5p7HAvWxtUWrfcZlwHj8w0MVDGjp4pMrvDnacXNwT0+F0GaX4kkY
         ETa/ZeWvUdxupGFTxx+QTcE7isuJdV/1Yt8so4iq0vbxqND8D1QlknSEdxZs4tEMtM24
         /ZPQ==
X-Gm-Message-State: AOJu0YwauJ+xULmYB7hIH31jC9uWlWcsL9q7MDp7yaQ5EStdJDE5zThd
	uoIYUBwE9sYdEUAaJbaZz+tFWFR3gLXuR9Pz/RxFHXaFuzXGxBZgEVgT
X-Gm-Gg: Acq92OGKF2tyBsbHbxYFcNY6WQDuchegmdAQOOkzOzAb8yJFJ2ARwk1YZO6gBWp9N6S
	ztB0Qrq28nwu/UrZgR0FcuYc/d5sNOxBwAZ1XoY1Qi/V6JB8vFjr3JGEBR+vbMyYqGnbNnkW63X
	ibyoOWBhqw7WW8+n11Y+POrRwlrRng6zzxud5cSNiUo0kDDi0KHm6J4U8Ku2qeb1kLicT7RmBEE
	u3+Rofr4P2eBbktaozbXUBXqeUrmLK94PRffQxwkIp/uPZYymZeVVLtcFheE8P9GwKVt17YLaBl
	v8OTMo81rzRnOoj8XXFtMxOM3J4eAZbfRdZCzGQSrYz2RWX/L/CYZxq83MlHrOrgGjvhttruO/F
	eD+TPiCQmbjRU2N3+dxEfSF1dT02YypgzY4S6zfVn+VldKUx2jfKlhgxL1BPrTixOQVg4RvfP3Y
	5D9UUx2GwSPi5ghiIcNK/J+DIhLt4DKihVtXzlSaQ=
X-Received: by 2002:a05:6122:4d8b:b0:567:4e8a:fb13 with SMTP id 71dfb90a1353d-5bb6c05beefmr3545667e0c.8.1781328039294;
        Fri, 12 Jun 2026 22:20:39 -0700 (PDT)
Received: from [127.0.0.1] ([38.252.222.136])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bb69014308sm4848692e0c.7.2026.06.12.22.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 22:20:38 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Sat, 13 Jun 2026 00:19:52 -0500
Subject: [PATCH v2 2/2] clk: samsung: exynos990: Fix PERIS gate clock
 parents
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260613-exynos990-peris-fix-v2-v2-2-3dff7ade75b3@gmail.com>
References: <20260613-exynos990-peris-fix-v2-v2-0-3dff7ade75b3@gmail.com>
In-Reply-To: <20260613-exynos990-peris-fix-v2-v2-0-3dff7ade75b3@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781328021; l=4330;
 i=wachiturroxd150@gmail.com; s=20250819; h=from:subject:message-id;
 bh=7Mhi088K4JbmXLsghbRGkWUhMJ0OIYyxUcPPBdeO4Vw=;
 b=Eyg5vZ285Yt4XsqlCXfDhI6gutnRY1/qm7OGvSamzvTejycc9Ex+wbJKzBbJ+K8I7VPEBIZTW
 vObz5hhT0QTBZj6W7HOAE6UCPhEdJ+zqVsb7vsunsTNs/+XVHigtLbR
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=qNvcL0Ehm3chrW9jFA2JaPVgubN5mHH//uriMxR/DlI=

Correct eight PERIS gate clock parents to match the hardware clock
tree, reorder the GIC mux parents, and add the missing TMU_SUB_PCLK
gate.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 drivers/clk/samsung/clk-exynos990.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos990.c b/drivers/clk/samsung/clk-exynos990.c
index 4385c3b76dd6..df5928833b23 100644
--- a/drivers/clk/samsung/clk-exynos990.c
+++ b/drivers/clk/samsung/clk-exynos990.c
@@ -21,7 +21,7 @@
 #define CLKS_NR_HSI0 (CLK_GOUT_HSI0_LHS_ACEL_D_HSI0_CLK + 1)
 #define CLKS_NR_PERIC0 (CLK_GOUT_PERIC0_SYSREG_PCLK + 1)
 #define CLKS_NR_PERIC1 (CLK_GOUT_PERIC1_XIU_P_ACLK + 1)
-#define CLKS_NR_PERIS (CLK_GOUT_PERIS_OTP_CON_TOP_OSCCLK + 1)
+#define CLKS_NR_PERIS (CLK_GOUT_PERIS_TMU_SUB_PCLK + 1)
 
 /* ---- CMU_TOP ------------------------------------------------------------- */
 
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
@@ -2600,27 +2600,31 @@ static const struct samsung_gate_clock peris_gate_clks[] __initconst = {
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
 	     "gout_peris_d_tzpc_peris_pclk", "mout_peris_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_PERIS_UID_D_TZPC_PERIS_IPCLKPORT_PCLK,
 	     21, 0, 0),
+	GATE(CLK_GOUT_PERIS_TMU_SUB_PCLK,
+	     "gout_peris_tmu_sub_pclk", "mout_peris_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIS_UID_TMU_SUB_IPCLKPORT_PCLK,
+	     21, 0, 0),
 	GATE(CLK_GOUT_PERIS_TMU_TOP_PCLK,
-	     "gout_peris_tmu_top_pclk", "mout_peris_clk_peris_gic",
+	     "gout_peris_tmu_top_pclk", "mout_peris_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_PERIS_UID_TMU_TOP_IPCLKPORT_PCLK,
 	     21, 0, 0),
 	GATE(CLK_GOUT_PERIS_OTP_CON_BIRA_OSCCLK,

-- 
2.54.0

