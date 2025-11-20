Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B7830BB87
	for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Nov 2025 21:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763672793; cv=none; b=ECtA8nd43v9sdGPEOLt/R0DlGH2ofPJqsgeBjeVUJj8hZrETRx/Sew2tvuHQ3U8t3PULcnZNYgXK+I6mrxd3vT4Um7OgzNhkIctQPv5edVn/rR72uK+XgT9nsgsJA2pZyxyfkz1Chy/XPr9Pd57+s1xvjZVCGMceU6duTEX1btI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763672793; c=relaxed/simple;
	bh=QHk8SiPa/eaPMZxAsAQiLzZk+6fLpZAERsS/cFDDl8A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=moYSqeknnTQ7YBTqdxXGlpQ+pT03Q6c1LZuQvsFYa3CjXiWieiK3K95TWef++FEofu0TiueGQcRfigQpssq/cPuaU9dqtgtX1ZojBi2yyqWowX7j3/pfrLe0KdjPvJfTuUXMfs1S34MTq3/Bet2Ss5g9y1u6VCSEvhGAwfdIzIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LVRZkR60; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LVRZkR60"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42bb288c1bfso869198f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Nov 2025 13:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763672789; x=1764277589; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K8BXYkJo09cffbco27DiXaVUKDDylvywu2kiuIHEYbM=;
        b=LVRZkR60NkJPy9hN4oUaj+PKWggxEnjH9hAs+JvT1CLT2xmdsydrIwVvXAKULSpOMj
         s1YMeWvKbO8/uc45Mb0EeVzEUO+Q26cdl7Vdn/i+2NSbmSHA79vWu73Ae5nRKBPKS0Dj
         YDifd4GGbjzPhsCXD/+9WvekRGwKiJF024OQrpSc6kbPXEuvp9o1ttgQBZRrRrIlqbGB
         kOugUlPuTRVhNFCyx1ulBZBUH8qkWe3RuG6XHBO9YqFr9JPqLUNdMU3uIB77585ZN+FT
         vGXykntK6N3+4EHmU5q4/N2o5ZiiX4O9Zt1Ya8Bz4qtnzmug761QiGhhIj66Oo+okXnN
         adDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763672789; x=1764277589;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K8BXYkJo09cffbco27DiXaVUKDDylvywu2kiuIHEYbM=;
        b=LXby+k1VX34YAdiJMA6Hsswegyw2PAOeuifdJ35+9RZTlgsuQblx3CQRs0M9IK4rMK
         j7EVldyO20oH8xvThb8MelAsG1rFgcD7BCfDUMzp3UHQpOctu2tlUkQ48AXuwTbmlATJ
         jHQcnddfwAduJyDQdYxGdQm5RAtMHlmBJWJ3MWn887/ZzZRb+76HKwKDOrtqE9TLLwTv
         2lVex9NOLf37SAalD+rsnFKfbszCx97ztP2Zjo+K+1w1QhdMK+MUA9CWKHTYU68FoWwa
         jqPJPp+6hU4/ahrAXhPdw5vNq/lgzOZ4TXHfVCTUtlfJAPw8SO/OOunYBtNgIHvcWlia
         FH3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWT5zJ3QWimwysvBUSRlvozmb7ycGfhQqR8pm6SwqjdstInVS2mUcHAai7szhcUyGpKu6VaBq4Q0m6Uifo/Wxhmvg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVCK4u8XmnLWMNXNJWl6zFg+7HQWL/y+Q/QZnUijdWPPtXob9F
	XqURZ4MGWLLygZ74AkmOW80DfO0edhJaFTRG95WKgQvKfQ9bhqXeNHajgW1HAfGoOPQ=
X-Gm-Gg: ASbGnctpym6a5dOziLIUB7tmjPkKJ4enOsVoU/IdrgtBGuwApJCHA7+nKRIKEBInbqh
	9305jNQjC/Ul2SyVQyWxlzOOWba2Jd/Z1F1wIfxTRzxWPqvo4g8MhAksxnAf0V41OAwTSA+MBLh
	ywuTrny0wBYyUqrxBoRgaQ0PV9WhiDxzzYsf3vRqf8bpmk1xeVvZF7wk5ZeBOYX+dN4Fo78suwS
	6M6SjCBjgbkpUWF05P9P5IMIj2tc+FmwyltqLnd3uBCe+rlS2KqvG6jeidk+IKUHH1DteHIfN8K
	AqW7ZrgVVrUVZlpRUq8XwpTEx9AFya2Owj73jFRTZApBxcrXXJ46kwd+m34JhVO1osxrhC/K6DX
	WkNGcAFLnsJNqHcI7XLYvvEfMKLXDqSkv8suUYpYah4E2pgFGjX0gl4ZuL7TWWms71BaIrcIJ1C
	s+D18k4Uf9i5g4K4D61CHpN9WiGomkmo3mzHR6+LA=
X-Google-Smtp-Source: AGHT+IF1y8NS7fSk9ziWEi5PszSWt8O9ekApxvVjAqVjXDU6OKQ3ZcI1ywbVKU56ntpqV90CAcY/xw==
X-Received: by 2002:a5d:5d0a:0:b0:42b:4177:7136 with SMTP id ffacd0b85a97d-42cb9a6075fmr5196598f8f.32.1763672789027;
        Thu, 20 Nov 2025 13:06:29 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([150.228.9.80])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f2e5b6sm7321287f8f.1.2025.11.20.13.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 13:06:28 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 20 Nov 2025 21:06:14 +0000
Subject: [PATCH 4/4] clk: samsung: gs101: add support for Display Process
 Unit (DPU) clocks
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251120-dpu-clocks-v1-4-11508054eab8@linaro.org>
References: <20251120-dpu-clocks-v1-0-11508054eab8@linaro.org>
In-Reply-To: <20251120-dpu-clocks-v1-0-11508054eab8@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=15641;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=QHk8SiPa/eaPMZxAsAQiLzZk+6fLpZAERsS/cFDDl8A=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpH4LLaQE+sYqCV4pJQLUBYS+awWcWDoBUANWyY
 B9Qz+UNyreJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaR+CywAKCRDO6LjWAjRy
 umlID/93RgADTcD22ilasX9gZ4Sdeps/lGe7ouZBzFVb4ZJ1GW+ehklO8xMW9bocRQ0bPS8dchZ
 jU/EZUk5+PLE20IJPra5D+QaCr06c7yuKHIIWXhcY73kbs+UaxSwnq1jpTpOinQifo4TPaMqWzB
 u4MHhUlyVw9jlHs5Zj0vs/gjTJmyXpSzzfGv3IOo3Pg0VElyt3OVSZEbWWU0oqzT5pXEdG0bciy
 Fb3FP6AaVBr7/vYjCuQmzN0+WQcTn90URC0L29DaxMBLG/4s85ro9OBdCneE/t+IDa6NWC2cJcQ
 29mtKBjvUDBZF6FudmmIBnmgUmpJytm09zq69+NJaBhFmgVZo50JQWd5IXzuR7xE31DO6O9MXqE
 UoIwdSPGm5VnsUvKTAqdp/X8Pi/UNuDsmv2c65QAFrXsGYwMrOLLosR87tiU0ow43ao4ZTT2czC
 1Po77OSkwdmnzw2OPmYigiIxLorjsGI1gQLLj3s/m+8YlGTV9KXHEwsZPTxw6ZM/4iSNWGO9+ku
 BT+0zU16Q3dMLfTyxjnh+AuI6zOtq0ixt7BZc/C6QeEPpzW0/uDFTP5EBiHNVzmaY9fjxJ2JEfT
 +r2Mvtf+9PmQe0NqNEXr1/ZjRIw2PLVatn+B46Y+MTh06xVBW+2ldE6JT7gkNGfuTEMVDjyRIOz
 FQTpfE2EtNlNy6Q==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

cmu_dpu is the clock management unit used for the Display Process Unit
block. It generates clocks for image scaler, compressor etc.

Add support for the muxes, dividers and gates in cmu_dpu.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/clk/samsung/clk-gs101.c | 283 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 283 insertions(+)

diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs101.c
index 8551289b46eb88ec61dd1914d0fe782ae6794000..82f2343ecc63cc285343cc79692f3a199a9c16cc 100644
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
+	DIV(CLK_DOUT_DPU_BUSP, "dout_dpu_busp", "",
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
+	GATE(CLK_GOUT_DPU_GPC_DPU_PCLK, "gout_dpu_dpu_pclk",
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
2.52.0.rc2.455.g230fcf2819-goog

