Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9EA9355F42
	for <linux-samsung-soc@vger.kernel.org>; Fri, 29 May 2026 01:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780017049; cv=none; b=Ih7MyaNCavddMi0Uax/pleeVQAct1y7BzyxhObFl7+LQQWTCRrco/xJvFtnJKn+QBYpxldO4oNtp870SApaqPote9NGh7sXquaw3cyAJhdfIV22Zv2nXW8zELoUYyIpAGV+5dEuEvNAVpuFV/9ScI3slyxq45TWWlej4mNiSYSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780017049; c=relaxed/simple;
	bh=3HgbklMkFFcdOufEzpAr23OlOouec0egYoQeV8Kj2ew=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gd2jj1uA3bzTQB2K6U/tdyvX7ZXn47ILmGHhpwyOYyiwfKZn1s1nkKOn5hQdei02BMj9RJHfi/g97GrMu6b00toux7tzNCDHK3JLERa61/fZ7+tKqmGZJPxxxqhTA5dORZ5TtIOnGNNDUZxOw/NC+0L/f+biB7Jhlp9OWAOvtZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kyd/RcmH; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kyd/RcmH"
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-960b00874cfso5289284241.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 May 2026 18:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780017047; x=1780621847; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+9rCaR21M/nc3/i6qSSe04SnKU+FWJmA2yPT3FUP/WY=;
        b=kyd/RcmHOQbYxnITQIEkQLytunQB7VbtsO9TVTBobkiygs1k66jGmsjhsEdx5CX7sN
         YMx9jaBL7dgb/D0bltk9l+flHmaNWSCIBffcvvqDhbaRgJFrhrUwZQAzuM/bCOo12v+2
         Kyq8x53jkGNgVpYAlUgsaZaf/eRHi7nbSSNswyUb9OGZXvvvwveaVI5VWTUCgfpzJp6J
         bFP2Yua5XbFi3A2RAnUbqBg50ZryHXUWZW5/gJ0v7AAeor1tlkGT1uDNc7Y6igOOUI9g
         GQ/b9Naxc4MP9OGkL2UfW/T9y16RETvnBasfPLlZtZRbRj9dLCNIS84z+z5Sk1IpEEES
         gZ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780017047; x=1780621847;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+9rCaR21M/nc3/i6qSSe04SnKU+FWJmA2yPT3FUP/WY=;
        b=gq1GX3RGCf0ucg3+1KLDBDJSQJGLgMxyT5vOuPE2lpWiLzGpd5GGSR0mR33vx7WlPp
         1XEIXBE9xozdz1Wm6oa0tnGNo5PW4GrbG/8UlO8w7EoCPw1O/W9RCuRauDjmVLYK2KSL
         pG3nrV1IsJcuIb2EJD7nEM2h31FPDBT+LkQ1l2CSBLmscBxgu3ALip6uUVCxA6wR3HKn
         SeaMDAGHO0f/sbppq3NUflm8jkrIHmaUmboApZrpMpaYOdDnKmfE1uXwlS6d/tH8A4JP
         55jKSn5Zlcx4sAFCVM1Q2m09PYBWea61+xaU9vNX/iIIIWNqmH1Dl3wDnIxIaAMEDP3L
         y0FQ==
X-Gm-Message-State: AOJu0YxpsjEJ7yk1WgzJ0hOgEXRjdYJmDB68bpRFApTBzsS5qMdC4059
	hKjIiGmgLnDbh4PSGvDzcXw/QM4Zp/bLJKM3OfxO834JnfB7/YrY4td0idA0OseG
X-Gm-Gg: Acq92OGfhy17YPK7I2/u8dvtQNb/UxhxaMad0ttYueywv+Rd/HKNQW6/aVp792jOJVe
	97Ggmjvkb7SkIyAaNoigB1omfe65sWmtV74nLBP/JIO++dUYT/GEunIt0LwWmo1pJM3iLBpVv1y
	VMioiwHl+Wz1+c3Cv6lf4xssSek7CMD7KzTRPwkCyNTH8dqAlgzXJHNGMyaoqTkEpSl1sj45qcb
	Ezbs1hz9/OTJYc33MJT/mnPin5Vj7Y4Lu5ECAiMwyxDIPthkCd3PnGfnEWwJjlX7QJfiTr6VRW0
	pDNQfQS9Lhqbf3LePX6dPvDM6MHBHLOPRx7Wh1ao/B0VdU++Olux+HmaXCuZx46AlLgNorszJTF
	bQu8nrk7Za96x11tVHe8bet1Wx+S2q5GwjHxXYGNX2LQu/4ke6jdKwfFVrNZCNLWRcoNuUkFtqu
	IIBYyay2tvmXkQ/aIKSnR+DfE=
X-Received: by 2002:a05:6122:3401:b0:56c:3a57:aee2 with SMTP id 71dfb90a1353d-599f67cea76mr184555e0c.6.1780017046650;
        Thu, 28 May 2026 18:10:46 -0700 (PDT)
Received: from [127.0.0.1] ([2a02:6ea0:5505:7199::29])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-599d3c9662esm311912e0c.3.2026.05.28.18.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 18:10:46 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Thu, 28 May 2026 20:10:39 -0500
Subject: [PATCH] clk: samsung: exynos990: Fix PERIS gate clock parents and
 add TMU_SUB
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260528-exynos990-peris-fix-v1-1-5b65aa7def2d@gmail.com>
X-B4-Tracking: v=1; b=H4sIAI7nGGoC/yWMwQrCQAwFf6XkbGAN3dL1V8SDXV81HrZlo1Ip/
 XejHmdgZiVDVRgdmpUqXmo6FYf9rqF8O5crWC/OJEG6EKVnLO8yWUqBZy+NR11YokSkrm9HZPJ
 yrnD9ux5Pf7bncEd+fFe0bR8Py/AydwAAAA==
X-Change-ID: 20260528-exynos990-peris-fix-2525e9684fec
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>
X-Mailer: b4 0.15.1

Correct eight PERIS gate clock parents to match the hardware clock
tree, reorder the GIC mux parents, and add the missing TMU_SUB_PCLK
gate.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 drivers/clk/samsung/clk-exynos990.c           | 24 ++++++++++++++----------
 include/dt-bindings/clock/samsung,exynos990.h |  1 +
 2 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos990.c b/drivers/clk/samsung/clk-exynos990.c
index 6277dd557..f1f5297f5 100644
--- a/drivers/clk/samsung/clk-exynos990.c
+++ b/drivers/clk/samsung/clk-exynos990.c
@@ -21,7 +21,7 @@
 #define CLKS_NR_HSI0 (CLK_GOUT_HSI0_LHS_ACEL_D_HSI0_CLK + 1)
 #define CLKS_NR_PERIC0 (CLK_GOUT_PERIC0_SYSREG_PCLK + 1)
 #define CLKS_NR_PERIC1 (CLK_GOUT_PERIC1_XIU_P_ACLK + 1)
-#define CLKS_NR_PERIS (CLK_GOUT_PERIS_OTP_CON_TOP_OSCCLK + 1)
+#define CLKS_NR_PERIS (CLK_GOUT_PERIS_TMU_SUB_PCLK + 1)
 
 /* ---- CMU_TOP ------------------------------------------------------------- */
 
@@ -2572,7 +2572,7 @@ static const unsigned long peris_clk_regs[] __initconst = {
 
 /* Parent clock list for CMU_PERIS muxes */
 PNAME(mout_peris_bus_user_p)		= { "oscclk", "mout_cmu_peris_bus" };
-PNAME(mout_peris_clk_peris_gic_p)	= { "oscclk", "mout_peris_bus_user" };
+PNAME(mout_peris_clk_peris_gic_p)	= { "mout_peris_bus_user", "oscclk" };
 
 static const struct samsung_mux_clock peris_mux_clks[] __initconst = {
 	MUX(CLK_MOUT_PERIS_BUS_USER, "mout_peris_bus_user",
@@ -2605,15 +2605,15 @@ static const struct samsung_gate_clock peris_gate_clks[] __initconst = {
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
@@ -2621,27 +2621,31 @@ static const struct samsung_gate_clock peris_gate_clks[] __initconst = {
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
diff --git a/include/dt-bindings/clock/samsung,exynos990.h b/include/dt-bindings/clock/samsung,exynos990.h
index 47540307c..c06f591d9 100644
--- a/include/dt-bindings/clock/samsung,exynos990.h
+++ b/include/dt-bindings/clock/samsung,exynos990.h
@@ -434,5 +434,6 @@
 #define CLK_GOUT_PERIS_TMU_TOP_PCLK		17
 #define CLK_GOUT_PERIS_OTP_CON_BIRA_OSCCLK	18
 #define CLK_GOUT_PERIS_OTP_CON_TOP_OSCCLK	19
+#define CLK_GOUT_PERIS_TMU_SUB_PCLK		20
 
 #endif

---
base-commit: e7d700e14934e68f86338c5610cf2ae76798b663
change-id: 20260528-exynos990-peris-fix-2525e9684fec

Best regards,
--  
Denzeel Oliva <wachiturroxd150@gmail.com>

