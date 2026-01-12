Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E983224A049
	for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Jan 2026 14:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227429; cv=none; b=Q1ehFi+OsFwAgYYe5hdUZAve69/9MJix8M2mOm+ZaeqjD60wzC62NmvLL3hea60NoZdTA5PcWLWUCMpvdBqf+sJNn3ym/Ca7LIcnbWIjYH9TUJnxycDsIReO6Xvi+cv59YNl+7Rl7qLYKOwHXjjiOjEenpeIcroJuOgKiMCZEnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227429; c=relaxed/simple;
	bh=4hCNU/zTiEuhIaW9FSW3u1zfJKYx1V3LP5oT3O9RbZw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RKd617Bc8+bltleVBZvXKhV4z1TXydyVtFWSTvAWKL8c8X76RqdqrVvq8xE64+OXRNfp+vNt6D8x1jREuz9BmE55AM8o0WV9GktxtAWJVPKaYnBU05vHhowCCT47huN1sonQ8UdKtvfjBTqfNh4MGdDNPMWdymnzF+/xooIE2XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=orHVF0FH; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="orHVF0FH"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-431048c4068so3239961f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Jan 2026 06:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768227425; x=1768832225; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I1JMhljmYUHJUvqhM8H4VpSSzkImn+TjxNJvG6FZB7M=;
        b=orHVF0FHWYcEDBYB0wYdBI7c5GxcuG6I17LGEnFL3IaATv2gSberwQ7NI3UtVqAWTO
         RfIcWcte+9tOJLYWYCItFtzi6q9WOnGyfPvoYblNNQCuXWd6xxn/lcdVZ/r2kXPWLwtV
         TfvAi0pMhosYOHHTPslsJo7nsNGnpH6+B93PPctIYXnD43hhrlzqDq6+KM/GCb/ZywTH
         IUjrvdop7SxeEHcGGy3Q2dD6AlJP5zWT41l5EqBoydOYWf2/uwpBHsgcOZUCimRoxzhA
         n84ZTe32KYdtNS9g9Gv2mjiiWQe6jT1u69p0BM/ucr68cG5K2HyjVY1zOkfipbKkqrMU
         xUyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768227425; x=1768832225;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I1JMhljmYUHJUvqhM8H4VpSSzkImn+TjxNJvG6FZB7M=;
        b=t/7YsEs5gwFYHFWBUDy5dbFfSE/kX2mYc5BwRs0wDTcozQHNFovnNuHC3qWExUXC6p
         +GJPov1DYinVb2X8neJ8lGa38vO+Hv7g3AAw35RhKilXWkiGaHtIBrtbTXjAGjSeuptt
         Z6Klc5CYCOnMjoMFGZzdHf1+Cr7hvONjH+iSu4ONh4LRD7waTI3OKPo9uDqHLY5Z64pn
         r2Uv3kmF6L8a+W1WlE7LMovCuzlK3nqgVlDzWuscCmT1Qth5jrU5TLm/IvWx8jq5Fie/
         xJKIKip5Ifi7QLzCcRVupMv9zA01eR+8uuINaYmBdP6HGT5iYFWSvCkS1ArTmUs1QhPF
         wqDg==
X-Forwarded-Encrypted: i=1; AJvYcCVlZFBWDhkYD6mdnPvKFsoxr2hIaQhNPOid1GiqQf+13XAPMmHmO9/QXqPwKLL4/4r+Y+Dm0xyg1KjxWIaddehWdA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0LMxK8ry012v1fymGxI6DeYeOUYJKbmUye96xySoGBgF8AMlc
	++mU8iSPoCa4MRHh7l0DIcE/Djm1rbZAOwmuxr3uFPiTfSIrHgo8Fx+FeL24F7ZbCmldOVL/13W
	/TUx9
X-Gm-Gg: AY/fxX4jHpU3NApefeiWjAmjCnE1x2DGgp3ziDdtAazYRC5EjDhJGbFB8CkH6/Buwot
	Yxlw87OduRGblijc2CwDrH8zfye/a6ygKTDOzomPLWn0V6Vi/coolbrRS1u1a7zkGodANH0HYRl
	qN+gYgqrOVXBPeC9bkjMGwcdT51SuBNojnYSEeJwjCH/bPb8VD2mY9edXdeVJ78rAiDMpBrnMRA
	pxwzTl6P5GtPy0Hyl8ZHqZ0L7l1rnYhx6sHpiN2rMRx13J2q+qR40JwU5/YkVVqwzTJpOTJL5C0
	x7ZDwGdSgtM/ftgpMpHaNWqYUqI+7iy78CU5SLSFsTOpoZ99B5dNibo2+dTQMuh6ntGjzBwvT1l
	Dmt1LbnTlZ++AUTxR/Eb0zjiok9HQQAg56Z0b0sAeUSMw4eIjLxgEkyBnRh7rh2MmK0a478ofvx
	kdIgE4JMA00/bbictnIJZ1fEUNp4NTpVspzkKbAqyfM8UA
X-Google-Smtp-Source: AGHT+IG5w+n7A5GrPn1Dyr/ZW1Z13JZ7ruOEznKvASHzXrHcVYCZyOiTsOj2cIIGgJQG6+7B6B7s/A==
X-Received: by 2002:a05:6000:290c:b0:431:382:f141 with SMTP id ffacd0b85a97d-432c3644b44mr24863831f8f.12.1768227425242;
        Mon, 12 Jan 2026 06:17:05 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([2a00:23c7:3122:c601:4c43:39e0:348c:a72e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5dfa07sm38705096f8f.25.2026.01.12.06.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 06:17:04 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 12 Jan 2026 14:16:51 +0000
Subject: [PATCH v2 4/5] clk: samsung: gs101: add support for Display
 Process Unit (DPU) clocks
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-dpu-clocks-v2-4-bd00903fdeb9@linaro.org>
References: <20260112-dpu-clocks-v2-0-bd00903fdeb9@linaro.org>
In-Reply-To: <20260112-dpu-clocks-v2-0-bd00903fdeb9@linaro.org>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 kernel-team@android.com, Will McVicker <willmcvicker@google.com>, 
 Juan Yescas <jyescas@google.com>, Doug Anderson <dianders@google.com>, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=15778;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=4hCNU/zTiEuhIaW9FSW3u1zfJKYx1V3LP5oT3O9RbZw=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpZQJYfTCwQ4d4h7A4XVjtqu8VBf7bcKdA0Aitv
 93+5jfSMT+JAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaWUCWAAKCRDO6LjWAjRy
 umUoD/9/HQ6qCUOtPDzAd94iYDEODDUh3s2Q+czpP1FxL3zBaGoYd2K9ch1JuqbPs3OLZITdpE3
 NZzZGgYy9YuzzYcjRCmTFaTXDQwzfnqTWcqOVUpLHPDsOcv6P3J+cBce3YEKbXdRKz6OSNujbTV
 xdDiL3cqCSEzPows9K3/LGoFUpz5N24BrF513Emsa9r9DB5gB2aIAobE3kU6/Z6uw8NLYXfbWQN
 QgNl24S9vvHWdidkpZYqHz8826wDmfeTRPHYI42t7C9HtWOFYHyY1Ugz/lttUnuumkEcXrewV+d
 VgkTVSoq3gzOTvpOVZPAVYUrQZHLPSfu/PHJOVux+JND0CEC8WRvPtZBmjFJegR9tam3G6m9Hip
 0o20oZuwl6vc2y/r/90AVIuLN0JRQ7FezyLZE7JQd6O9g6x2I3gHNWWez6DOHrH1LZN2cMwlK29
 BamjGzCUtP0AWuM1h+o5zlC0QDjkpBz5HCkGYkTNyK2tW2mM/um0vV5UELflBc9lrRDq6Junr7M
 oR7mi7VrJ7ml9OsquC9eF8dWLBdeeGE0raAkZROzws0cX84VaGZigVkCSAN452TJIjlL5Z8Hjw8
 JG3kCIfoMFDQ2V6uIjIbr96SDZnezkfViv1cLYcf+nX0A/aja1H3to+R9oK5HxwlleH2TKrABfT
 kxTlNuinSCR0nIw==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

cmu_dpu is the clock management unit used for the Display Process Unit
block. It generates clocks for image scaler, compressor etc.

Add support for the muxes, dividers and gates in cmu_dpu.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes in v2:
 - Update gout_dpu_dpu_pclk to gout_dpu_gpc_dpu_pclk (Peter)
 - Fix dout_dpu_busp parent (Peter)
---
 drivers/clk/samsung/clk-gs101.c | 283 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 283 insertions(+)

diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs101.c
index 8551289b46eb88ec61dd1914d0fe782ae6794000..b38c6c8749aae42319d2004ff5ffbc9a19320cac 100644
--- a/drivers/clk/samsung/clk-gs101.c
+++ b/drivers/clk/samsung/clk-gs101.c
@@ -25,6 +25,7 @@
 #define CLKS_NR_MISC	(CLK_GOUT_MISC_XIU_D_MISC_ACLK + 1)
 #define CLKS_NR_PERIC0	(CLK_GOUT_PERIC0_SYSREG_PERIC0_PCLK + 1)
 #define CLKS_NR_PERIC1	(CLK_GOUT_PERIC1_SYSREG_PERIC1_PCLK + 1)
+#define CLKS_NR_DPU	(CLK_GOUT_DPU_SYSREG_DPU_PCLK + 1)
 
 #define GS101_GATE_DBG_OFFSET 0x4000
 #define GS101_DRCG_EN_OFFSET  0x104
@@ -4426,6 +4427,285 @@ static const struct samsung_cmu_info peric1_cmu_info __initconst = {
 	.drcg_offset		= GS101_DRCG_EN_OFFSET,
 };
 
+/* ---- CMU_DPU ------------------------------------------------------------- */
+
+/* Register Offset definitions for CMU_DPU (0x1c000000) */
+#define PLL_CON0_MUX_CLKCMU_DPU_BUS_USER					0x0600
+#define PLL_CON1_MUX_CLKCMU_DPU_BUS_USER					0x0604
+#define DPU_CMU_DPU_CONTROLLER_OPTION						0x0800
+#define CLKOUT_CON_BLK_DPU_CMU_DPU_CLKOUT0					0x0810
+#define CLK_CON_DIV_DIV_CLK_DPU_BUSP						0x1800
+#define CLK_CON_GAT_CLK_BLK_DPU_UID_DPU_CMU_DPU_IPCLKPORT_PCLK			0x2000
+#define CLK_CON_GAT_CLK_BLK_DPU_UID_RSTNSYNC_CLK_DPU_OSCCLK_IPCLKPORT_CLK	0x2004
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_AD_APB_DPU_DMA_IPCLKPORT_PCLKM		0x2008
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_DPUF_IPCLKPORT_ACLK_DMA			0x200c
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_DPUF_IPCLKPORT_ACLK_DPP			0x2010
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_D_TZPC_DPU_IPCLKPORT_PCLK			0x2014
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_GPC_DPU_IPCLKPORT_PCLK			0x2018
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_LHM_AXI_P_DPU_IPCLKPORT_I_CLK		0x201c
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_LHS_AXI_D0_DPU_IPCLKPORT_I_CLK		0x2020
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_LHS_AXI_D1_DPU_IPCLKPORT_I_CLK		0x2024
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_LHS_AXI_D2_DPU_IPCLKPORT_I_CLK		0x2028
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_PPMU_DPUD0_IPCLKPORT_ACLK			0x202c
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_PPMU_DPUD0_IPCLKPORT_PCLK			0x2030
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_PPMU_DPUD1_IPCLKPORT_ACLK			0x2034
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_PPMU_DPUD1_IPCLKPORT_PCLK			0x2038
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_PPMU_DPUD2_IPCLKPORT_ACLK			0x203c
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_PPMU_DPUD2_IPCLKPORT_PCLK			0x2040
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_RSTNSYNC_CLK_DPU_BUSD_IPCLKPORT_CLK	0x2044
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_RSTNSYNC_CLK_DPU_BUSP_IPCLKPORT_CLK	0x2048
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_SSMT_DPU0_IPCLKPORT_ACLK			0x204c
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_SSMT_DPU0_IPCLKPORT_PCLK			0x2050
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_SSMT_DPU1_IPCLKPORT_ACLK			0x2054
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_SSMT_DPU1_IPCLKPORT_PCLK			0x2058
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_SSMT_DPU2_IPCLKPORT_ACLK			0x205c
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_SSMT_DPU2_IPCLKPORT_PCLK			0x2060
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_SYSMMU_DPUD0_IPCLKPORT_CLK_S1		0x2064
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_SYSMMU_DPUD0_IPCLKPORT_CLK_S2		0x2068
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_SYSMMU_DPUD1_IPCLKPORT_CLK_S1		0x206c
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_SYSMMU_DPUD1_IPCLKPORT_CLK_S2		0x2070
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_SYSMMU_DPUD2_IPCLKPORT_CLK_S1		0x2074
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_SYSMMU_DPUD2_IPCLKPORT_CLK_S2		0x2078
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_SYSREG_DPU_IPCLKPORT_PCLK			0x207c
+#define PCH_CON_LHM_AXI_P_DPU_PCH						0x3000
+#define PCH_CON_LHS_AXI_D0_DPU_PCH						0x3004
+#define PCH_CON_LHS_AXI_D1_DPU_PCH						0x3008
+#define PCH_CON_LHS_AXI_D2_DPU_PCH						0x300c
+#define QCH_CON_DPUF_QCH_DPU_DMA						0x3010
+#define QCH_CON_DPUF_QCH_DPU_DPP						0x3014
+#define QCH_CON_DPU_CMU_DPU_QCH							0x301c
+#define QCH_CON_D_TZPC_DPU_QCH							0x3020
+#define QCH_CON_GPC_DPU_QCH							0x3024
+#define QCH_CON_LHM_AXI_P_DPU_QCH						0x3028
+#define QCH_CON_LHS_AXI_D0_DPU_QCH						0x302c
+#define QCH_CON_LHS_AXI_D1_DPU_QCH						0x3030
+#define QCH_CON_LHS_AXI_D2_DPU_QCH						0x3034
+#define QCH_CON_PPMU_DPUD0_QCH							0x3038
+#define QCH_CON_PPMU_DPUD1_QCH							0x303c
+#define QCH_CON_PPMU_DPUD2_QCH							0x3040
+#define QCH_CON_SSMT_DPU0_QCH							0x3044
+#define QCH_CON_SSMT_DPU1_QCH							0x3048
+#define QCH_CON_SSMT_DPU2_QCH							0x304c
+#define QCH_CON_SYSMMU_DPUD0_QCH_S1						0x3050
+#define QCH_CON_SYSMMU_DPUD0_QCH_S2						0x3054
+#define QCH_CON_SYSMMU_DPUD1_QCH_S1						0x3058
+#define QCH_CON_SYSMMU_DPUD1_QCH_S2						0x305c
+#define QCH_CON_SYSMMU_DPUD2_QCH_S1						0x3060
+#define QCH_CON_SYSMMU_DPUD2_QCH_S2						0x3064
+#define QCH_CON_SYSREG_DPU_QCH							0x3068
+#define QUEUE_CTRL_REG_BLK_DPU_CMU_DPU						0x3c00
+
+static const unsigned long dpu_clk_regs[] __initconst = {
+	PLL_CON0_MUX_CLKCMU_DPU_BUS_USER,
+	PLL_CON1_MUX_CLKCMU_DPU_BUS_USER,
+	DPU_CMU_DPU_CONTROLLER_OPTION,
+	CLKOUT_CON_BLK_DPU_CMU_DPU_CLKOUT0,
+	CLK_CON_DIV_DIV_CLK_DPU_BUSP,
+	CLK_CON_GAT_CLK_BLK_DPU_UID_DPU_CMU_DPU_IPCLKPORT_PCLK,
+	CLK_CON_GAT_CLK_BLK_DPU_UID_RSTNSYNC_CLK_DPU_OSCCLK_IPCLKPORT_CLK,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_AD_APB_DPU_DMA_IPCLKPORT_PCLKM,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_DPUF_IPCLKPORT_ACLK_DMA,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_DPUF_IPCLKPORT_ACLK_DPP,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_D_TZPC_DPU_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_GPC_DPU_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_LHM_AXI_P_DPU_IPCLKPORT_I_CLK,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_LHS_AXI_D0_DPU_IPCLKPORT_I_CLK,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_LHS_AXI_D1_DPU_IPCLKPORT_I_CLK,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_LHS_AXI_D2_DPU_IPCLKPORT_I_CLK,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_PPMU_DPUD0_IPCLKPORT_ACLK,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_PPMU_DPUD0_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_PPMU_DPUD1_IPCLKPORT_ACLK,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_PPMU_DPUD1_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_PPMU_DPUD2_IPCLKPORT_ACLK,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_PPMU_DPUD2_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_RSTNSYNC_CLK_DPU_BUSD_IPCLKPORT_CLK,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_RSTNSYNC_CLK_DPU_BUSP_IPCLKPORT_CLK,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_SSMT_DPU0_IPCLKPORT_ACLK,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_SSMT_DPU0_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_SSMT_DPU1_IPCLKPORT_ACLK,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_SSMT_DPU1_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_SSMT_DPU2_IPCLKPORT_ACLK,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_SSMT_DPU2_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_SYSMMU_DPUD0_IPCLKPORT_CLK_S1,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_SYSMMU_DPUD0_IPCLKPORT_CLK_S2,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_SYSMMU_DPUD1_IPCLKPORT_CLK_S1,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_SYSMMU_DPUD1_IPCLKPORT_CLK_S2,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_SYSMMU_DPUD2_IPCLKPORT_CLK_S1,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_SYSMMU_DPUD2_IPCLKPORT_CLK_S2,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_SYSREG_DPU_IPCLKPORT_PCLK,
+	PCH_CON_LHM_AXI_P_DPU_PCH,
+	PCH_CON_LHS_AXI_D0_DPU_PCH,
+	PCH_CON_LHS_AXI_D1_DPU_PCH,
+	PCH_CON_LHS_AXI_D2_DPU_PCH,
+	QCH_CON_DPUF_QCH_DPU_DMA,
+	QCH_CON_DPUF_QCH_DPU_DPP,
+	QCH_CON_DPU_CMU_DPU_QCH,
+	QCH_CON_D_TZPC_DPU_QCH,
+	QCH_CON_GPC_DPU_QCH,
+	QCH_CON_LHM_AXI_P_DPU_QCH,
+	QCH_CON_LHS_AXI_D0_DPU_QCH,
+	QCH_CON_LHS_AXI_D1_DPU_QCH,
+	QCH_CON_LHS_AXI_D2_DPU_QCH,
+	QCH_CON_PPMU_DPUD0_QCH,
+	QCH_CON_PPMU_DPUD1_QCH,
+	QCH_CON_PPMU_DPUD2_QCH,
+	QCH_CON_SSMT_DPU0_QCH,
+	QCH_CON_SSMT_DPU1_QCH,
+	QCH_CON_SSMT_DPU2_QCH,
+	QCH_CON_SYSMMU_DPUD0_QCH_S1,
+	QCH_CON_SYSMMU_DPUD0_QCH_S2,
+	QCH_CON_SYSMMU_DPUD1_QCH_S1,
+	QCH_CON_SYSMMU_DPUD1_QCH_S2,
+	QCH_CON_SYSMMU_DPUD2_QCH_S1,
+	QCH_CON_SYSMMU_DPUD2_QCH_S2,
+	QCH_CON_SYSREG_DPU_QCH,
+	QUEUE_CTRL_REG_BLK_DPU_CMU_DPU,
+};
+
+/* List of parent clocks for Muxes in CMU_DPU */
+PNAME(mout_dpu_bus_user_p)	= { "oscclk", "dout_cmu_dpu_bus" };
+
+static const struct samsung_mux_clock dpu_mux_clks[] __initconst = {
+	MUX(CLK_MOUT_DPU_BUS_USER, "mout_dpu_bus_user",
+	    mout_dpu_bus_user_p, PLL_CON0_MUX_CLKCMU_DPU_BUS_USER, 4, 1),
+};
+
+static const struct samsung_div_clock dpu_div_clks[] __initconst = {
+	DIV(CLK_DOUT_DPU_BUSP, "dout_dpu_busp", "mout_dpu_bus_user",
+	    CLK_CON_DIV_DIV_CLK_DPU_BUSP, 0, 3),
+};
+
+static const struct samsung_gate_clock dpu_gate_clks[] __initconst = {
+	GATE(CLK_GOUT_DPU_PCLK, "gout_dpu_dpu_pclk",
+	     "dout_dpu_busp",
+	     CLK_CON_GAT_CLK_BLK_DPU_UID_DPU_CMU_DPU_IPCLKPORT_PCLK, 21, 0, 0),
+	GATE(CLK_GOUT_DPU_CLK_DPU_OSCCLK_CLK, "gout_dpu_clk_dpu_oscclk_clk",
+	     "oscclk",
+	     CLK_CON_GAT_CLK_BLK_DPU_UID_RSTNSYNC_CLK_DPU_OSCCLK_IPCLKPORT_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_DPU_AD_APB_DPU_DMA_PCLKM, "gout_dpu_ad_apb_dpu_dma_pclkm",
+	     "mout_dpu_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_AD_APB_DPU_DMA_IPCLKPORT_PCLKM,
+	     21, 0, 0),
+	GATE(CLK_GOUT_DPU_DPUF_ACLK_DMA, "gout_dpu_dpuf_aclk_dma",
+	     "mout_dpu_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_DPUF_IPCLKPORT_ACLK_DMA, 21, 0, 0),
+	GATE(CLK_GOUT_DPU_DPUF_ACLK_DPP, "gout_dpu_dpuf_aclk_dpp",
+	     "mout_dpu_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_DPUF_IPCLKPORT_ACLK_DPP, 21, 0, 0),
+	GATE(CLK_GOUT_DPU_D_TZPC_DPU_PCLK, "gout_dpu_d_tzpc_dpu_pclk",
+	     "dout_dpu_busp",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_D_TZPC_DPU_IPCLKPORT_PCLK, 21, 0, 0),
+	GATE(CLK_GOUT_DPU_GPC_DPU_PCLK, "gout_dpu_gpc_dpu_pclk",
+	     "dout_dpu_busp",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_GPC_DPU_IPCLKPORT_PCLK, 21, 0, 0),
+	GATE(CLK_GOUT_DPU_LHM_AXI_P_DPU_I_CLK, "gout_dpu_lhm_axi_p_dpu_i_clk",
+	     "dout_dpu_busp",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_LHM_AXI_P_DPU_IPCLKPORT_I_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_DPU_LHS_AXI_D0_DPU_I_CLK, "gout_dpu_lhs_axi_d0_dpu_i_clk",
+	     "mout_dpu_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_LHS_AXI_D0_DPU_IPCLKPORT_I_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_DPU_LHS_AXI_D1_DPU_I_CLK, "gout_dpu_lhs_axi_d1_dpu_i_clk",
+	     "mout_dpu_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_LHS_AXI_D1_DPU_IPCLKPORT_I_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_DPU_LHS_AXI_D2_DPU_I_CLK, "gout_dpu_lhs_axi_d2_dpu_i_clk",
+	     "mout_dpu_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_LHS_AXI_D2_DPU_IPCLKPORT_I_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_DPU_PPMU_DPUD0_ACLK, "gout_dpu_ppmu_dpud0_aclk",
+	     "mout_dpu_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_PPMU_DPUD0_IPCLKPORT_ACLK, 21, 0, 0),
+	GATE(CLK_GOUT_DPU_PPMU_DPUD0_PCLK, "gout_dpu_ppmu_dpud0_pclk",
+	     "dout_dpu_busp",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_PPMU_DPUD0_IPCLKPORT_PCLK, 21, 0, 0),
+	GATE(CLK_GOUT_DPU_PPMU_DPUD1_ACLK, "gout_dpu_ppmu_dpud1_aclk",
+	     "mout_dpu_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_PPMU_DPUD1_IPCLKPORT_ACLK, 21, 0, 0),
+	GATE(CLK_GOUT_DPU_PPMU_DPUD1_PCLK, "gout_dpu_ppmu_dpud1_pclk",
+	     "dout_dpu_busp",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_PPMU_DPUD1_IPCLKPORT_PCLK, 21, 0, 0),
+	GATE(CLK_GOUT_DPU_PPMU_DPUD2_ACLK, "gout_dpu_ppmu_dpud2_aclk",
+	     "mout_dpu_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_PPMU_DPUD2_IPCLKPORT_ACLK, 21, 0, 0),
+	GATE(CLK_GOUT_DPU_PPMU_DPUD2_PCLK, "gout_dpu_ppmu_dpud2_pclk",
+	     "dout_dpu_busp",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_PPMU_DPUD2_IPCLKPORT_PCLK, 21, 0, 0),
+	GATE(CLK_GOUT_DPU_CLK_DPU_BUSD_CLK, "gout_dpu_clk_dpu_busd_clk",
+	     "mout_dpu_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_RSTNSYNC_CLK_DPU_BUSD_IPCLKPORT_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_DPU_CLK_DPU_BUSP_CLK, "gout_dpu_clk_dpu_busp_clk",
+	     "dout_dpu_busp",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_RSTNSYNC_CLK_DPU_BUSP_IPCLKPORT_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_DPU_SSMT_DPU0_ACLK, "gout_dpu_ssmt_dpu0_aclk",
+	     "mout_dpu_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_SSMT_DPU0_IPCLKPORT_ACLK, 21, 0, 0),
+	GATE(CLK_GOUT_DPU_SSMT_DPU0_PCLK, "gout_dpu_ssmt_dpu0_pclk",
+	     "dout_dpu_busp",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_SSMT_DPU0_IPCLKPORT_PCLK, 21, 0, 0),
+	GATE(CLK_GOUT_DPU_SSMT_DPU1_ACLK, "gout_dpu_ssmt_dpu1_aclk",
+	     "mout_dpu_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_SSMT_DPU1_IPCLKPORT_ACLK, 21, 0, 0),
+	GATE(CLK_GOUT_DPU_SSMT_DPU1_PCLK, "gout_dpu_ssmt_dpu1_pclk",
+	     "dout_dpu_busp",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_SSMT_DPU1_IPCLKPORT_PCLK, 21, 0, 0),
+	GATE(CLK_GOUT_DPU_SSMT_DPU2_ACLK, "gout_dpu_ssmt_dpu2_aclk",
+	     "mout_dpu_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_SSMT_DPU2_IPCLKPORT_ACLK, 21, 0, 0),
+	GATE(CLK_GOUT_DPU_SSMT_DPU2_PCLK, "gout_dpu_ssmt_dpu2_pclk",
+	     "dout_dpu_busp",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_SSMT_DPU2_IPCLKPORT_PCLK, 21, 0, 0),
+	GATE(CLK_GOUT_DPU_SYSMMU_DPUD0_CLK_S1, "gout_dpu_sysmmu_dpud0_clk_s1",
+	     "mout_dpu_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_SYSMMU_DPUD0_IPCLKPORT_CLK_S1,
+	     21, 0, 0),
+	GATE(CLK_GOUT_DPU_SYSMMU_DPUD0_CLK_S2, "gout_dpu_sysmmu_dpud0_clk_s2",
+	     "mout_dpu_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_SYSMMU_DPUD0_IPCLKPORT_CLK_S2,
+	     21, 0, 0),
+	GATE(CLK_GOUT_DPU_SYSMMU_DPUD1_CLK_S1, "gout_dpu_sysmmu_dpud1_clk_s1",
+	     "mout_dpu_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_SYSMMU_DPUD1_IPCLKPORT_CLK_S1,
+	     21, 0, 0),
+	GATE(CLK_GOUT_DPU_SYSMMU_DPUD1_CLK_S2, "gout_dpu_sysmmu_dpud1_clk_s2",
+	     "mout_dpu_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_SYSMMU_DPUD1_IPCLKPORT_CLK_S2,
+	     21, 0, 0),
+	GATE(CLK_GOUT_DPU_SYSMMU_DPUD2_CLK_S1, "gout_dpu_sysmmu_dpud2_clk_s1",
+	     "mout_dpu_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_SYSMMU_DPUD2_IPCLKPORT_CLK_S1,
+	     21, 0, 0),
+	GATE(CLK_GOUT_DPU_SYSMMU_DPUD2_CLK_S2, "gout_dpu_sysmmu_dpud2_clk_s2",
+	     "mout_dpu_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_SYSMMU_DPUD2_IPCLKPORT_CLK_S2, 21, 0, 0),
+	GATE(CLK_GOUT_DPU_SYSREG_DPU_PCLK, "gout_dpu_sysreg_dpu_pclk",
+	     "dout_dpu_busp",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_SYSREG_DPU_IPCLKPORT_PCLK, 21, 0, 0),
+};
+
+static const struct samsung_cmu_info dpu_cmu_info __initconst = {
+	.mux_clks		= dpu_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(dpu_mux_clks),
+	.div_clks		= dpu_div_clks,
+	.nr_div_clks		= ARRAY_SIZE(dpu_div_clks),
+	.gate_clks		= dpu_gate_clks,
+	.nr_gate_clks		= ARRAY_SIZE(dpu_gate_clks),
+	.nr_clk_ids		= CLKS_NR_DPU,
+	.clk_regs		= dpu_clk_regs,
+	.nr_clk_regs		= ARRAY_SIZE(dpu_clk_regs),
+	.sysreg_clk_regs	= dcrg_memclk_sysreg,
+	.nr_sysreg_clk_regs	= ARRAY_SIZE(dcrg_memclk_sysreg),
+	.clk_name		= "bus",
+	.auto_clock_gate        = true,
+	.gate_dbg_offset        = GS101_GATE_DBG_OFFSET,
+	.option_offset		= DPU_CMU_DPU_CONTROLLER_OPTION,
+	.drcg_offset		= GS101_DRCG_EN_OFFSET,
+};
+
 /* ---- platform_driver ----------------------------------------------------- */
 
 static int __init gs101_cmu_probe(struct platform_device *pdev)
@@ -4443,6 +4723,9 @@ static const struct of_device_id gs101_cmu_of_match[] = {
 	{
 		.compatible = "google,gs101-cmu-apm",
 		.data = &apm_cmu_info,
+	}, {
+		.compatible = "google,gs101-cmu-dpu",
+		.data = &dpu_cmu_info,
 	}, {
 		.compatible = "google,gs101-cmu-hsi0",
 		.data = &hsi0_cmu_info,

-- 
2.52.0.457.g6b5491de43-goog

