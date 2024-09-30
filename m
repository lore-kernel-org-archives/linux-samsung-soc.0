Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892EE18E35E
	for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Sep 2024 12:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727698739; cv=none; b=VpcznFeWV4tRFyRZvfoMCOLouu8M6qBta6gitjGNyyMc8hgglgUOD3FpDt7xeVFb6bSScFCAltRCqw8Y9RFIw3eZ7CH7jsXz1ZtRSIl4wuvd0nY2hy05rKrOm7KWWMsg4Xp/hBw3sGPSsDGq9dMWDSw4ajQIRHCO8vdsGGrOWY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727698739; c=relaxed/simple;
	bh=05PjTarHxnFz3Ixe7535iOPjuMf20/Kc0QLUDTeNMP0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:Content-Type:
	 References; b=SzckdSEalNbHsuWg4Sv79XHEcsFZ8OY/TwoPeQbgSnK7eLuBXwVRrM5vMxH5DLb8L4ZaEbtVwMgEUFROC5Y4tRyFPEZMVgHr8n7DDbYc7tOrUUNPm3AdB1Ah3XEUg4Gy0V97iAvLRPTIHlCS44agfXy45zTGm06S/61wb1JdU/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=CA807w3m; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="CA807w3m"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20240930121855epoutp0181742aebc1d8f82548cddfd7f53d0a15~6BNiqX_OH1253612536epoutp01N
	for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Sep 2024 12:18:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20240930121855epoutp0181742aebc1d8f82548cddfd7f53d0a15~6BNiqX_OH1253612536epoutp01N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1727698735;
	bh=ixpivVW6ciCnqiI/F6bcTVErvzJsjDQnUionb9IpKKw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CA807w3mQNWJyTO88RZu/le9b53k/ExvFo24vOZNyH5L8Sd4H1kTX2mZdJGZr4BCL
	 wdJwbD9xRdeA37riDDwedwhE/U7Bitf/MTqP7kQuoB8ZvM9auWDE9W4pM4DCSjFWBV
	 0FML+ywsnPUo4xOvFJ++d0sLcJWkqTwy4pvs7bao=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTP id
	20240930121854epcas5p2a2db00eca4584833110275cf1b1c3e73~6BNhp7zf82640326403epcas5p20;
	Mon, 30 Sep 2024 12:18:54 +0000 (GMT)
Received: from epsmges5p2new.samsung.com (unknown [182.195.38.182]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4XHKqc5SYkz4x9Pw; Mon, 30 Sep
	2024 12:18:52 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
	epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	FE.AE.09770.C279AF66; Mon, 30 Sep 2024 21:18:52 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20240930112131epcas5p1babeb8b867f8e4e0ec82a496c3d41aa9~6Aba-_XVT0399403994epcas5p13;
	Mon, 30 Sep 2024 11:21:31 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240930112131epsmtrp24494fe7fc3217fb57e1c509caf25d7f9~6Aba-RdGv0864708647epsmtrp2c;
	Mon, 30 Sep 2024 11:21:31 +0000 (GMT)
X-AuditID: b6c32a4a-e25fa7000000262a-81-66fa972c4a22
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	BB.F7.18937.BB98AF66; Mon, 30 Sep 2024 20:21:31 +0900 (KST)
Received: from cheetah.sa.corp.samsungelectronics.net (unknown
	[107.109.115.53]) by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20240930112129epsmtip209d3283343a8192e636c1ec35bcd3023~6AbZD6Rfk3088230882epsmtip2E;
	Mon, 30 Sep 2024 11:21:29 +0000 (GMT)
From: Varada Pavani <v.pavani@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: aswani.reddy@samsung.com, pankaj.dubey@samsung.com,
	gost.dev@samsung.com, Varada Pavani <v.pavani@samsung.com>
Subject: [PATCH 1/2] clk: samsung: Use samsung CCF common function
Date: Mon, 30 Sep 2024 16:48:58 +0530
Message-Id: <20240930111859.22264-2-v.pavani@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240930111859.22264-1-v.pavani@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpkk+LIzCtJLcpLzFFi42LZdlhTS1dn+q80g5frNSwezNvGZnFo81Z2
	i+tfnrNa3Dywk8ni/PkN7BabHl9jtfjYc4/V4vKuOWwWM87vY7K4eMrVYtHWL+wWh9+0s1r8
	u7aRxWJD7yt2Bz6P9zda2T02repk89i8pN6jb8sqRo/Pm+QCWKOybTJSE1NSixRS85LzUzLz
	0m2VvIPjneNNzQwMdQ0tLcyVFPISc1NtlVx8AnTdMnOA7lRSKEvMKQUKBSQWFyvp29kU5ZeW
	pCpk5BeX2CqlFqTkFJgU6BUn5haX5qXr5aWWWBkaGBiZAhUmZGd8Xf6GveC4csWiRwoNjP3y
	XYycHBICJhK3n+5h6WLk4hAS2M0ocfXJbCjnE6PExZ2/GOGcSy862WBaDr+5zgSR2MkosX7O
	MqiqViaJgyfWsYBUsQloSayeupwVJCEi0MckcffEBCaQBLNAicT/T69ZQWxhASeJc4d7GEFs
	FgFVif2TvoDFeQUsJXb/WcwCsU5eYvWGA8wgNqeAlcSlOX/YQYZKCHxll9h+ZS8TRJGLxJJ5
	c1ghbGGJV8e3sEPYUhKf3+0FupsDyE6WaP/EDRHOkbi0exVUq73EgStzWEBKmAU0Jdbv0ocI
	y0pMPbUO6mQ+id7fT6DKeSV2zIOxlSR27pgAZUtIPF29BhpCHhIze9rYIYHSyygx6+BC5gmM
	crMQVixgZFzFKJlaUJybnlpsWmCUl1oOj7Xk/NxNjOC0qOW1g/Hhgw96hxiZOBgPMUpwMCuJ
	8N479DNNiDclsbIqtSg/vqg0J7X4EKMpMPwmMkuJJucDE3NeSbyhiaWBiZmZmYmlsZmhkjjv
	69a5KUIC6YklqdmpqQWpRTB9TBycUg1MMtdX+y+1yDIUD756oMqxOo1lZvrXzkq/1p32QqEi
	n9gjDN+kzz9whTelZ+neJ2//8JxoeTTDa7ZI2q+eJ48OXS3p2Pvm3BqXq+7bmF3vKPZc6Pad
	HX+F5ZT0qvTV595e406VvHk1bf3VBzoVmz2+bOV2qNFuyd9vlH5TXaXm8L0ry17ePv/t4nox
	gbT+z3XWnkvE3obsy3qYx3x8lfyan9t5l/wVKQyZfthPSO1y3ftoZa5Dwg+3737mNmVz7ZL5
	9+IfXP48+dpxt5iJNe9EIz6VcrRGLylefbMpf2GB+bXDFbMW/Ys6UeMi6vxX7YmZv37P++Ka
	bJs2D7EVszm+3D8ewfb704z9G7cue73Wao4SS3FGoqEWc1FxIgDeQmrqFAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrELMWRmVeSWpSXmKPExsWy7bCSvO7uzl9pBvO2Cls8mLeNzeLQ5q3s
	Fte/PGe1uHlgJ5PF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxaKtX9gtDr9pZ7X4
	d20ji8WG3lfsDnwe72+0sntsWtXJ5rF5Sb1H35ZVjB6fN8kFsEZx2aSk5mSWpRbp2yVwZXxd
	/oa94LhyxaJHCg2M/fJdjJwcEgImEoffXGfqYuTiEBLYzijxZVsrE0RCQmLnt1ZmCFtYYuW/
	5+wQRc1MEnsm3QdLsAloSayeupwVJCEiMItJYu6SDyxdjBwczAIVEnP+G4PUCAs4SZw73MMI
	YrMIqErsn/SFFcTmFbCU2P1nMQvEAnmJ1RsOgM3kFLCSuDTnDzvIGCGgmpsvsyYw8i1gZFjF
	KJpaUJybnptcYKhXnJhbXJqXrpecn7uJERysWkE7GJet/6t3iJGJg/EQowQHs5II771DP9OE
	eFMSK6tSi/Lji0pzUosPMUpzsCiJ8yrndKYICaQnlqRmp6YWpBbBZJk4OKUamNojz8RkvDqk
	6rrh8oQuq/9fVzP+kdi8ayan/rl5rh9m8MtzaudUGm+dujd/yYslHd8OnLZW2vrRhJl5TdBs
	tlvr3nMfEchZ1Gxxe+E3c52gc/7WrnFu8d/edfaaOlw8q7ExSff9pZ3G4RYnZ7ssWOWkdSjs
	h/4LvqcvVaPShObLF7p+8TWxjM765rPIembKheA7rF05t1Jk7izIWyPeNu14TNYM/X7VxdWS
	js9vikqz3VXMVGMq+nHaptRAueqtXkHp6WuavQ+m3Ft46Vff518enuv87QxCXedbf2wLMD3q
	L/BVtUNx86vJMrxBGqmG5aukFK8eZtju3JnrsET67/3I2152ov3qsgvze4/3KrEUZyQaajEX
	FScCAMQ3Z3zFAgAA
X-CMS-MailID: 20240930112131epcas5p1babeb8b867f8e4e0ec82a496c3d41aa9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240930112131epcas5p1babeb8b867f8e4e0ec82a496c3d41aa9
References: <20240930111859.22264-1-v.pavani@samsung.com>
	<CGME20240930112131epcas5p1babeb8b867f8e4e0ec82a496c3d41aa9@epcas5p1.samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>

Use samsung CCF function which registers multiple clock providers using
single function call samsung_cmu_register_clocks().

Signed-off-by: Varada Pavani <v.pavani@samsung.com>
---
 drivers/clk/samsung/clk-exynos4.c | 78 +++++++++++++++++--------------
 1 file changed, 44 insertions(+), 34 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
index 28945b6b0ee1..31cb85330549 100644
--- a/drivers/clk/samsung/clk-exynos4.c
+++ b/drivers/clk/samsung/clk-exynos4.c
@@ -1269,6 +1269,45 @@ static const struct samsung_cpu_clock exynos4412_cpu_clks[] __initconst = {
 		CPUCLK_LAYOUT_E4210, e4412_armclk_d),
 };
 
+static const struct samsung_cmu_info cmu_info_exynos4 __initconst = {
+	.mux_clks		= exynos4_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(exynos4_mux_clks),
+	.div_clks		= exynos4_div_clks,
+	.nr_div_clks		= ARRAY_SIZE(exynos4_div_clks),
+	.gate_clks		= exynos4_gate_clks,
+	.nr_gate_clks		= ARRAY_SIZE(exynos4_gate_clks),
+	.fixed_factor_clks	= exynos4_fixed_factor_clks,
+	.nr_fixed_factor_clks	= ARRAY_SIZE(exynos4_fixed_factor_clks),
+	.fixed_clks	= exynos4_fixed_rate_clks,
+	.nr_fixed_clks	= ARRAY_SIZE(exynos4_fixed_rate_clks),
+};
+
+static const struct samsung_cmu_info cmu_info_exynos4210 __initconst = {
+	.mux_clks		= exynos4210_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(exynos4210_mux_clks),
+	.div_clks		= exynos4210_div_clks,
+	.nr_div_clks		= ARRAY_SIZE(exynos4210_div_clks),
+	.gate_clks		= exynos4210_gate_clks,
+	.nr_gate_clks		= ARRAY_SIZE(exynos4210_gate_clks),
+	.fixed_factor_clks	= exynos4210_fixed_factor_clks,
+	.nr_fixed_factor_clks	= ARRAY_SIZE(exynos4210_fixed_factor_clks),
+	.fixed_clks	= exynos4210_fixed_rate_clks,
+	.nr_fixed_clks	= ARRAY_SIZE(exynos4210_fixed_rate_clks),
+	.cpu_clks		= exynos4210_cpu_clks,
+	.nr_cpu_clks		= ARRAY_SIZE(exynos4210_cpu_clks),
+};
+
+static const struct samsung_cmu_info cmu_info_exynos4x12 __initconst = {
+	.mux_clks		= exynos4x12_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(exynos4x12_mux_clks),
+	.div_clks		= exynos4x12_div_clks,
+	.nr_div_clks		= ARRAY_SIZE(exynos4x12_div_clks),
+	.gate_clks		= exynos4x12_gate_clks,
+	.nr_gate_clks		= ARRAY_SIZE(exynos4x12_gate_clks),
+	.fixed_factor_clks	= exynos4x12_fixed_factor_clks,
+	.nr_fixed_factor_clks	= ARRAY_SIZE(exynos4x12_fixed_factor_clks),
+};
+
 /* register exynos4 clocks */
 static void __init exynos4_clk_init(struct device_node *np,
 				    enum exynos4_soc soc)
@@ -1322,41 +1361,12 @@ static void __init exynos4_clk_init(struct device_node *np,
 					ARRAY_SIZE(exynos4x12_plls));
 	}
 
-	samsung_clk_register_fixed_rate(ctx, exynos4_fixed_rate_clks,
-			ARRAY_SIZE(exynos4_fixed_rate_clks));
-	samsung_clk_register_mux(ctx, exynos4_mux_clks,
-			ARRAY_SIZE(exynos4_mux_clks));
-	samsung_clk_register_div(ctx, exynos4_div_clks,
-			ARRAY_SIZE(exynos4_div_clks));
-	samsung_clk_register_gate(ctx, exynos4_gate_clks,
-			ARRAY_SIZE(exynos4_gate_clks));
-	samsung_clk_register_fixed_factor(ctx, exynos4_fixed_factor_clks,
-			ARRAY_SIZE(exynos4_fixed_factor_clks));
+	samsung_cmu_register_clocks(ctx, &cmu_info_exynos4);
 
-	if (exynos4_soc == EXYNOS4210) {
-		samsung_clk_register_fixed_rate(ctx, exynos4210_fixed_rate_clks,
-			ARRAY_SIZE(exynos4210_fixed_rate_clks));
-		samsung_clk_register_mux(ctx, exynos4210_mux_clks,
-			ARRAY_SIZE(exynos4210_mux_clks));
-		samsung_clk_register_div(ctx, exynos4210_div_clks,
-			ARRAY_SIZE(exynos4210_div_clks));
-		samsung_clk_register_gate(ctx, exynos4210_gate_clks,
-			ARRAY_SIZE(exynos4210_gate_clks));
-		samsung_clk_register_fixed_factor(ctx,
-			exynos4210_fixed_factor_clks,
-			ARRAY_SIZE(exynos4210_fixed_factor_clks));
-		samsung_clk_register_cpu(ctx, exynos4210_cpu_clks,
-				ARRAY_SIZE(exynos4210_cpu_clks));
-	} else {
-		samsung_clk_register_mux(ctx, exynos4x12_mux_clks,
-			ARRAY_SIZE(exynos4x12_mux_clks));
-		samsung_clk_register_div(ctx, exynos4x12_div_clks,
-			ARRAY_SIZE(exynos4x12_div_clks));
-		samsung_clk_register_gate(ctx, exynos4x12_gate_clks,
-			ARRAY_SIZE(exynos4x12_gate_clks));
-		samsung_clk_register_fixed_factor(ctx,
-			exynos4x12_fixed_factor_clks,
-			ARRAY_SIZE(exynos4x12_fixed_factor_clks));
+	if (exynos4_soc == EXYNOS4210)
+		samsung_cmu_register_clocks(ctx, &cmu_info_exynos4210);
+	else {
+		samsung_cmu_register_clocks(ctx, &cmu_info_exynos4x12);
 		if (soc == EXYNOS4412)
 			samsung_clk_register_cpu(ctx, exynos4412_cpu_clks,
 					ARRAY_SIZE(exynos4412_cpu_clks));
-- 
2.17.1

