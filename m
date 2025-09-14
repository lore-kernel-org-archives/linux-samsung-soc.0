Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11A32620E4
	for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Sep 2025 12:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757852487; cv=none; b=mkG6xWCyxAqZY7UKYHMytEASlnRFQ3qOBEeE2hXaczRKjdhh4NtQArHanVAiAKLPMPvGanDOSYa4rpDmuyZ6KbvkR87+M4GDJFRFfJ6pRTsNkpAlEDXozX2JS1p9poqNGwBq48J1/uVY4xDjef/wn/5kKoRJKdGnEZGfQX5dIrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757852487; c=relaxed/simple;
	bh=+ARkTTfgYAV8lq+cpguXWwMOib8tysz+VwmQ4xeFl5g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dljHkX2XsYZaXqQ0IAvh0fZk41TDvcXAPefAKS36uft058U+yzK/FyhVD2UbmNac7Th7Qyaq6MdnKFGsQSzVVzUXgWkqRuUgSji+JzQpzdTeSSKQ7DwKDIp1tKA2rAb/uXwQVcSkS1rwvqv5f5HpjgnwoAzEpO8M5SB1j/BkKxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X8i2fInP; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X8i2fInP"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3e7636aa65fso2706227f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Sep 2025 05:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757852483; x=1758457283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/o/CmP3Rg70MppvTZL3UgHlhdGprRSi/0bRMfCqA7ss=;
        b=X8i2fInPVWgbF0VhpKD2Soj5sBQbSsjvijxy4gGKB7pMm+u8ZdYr2AfX2kfAUk8aG5
         qerugikVWvZeSNAsnkvLFjs4jgiXCAJ71r/BVreVhEQ3ekh9zQGjBXF92hcj1/aOAiM+
         uZMrZ67J8D5Ikjt3mTekzAn+QqzvVnk0bdPUi6hX1alDH/hjwRpaC7qDg11sYDTc7Vza
         6psuANFgw94UyPCJ/jAACE3drmqcqsvz1SPWB4Z5yM7gwyfx0JSIl0i/KMIk1n/H/1mc
         ByMeA0n4F3VnzvaqVizYvxpOrllWF/Z3eh8lYKDZFEMLG8/hnY4kGJV1V3TwEKDdeuhT
         m1IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757852483; x=1758457283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/o/CmP3Rg70MppvTZL3UgHlhdGprRSi/0bRMfCqA7ss=;
        b=BnZvuMky5eOW5EaPMKoEIWABC7C8Zv/HL9X+SjXhoy+h8qGPf9XD9l1ALbYG5QZaqg
         XGgwAqcS9FlPb+t9aOhonyXXJZCExVEZV3pGVlARJnJAsJs8QCMvHA5Av2ztx0x9Q/na
         reqzdoTLLfzzadTDR68cVtN1ycxqDez9+lIkxdeuYxMoj8CnDy+ixduXc/iF8Ez0NhzF
         QBe07Xkv3d0I7NKROli1r97ErCtzqRDDD/DMTITl2Nu3FV/ela7a2cvmFc6t0kFw6fpl
         +88m4q3ASw+MD0LoGT3X8kz8ATkm/znCPq6quBsoDXrd8QZioutH3V9vi2/P172HkR1c
         LFYw==
X-Gm-Message-State: AOJu0YxhjgJGitCGFzkgxpo5EQsi70cnfwqgIdH3pieWla3oXCN6pZcN
	lTh9dNs4eiVmx4cpIKC2nRB/3snRMF7hOXehL7thfhdtMJZpIG0tl0op
X-Gm-Gg: ASbGncvEFu5OIxvHaYQceQ/z389e1jUFEePBz1bGpdB0G+GkDj8zyX6Gpk0y0aUeEbz
	+v5AvXBqNQzOhE90wKQmRR0pBCkkb3Hs/JB+beGMErH/OBKHLqfiYiH2w4ECJ8I4EobqN8yAbku
	XoWsyM9AQEOnZzALi36cUjV/38YmJ2bRiAMw8bMJMlsA89GXuU+xvPRfRCvNKe4AY0rtSJKomzs
	POc7QH8kLQ6uWRlyDgEIH+KxjeekHm5stRDFy5J63sU3HuSUsYHfUwFx6TyheaLtdkc9TxDySst
	9Kk7hhgmnQ2CXH8m6jzYMv5D8k38hDDI+BTK+2UbXNnnFDy7MQuuEWJTFVhkZCd3l8p9aF2WIfF
	1aY5s/i2wi7TS/6dA7VMUIEN3vY8Y+T40LA4m54bOdEWNuzjrIm5e9zsWhXmuAwKEk6//oWgdns
	ZNt0NM8Vx8
X-Google-Smtp-Source: AGHT+IF65054uWgaEnZnjo3739WPkXpFwENVCRBSnh2RLQhMQq0qfIAS99sWpws28e4M/hCiCQUjLQ==
X-Received: by 2002:a05:6000:178c:b0:3e7:63dc:1ff6 with SMTP id ffacd0b85a97d-3e7658bc908mr6223136f8f.8.1757852482965;
        Sun, 14 Sep 2025 05:21:22 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e017b4222sm136476615e9.20.2025.09.14.05.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 05:21:22 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/5] clk: samsung: clk-pll: Add support for pll_1419x
Date: Sun, 14 Sep 2025 15:21:14 +0300
Message-ID: <20250914122116.2616801-4-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250914122116.2616801-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250914122116.2616801-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PLL is similar to pll_35xx, with the following differences:
- different locktime - 150 instead of 270, as with pll_142xx
- different rate calculation

When defining a PLL, the "con" parameter should be set to CON0
register, like this:

PLL(pll_1419x, CLK_FOUT_SHARED0_PLL, "fout_shared0_pll", "oscclk",
    PLL_LOCKTIME_PLL_SHARED0, PLL_CON0_PLL_SHARED0,
    pll_shared0_rate_table),

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 drivers/clk/samsung/clk-pll.c | 10 ++++++++--
 drivers/clk/samsung/clk-pll.h | 10 ++++++++++
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index acb366f14..6b3593445 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -229,7 +229,11 @@ static unsigned long samsung_pll35xx_recalc_rate(struct clk_hw *hw,
 	pdiv = (pll_con >> PLL35XX_PDIV_SHIFT) & PLL35XX_PDIV_MASK;
 	sdiv = (pll_con >> PLL35XX_SDIV_SHIFT) & PLL35XX_SDIV_MASK;
 
-	fvco *= mdiv;
+	if (pll->type == pll_1419x)
+		fvco *= (2 * mdiv);
+	else
+		fvco *= mdiv;
+
 	do_div(fvco, (pdiv << sdiv));
 
 	return (unsigned long)fvco;
@@ -273,7 +277,8 @@ static int samsung_pll35xx_set_rate(struct clk_hw *hw, unsigned long drate,
 	}
 
 	/* Set PLL lock time. */
-	if (pll->type == pll_142xx || pll->type == pll_141xx)
+	if (pll->type == pll_142xx || pll->type == pll_141xx ||
+	    pll->type == pll_1419x)
 		writel_relaxed(rate->pdiv * PLL142XX_LOCK_FACTOR,
 			pll->lock_reg);
 	else
@@ -1373,6 +1378,7 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 	case pll_1450x:
 	case pll_1451x:
 	case pll_1452x:
+	case pll_1419x:
 	case pll_141xx:
 	case pll_142xx:
 		pll->enable_offs = PLL35XX_ENABLE_SHIFT;
diff --git a/drivers/clk/samsung/clk-pll.h b/drivers/clk/samsung/clk-pll.h
index 989addfdb..c07d76121 100644
--- a/drivers/clk/samsung/clk-pll.h
+++ b/drivers/clk/samsung/clk-pll.h
@@ -50,6 +50,7 @@ enum samsung_pll_type {
 	pll_0732x,
 	pll_4311,
 	pll_141xx,
+	pll_1419x,
 };
 
 #define PLL_RATE(_fin, _m, _p, _s, _k, _ks) \
@@ -57,6 +58,15 @@ enum samsung_pll_type {
 #define PLL_VALID_RATE(_fin, _fout, _m, _p, _s, _k, _ks) ((_fout) + \
 	BUILD_BUG_ON_ZERO(PLL_RATE(_fin, _m, _p, _s, _k, _ks) != (_fout)))
 
+#define PLL_1419X_RATE(_fin, _rate, _m, _p, _s)			\
+	{							\
+		.rate	=	PLL_VALID_RATE(_fin, _rate,	\
+				2 * _m, _p, _s, 0, 16),		\
+		.mdiv	=	(_m),				\
+		.pdiv	=	(_p),				\
+		.sdiv	=	(_s),				\
+	}
+
 #define PLL_35XX_RATE(_fin, _rate, _m, _p, _s)			\
 	{							\
 		.rate	=	PLL_VALID_RATE(_fin, _rate,	\
-- 
2.43.0

