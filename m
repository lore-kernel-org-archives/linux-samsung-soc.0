Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D579344DAC
	for <linux-samsung-soc@vger.kernel.org>; Thu, 28 May 2026 20:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779998951; cv=none; b=FqigFP/bkerDNaT1EfDUCZBBaw7A9lHAcp6fA4a/eG6/K0czQkj7WmvbsjQkKNl2mDA/8jBAg+TytEw+gVfM93ca+pxXWU3DscnEyXTBvaFj+fUTqRvI106SgUgT+ePQZOT7+fiMNRx0PmemgCNBHsNHKbyXStthPNR5GYX3WXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779998951; c=relaxed/simple;
	bh=iAJ7LjzKcdgIeRWt2hA/3B6ahxBFHWqAM4FQXrRQpkc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=EOF7ipVFdLaPOHCvY3xi5gegDigobOAo1ERwsOihjIL2rsLBqk1f+6IeIpM1F4d8FPmCjptoMKh8hm033C1W8ZU9SRa5WWo6zDK4ZeMzxeM+Au/vplT14RZ34mow6nqEK2ojJA5yfgQCb4BkCQ/JjIjUxhLOiJatfHXyjrpm+WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LnOBtczm; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LnOBtczm"
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-63129bf2af0so4940570137.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 May 2026 13:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779998948; x=1780603748; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yeYHRA7Uvd+ApWb0mxYDuX05x09Ixiae7OYtaETUCZ4=;
        b=LnOBtczmD5oo/DBwPSiwi862lltErQMN/mRkCBt/CFnnPVvWQsI46BLPa48mQy7Syi
         zZHUbXjVaO7SRdmgoVn58l5kfV1zV3VL1KFytvjoaDFxKVmZLB6tA9B2wMyTHecI7OgE
         FKQNmzuGTFU+GCVdPnYKPmCG8VgUNJ9E4vX2D0DUKMLHPBWNg0IgUwzN5dNMRL5CoTGg
         EOTwZItTkWno/DXtCsx8mQTx3F5f1i8K2UvXIbh37ihMlhCTroLPyIDefZkSEM99NNxn
         bW1fYimi9kvcs9g/1vzazsEoLFi5IXq8Zu7N0kNoJCMeSMbLIeVT2SaBK7bUElZzwWbP
         CIVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779998948; x=1780603748;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yeYHRA7Uvd+ApWb0mxYDuX05x09Ixiae7OYtaETUCZ4=;
        b=c4dO62EfnWTwNawcMVQjgWH6VrHHCZgW36fHNFbf1uQFLLe+f1h+lLfynKqiOPHBaQ
         lMmEGx+nY5vUbWUWa65ISdvzyDIjpq7FbMpca8/fNohOOoffo0IL4BEmSpC4v7m9MoSj
         tQ6mv+Q6RMlJFqNcqmONXEMyFpxVAtC1etN6/9dRdq2eFhkL5PTNz/EmhJ80W+94gLGI
         ydiN/NZXM+hTQaUx4BgU8HLTIXxPYj0u7rhPDgxnDlnUCMx1hkcKrD5qdWuGK9aR5HiF
         9vKvaXBA2nLUZpHbXW/NZecZnysqSapbR516hh6A2g0AXeaW79gYqLkdzA4G32ncSG2z
         EWeQ==
X-Gm-Message-State: AOJu0YzC09sLHwkIM9t8fDUINGd+I9pFw+YIQSQJkZdaCJlujZGEETfd
	cBEf1ZgeNU+w7c06uajZfUBqOQM4jbqHwCkQIyT4JpQMJeLD8hhXAeyVejaGpO2e
X-Gm-Gg: Acq92OHV2Vt0iABB7bWvjm/iyAfmD26EBl+rPArOe8/NHa2jOGL0yAP6jTLyilFVZeo
	GOpZuafiHmyb1ebIDbxyUXYspzbBVM8oeDotnsoarUK7JSxiwYkinvsMA0lnu/XQbYbeM3HEA49
	UojYXMlfT/1ApeeLYH1KFtUOilmnBm3km+XQrfqlpIcf4sk3xQKziJr7VPNsHr40KaGsv4vux7W
	JSmnYp1bm+YVUdbqBlPACzl7hdbriZmuK7fD/x1VGhvdhE3hTv6c+tWmuvm1wnk3CfHRM7ln7Hy
	OPNwwjruv22ucnBaxFjeezFPReVLmcwuXj9KrX2NEihsVyiJDXiw6s1pMlL1XTPiwLnu+Vj6SVV
	NhRKLJ+zcbTtxL7EfxtOc+8QG37z5BqkC4o8ETEdPncwPsP2Bduc4OluvCQYJzJoLER2H6Zl4Km
	/WruuxA+L3n4fusEU/YnrvgCM=
X-Received: by 2002:a05:6102:b01:b0:631:ea6b:23dc with SMTP id ada2fe7eead31-6be0521eca7mr179806137.2.1779998948250;
        Thu, 28 May 2026 13:09:08 -0700 (PDT)
Received: from [127.0.0.1] ([2a02:6ea0:5505:7199::29])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-6beb8652221sm212137.2.2026.05.28.13.09.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 13:09:07 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Thu, 28 May 2026 15:09:01 -0500
Subject: [PATCH] clk: samsung: exynos990: Fix PERIC0/1 USI clock types
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260528-perics-usi-v1-1-13a6ee4d1a6f@gmail.com>
X-B4-Tracking: v=1; b=H4sIANygGGoC/yXMQQqAIBCF4avErBNM0KKrRAuzqaaFiVMRSHfPa
 vnBe38CxkjI0BYJIp7EtPmMqizALdbPKGjMBiWVkVo1IuS9Y3EwCaNtPaEyg5QW8iFEnOj6Yl3
 /m49hRbe/BbjvB0Y4lwNuAAAA
X-Change-ID: 20260528-perics-usi-65a7fe26b00a
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Denzeel Oliva <wachiturroxd150@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779998944; l=17919;
 i=wachiturroxd150@gmail.com; s=20250819; h=from:subject:message-id;
 bh=iAJ7LjzKcdgIeRWt2hA/3B6ahxBFHWqAM4FQXrRQpkc=;
 b=eWjfjJZw6dk5bzHIaUlaClQjekGGOARa9Il7gVRF0yx9ZSNWF/f5Y8e9IIlxl5jXoGnhFHIZu
 iVTXquUCWEUB6driQUJnXWz2BiM1beNGct99sl4tiYtfCENHBrWU11C
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=qNvcL0Ehm3chrW9jFA2JaPVgubN5mHH//uriMxR/DlI=

Use nMUX() for USI and UART user muxes to allow reparenting between
OSC and CMU IP output when changing rates, and use DIV_F() with
CLK_SET_RATE_PARENT on their dividers and gates so rate requests
propagate upward.

Consolidate identical USI parent arrays into shared
mout_peric0_nonbususer_p and mout_peric1_nonbususer_p.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 drivers/clk/samsung/clk-exynos990.c | 307 +++++++++++++++++++++++++++++++++++---------------------------------------
 1 file changed, 143 insertions(+), 164 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos990.c b/drivers/clk/samsung/clk-exynos990.c
index 6277dd557..4385c3b76 100644
--- a/drivers/clk/samsung/clk-exynos990.c
+++ b/drivers/clk/samsung/clk-exynos990.c
@@ -1546,54 +1546,44 @@ static const unsigned long peric0_clk_regs[] __initconst = {
 
 /* Parent clock list for CMU_PERIC0 muxes */
 PNAME(mout_peric0_bus_user_p) = { "oscclk", "dout_cmu_peric0_bus" };
-PNAME(mout_peric0_uart_dbg_p) = { "oscclk", "dout_cmu_peric0_ip" };
-PNAME(mout_peric0_usi00_user_p) = { "oscclk", "dout_cmu_peric0_ip" };
-PNAME(mout_peric0_usi01_user_p) = { "oscclk", "dout_cmu_peric0_ip" };
-PNAME(mout_peric0_usi02_user_p) = { "oscclk", "dout_cmu_peric0_ip" };
-PNAME(mout_peric0_usi03_user_p) = { "oscclk", "dout_cmu_peric0_ip" };
-PNAME(mout_peric0_usi04_user_p) = { "oscclk", "dout_cmu_peric0_ip" };
-PNAME(mout_peric0_usi05_user_p) = { "oscclk", "dout_cmu_peric0_ip" };
-PNAME(mout_peric0_usi13_user_p) = { "oscclk", "dout_cmu_peric0_ip" };
-PNAME(mout_peric0_usi14_user_p) = { "oscclk", "dout_cmu_peric0_ip" };
-PNAME(mout_peric0_usi15_user_p) = { "oscclk", "dout_cmu_peric0_ip" };
-PNAME(mout_peric0_usi_i2c_user_p) = { "oscclk", "dout_cmu_peric0_ip" };
+PNAME(mout_peric0_nonbususer_p) = { "oscclk", "dout_cmu_peric0_ip" };
 
 static const struct samsung_mux_clock peric0_mux_clks[] __initconst = {
 	MUX(CLK_MOUT_PERIC0_BUS_USER, "mout_peric0_bus_user",
 	    mout_peric0_bus_user_p, PLL_CON0_MUX_CLKCMU_PERIC0_BUS_USER,
 	    4, 1),
-	MUX(CLK_MOUT_PERIC0_UART_DBG, "mout_peric0_uart_dbg",
-	    mout_peric0_uart_dbg_p, PLL_CON0_MUX_CLKCMU_PERIC0_UART_DBG,
-	    4, 1),
-	MUX(CLK_MOUT_PERIC0_USI00_USI_USER, "mout_peric0_usi00_usi_user",
-	    mout_peric0_usi00_user_p, PLL_CON0_MUX_CLKCMU_PERIC0_USI00_USI_USER,
-	    4, 1),
-	MUX(CLK_MOUT_PERIC0_USI01_USI_USER, "mout_peric0_usi01_usi_user",
-	    mout_peric0_usi01_user_p, PLL_CON0_MUX_CLKCMU_PERIC0_USI01_USI_USER,
-	    4, 1),
-	MUX(CLK_MOUT_PERIC0_USI02_USI_USER, "mout_peric0_usi02_usi_user",
-	    mout_peric0_usi02_user_p, PLL_CON0_MUX_CLKCMU_PERIC0_USI02_USI_USER,
-	    4, 1),
-	MUX(CLK_MOUT_PERIC0_USI03_USI_USER, "mout_peric0_usi03_usi_user",
-	    mout_peric0_usi03_user_p, PLL_CON0_MUX_CLKCMU_PERIC0_USI03_USI_USER,
-	    4, 1),
-	MUX(CLK_MOUT_PERIC0_USI04_USI_USER, "mout_peric0_usi04_usi_user",
-	    mout_peric0_usi04_user_p, PLL_CON0_MUX_CLKCMU_PERIC0_USI04_USI_USER,
-	    4, 1),
-	MUX(CLK_MOUT_PERIC0_USI05_USI_USER, "mout_peric0_usi05_usi_user",
-	    mout_peric0_usi05_user_p, PLL_CON0_MUX_CLKCMU_PERIC0_USI05_USI_USER,
-	    4, 1),
-	MUX(CLK_MOUT_PERIC0_USI13_USI_USER, "mout_peric0_usi13_usi_user",
-	    mout_peric0_usi13_user_p, PLL_CON0_MUX_CLKCMU_PERIC0_USI13_USI_USER,
-	    4, 1),
-	MUX(CLK_MOUT_PERIC0_USI14_USI_USER, "mout_peric0_usi14_usi_user",
-	    mout_peric0_usi14_user_p, PLL_CON0_MUX_CLKCMU_PERIC0_USI14_USI_USER,
-	    4, 1),
-	MUX(CLK_MOUT_PERIC0_USI15_USI_USER, "mout_peric0_usi15_usi_user",
-	    mout_peric0_usi15_user_p, PLL_CON0_MUX_CLKCMU_PERIC0_USI15_USI_USER,
-	    4, 1),
+	nMUX(CLK_MOUT_PERIC0_UART_DBG, "mout_peric0_uart_dbg",
+	     mout_peric0_nonbususer_p, PLL_CON0_MUX_CLKCMU_PERIC0_UART_DBG,
+	     4, 1),
+	nMUX(CLK_MOUT_PERIC0_USI00_USI_USER, "mout_peric0_usi00_usi_user",
+	     mout_peric0_nonbususer_p, PLL_CON0_MUX_CLKCMU_PERIC0_USI00_USI_USER,
+	     4, 1),
+	nMUX(CLK_MOUT_PERIC0_USI01_USI_USER, "mout_peric0_usi01_usi_user",
+	     mout_peric0_nonbususer_p, PLL_CON0_MUX_CLKCMU_PERIC0_USI01_USI_USER,
+	     4, 1),
+	nMUX(CLK_MOUT_PERIC0_USI02_USI_USER, "mout_peric0_usi02_usi_user",
+	     mout_peric0_nonbususer_p, PLL_CON0_MUX_CLKCMU_PERIC0_USI02_USI_USER,
+	     4, 1),
+	nMUX(CLK_MOUT_PERIC0_USI03_USI_USER, "mout_peric0_usi03_usi_user",
+	     mout_peric0_nonbususer_p, PLL_CON0_MUX_CLKCMU_PERIC0_USI03_USI_USER,
+	     4, 1),
+	nMUX(CLK_MOUT_PERIC0_USI04_USI_USER, "mout_peric0_usi04_usi_user",
+	     mout_peric0_nonbususer_p, PLL_CON0_MUX_CLKCMU_PERIC0_USI04_USI_USER,
+	     4, 1),
+	nMUX(CLK_MOUT_PERIC0_USI05_USI_USER, "mout_peric0_usi05_usi_user",
+	     mout_peric0_nonbususer_p, PLL_CON0_MUX_CLKCMU_PERIC0_USI05_USI_USER,
+	     4, 1),
+	nMUX(CLK_MOUT_PERIC0_USI13_USI_USER, "mout_peric0_usi13_usi_user",
+	     mout_peric0_nonbususer_p, PLL_CON0_MUX_CLKCMU_PERIC0_USI13_USI_USER,
+	     4, 1),
+	nMUX(CLK_MOUT_PERIC0_USI14_USI_USER, "mout_peric0_usi14_usi_user",
+	     mout_peric0_nonbususer_p, PLL_CON0_MUX_CLKCMU_PERIC0_USI14_USI_USER,
+	     4, 1),
+	nMUX(CLK_MOUT_PERIC0_USI15_USI_USER, "mout_peric0_usi15_usi_user",
+	     mout_peric0_nonbususer_p, PLL_CON0_MUX_CLKCMU_PERIC0_USI15_USI_USER,
+	     4, 1),
 	MUX(CLK_MOUT_PERIC0_USI_I2C_USER, "mout_peric0_usi_i2c_user",
-	    mout_peric0_usi_i2c_user_p, PLL_CON0_MUX_CLKCMU_PERIC0_USI_I2C_USER,
+	    mout_peric0_nonbususer_p, PLL_CON0_MUX_CLKCMU_PERIC0_USI_I2C_USER,
 	    4, 1),
 };
 
@@ -1602,42 +1592,42 @@ static const struct samsung_div_clock peric0_div_clks[] __initconst = {
 	    "mout_peric0_uart_dbg",
 	    CLK_CON_DIV_DIV_CLK_PERIC0_UART_DBG,
 	    0, 4),
-	DIV(CLK_DOUT_PERIC0_USI00_USI, "dout_peric0_usi00_usi",
-	    "mout_peric0_usi00_usi_user",
-	    CLK_CON_DIV_DIV_CLK_PERIC0_USI00_USI,
-	    0, 4),
-	DIV(CLK_DOUT_PERIC0_USI01_USI, "dout_peric0_usi01_usi",
-	    "mout_peric0_usi01_usi_user",
-	    CLK_CON_DIV_DIV_CLK_PERIC0_USI01_USI,
-	    0, 4),
-	DIV(CLK_DOUT_PERIC0_USI02_USI, "dout_peric0_usi02_usi",
-	    "mout_peric0_usi02_usi_user",
-	    CLK_CON_DIV_DIV_CLK_PERIC0_USI02_USI,
-	    0, 4),
-	DIV(CLK_DOUT_PERIC0_USI03_USI, "dout_peric0_usi03_usi",
-	    "mout_peric0_usi03_usi_user",
-	    CLK_CON_DIV_DIV_CLK_PERIC0_USI03_USI,
-	    0, 4),
-	DIV(CLK_DOUT_PERIC0_USI04_USI, "dout_peric0_usi04_usi",
-	    "mout_peric0_usi04_usi_user",
-	    CLK_CON_DIV_DIV_CLK_PERIC0_USI04_USI,
-	    0, 4),
-	DIV(CLK_DOUT_PERIC0_USI05_USI, "dout_peric0_usi05_usi",
-	    "mout_peric0_usi05_usi_user",
-	    CLK_CON_DIV_DIV_CLK_PERIC0_USI05_USI,
-	    0, 4),
-	DIV(CLK_DOUT_PERIC0_USI13_USI, "dout_peric0_usi13_usi",
-	    "mout_peric0_usi13_usi_user",
-	    CLK_CON_DIV_DIV_CLK_PERIC0_USI13_USI,
-	    0, 4),
-	DIV(CLK_DOUT_PERIC0_USI14_USI, "dout_peric0_usi14_usi",
-	    "mout_peric0_usi14_usi_user",
-	    CLK_CON_DIV_DIV_CLK_PERIC0_USI14_USI,
-	    0, 4),
-	DIV(CLK_DOUT_PERIC0_USI15_USI, "dout_peric0_usi15_usi",
-	    "mout_peric0_usi15_usi_user",
-	    CLK_CON_DIV_DIV_CLK_PERIC0_USI15_USI,
-	    0, 4),
+	DIV_F(CLK_DOUT_PERIC0_USI00_USI, "dout_peric0_usi00_usi",
+	      "mout_peric0_usi00_usi_user",
+	      CLK_CON_DIV_DIV_CLK_PERIC0_USI00_USI, 0, 4,
+	      CLK_SET_RATE_PARENT, 0),
+	DIV_F(CLK_DOUT_PERIC0_USI01_USI, "dout_peric0_usi01_usi",
+	      "mout_peric0_usi01_usi_user",
+	      CLK_CON_DIV_DIV_CLK_PERIC0_USI01_USI, 0, 4,
+	      CLK_SET_RATE_PARENT, 0),
+	DIV_F(CLK_DOUT_PERIC0_USI02_USI, "dout_peric0_usi02_usi",
+	      "mout_peric0_usi02_usi_user",
+	      CLK_CON_DIV_DIV_CLK_PERIC0_USI02_USI, 0, 4,
+	      CLK_SET_RATE_PARENT, 0),
+	DIV_F(CLK_DOUT_PERIC0_USI03_USI, "dout_peric0_usi03_usi",
+	      "mout_peric0_usi03_usi_user",
+	      CLK_CON_DIV_DIV_CLK_PERIC0_USI03_USI, 0, 4,
+	      CLK_SET_RATE_PARENT, 0),
+	DIV_F(CLK_DOUT_PERIC0_USI04_USI, "dout_peric0_usi04_usi",
+	      "mout_peric0_usi04_usi_user",
+	      CLK_CON_DIV_DIV_CLK_PERIC0_USI04_USI, 0, 4,
+	      CLK_SET_RATE_PARENT, 0),
+	DIV_F(CLK_DOUT_PERIC0_USI05_USI, "dout_peric0_usi05_usi",
+	      "mout_peric0_usi05_usi_user",
+	      CLK_CON_DIV_DIV_CLK_PERIC0_USI05_USI, 0, 4,
+	      CLK_SET_RATE_PARENT, 0),
+	DIV_F(CLK_DOUT_PERIC0_USI13_USI, "dout_peric0_usi13_usi",
+	      "mout_peric0_usi13_usi_user",
+	      CLK_CON_DIV_DIV_CLK_PERIC0_USI13_USI, 0, 4,
+	      CLK_SET_RATE_PARENT, 0),
+	DIV_F(CLK_DOUT_PERIC0_USI14_USI, "dout_peric0_usi14_usi",
+	      "mout_peric0_usi14_usi_user",
+	      CLK_CON_DIV_DIV_CLK_PERIC0_USI14_USI, 0, 4,
+	      CLK_SET_RATE_PARENT, 0),
+	DIV_F(CLK_DOUT_PERIC0_USI15_USI, "dout_peric0_usi15_usi",
+	      "mout_peric0_usi15_usi_user",
+	      CLK_CON_DIV_DIV_CLK_PERIC0_USI15_USI, 0, 4,
+	      CLK_SET_RATE_PARENT, 0),
 	DIV(CLK_DOUT_PERIC0_USI_I2C, "dout_peric0_usi_i2c",
 	    "mout_peric0_usi_i2c_user",
 	    CLK_CON_DIV_DIV_CLK_PERIC0_USI_I2C,
@@ -2107,58 +2097,47 @@ static const unsigned long peric1_clk_regs[] __initconst = {
 
 /* Parent clock list for CMU_PERIC1 muxes */
 PNAME(mout_peric1_bus_user_p)  = { "oscclk", "dout_cmu_peric1_bus" };
-PNAME(mout_peric1_uart_bt_user_p) = { "oscclk", "dout_cmu_peric1_ip" };
-PNAME(mout_peric1_usi06_user_p)  = { "oscclk", "dout_cmu_peric1_ip" };
-PNAME(mout_peric1_usi07_user_p)  = { "oscclk", "dout_cmu_peric1_ip" };
-PNAME(mout_peric1_usi08_user_p)  = { "oscclk", "dout_cmu_peric1_ip" };
-PNAME(mout_peric1_usi09_user_p)  = { "oscclk", "dout_cmu_peric1_ip" };
-PNAME(mout_peric1_usi10_user_p)  = { "oscclk", "dout_cmu_peric1_ip" };
-PNAME(mout_peric1_usi11_user_p)  = { "oscclk", "dout_cmu_peric1_ip" };
-PNAME(mout_peric1_usi12_user_p)  = { "oscclk", "dout_cmu_peric1_ip" };
-PNAME(mout_peric1_usi18_user_p)  = { "oscclk", "dout_cmu_peric1_ip" };
-PNAME(mout_peric1_usi16_user_p)  = { "oscclk", "dout_cmu_peric1_ip" };
-PNAME(mout_peric1_usi17_user_p)  = { "oscclk", "dout_cmu_peric1_ip" };
-PNAME(mout_peric1_usi_i2c_user_p) = { "oscclk", "dout_cmu_peric1_ip" };
+PNAME(mout_peric1_nonbususer_p) = { "oscclk", "dout_cmu_peric1_ip" };
 
 static const struct samsung_mux_clock peric1_mux_clks[] __initconst = {
 	MUX(CLK_MOUT_PERIC1_BUS_USER, "mout_peric1_bus_user",
 	    mout_peric1_bus_user_p, PLL_CON0_MUX_CLKCMU_PERIC1_BUS_USER,
 	    4, 1),
-	MUX(CLK_MOUT_PERIC1_UART_BT_USER, "mout_peric1_uart_bt_user",
-	    mout_peric1_uart_bt_user_p, PLL_CON0_MUX_CLKCMU_PERIC1_UART_BT_USER,
-	    4, 1),
-	MUX(CLK_MOUT_PERIC1_USI06_USI_USER, "mout_peric1_usi06_usi_user",
-	    mout_peric1_usi06_user_p, PLL_CON0_MUX_CLKCMU_PERIC1_USI06_USI_USER,
-	    4, 1),
-	MUX(CLK_MOUT_PERIC1_USI07_USI_USER, "mout_peric1_usi07_usi_user",
-	    mout_peric1_usi07_user_p, PLL_CON0_MUX_CLKCMU_PERIC1_USI07_USI_USER,
-	    4, 1),
-	MUX(CLK_MOUT_PERIC1_USI08_USI_USER, "mout_peric1_usi08_usi_user",
-	    mout_peric1_usi08_user_p, PLL_CON0_MUX_CLKCMU_PERIC1_USI08_USI_USER,
-	    4, 1),
-	MUX(CLK_MOUT_PERIC1_USI09_USI_USER, "mout_peric1_usi09_usi_user",
-	    mout_peric1_usi09_user_p, PLL_CON0_MUX_CLKCMU_PERIC1_USI09_USI_USER,
-	    4, 1),
-	MUX(CLK_MOUT_PERIC1_USI10_USI_USER, "mout_peric1_usi10_usi_user",
-	    mout_peric1_usi10_user_p, PLL_CON0_MUX_CLKCMU_PERIC1_USI10_USI_USER,
-	    4, 1),
-	MUX(CLK_MOUT_PERIC1_USI11_USI_USER, "mout_peric1_usi11_usi_user",
-	    mout_peric1_usi11_user_p, PLL_CON0_MUX_CLKCMU_PERIC1_USI11_USI_USER,
-	    4, 1),
-	MUX(CLK_MOUT_PERIC1_USI12_USI_USER, "mout_peric1_usi12_usi_user",
-	    mout_peric1_usi12_user_p, PLL_CON0_MUX_CLKCMU_PERIC1_USI12_USI_USER,
-	    4, 1),
-	MUX(CLK_MOUT_PERIC1_USI18_USI_USER, "mout_peric1_usi18_usi_user",
-	    mout_peric1_usi18_user_p, PLL_CON0_MUX_CLKCMU_PERIC1_USI18_USI_USER,
-	    4, 1),
-	MUX(CLK_MOUT_PERIC1_USI16_USI_USER, "mout_peric1_usi16_usi_user",
-	    mout_peric1_usi16_user_p, PLL_CON0_MUX_CLKCMU_PERIC1_USI16_USI_USER,
-	    4, 1),
-	MUX(CLK_MOUT_PERIC1_USI17_USI_USER, "mout_peric1_usi17_usi_user",
-	    mout_peric1_usi17_user_p, PLL_CON0_MUX_CLKCMU_PERIC1_USI17_USI_USER,
-	    4, 1),
+	nMUX(CLK_MOUT_PERIC1_UART_BT_USER, "mout_peric1_uart_bt_user",
+	     mout_peric1_nonbususer_p, PLL_CON0_MUX_CLKCMU_PERIC1_UART_BT_USER,
+	     4, 1),
+	nMUX(CLK_MOUT_PERIC1_USI06_USI_USER, "mout_peric1_usi06_usi_user",
+	     mout_peric1_nonbususer_p, PLL_CON0_MUX_CLKCMU_PERIC1_USI06_USI_USER,
+	     4, 1),
+	nMUX(CLK_MOUT_PERIC1_USI07_USI_USER, "mout_peric1_usi07_usi_user",
+	     mout_peric1_nonbususer_p, PLL_CON0_MUX_CLKCMU_PERIC1_USI07_USI_USER,
+	     4, 1),
+	nMUX(CLK_MOUT_PERIC1_USI08_USI_USER, "mout_peric1_usi08_usi_user",
+	     mout_peric1_nonbususer_p, PLL_CON0_MUX_CLKCMU_PERIC1_USI08_USI_USER,
+	     4, 1),
+	nMUX(CLK_MOUT_PERIC1_USI09_USI_USER, "mout_peric1_usi09_usi_user",
+	     mout_peric1_nonbususer_p, PLL_CON0_MUX_CLKCMU_PERIC1_USI09_USI_USER,
+	     4, 1),
+	nMUX(CLK_MOUT_PERIC1_USI10_USI_USER, "mout_peric1_usi10_usi_user",
+	     mout_peric1_nonbususer_p, PLL_CON0_MUX_CLKCMU_PERIC1_USI10_USI_USER,
+	     4, 1),
+	nMUX(CLK_MOUT_PERIC1_USI11_USI_USER, "mout_peric1_usi11_usi_user",
+	     mout_peric1_nonbususer_p, PLL_CON0_MUX_CLKCMU_PERIC1_USI11_USI_USER,
+	     4, 1),
+	nMUX(CLK_MOUT_PERIC1_USI12_USI_USER, "mout_peric1_usi12_usi_user",
+	     mout_peric1_nonbususer_p, PLL_CON0_MUX_CLKCMU_PERIC1_USI12_USI_USER,
+	     4, 1),
+	nMUX(CLK_MOUT_PERIC1_USI18_USI_USER, "mout_peric1_usi18_usi_user",
+	     mout_peric1_nonbususer_p, PLL_CON0_MUX_CLKCMU_PERIC1_USI18_USI_USER,
+	     4, 1),
+	nMUX(CLK_MOUT_PERIC1_USI16_USI_USER, "mout_peric1_usi16_usi_user",
+	     mout_peric1_nonbususer_p, PLL_CON0_MUX_CLKCMU_PERIC1_USI16_USI_USER,
+	     4, 1),
+	nMUX(CLK_MOUT_PERIC1_USI17_USI_USER, "mout_peric1_usi17_usi_user",
+	     mout_peric1_nonbususer_p, PLL_CON0_MUX_CLKCMU_PERIC1_USI17_USI_USER,
+	     4, 1),
 	MUX(CLK_MOUT_PERIC1_USI_I2C_USER, "mout_peric1_usi_i2c_user",
-	    mout_peric1_usi_i2c_user_p, PLL_CON0_MUX_CLKCMU_PERIC1_USI_I2C_USER,
+	    mout_peric1_nonbususer_p, PLL_CON0_MUX_CLKCMU_PERIC1_USI_I2C_USER,
 	    4, 1),
 };
 
@@ -2167,46 +2146,46 @@ static const struct samsung_div_clock peric1_div_clks[] __initconst = {
 	    "mout_peric1_uart_bt_user",
 	    CLK_CON_DIV_DIV_CLK_PERIC1_UART_BT,
 	    0, 4),
-	DIV(CLK_DOUT_PERIC1_USI06_USI, "dout_peric1_usi06_usi",
-	    "mout_peric1_usi06_usi_user",
-	    CLK_CON_DIV_DIV_CLK_PERIC1_USI06_USI,
-	    0, 4),
-	DIV(CLK_DOUT_PERIC1_USI07_USI, "dout_peric1_usi07_usi",
-	    "mout_peric1_usi07_usi_user",
-	    CLK_CON_DIV_DIV_CLK_PERIC1_USI07_USI,
-	    0, 4),
-	DIV(CLK_DOUT_PERIC1_USI08_USI, "dout_peric1_usi08_usi",
-	    "mout_peric1_usi08_usi_user",
-	    CLK_CON_DIV_DIV_CLK_PERIC1_USI08_USI,
-	    0, 4),
-	DIV(CLK_DOUT_PERIC1_USI18_USI, "dout_peric1_usi18_usi",
-	    "mout_peric1_usi18_usi_user",
-	    CLK_CON_DIV_DIV_CLK_PERIC1_USI18_USI,
-	    0, 4),
-	DIV(CLK_DOUT_PERIC1_USI12_USI, "dout_peric1_usi12_usi",
-	    "mout_peric1_usi12_usi_user",
-	    CLK_CON_DIV_DIV_CLK_PERIC1_USI12_USI,
-	    0, 4),
-	DIV(CLK_DOUT_PERIC1_USI09_USI, "dout_peric1_usi09_usi",
-	    "mout_peric1_usi09_usi_user",
-	    CLK_CON_DIV_DIV_CLK_PERIC1_USI09_USI,
-	    0, 4),
-	DIV(CLK_DOUT_PERIC1_USI10_USI, "dout_peric1_usi10_usi",
-	    "mout_peric1_usi10_usi_user",
-	    CLK_CON_DIV_DIV_CLK_PERIC1_USI10_USI,
-	    0, 4),
-	DIV(CLK_DOUT_PERIC1_USI11_USI, "dout_peric1_usi11_usi",
-	    "mout_peric1_usi11_usi_user",
-	    CLK_CON_DIV_DIV_CLK_PERIC1_USI11_USI,
-	    0, 4),
-	DIV(CLK_DOUT_PERIC1_USI16_USI, "dout_peric1_usi16_usi",
-	    "mout_peric1_usi16_usi_user",
-	    CLK_CON_DIV_DIV_CLK_PERIC1_USI16_USI,
-	    0, 4),
-	DIV(CLK_DOUT_PERIC1_USI17_USI, "dout_peric1_usi17_usi",
-	    "mout_peric1_usi17_usi_user",
-	    CLK_CON_DIV_DIV_CLK_PERIC1_USI17_USI,
-	    0, 4),
+	DIV_F(CLK_DOUT_PERIC1_USI06_USI, "dout_peric1_usi06_usi",
+	      "mout_peric1_usi06_usi_user",
+	      CLK_CON_DIV_DIV_CLK_PERIC1_USI06_USI, 0, 4,
+	      CLK_SET_RATE_PARENT, 0),
+	DIV_F(CLK_DOUT_PERIC1_USI07_USI, "dout_peric1_usi07_usi",
+	      "mout_peric1_usi07_usi_user",
+	      CLK_CON_DIV_DIV_CLK_PERIC1_USI07_USI, 0, 4,
+	      CLK_SET_RATE_PARENT, 0),
+	DIV_F(CLK_DOUT_PERIC1_USI08_USI, "dout_peric1_usi08_usi",
+	      "mout_peric1_usi08_usi_user",
+	      CLK_CON_DIV_DIV_CLK_PERIC1_USI08_USI, 0, 4,
+	      CLK_SET_RATE_PARENT, 0),
+	DIV_F(CLK_DOUT_PERIC1_USI18_USI, "dout_peric1_usi18_usi",
+	      "mout_peric1_usi18_usi_user",
+	      CLK_CON_DIV_DIV_CLK_PERIC1_USI18_USI, 0, 4,
+	      CLK_SET_RATE_PARENT, 0),
+	DIV_F(CLK_DOUT_PERIC1_USI12_USI, "dout_peric1_usi12_usi",
+	      "mout_peric1_usi12_usi_user",
+	      CLK_CON_DIV_DIV_CLK_PERIC1_USI12_USI, 0, 4,
+	      CLK_SET_RATE_PARENT, 0),
+	DIV_F(CLK_DOUT_PERIC1_USI09_USI, "dout_peric1_usi09_usi",
+	      "mout_peric1_usi09_usi_user",
+	      CLK_CON_DIV_DIV_CLK_PERIC1_USI09_USI, 0, 4,
+	      CLK_SET_RATE_PARENT, 0),
+	DIV_F(CLK_DOUT_PERIC1_USI10_USI, "dout_peric1_usi10_usi",
+	      "mout_peric1_usi10_usi_user",
+	      CLK_CON_DIV_DIV_CLK_PERIC1_USI10_USI, 0, 4,
+	      CLK_SET_RATE_PARENT, 0),
+	DIV_F(CLK_DOUT_PERIC1_USI11_USI, "dout_peric1_usi11_usi",
+	      "mout_peric1_usi11_usi_user",
+	      CLK_CON_DIV_DIV_CLK_PERIC1_USI11_USI, 0, 4,
+	      CLK_SET_RATE_PARENT, 0),
+	DIV_F(CLK_DOUT_PERIC1_USI16_USI, "dout_peric1_usi16_usi",
+	      "mout_peric1_usi16_usi_user",
+	      CLK_CON_DIV_DIV_CLK_PERIC1_USI16_USI, 0, 4,
+	      CLK_SET_RATE_PARENT, 0),
+	DIV_F(CLK_DOUT_PERIC1_USI17_USI, "dout_peric1_usi17_usi",
+	      "mout_peric1_usi17_usi_user",
+	      CLK_CON_DIV_DIV_CLK_PERIC1_USI17_USI, 0, 4,
+	      CLK_SET_RATE_PARENT, 0),
 	DIV(CLK_DOUT_PERIC1_USI_I2C, "dout_peric1_usi_i2c",
 	    "mout_peric1_usi_i2c_user",
 	    CLK_CON_DIV_DIV_CLK_PERIC1_USI_I2C,

---
base-commit: e7d700e14934e68f86338c5610cf2ae76798b663
change-id: 20260528-perics-usi-65a7fe26b00a

Best regards,
--  
Denzeel Oliva <wachiturroxd150@gmail.com>

