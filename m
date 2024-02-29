Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B1A7D078
	for <linux-samsung-soc@vger.kernel.org>; Thu, 29 Feb 2024 12:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709209232; cv=none; b=U2EIvVFIbUCYRam6ZrXk2+jDA7ycYr5X8eh5lsQhbjO/1CCM60DI1VwdX8336ZdTmqSYqARQZRrocpB9mYT7yM3qxTQk0WMlT/MGNj8gj2jefW5bjDZITdIGYnWRiy8ZlvjIg7chlNx5xCP2KJB1YcTaAFr6kyfhAj7HJCakU2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709209232; c=relaxed/simple;
	bh=lSBnb+XEH5OWKNdD4KGcBTGlJJw3UsgmPv8PP61sTBs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qnoE8IpZdZ2mqH0b09epIGzv1uzDPQdm6RVzLQI2IkTgwjX64iJ8C9oThisLm93KKdp2HbD6phWSxxQCuSbFbk374O1iz3ixqXzbj4VXVzr5O9Naz62tSOOJX0yOmitxdT4Qq+9gIKxrUnXDSgJ8xjgW1H8o+rwIf4vLAWL05YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N0vVTGo/; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N0vVTGo/"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-412a9e9c776so12026115e9.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 29 Feb 2024 04:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709209228; x=1709814028; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JQDiw4Hp02y45aR2U+S1FUPielx60HP4THtzacPLYL4=;
        b=N0vVTGo/QK7TuMMtlx508B8T8+MwraDk0xD+X6+mU7gD25o90TSDGOt1udnVFRlxwh
         nzCFxgBjFKz2cyrmmL5x2R/AZBb3w0PYf+YtP7ywrzplPH7BD+RaCCpkWJo/3ugHIuz0
         uzDATlaOSFeJ8bJVxSjpIOaTMmhML5COEgU3DzUrau1fp6oGLucHeNBYU/nQHQ9xCkOm
         wnw7/so1tVS8drQnYjv3SgpMOwcE+DLV9Kh+9/skJlP59r1vH53D3St+vM6315/8tcK0
         k2kESc0F/UUzMFljsfiKf6hy48on3E415IbFeGtdiSDiiuOWIKYUD6clRPfPRfMb1uHJ
         u1iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709209228; x=1709814028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JQDiw4Hp02y45aR2U+S1FUPielx60HP4THtzacPLYL4=;
        b=S34fxBE8OAHgIcTPC9RFkevEHaSOKrA/pkL9KqtTQT4fVqxC2A8IPsVYbhswjtoOM6
         Lx0DpAzCMLt821AnEd173He5kvmrVoxXvEA8MpSHwr1aQNI++tFprfScobUh4guzvAvP
         JQSlwDxJ3P8bVm0CbX9EgM85Su2JUwLjFstG75g/EeQEaXoh4gBzF3wCWI9F8+szMTBu
         xnuTNwX8lqCq3uFk/Wh0uP955if90cW2lAXyx4d6cNOGRDIe7bpujTXu3pwfJylAcxcC
         4SuImdaHP8+02q6G8U4TyH/ioAv3EhOZ6DrMGrDCtHgzmpkxz0gooIgXgLmMAQ3+LJSG
         sb3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUYIZFFZCjoiRkqC42uGezB5BFL7H5OKaLINcpGjAMWD6rSoOlT8wud+kf2x6OHvp8h0pz9Pm4F/Ci/mK1noElSGIsDuO23S5+EmhD3c+yZLEo=
X-Gm-Message-State: AOJu0Yw4ljJv8Jc2lLvxn2eTTCuHG9/BPCAzBQonzs7cxflVxuL5yPes
	70hSPrhZpfpxg1CmRXzVgPOTF0h8yAz09DYsaHXGQntnV8+HjXOkoUgWlv7uE3M=
X-Google-Smtp-Source: AGHT+IF4he2HlSn1uPXmyFLNHEgmB6m1JN5wF1U8no+ln4ydrMAzQxoObQ3iUBzOebwvb9t68euB8g==
X-Received: by 2002:a05:600c:444f:b0:412:c285:10fc with SMTP id v15-20020a05600c444f00b00412c28510fcmr275312wmn.4.1709209228120;
        Thu, 29 Feb 2024 04:20:28 -0800 (PST)
Received: from ta2.c.googlers.com.com (110.121.148.146.bc.googleusercontent.com. [146.148.121.110])
        by smtp.gmail.com with ESMTPSA id dx14-20020a05600c63ce00b004129f28e2cdsm5009121wmb.3.2024.02.29.04.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 04:20:27 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: krzysztof.kozlowski@linaro.org,
	s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	semen.protsenko@linaro.org
Cc: alim.akhtar@samsung.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	peter.griffin@linaro.org,
	andre.draszik@linaro.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	willmcvicker@google.com,
	kernel-team@android.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 3/4] clk: samsung: gs101: propagate PERIC0 USI SPI clock rate
Date: Thu, 29 Feb 2024 12:20:20 +0000
Message-ID: <20240229122021.1901785-4-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.44.0.278.ge034bb2e1d-goog
In-Reply-To: <20240229122021.1901785-1-tudor.ambarus@linaro.org>
References: <20240229122021.1901785-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When SPI transfer is being prepared, the spi-s3c64xx driver will call
clk_set_rate() to change the rate of SPI source clock (IPCLK). But IPCLK
is a gate (leaf) clock, so it must propagate the rate change up the
clock tree, so that corresponding MUX/DIV clocks can actually change
their values. Add CLK_SET_RATE_PARENT flag to corresponding clocks for
all USI instances in GS101 PERIC0: USI{1-8, 14}. This change involves the
following clocks:

PERIC0 USI*:

    Clock                              Div range    MUX Selection
    -------------------------------------------------------------------
    gout_peric0_peric0_top0_ipclk_*    -            -
    dout_peric0_usi*_usi               /1..16       -
    mout_peric0_usi*_usi_user          -            {24.5 MHz, 400 MHz}

With input clock of 400 MHz this scheme provides the following IPCLK
rate range, for each USI block:

    PERIC0 USI*:       1.5 MHz ... 400 MHz

Accounting for internal /4 divider in SPI blocks, and because the max
SPI frequency is limited at 50 MHz, it gives us next SPI SCK rates:

    PERIC0 USI_SPI*:   384 KHz ... 49.9 MHz

Which shall be fine for the applications of the SPI bus.

Fixes: 893f133a040b ("clk: samsung: gs101: add support for cmu_peric0")
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/clk/samsung/clk-gs101.c | 135 +++++++++++++++++---------------
 1 file changed, 72 insertions(+), 63 deletions(-)

diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs101.c
index ddf2d57eed68..bd3c1b02715b 100644
--- a/drivers/clk/samsung/clk-gs101.c
+++ b/drivers/clk/samsung/clk-gs101.c
@@ -2763,33 +2763,33 @@ static const struct samsung_mux_clock peric0_mux_clks[] __initconst = {
 	MUX(CLK_MOUT_PERIC0_USI0_UART_USER,
 	    "mout_peric0_usi0_uart_user", mout_peric0_usi0_uart_user_p,
 	    PLL_CON0_MUX_CLKCMU_PERIC0_USI0_UART_USER, 4, 1),
-	MUX(CLK_MOUT_PERIC0_USI14_USI_USER,
-	    "mout_peric0_usi14_usi_user", mout_peric0_usi_usi_user_p,
-	    PLL_CON0_MUX_CLKCMU_PERIC0_USI14_USI_USER, 4, 1),
-	MUX(CLK_MOUT_PERIC0_USI1_USI_USER,
-	    "mout_peric0_usi1_usi_user", mout_peric0_usi_usi_user_p,
-	    PLL_CON0_MUX_CLKCMU_PERIC0_USI1_USI_USER, 4, 1),
-	MUX(CLK_MOUT_PERIC0_USI2_USI_USER,
-	    "mout_peric0_usi2_usi_user", mout_peric0_usi_usi_user_p,
-	    PLL_CON0_MUX_CLKCMU_PERIC0_USI2_USI_USER, 4, 1),
-	MUX(CLK_MOUT_PERIC0_USI3_USI_USER,
-	    "mout_peric0_usi3_usi_user", mout_peric0_usi_usi_user_p,
-	    PLL_CON0_MUX_CLKCMU_PERIC0_USI3_USI_USER, 4, 1),
-	MUX(CLK_MOUT_PERIC0_USI4_USI_USER,
-	    "mout_peric0_usi4_usi_user", mout_peric0_usi_usi_user_p,
-	    PLL_CON0_MUX_CLKCMU_PERIC0_USI4_USI_USER, 4, 1),
-	MUX(CLK_MOUT_PERIC0_USI5_USI_USER,
-	    "mout_peric0_usi5_usi_user", mout_peric0_usi_usi_user_p,
-	    PLL_CON0_MUX_CLKCMU_PERIC0_USI5_USI_USER, 4, 1),
-	MUX(CLK_MOUT_PERIC0_USI6_USI_USER,
-	    "mout_peric0_usi6_usi_user", mout_peric0_usi_usi_user_p,
-	    PLL_CON0_MUX_CLKCMU_PERIC0_USI6_USI_USER, 4, 1),
-	MUX(CLK_MOUT_PERIC0_USI7_USI_USER,
-	    "mout_peric0_usi7_usi_user", mout_peric0_usi_usi_user_p,
-	    PLL_CON0_MUX_CLKCMU_PERIC0_USI7_USI_USER, 4, 1),
-	MUX(CLK_MOUT_PERIC0_USI8_USI_USER,
-	    "mout_peric0_usi8_usi_user", mout_peric0_usi_usi_user_p,
-	    PLL_CON0_MUX_CLKCMU_PERIC0_USI8_USI_USER, 4, 1),
+	nMUX(CLK_MOUT_PERIC0_USI14_USI_USER,
+	     "mout_peric0_usi14_usi_user", mout_peric0_usi_usi_user_p,
+	     PLL_CON0_MUX_CLKCMU_PERIC0_USI14_USI_USER, 4, 1),
+	nMUX(CLK_MOUT_PERIC0_USI1_USI_USER,
+	     "mout_peric0_usi1_usi_user", mout_peric0_usi_usi_user_p,
+	     PLL_CON0_MUX_CLKCMU_PERIC0_USI1_USI_USER, 4, 1),
+	nMUX(CLK_MOUT_PERIC0_USI2_USI_USER,
+	     "mout_peric0_usi2_usi_user", mout_peric0_usi_usi_user_p,
+	     PLL_CON0_MUX_CLKCMU_PERIC0_USI2_USI_USER, 4, 1),
+	nMUX(CLK_MOUT_PERIC0_USI3_USI_USER,
+	     "mout_peric0_usi3_usi_user", mout_peric0_usi_usi_user_p,
+	     PLL_CON0_MUX_CLKCMU_PERIC0_USI3_USI_USER, 4, 1),
+	nMUX(CLK_MOUT_PERIC0_USI4_USI_USER,
+	     "mout_peric0_usi4_usi_user", mout_peric0_usi_usi_user_p,
+	     PLL_CON0_MUX_CLKCMU_PERIC0_USI4_USI_USER, 4, 1),
+	nMUX(CLK_MOUT_PERIC0_USI5_USI_USER,
+	     "mout_peric0_usi5_usi_user", mout_peric0_usi_usi_user_p,
+	     PLL_CON0_MUX_CLKCMU_PERIC0_USI5_USI_USER, 4, 1),
+	nMUX(CLK_MOUT_PERIC0_USI6_USI_USER,
+	     "mout_peric0_usi6_usi_user", mout_peric0_usi_usi_user_p,
+	     PLL_CON0_MUX_CLKCMU_PERIC0_USI6_USI_USER, 4, 1),
+	nMUX(CLK_MOUT_PERIC0_USI7_USI_USER,
+	     "mout_peric0_usi7_usi_user", mout_peric0_usi_usi_user_p,
+	     PLL_CON0_MUX_CLKCMU_PERIC0_USI7_USI_USER, 4, 1),
+	nMUX(CLK_MOUT_PERIC0_USI8_USI_USER,
+	     "mout_peric0_usi8_usi_user", mout_peric0_usi_usi_user_p,
+	     PLL_CON0_MUX_CLKCMU_PERIC0_USI8_USI_USER, 4, 1),
 };
 
 static const struct samsung_div_clock peric0_div_clks[] __initconst = {
@@ -2798,33 +2798,42 @@ static const struct samsung_div_clock peric0_div_clks[] __initconst = {
 	DIV(CLK_DOUT_PERIC0_USI0_UART,
 	    "dout_peric0_usi0_uart", "mout_peric0_usi0_uart_user",
 	    CLK_CON_DIV_DIV_CLK_PERIC0_USI0_UART, 0, 4),
-	DIV(CLK_DOUT_PERIC0_USI14_USI,
-	    "dout_peric0_usi14_usi", "mout_peric0_usi14_usi_user",
-	    CLK_CON_DIV_DIV_CLK_PERIC0_USI14_USI, 0, 4),
-	DIV(CLK_DOUT_PERIC0_USI1_USI,
-	    "dout_peric0_usi1_usi", "mout_peric0_usi1_usi_user",
-	    CLK_CON_DIV_DIV_CLK_PERIC0_USI1_USI, 0, 4),
-	DIV(CLK_DOUT_PERIC0_USI2_USI,
-	    "dout_peric0_usi2_usi", "mout_peric0_usi2_usi_user",
-	    CLK_CON_DIV_DIV_CLK_PERIC0_USI2_USI, 0, 4),
-	DIV(CLK_DOUT_PERIC0_USI3_USI,
-	    "dout_peric0_usi3_usi", "mout_peric0_usi3_usi_user",
-	    CLK_CON_DIV_DIV_CLK_PERIC0_USI3_USI, 0, 4),
-	DIV(CLK_DOUT_PERIC0_USI4_USI,
-	    "dout_peric0_usi4_usi", "mout_peric0_usi4_usi_user",
-	    CLK_CON_DIV_DIV_CLK_PERIC0_USI4_USI, 0, 4),
-	DIV(CLK_DOUT_PERIC0_USI5_USI,
-	    "dout_peric0_usi5_usi", "mout_peric0_usi5_usi_user",
-	    CLK_CON_DIV_DIV_CLK_PERIC0_USI5_USI, 0, 4),
-	DIV(CLK_DOUT_PERIC0_USI6_USI,
-	    "dout_peric0_usi6_usi", "mout_peric0_usi6_usi_user",
-	    CLK_CON_DIV_DIV_CLK_PERIC0_USI6_USI, 0, 4),
-	DIV(CLK_DOUT_PERIC0_USI7_USI,
-	    "dout_peric0_usi7_usi", "mout_peric0_usi7_usi_user",
-	    CLK_CON_DIV_DIV_CLK_PERIC0_USI7_USI, 0, 4),
-	DIV(CLK_DOUT_PERIC0_USI8_USI,
-	    "dout_peric0_usi8_usi", "mout_peric0_usi8_usi_user",
-	    CLK_CON_DIV_DIV_CLK_PERIC0_USI8_USI, 0, 4),
+	DIV_F(CLK_DOUT_PERIC0_USI14_USI,
+	      "dout_peric0_usi14_usi", "mout_peric0_usi14_usi_user",
+	      CLK_CON_DIV_DIV_CLK_PERIC0_USI14_USI, 0, 4,
+	      CLK_SET_RATE_PARENT, 0),
+	DIV_F(CLK_DOUT_PERIC0_USI1_USI,
+	      "dout_peric0_usi1_usi", "mout_peric0_usi1_usi_user",
+	      CLK_CON_DIV_DIV_CLK_PERIC0_USI1_USI, 0, 4,
+	      CLK_SET_RATE_PARENT, 0),
+	DIV_F(CLK_DOUT_PERIC0_USI2_USI,
+	      "dout_peric0_usi2_usi", "mout_peric0_usi2_usi_user",
+	      CLK_CON_DIV_DIV_CLK_PERIC0_USI2_USI, 0, 4,
+	      CLK_SET_RATE_PARENT, 0),
+	DIV_F(CLK_DOUT_PERIC0_USI3_USI,
+	      "dout_peric0_usi3_usi", "mout_peric0_usi3_usi_user",
+	      CLK_CON_DIV_DIV_CLK_PERIC0_USI3_USI, 0, 4,
+	      CLK_SET_RATE_PARENT, 0),
+	DIV_F(CLK_DOUT_PERIC0_USI4_USI,
+	      "dout_peric0_usi4_usi", "mout_peric0_usi4_usi_user",
+	      CLK_CON_DIV_DIV_CLK_PERIC0_USI4_USI, 0, 4,
+	      CLK_SET_RATE_PARENT, 0),
+	DIV_F(CLK_DOUT_PERIC0_USI5_USI,
+	      "dout_peric0_usi5_usi", "mout_peric0_usi5_usi_user",
+	      CLK_CON_DIV_DIV_CLK_PERIC0_USI5_USI, 0, 4,
+	      CLK_SET_RATE_PARENT, 0),
+	DIV_F(CLK_DOUT_PERIC0_USI6_USI,
+	      "dout_peric0_usi6_usi", "mout_peric0_usi6_usi_user",
+	      CLK_CON_DIV_DIV_CLK_PERIC0_USI6_USI, 0, 4,
+	      CLK_SET_RATE_PARENT, 0),
+	DIV_F(CLK_DOUT_PERIC0_USI7_USI,
+	      "dout_peric0_usi7_usi", "mout_peric0_usi7_usi_user",
+	      CLK_CON_DIV_DIV_CLK_PERIC0_USI7_USI, 0, 4,
+	      CLK_SET_RATE_PARENT, 0),
+	DIV_F(CLK_DOUT_PERIC0_USI8_USI,
+	      "dout_peric0_usi8_usi", "mout_peric0_usi8_usi_user",
+	      CLK_CON_DIV_DIV_CLK_PERIC0_USI8_USI, 0, 4,
+	      CLK_SET_RATE_PARENT, 0),
 };
 
 static const struct samsung_gate_clock peric0_gate_clks[] __initconst = {
@@ -2857,11 +2866,11 @@ static const struct samsung_gate_clock peric0_gate_clks[] __initconst = {
 	GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_0,
 	     "gout_peric0_peric0_top0_ipclk_0", "dout_peric0_usi1_usi",
 	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_0,
-	     21, 0, 0),
+	     21, CLK_SET_RATE_PARENT, 0),
 	GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_1,
 	     "gout_peric0_peric0_top0_ipclk_1", "dout_peric0_usi2_usi",
 	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_1,
-	     21, 0, 0),
+	     21, CLK_SET_RATE_PARENT, 0),
 	GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_10,
 	     "gout_peric0_peric0_top0_ipclk_10", "dout_peric0_i3c",
 	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_10,
@@ -2889,27 +2898,27 @@ static const struct samsung_gate_clock peric0_gate_clks[] __initconst = {
 	GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_2,
 	     "gout_peric0_peric0_top0_ipclk_2", "dout_peric0_usi3_usi",
 	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_2,
-	     21, 0, 0),
+	     21, CLK_SET_RATE_PARENT, 0),
 	GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_3,
 	     "gout_peric0_peric0_top0_ipclk_3", "dout_peric0_usi4_usi",
 	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_3,
-	     21, 0, 0),
+	     21, CLK_SET_RATE_PARENT, 0),
 	GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_4,
 	     "gout_peric0_peric0_top0_ipclk_4", "dout_peric0_usi5_usi",
 	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_4,
-	     21, 0, 0),
+	     21, CLK_SET_RATE_PARENT, 0),
 	GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_5,
 	     "gout_peric0_peric0_top0_ipclk_5", "dout_peric0_usi6_usi",
 	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_5,
-	     21, 0, 0),
+	     21, CLK_SET_RATE_PARENT, 0),
 	GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_6,
 	     "gout_peric0_peric0_top0_ipclk_6", "dout_peric0_usi7_usi",
 	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_6,
-	     21, 0, 0),
+	     21, CLK_SET_RATE_PARENT, 0),
 	GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_7,
 	     "gout_peric0_peric0_top0_ipclk_7", "dout_peric0_usi8_usi",
 	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_7,
-	     21, 0, 0),
+	     21, CLK_SET_RATE_PARENT, 0),
 	GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_8,
 	     "gout_peric0_peric0_top0_ipclk_8", "dout_peric0_i3c",
 	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_8,
@@ -2990,7 +2999,7 @@ static const struct samsung_gate_clock peric0_gate_clks[] __initconst = {
 	GATE(CLK_GOUT_PERIC0_PERIC0_TOP1_IPCLK_2,
 	     "gout_peric0_peric0_top1_ipclk_2", "dout_peric0_usi14_usi",
 	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_IPCLK_2,
-	     21, 0, 0),
+	     21, CLK_SET_RATE_PARENT, 0),
 	/* Disabling this clock makes the system hang. Mark the clock as critical. */
 	GATE(CLK_GOUT_PERIC0_PERIC0_TOP1_PCLK_0,
 	     "gout_peric0_peric0_top1_pclk_0", "mout_peric0_bus_user",
-- 
2.44.0.278.ge034bb2e1d-goog

