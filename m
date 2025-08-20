Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43052343D87;
	Wed, 20 Aug 2025 14:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755701959; cv=none; b=Ui8oV2wIXzYM1ccsWUYuw9BcA61/FEe+E1IFsB1ZrWgWa4c2hGxjuTxswnnFrGATX8VXXSwfO9JrYyM6zqtwSw2MCG8AZ+kR/b4sua+3K36GFLH08X8dDsXTZoDlBvJ+Bh9XKqcnnKEXUezh7cacARcCebak5SqxqZNj3CRRoso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755701959; c=relaxed/simple;
	bh=08L0O1QzjB06mEEmW7E8BQyzmJgrxO6aKMGsjwBWY9M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S3koSe373xem1b6B6wmUs2Ew3+CkASjPMYsz3HqodMVz0i64WvVhT8QLczbIKyAAZ8DloIK49ceohLTAzJZmD9geSKH2jQ2uu2Co1RLSmtauphz1YJqB+3aLIgTU/Pt4IZJM0n2u3BNAnqokiHIodkjoJoqd9fXW4mW4RZVgzIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WRmH393X; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WRmH393X"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-32326e69f1dso7958a91.3;
        Wed, 20 Aug 2025 07:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755701957; x=1756306757; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gbzi7bKOiZkPR4tVr8Rl75IJu4u69w506O4duD5k0zQ=;
        b=WRmH393XYChjxsH3fCruL64jSM6m1jeJPlDyAtOp4seRBh1i7u/qxysLTOpWY+kutM
         6ryaWm9dvYSspl96sOUQZWLHKXBjnfVllqfRNySObGjvsAMq9ZRfxVlYtT+gwgV4hDuy
         1YnU4zLQW3UpXZ8rr9ixJPJsP5H+vb7YBCMOrxs/dqA86mmpQWqHuHdaqSpjTdvC6iSs
         JD2afTuQR/k6upr5L1BHdV8//H2VpEi+bNLHjxcyBebczGZKioYKECLsxt3QMXgQajN/
         UEtlq91J3VeSRXEDKPwFNcYrhFulsQRWWyI264hOIpB6G7wy0cYC259UbHbmDfmDaHw5
         JdEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755701957; x=1756306757;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gbzi7bKOiZkPR4tVr8Rl75IJu4u69w506O4duD5k0zQ=;
        b=cII+nR3QL2ac2BstJIY4kR+W8X3jEdVxxT0flVs2r93XZ9h7/JSfGAdyN7duqCmwzC
         qTPwLH5M5DZuzl9qcZCdyi8pK/oV65+rBoVNbbVdKmlUmf1vRNx8H9AWpoI2KgjiUkuo
         OFi3fHFwyzI0tDxPWcRg2wJ+fdeyusk7b8WjI9zPhIehyaHnfUcedgRQ95QAnI7svxZl
         1iQ/sH+ZoeejWnCM3FVWqpx1UZGGkE3Mc5/jjaAO4Q/o2lnJcqCiZkBjD9orbaU+dx/o
         i9Nxtx8atko1bEuS2Xhj0ufyGxENbN0rdNmiTaRMUvjbgEQ7Ezx+6s2gE7hHMVsfxTs/
         O/Eg==
X-Forwarded-Encrypted: i=1; AJvYcCUeS7ExJaiNs5et5VmHkvYLeGo2LoPS/11uZpGN265V+6k/oPVjk89Y1AFvmNAvcwoSG5yB2zYU8Rfk@vger.kernel.org, AJvYcCV4KuteEa4dY4Is0vhbj5j7eN5pHxpRdXwzTdmamcdp6qEL6vdTA5ljO77HDYB4pYikwUFnqA2D+6+B@vger.kernel.org, AJvYcCVUUxr16YV3kLyRw4Tl4h8Wv7IEjAWyvnYIwQqNqRZlv/nIYG8D4KMviuzlKoosBLOxEZdbW6q2qqUOEPxw@vger.kernel.org
X-Gm-Message-State: AOJu0YwYajujjZ89Spr/BbkRGR4mJ7VV8Rdu5biT+WaXVFAcNa5U0M+n
	EyUM9Esme1tNIMftd0uC56Do5/qj13ivqF4R4EpvvDqQgLOyR8EvwgTk
X-Gm-Gg: ASbGncvia3cHpYTgt1NmKYmT5nd/DoiN8XwCodinaRHs54uZi0nxu1yL+36Ov62Ps57
	dRUCKdzJNodaJ1W00638ZS51+oB6v/Nh7H0DOervEJ2bfv+yqVQGKWUv7Rk1YaJdt+TlWy+PRmJ
	eCGbL6zAdAHk5dDa/87glDQ50iDMAZg3TQ8YQ1cO34vnV3EB2vxQ0mvCDxH6yPwb4JkjCgHlFzQ
	lB+wDNlUqyAacAKAOVUqLXir4po77I1AOjn16uWD68Kkgd0/JwcSA0+QUQTxA3mEHGoEpkoObQR
	OFXmLqDD7dVCs1ThyTLyoAUGRcvV4/paSbjxOXBICaobd58NYQpkNbQxbnHSaK5t/DjW/wnbZfc
	vR6+1ubU9qD6z9NEHmguFMIWVYZX4FJJ+xuPP1JUh35UMQiw=
X-Google-Smtp-Source: AGHT+IGIPMmmi+mgr0mAE1JQsz1veRMJRyPlRi1U97wGAtb3S18yQ9jwLbrK+aFHnPQ5j5mKg5P57A==
X-Received: by 2002:a17:90b:4fc7:b0:323:7e81:7faa with SMTP id 98e67ed59e1d1-324e14557e7mr3738888a91.36.1755701957464;
        Wed, 20 Aug 2025 07:59:17 -0700 (PDT)
Received: from [127.0.0.1] (aulavirtual.utp.edu.pe. [190.12.77.24])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-324e257809esm2606455a91.24.2025.08.20.07.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 07:59:17 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Wed, 20 Aug 2025 09:57:22 -0500
Subject: [PATCH v2 1/3] clk: samsung: exynos990: Fix CMU TOP mux/div widths
 and add fixed-factors
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-2-v2-1-bd45e196d4c4@gmail.com>
References: <20250820-2-v2-0-bd45e196d4c4@gmail.com>
In-Reply-To: <20250820-2-v2-0-bd45e196d4c4@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755701949; l=6236;
 i=wachiturroxd150@gmail.com; s=20250819; h=from:subject:message-id;
 bh=08L0O1QzjB06mEEmW7E8BQyzmJgrxO6aKMGsjwBWY9M=;
 b=DiclXwUL8lWy/P/EylsoMUXhN7bjdPJ0nOLt5SECWdfpBvCt5RXYZI2aLUSBvCGlkmvgdGbG4
 bqiEAeCBxVcA4wAnuyYaWvchxH2BpmD73W0mHwobldpE2fKD3WBxYEm
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=qNvcL0Ehm3chrW9jFA2JaPVgubN5mHH//uriMxR/DlI=

Correct mux/div bit widths in CMU TOP (DPU, DSP_BUS, G2D_MSCL,
HSI0/1/2). Replace wrong divs with fixed-factor clocks for
HSI1/2 PCIe and USBDP debug. Also fix OTP rate. These align
with Exynos990 downstream cmucal and ensure correct parent/rate
selection.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 drivers/clk/samsung/clk-exynos990.c | 33 +++++++++++++++++++--------------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos990.c b/drivers/clk/samsung/clk-exynos990.c
index 8d3f193d2b4d4c2146d9b8b57d76605b88dc9bbb..a55991ebb77bcb2988071fc156dbe5c9b100215f 100644
--- a/drivers/clk/samsung/clk-exynos990.c
+++ b/drivers/clk/samsung/clk-exynos990.c
@@ -759,11 +759,11 @@ static const struct samsung_mux_clock top_mux_clks[] __initconst = {
 	MUX(CLK_MOUT_CMU_DPU_ALT, "mout_cmu_dpu_alt",
 	    mout_cmu_dpu_alt_p, CLK_CON_MUX_MUX_CLKCMU_DPU_ALT, 0, 2),
 	MUX(CLK_MOUT_CMU_DSP_BUS, "mout_cmu_dsp_bus",
-	    mout_cmu_dsp_bus_p, CLK_CON_MUX_MUX_CLKCMU_DSP_BUS, 0, 2),
+	    mout_cmu_dsp_bus_p, CLK_CON_MUX_MUX_CLKCMU_DSP_BUS, 0, 3),
 	MUX(CLK_MOUT_CMU_G2D_G2D, "mout_cmu_g2d_g2d",
 	    mout_cmu_g2d_g2d_p, CLK_CON_MUX_MUX_CLKCMU_G2D_G2D, 0, 2),
 	MUX(CLK_MOUT_CMU_G2D_MSCL, "mout_cmu_g2d_mscl",
-	    mout_cmu_g2d_mscl_p, CLK_CON_MUX_MUX_CLKCMU_G2D_MSCL, 0, 1),
+	    mout_cmu_g2d_mscl_p, CLK_CON_MUX_MUX_CLKCMU_G2D_MSCL, 0, 2),
 	MUX(CLK_MOUT_CMU_HPM, "mout_cmu_hpm",
 	    mout_cmu_hpm_p, CLK_CON_MUX_MUX_CLKCMU_HPM, 0, 2),
 	MUX(CLK_MOUT_CMU_HSI0_BUS, "mout_cmu_hsi0_bus",
@@ -775,7 +775,7 @@ static const struct samsung_mux_clock top_mux_clks[] __initconst = {
 	    0, 2),
 	MUX(CLK_MOUT_CMU_HSI0_USBDP_DEBUG, "mout_cmu_hsi0_usbdp_debug",
 	    mout_cmu_hsi0_usbdp_debug_p,
-	    CLK_CON_MUX_MUX_CLKCMU_HSI0_USBDP_DEBUG, 0, 2),
+	    CLK_CON_MUX_MUX_CLKCMU_HSI0_USBDP_DEBUG, 0, 1),
 	MUX(CLK_MOUT_CMU_HSI1_BUS, "mout_cmu_hsi1_bus",
 	    mout_cmu_hsi1_bus_p, CLK_CON_MUX_MUX_CLKCMU_HSI1_BUS, 0, 3),
 	MUX(CLK_MOUT_CMU_HSI1_MMC_CARD, "mout_cmu_hsi1_mmc_card",
@@ -788,7 +788,7 @@ static const struct samsung_mux_clock top_mux_clks[] __initconst = {
 	    0, 2),
 	MUX(CLK_MOUT_CMU_HSI1_UFS_EMBD, "mout_cmu_hsi1_ufs_embd",
 	    mout_cmu_hsi1_ufs_embd_p, CLK_CON_MUX_MUX_CLKCMU_HSI1_UFS_EMBD,
-	    0, 1),
+	    0, 2),
 	MUX(CLK_MOUT_CMU_HSI2_BUS, "mout_cmu_hsi2_bus",
 	    mout_cmu_hsi2_bus_p, CLK_CON_MUX_MUX_CLKCMU_HSI2_BUS, 0, 1),
 	MUX(CLK_MOUT_CMU_HSI2_PCIE, "mout_cmu_hsi2_pcie",
@@ -862,7 +862,7 @@ static const struct samsung_div_clock top_div_clks[] __initconst = {
 	    CLK_CON_DIV_PLL_SHARED4_DIV4, 0, 1),
 
 	DIV(CLK_DOUT_CMU_APM_BUS, "dout_cmu_apm_bus", "gout_cmu_apm_bus",
-	    CLK_CON_DIV_CLKCMU_APM_BUS, 0, 3),
+	    CLK_CON_DIV_CLKCMU_APM_BUS, 0, 2),
 	DIV(CLK_DOUT_CMU_AUD_CPU, "dout_cmu_aud_cpu", "gout_cmu_aud_cpu",
 	    CLK_CON_DIV_CLKCMU_AUD_CPU, 0, 3),
 	DIV(CLK_DOUT_CMU_BUS0_BUS, "dout_cmu_bus0_bus", "gout_cmu_bus0_bus",
@@ -889,7 +889,7 @@ static const struct samsung_div_clock top_div_clks[] __initconst = {
 	    CLK_CON_DIV_CLKCMU_CORE_BUS, 0, 4),
 	DIV(CLK_DOUT_CMU_CPUCL0_DBG_BUS, "dout_cmu_cpucl0_debug",
 	    "gout_cmu_cpucl0_dbg_bus", CLK_CON_DIV_CLKCMU_CPUCL0_DBG_BUS,
-	    0, 3),
+	    0, 4),
 	DIV(CLK_DOUT_CMU_CPUCL0_SWITCH, "dout_cmu_cpucl0_switch",
 	    "gout_cmu_cpucl0_switch", CLK_CON_DIV_CLKCMU_CPUCL0_SWITCH, 0, 3),
 	DIV(CLK_DOUT_CMU_CPUCL1_SWITCH, "dout_cmu_cpucl1_switch",
@@ -924,16 +924,11 @@ static const struct samsung_div_clock top_div_clks[] __initconst = {
 	    CLK_CON_DIV_CLKCMU_HSI0_DPGTC, 0, 3),
 	DIV(CLK_DOUT_CMU_HSI0_USB31DRD, "dout_cmu_hsi0_usb31drd",
 	    "gout_cmu_hsi0_usb31drd", CLK_CON_DIV_CLKCMU_HSI0_USB31DRD, 0, 4),
-	DIV(CLK_DOUT_CMU_HSI0_USBDP_DEBUG, "dout_cmu_hsi0_usbdp_debug",
-	    "gout_cmu_hsi0_usbdp_debug", CLK_CON_DIV_CLKCMU_HSI0_USBDP_DEBUG,
-	    0, 4),
 	DIV(CLK_DOUT_CMU_HSI1_BUS, "dout_cmu_hsi1_bus", "gout_cmu_hsi1_bus",
 	    CLK_CON_DIV_CLKCMU_HSI1_BUS, 0, 3),
 	DIV(CLK_DOUT_CMU_HSI1_MMC_CARD, "dout_cmu_hsi1_mmc_card",
 	    "gout_cmu_hsi1_mmc_card", CLK_CON_DIV_CLKCMU_HSI1_MMC_CARD,
 	    0, 9),
-	DIV(CLK_DOUT_CMU_HSI1_PCIE, "dout_cmu_hsi1_pcie", "gout_cmu_hsi1_pcie",
-	    CLK_CON_DIV_CLKCMU_HSI1_PCIE, 0, 7),
 	DIV(CLK_DOUT_CMU_HSI1_UFS_CARD, "dout_cmu_hsi1_ufs_card",
 	    "gout_cmu_hsi1_ufs_card", CLK_CON_DIV_CLKCMU_HSI1_UFS_CARD,
 	    0, 3),
@@ -942,8 +937,6 @@ static const struct samsung_div_clock top_div_clks[] __initconst = {
 	    0, 3),
 	DIV(CLK_DOUT_CMU_HSI2_BUS, "dout_cmu_hsi2_bus", "gout_cmu_hsi2_bus",
 	    CLK_CON_DIV_CLKCMU_HSI2_BUS, 0, 4),
-	DIV(CLK_DOUT_CMU_HSI2_PCIE, "dout_cmu_hsi2_pcie", "gout_cmu_hsi2_pcie",
-	    CLK_CON_DIV_CLKCMU_HSI2_PCIE, 0, 7),
 	DIV(CLK_DOUT_CMU_IPP_BUS, "dout_cmu_ipp_bus", "gout_cmu_ipp_bus",
 	    CLK_CON_DIV_CLKCMU_IPP_BUS, 0, 4),
 	DIV(CLK_DOUT_CMU_ITP_BUS, "dout_cmu_itp_bus", "gout_cmu_itp_bus",
@@ -980,7 +973,17 @@ static const struct samsung_div_clock top_div_clks[] __initconst = {
 	DIV(CLK_DOUT_CMU_VRA_BUS, "dout_cmu_vra_bus", "gout_cmu_vra_bus",
 	    CLK_CON_DIV_CLKCMU_VRA_BUS, 0, 4),
 	DIV(CLK_DOUT_CMU_DPU, "dout_cmu_clkcmu_dpu", "gout_cmu_dpu",
-	    CLK_CON_DIV_DIV_CLKCMU_DPU, 0, 4),
+	    CLK_CON_DIV_DIV_CLKCMU_DPU, 0, 3),
+};
+
+static const struct samsung_fixed_factor_clock cmu_top_ffactor[] __initconst = {
+	FFACTOR(CLK_DOUT_CMU_HSI1_PCIE, "dout_cmu_hsi1_pcie",
+		"gout_cmu_hsi1_pcie", 1, 8, 0),
+	FFACTOR(CLK_DOUT_CMU_OTP, "dout_cmu_otp", "oscclk", 1, 8, 0),
+	FFACTOR(CLK_DOUT_CMU_HSI0_USBDP_DEBUG, "dout_cmu_hsi0_usbdp_debug",
+		"gout_cmu_hsi0_usbdp_debug", 1, 8, 0),
+	FFACTOR(CLK_DOUT_CMU_HSI2_PCIE, "dout_cmu_hsi2_pcie",
+		"gout_cmu_hsi2_pcie", 1, 8, 0),
 };
 
 static const struct samsung_gate_clock top_gate_clks[] __initconst = {
@@ -1126,6 +1129,8 @@ static const struct samsung_cmu_info top_cmu_info __initconst = {
 	.nr_mux_clks = ARRAY_SIZE(top_mux_clks),
 	.div_clks = top_div_clks,
 	.nr_div_clks = ARRAY_SIZE(top_div_clks),
+	.fixed_factor_clks = cmu_top_ffactor,
+	.nr_fixed_factor_clks = ARRAY_SIZE(cmu_top_ffactor),
 	.gate_clks = top_gate_clks,
 	.nr_gate_clks = ARRAY_SIZE(top_gate_clks),
 	.nr_clk_ids = CLKS_NR_TOP,

-- 
2.49.0

