Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C7330AD0A
	for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Oct 2025 20:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760388727; cv=none; b=TCa4Hk4TOVle6NwIB2hykPo56zSL6OG5G/2vzs+il0onkb65bw6wh3caKEnhJ+nIzz4fzUax4vK86AGhRG1zGvrvCVke3ZS2vCYOmXkVX7iNvsPquby0K0iwGioUdycBsgUB/wmuoqff36ZubLXUQ+x0erI5cRZBTUYe6A6JZZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760388727; c=relaxed/simple;
	bh=uWkxZU/Hl8Nl10OdzwhtsVKl5aw0le6G5ifJ1QQqHl0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nn3oJqDuWZx6kVYY65gyMlf/RQh+cHedprHsxagpcP8LDT5ASEln9MeNCUIjZeZ2S3ILr+OnpHD6VOIEK2GteJHKvKoWNHbi83w/1PS25ChhYu6QuRuAoX6dwn6Ym2ffWKoraHeAN4Yb6N6hlXBbCk0dHUVsC+1qYvPwY6RHGPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fosBjfku; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fosBjfku"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-46e6a689bd0so33391275e9.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Oct 2025 13:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760388723; x=1760993523; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p75CvvJIDH6qNfnUs0gO+Nm9mIpQLlEjYBAGW26AtKM=;
        b=fosBjfkuh4bsbpjwv8R4HM097xFV6lxTlI1jxFc41iTbC5PqIIP/XH7D2Pg20BG5hH
         P1x7Ja0CqsOaj4wFqY4fC7+4KV9ArIc2LChlPmLJ4PwMBGx4FZIHB5HB4rkvdpytkp4w
         rfwVQA+8b7zQbCI6Ls47XJ4rwU2jN0HKtuZtFeVBb6apzXHHs1oMJ8vLJ7AnrC/np8MJ
         fDYiibM+LLyACVW9+oOluNMJBXjjh8kM1kI0EJMoV6NuPzQHI2gzseMmN2Pup/fL/iCt
         yM04rMcGwf3RsFcHXTTsS0JLI836wmXK5MokjnToEEXDGvR6eIKtCnvYDNVYd683zBqA
         wfmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760388723; x=1760993523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p75CvvJIDH6qNfnUs0gO+Nm9mIpQLlEjYBAGW26AtKM=;
        b=uRhxruLTMQePmokq+WWvoBHibo9IL1y4ZsfaxmeBfcolbUpFKzMK0MkeBsXVYz++7t
         8WAjQAUoybLqTrI2FRbpR0nIDzz2D5b79ckPHcH0uLaxzTmiFWDR//aRLimlfTpE3KL4
         UKsaN5Obeq3+moJaPr2RFnV2RTJYhlbc6K4vqBFtGltT9bN9y67rj9jTG4tGpJtgPK/Y
         T+Ne4rhg2szgFCQ+Hdufn+p8v/uiWyBCz0I9ESKKSBqK7JsYHkSK0t8C+SpVZbjqtV8p
         86Me0vO5cViUgrDu4qvK+XvvBttLsYijeeSyDjkMPLmSm19XTOEBNCkSy66FVOWADmwn
         9PyA==
X-Forwarded-Encrypted: i=1; AJvYcCWL16An4sI3cnX50xJdtuo2cORb9VCXHjaqt6fzqoNToPrPWM/nenZ14MTIT1Tl4u0phV1iu/rSN9Dpqn8x3RI7CA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+WnXc5LuQtHxyqPoGHfYSbxgIs61tmLVKOfSTU4DAOp0/ha8w
	mbDCEbrZ1toP51uB8YMoEh974JqeBoaRb2OzZrNSiAsJ7JHqc5eaOxFXugEGZK8//Ak=
X-Gm-Gg: ASbGncs+WZx1YMpuirpDYH2Y4mYzkHSQ7F9+YbEvhJ9uvQe1rC0ECPKwrd+XZkOBZPo
	r7EYGLpsWoer7NsJysFuxce4hyTlDs2czXIifnPhaIjKdJmlBKAWeS9AU7UpyEAbk+T8eMQj8Ig
	dSYy0mQq7gdK1T8i8f10BiwrVYsNb32QjXevYCwy8V965rRHbq8ZNsSNcS9acyA6oY6Njlxq2Wu
	zi7Gp4mAL5n8QB2VuvGd5HohnG6xYHSl+gT44iGDs9BjDeXZ0tt+AxBdPADHhNJMM6/DIYZA+9/
	Nn8WnzWCGplHhc+iZ9x2JZx2c/AN7vi+E3wm2vt1DgpuSQMRTIi9bpVMNFDlaP1gRYl9tLc6U0d
	njqsjel06tFODSQr3r42CRBQCoL9m2KoxsE4ZI751byQE7GYfI192Od0FstM/uCbZk3nkaL5qbD
	g=
X-Google-Smtp-Source: AGHT+IFlSMRo+GJbrZC2R6cadbg0Mn2wjcwo558vGXjQZ987pWFhJmxXyrKyNE/lrCX6DAooh7pdgg==
X-Received: by 2002:a05:600c:608d:b0:46e:6d5f:f59 with SMTP id 5b1f17b1804b1-46fa9a8b2aemr152563365e9.4.1760388723134;
        Mon, 13 Oct 2025 13:52:03 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.67.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fab3e3206sm133512615e9.4.2025.10.13.13.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 13:52:01 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 13 Oct 2025 21:51:38 +0100
Subject: [PATCH 9/9] clk: samsung: gs101: remove CLK_IGNORE_UNUSED and
 CLK_IS_CRITICAL flags
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-automatic-clocks-v1-9-72851ee00300@linaro.org>
References: <20251013-automatic-clocks-v1-0-72851ee00300@linaro.org>
In-Reply-To: <20251013-automatic-clocks-v1-0-72851ee00300@linaro.org>
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=13977;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=uWkxZU/Hl8Nl10OdzwhtsVKl5aw0le6G5ifJ1QQqHl0=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBo7WZaPc65TE1WfAGkP722Wyk85+blnbkvhUHrU
 U7QDhVWSSSJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaO1mWgAKCRDO6LjWAjRy
 ujkpD/4nQc7i5Ki84Xi71NS6m0M4/YubG7TkMt2P1UyU1+0hFiVLbs8oAVDjzS5fv6fUyVLpE1q
 HoUXjuJnYeM5tCbqiXiLS4wH44TQlCUM8rvGFUA2wM1C09q+1coeSzI/T+q3ImXdU3P0awnOcIM
 aB7lwJZbRf7s736y+c+yb/0BvvOpq60q5JHwOO5a2CLvV1nkrNtiGkBVjPjxdYl3qFW4zpXjigI
 95QCCp81HlKKs1aXRrpP29HJhK3nG4pyMwws3C6+MCGwAck14MBIJJMA/aiPCb+00Kf5uxmXnRj
 6XwbRcFqABW1lGXMCSsmDSjX/cOZzlRs/qRKD7gphWCvqCWhnN2US1v15dAN3xtSxENOGexCljt
 HM/tSIFGFSCq6v5ZtUaXl1DOnClFaGn+sQJnycL5OzYWoDqpD35LBlWzoKtx27UdfNpUoz6rLSG
 AfujdrLAL/4rKbQWtg1g1MEoWS62Y7Nauc9ZkSTxPmzM/nI19e5z29XrVpCyC6QwinZWOCcyoJs
 K3XRcVheoQdOnHFsYGS2oESrkrCqelscvwQrXy6vu79tUH9e+DQZ9xgHA0mIhXhUWaRY0W4ylmb
 uZezozg1b7CsxKZseNZ+wSjxnDjk6+oHuKiwrfH1mt4ytZGRmAQEAe58iq1ihjAOOaaOf8TgorR
 lwC5ZTLppfmiwZw==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Now each CMU is in automatic mode these flags are no longer necessary. All
unused clocks are automatically gated & ungated by hardware as
required.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/clk/samsung/clk-gs101.c | 87 +++++++++++++++++------------------------
 1 file changed, 35 insertions(+), 52 deletions(-)

diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs101.c
index baf41ae6c9e2480cb83531acf7eae190c6aff819..d01c94994d86bc27d344969c33955da63ed0e4a1 100644
--- a/drivers/clk/samsung/clk-gs101.c
+++ b/drivers/clk/samsung/clk-gs101.c
@@ -1901,13 +1901,13 @@ static const struct samsung_gate_clock apm_gate_clks[] __initconst = {
 	     CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_P_APM_IPCLKPORT_ACLK, 21, CLK_IS_CRITICAL, 0),
 	GATE(CLK_GOUT_APM_UASC_P_APM_PCLK,
 	     "gout_apm_uasc_p_apm_pclk", "gout_apm_func",
-	     CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_P_APM_IPCLKPORT_PCLK, 21, CLK_IS_CRITICAL, 0),
+	     CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_P_APM_IPCLKPORT_PCLK, 21, 0, 0),
 	GATE(CLK_GOUT_APM_WDT_APM_PCLK,
 	     "gout_apm_wdt_apm_pclk", "gout_apm_func",
 	     CLK_CON_GAT_GOUT_BLK_APM_UID_WDT_APM_IPCLKPORT_PCLK, 21, 0, 0),
 	GATE(CLK_GOUT_APM_XIU_DP_APM_ACLK,
 	     "gout_apm_xiu_dp_apm_aclk", "gout_apm_func",
-	     CLK_CON_GAT_GOUT_BLK_APM_UID_XIU_DP_APM_IPCLKPORT_ACLK, 21, CLK_IS_CRITICAL, 0),
+	     CLK_CON_GAT_GOUT_BLK_APM_UID_XIU_DP_APM_IPCLKPORT_ACLK, 21, 0, 0),
 };
 
 static const unsigned long dcrg_memclk_sysreg[] __initconst = {
@@ -2211,11 +2211,10 @@ static const struct samsung_div_clock hsi0_div_clks[] __initconst = {
 };
 
 static const struct samsung_gate_clock hsi0_gate_clks[] __initconst = {
-	/* TODO: should have a driver for this */
 	GATE(CLK_GOUT_HSI0_PCLK,
 	     "gout_hsi0_hsi0_pclk", "mout_hsi0_bus",
 	     CLK_CON_GAT_CLK_BLK_HSI0_UID_HSI0_CMU_HSI0_IPCLKPORT_PCLK,
-	     21, CLK_IGNORE_UNUSED, 0),
+	     21, 0, 0),
 	GATE(CLK_GOUT_HSI0_USB31DRD_I_USB31DRD_SUSPEND_CLK_26,
 	     "gout_hsi0_usb31drd_i_usb31drd_suspend_clk_26",
 	     "mout_hsi0_usb20_ref",
@@ -2252,16 +2251,14 @@ static const struct samsung_gate_clock hsi0_gate_clks[] __initconst = {
 	     "gout_hsi0_lhm_axi_p_aochsi0_i_clk", "mout_hsi0_bus",
 	     CLK_CON_GAT_GOUT_BLK_HSI0_UID_LHM_AXI_P_AOCHSI0_IPCLKPORT_I_CLK,
 	     21, 0, 0),
-	/* TODO: should have a driver for this */
 	GATE(CLK_GOUT_HSI0_LHM_AXI_P_HSI0_I_CLK,
 	     "gout_hsi0_lhm_axi_p_hsi0_i_clk", "mout_hsi0_bus",
 	     CLK_CON_GAT_GOUT_BLK_HSI0_UID_LHM_AXI_P_HSI0_IPCLKPORT_I_CLK,
-	     21, CLK_IGNORE_UNUSED, 0),
-	/* TODO: should have a driver for this */
+	     21, 0, 0),
 	GATE(CLK_GOUT_HSI0_LHS_ACEL_D_HSI0_I_CLK,
 	     "gout_hsi0_lhs_acel_d_hsi0_i_clk", "mout_hsi0_bus",
 	     CLK_CON_GAT_GOUT_BLK_HSI0_UID_LHS_ACEL_D_HSI0_IPCLKPORT_I_CLK,
-	     21, CLK_IGNORE_UNUSED, 0),
+	     21, 0, 0),
 	GATE(CLK_GOUT_HSI0_LHS_AXI_D_HSI0AOC_I_CLK,
 	     "gout_hsi0_lhs_axi_d_hsi0aoc_i_clk", "mout_hsi0_bus",
 	     CLK_CON_GAT_GOUT_BLK_HSI0_UID_LHS_AXI_D_HSI0AOC_IPCLKPORT_I_CLK,
@@ -2286,21 +2283,18 @@ static const struct samsung_gate_clock hsi0_gate_clks[] __initconst = {
 	     "gout_hsi0_clk_hsi0_bus_clk", "mout_hsi0_bus",
 	     CLK_CON_GAT_GOUT_BLK_HSI0_UID_RSTNSYNC_CLK_HSI0_BUS_IPCLKPORT_CLK,
 	     21, 0, 0),
-	/* TODO: should have a driver for this */
 	GATE(CLK_GOUT_HSI0_SSMT_USB_ACLK,
 	     "gout_hsi0_ssmt_usb_aclk", "mout_hsi0_bus",
 	     CLK_CON_GAT_GOUT_BLK_HSI0_UID_SSMT_USB_IPCLKPORT_ACLK,
-	     21, CLK_IGNORE_UNUSED, 0),
-	/* TODO: should have a driver for this */
+	     21, 0, 0),
 	GATE(CLK_GOUT_HSI0_SSMT_USB_PCLK,
 	     "gout_hsi0_ssmt_usb_pclk", "mout_hsi0_bus",
 	     CLK_CON_GAT_GOUT_BLK_HSI0_UID_SSMT_USB_IPCLKPORT_PCLK,
-	     21, CLK_IGNORE_UNUSED, 0),
-	/* TODO: should have a driver for this */
+	     21, 0, 0),
 	GATE(CLK_GOUT_HSI0_SYSMMU_USB_CLK_S2,
 	     "gout_hsi0_sysmmu_usb_clk_s2", "mout_hsi0_bus",
 	     CLK_CON_GAT_GOUT_BLK_HSI0_UID_SYSMMU_USB_IPCLKPORT_CLK_S2,
-	     21, CLK_IGNORE_UNUSED, 0),
+	     21, 0, 0),
 	GATE(CLK_GOUT_HSI0_SYSREG_HSI0_PCLK,
 	     "gout_hsi0_sysreg_hsi0_pclk", "mout_hsi0_bus",
 	     CLK_CON_GAT_GOUT_BLK_HSI0_UID_SYSREG_HSI0_IPCLKPORT_PCLK,
@@ -2358,21 +2352,18 @@ static const struct samsung_gate_clock hsi0_gate_clks[] __initconst = {
 	     "gout_hsi0_usb31drd_usbdpphy_udbg_i_apb_pclk", "mout_hsi0_bus",
 	     CLK_CON_GAT_GOUT_BLK_HSI0_UID_USB31DRD_IPCLKPORT_USBDPPHY_UDBG_I_APB_PCLK,
 	     21, 0, 0),
-	/* TODO: should have a driver for this */
 	GATE(CLK_GOUT_HSI0_XIU_D0_HSI0_ACLK,
 	     "gout_hsi0_xiu_d0_hsi0_aclk", "mout_hsi0_bus",
 	     CLK_CON_GAT_GOUT_BLK_HSI0_UID_XIU_D0_HSI0_IPCLKPORT_ACLK,
-	     21, CLK_IGNORE_UNUSED, 0),
-	/* TODO: should have a driver for this */
+	     21, 0, 0),
 	GATE(CLK_GOUT_HSI0_XIU_D1_HSI0_ACLK,
 	     "gout_hsi0_xiu_d1_hsi0_aclk", "mout_hsi0_bus",
 	     CLK_CON_GAT_GOUT_BLK_HSI0_UID_XIU_D1_HSI0_IPCLKPORT_ACLK,
-	     21, CLK_IGNORE_UNUSED, 0),
-	/* TODO: should have a driver for this */
+	     21, 0, 0),
 	GATE(CLK_GOUT_HSI0_XIU_P_HSI0_ACLK,
 	     "gout_hsi0_xiu_p_hsi0_aclk", "mout_hsi0_bus",
 	     CLK_CON_GAT_GOUT_BLK_HSI0_UID_XIU_P_HSI0_IPCLKPORT_ACLK,
-	     21, CLK_IGNORE_UNUSED, 0),
+	     21, 0, 0),
 };
 
 static const struct samsung_fixed_rate_clock hsi0_fixed_clks[] __initconst = {
@@ -2677,22 +2668,19 @@ static const struct samsung_gate_clock hsi2_gate_clks[] __initconst = {
 	GATE(CLK_GOUT_HSI2_GPIO_HSI2_PCLK,
 	     "gout_hsi2_gpio_hsi2_pclk", "mout_hsi2_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_HSI2_UID_GPIO_HSI2_IPCLKPORT_PCLK, 21,
-	     CLK_IGNORE_UNUSED, 0),
-	/* Disabling this clock makes the system hang. Mark the clock as critical. */
+	     0, 0),
 	GATE(CLK_GOUT_HSI2_HSI2_CMU_HSI2_PCLK,
 	     "gout_hsi2_hsi2_cmu_hsi2_pclk", "mout_hsi2_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_HSI2_UID_HSI2_CMU_HSI2_IPCLKPORT_PCLK,
-	     21, CLK_IS_CRITICAL, 0),
-	/* Disabling this clock makes the system hang. Mark the clock as critical. */
+	     21, 0, 0),
 	GATE(CLK_GOUT_HSI2_LHM_AXI_P_HSI2_I_CLK,
 	     "gout_hsi2_lhm_axi_p_hsi2_i_clk", "mout_hsi2_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_HSI2_UID_LHM_AXI_P_HSI2_IPCLKPORT_I_CLK,
-	     21, CLK_IS_CRITICAL, 0),
-	/* TODO: should have a driver for this */
+	     21, 0, 0),
 	GATE(CLK_GOUT_HSI2_LHS_ACEL_D_HSI2_I_CLK,
 	     "gout_hsi2_lhs_acel_d_hsi2_i_clk", "mout_hsi2_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_HSI2_UID_LHS_ACEL_D_HSI2_IPCLKPORT_I_CLK,
-	     21, CLK_IGNORE_UNUSED, 0),
+	     21, 0, 0),
 	GATE(CLK_GOUT_HSI2_MMC_CARD_I_ACLK,
 	     "gout_hsi2_mmc_card_i_aclk", "mout_hsi2_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_HSI2_UID_MMC_CARD_IPCLKPORT_I_ACLK,
@@ -2795,38 +2783,35 @@ static const struct samsung_gate_clock hsi2_gate_clks[] __initconst = {
 	GATE(CLK_GOUT_HSI2_QE_UFS_EMBD_HSI2_ACLK,
 	     "gout_hsi2_qe_ufs_embd_hsi2_aclk", "mout_hsi2_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_HSI2_UID_QE_UFS_EMBD_HSI2_IPCLKPORT_ACLK,
-	     21, CLK_IS_CRITICAL, 0),
+	     21, 0, 0),
 	GATE(CLK_GOUT_HSI2_QE_UFS_EMBD_HSI2_PCLK,
 	     "gout_hsi2_qe_ufs_embd_hsi2_pclk", "mout_hsi2_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_HSI2_UID_QE_UFS_EMBD_HSI2_IPCLKPORT_PCLK,
-	     21, CLK_IS_CRITICAL, 0),
+	     21, 0, 0),
 	GATE(CLK_GOUT_HSI2_CLK_HSI2_BUS_CLK,
 	     "gout_hsi2_clk_hsi2_bus_clk", "mout_hsi2_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_HSI2_UID_RSTNSYNC_CLK_HSI2_BUS_IPCLKPORT_CLK,
-	     21, CLK_IS_CRITICAL, 0),
+	     21, 0, 0),
 	GATE(CLK_GOUT_HSI2_CLK_HSI2_OSCCLK_CLK,
 	     "gout_hsi2_clk_hsi2_oscclk_clk", "oscclk",
 	     CLK_CON_GAT_GOUT_BLK_HSI2_UID_RSTNSYNC_CLK_HSI2_OSCCLK_IPCLKPORT_CLK,
 	     21, 0, 0),
-	/* TODO: should have a driver for this */
 	GATE(CLK_GOUT_HSI2_SSMT_HSI2_ACLK,
 	     "gout_hsi2_ssmt_hsi2_aclk", "mout_hsi2_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_HSI2_UID_SSMT_HSI2_IPCLKPORT_ACLK,
-	     21, CLK_IGNORE_UNUSED, 0),
-	/* TODO: should have a driver for this */
+	     21, 0, 0),
 	GATE(CLK_GOUT_HSI2_SSMT_HSI2_PCLK,
 	     "gout_hsi2_ssmt_hsi2_pclk", "mout_hsi2_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_HSI2_UID_SSMT_HSI2_IPCLKPORT_PCLK,
-	     21, CLK_IGNORE_UNUSED, 0),
-	/* TODO: should have a driver for this */
+	     21, 0, 0),
 	GATE(CLK_GOUT_HSI2_SYSMMU_HSI2_CLK_S2,
 	     "gout_hsi2_sysmmu_hsi2_clk_s2", "mout_hsi2_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_HSI2_UID_SYSMMU_HSI2_IPCLKPORT_CLK_S2,
-	     21, CLK_IGNORE_UNUSED, 0),
+	     21, 0, 0),
 	GATE(CLK_GOUT_HSI2_SYSREG_HSI2_PCLK,
 	     "gout_hsi2_sysreg_hsi2_pclk", "mout_hsi2_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_HSI2_UID_SYSREG_HSI2_IPCLKPORT_PCLK,
-	     21, CLK_IS_CRITICAL, 0),
+	     21, 0, 0),
 	GATE(CLK_GOUT_HSI2_UASC_PCIE_GEN4A_DBI_1_ACLK,
 	     "gout_hsi2_uasc_pcie_gen4a_dbi_1_aclk", "mout_hsi2_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_HSI2_UID_UASC_PCIE_GEN4A_DBI_1_IPCLKPORT_ACLK,
@@ -2862,25 +2847,23 @@ static const struct samsung_gate_clock hsi2_gate_clks[] __initconst = {
 	GATE(CLK_GOUT_HSI2_UFS_EMBD_I_ACLK,
 	     "gout_hsi2_ufs_embd_i_aclk", "mout_hsi2_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_HSI2_UID_UFS_EMBD_IPCLKPORT_I_ACLK,
-	     21, CLK_IS_CRITICAL, 0),
+	     21, 0, 0),
 	GATE(CLK_GOUT_HSI2_UFS_EMBD_I_CLK_UNIPRO,
 	     "gout_hsi2_ufs_embd_i_clk_unipro", "mout_hsi2_ufs_embd_user",
 	     CLK_CON_GAT_GOUT_BLK_HSI2_UID_UFS_EMBD_IPCLKPORT_I_CLK_UNIPRO,
-	     21, CLK_IS_CRITICAL, 0),
+	     21, 0, 0),
 	GATE(CLK_GOUT_HSI2_UFS_EMBD_I_FMP_CLK,
 	     "gout_hsi2_ufs_embd_i_fmp_clk", "mout_hsi2_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_HSI2_UID_UFS_EMBD_IPCLKPORT_I_FMP_CLK,
-	     21, CLK_IS_CRITICAL, 0),
-	/* TODO: should have a driver for this */
+	     21, 0, 0),
 	GATE(CLK_GOUT_HSI2_XIU_D_HSI2_ACLK,
 	     "gout_hsi2_xiu_d_hsi2_aclk", "mout_hsi2_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_HSI2_UID_XIU_D_HSI2_IPCLKPORT_ACLK,
-	     21, CLK_IGNORE_UNUSED, 0),
-	/* TODO: should have a driver for this */
+	     21, 0, 0),
 	GATE(CLK_GOUT_HSI2_XIU_P_HSI2_ACLK,
 	     "gout_hsi2_xiu_p_hsi2_aclk", "mout_hsi2_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_HSI2_UID_XIU_P_HSI2_IPCLKPORT_ACLK,
-	     21, CLK_IGNORE_UNUSED, 0),
+	     21, 0, 0),
 };
 
 static const struct samsung_cmu_info hsi2_cmu_info __initconst = {
@@ -3849,7 +3832,7 @@ static const struct samsung_gate_clock peric0_gate_clks[] __initconst = {
 	GATE(CLK_GOUT_PERIC0_PERIC0_CMU_PERIC0_PCLK,
 	     "gout_peric0_peric0_cmu_peric0_pclk", "mout_peric0_bus_user",
 	     CLK_CON_GAT_CLK_BLK_PERIC0_UID_PERIC0_CMU_PERIC0_IPCLKPORT_PCLK,
-	     21, CLK_IS_CRITICAL, 0),
+	     21, 0, 0),
 	GATE(CLK_GOUT_PERIC0_CLK_PERIC0_OSCCLK_CLK,
 	     "gout_peric0_clk_peric0_oscclk_clk", "oscclk",
 	     CLK_CON_GAT_CLK_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_OSCCLK_IPCLKPORT_CLK,
@@ -3865,12 +3848,12 @@ static const struct samsung_gate_clock peric0_gate_clks[] __initconst = {
 	GATE(CLK_GOUT_PERIC0_GPIO_PERIC0_PCLK,
 	     "gout_peric0_gpio_peric0_pclk", "mout_peric0_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_GPIO_PERIC0_IPCLKPORT_PCLK,
-	     21, CLK_IGNORE_UNUSED, 0),
+	     21, 0, 0),
 	/* Disabling this clock makes the system hang. Mark the clock as critical. */
 	GATE(CLK_GOUT_PERIC0_LHM_AXI_P_PERIC0_I_CLK,
 	     "gout_peric0_lhm_axi_p_peric0_i_clk", "mout_peric0_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_LHM_AXI_P_PERIC0_IPCLKPORT_I_CLK,
-	     21, CLK_IS_CRITICAL, 0),
+	     21, 0, 0),
 	GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_0,
 	     "gout_peric0_peric0_top0_ipclk_0", "dout_peric0_usi1_usi",
 	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_0,
@@ -4003,7 +3986,7 @@ static const struct samsung_gate_clock peric0_gate_clks[] __initconst = {
 	GATE(CLK_GOUT_PERIC0_PERIC0_TOP1_IPCLK_0,
 	     "gout_peric0_peric0_top1_ipclk_0", "dout_peric0_usi0_uart",
 	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_IPCLK_0,
-	     21, CLK_IS_CRITICAL, 0),
+	     21, 0, 0),
 	GATE(CLK_GOUT_PERIC0_PERIC0_TOP1_IPCLK_2,
 	     "gout_peric0_peric0_top1_ipclk_2", "dout_peric0_usi14_usi",
 	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_IPCLK_2,
@@ -4012,7 +3995,7 @@ static const struct samsung_gate_clock peric0_gate_clks[] __initconst = {
 	GATE(CLK_GOUT_PERIC0_PERIC0_TOP1_PCLK_0,
 	     "gout_peric0_peric0_top1_pclk_0", "mout_peric0_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_PCLK_0,
-	     21, CLK_IS_CRITICAL, 0),
+	     21, 0, 0),
 	GATE(CLK_GOUT_PERIC0_PERIC0_TOP1_PCLK_2,
 	     "gout_peric0_peric0_top1_pclk_2", "mout_peric0_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_PCLK_2,
@@ -4310,7 +4293,7 @@ static const struct samsung_gate_clock peric1_gate_clks[] __initconst = {
 	GATE(CLK_GOUT_PERIC1_PCLK,
 	     "gout_peric1_peric1_pclk", "mout_peric1_bus_user",
 	     CLK_CON_GAT_CLK_BLK_PERIC1_UID_PERIC1_CMU_PERIC1_IPCLKPORT_PCLK,
-	     21, CLK_IS_CRITICAL, 0),
+	     21, 0, 0),
 	GATE(CLK_GOUT_PERIC1_CLK_PERIC1_I3C_CLK,
 	     "gout_peric1_clk_peric1_i3c_clk", "dout_peric1_i3c",
 	     CLK_CON_GAT_CLK_BLK_PERIC1_UID_RSTNSYNC_CLK_PERIC1_I3C_IPCLKPORT_CLK,
@@ -4330,11 +4313,11 @@ static const struct samsung_gate_clock peric1_gate_clks[] __initconst = {
 	GATE(CLK_GOUT_PERIC1_GPIO_PERIC1_PCLK,
 	     "gout_peric1_gpio_peric1_pclk", "mout_peric1_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_GPIO_PERIC1_IPCLKPORT_PCLK,
-	     21, CLK_IGNORE_UNUSED, 0),
+	     21, 0, 0),
 	GATE(CLK_GOUT_PERIC1_LHM_AXI_P_PERIC1_I_CLK,
 	     "gout_peric1_lhm_axi_p_peric1_i_clk", "mout_peric1_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_LHM_AXI_P_PERIC1_IPCLKPORT_I_CLK,
-	     21, CLK_IS_CRITICAL, 0),
+	     21, 0, 0),
 	GATE(CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_1,
 	     "gout_peric1_peric1_top0_ipclk_1", "dout_peric1_usi0_usi",
 	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_1,

-- 
2.51.0.760.g7b8bcc2412-goog

