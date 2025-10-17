Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B324E284B37
	for <linux-samsung-soc@vger.kernel.org>; Fri, 17 Oct 2025 16:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760717661; cv=none; b=kRZy4U35yic3RnnRarCV4jBI9Khw0u7CT5VDxLysswwxN9a7fNp2d4Iwiilu3p/SB0pdz6qQ75vqGTDaX36AAkuV2PpjdzWWMwgaBIclKOLMWmPhhoD4ZxPgebBOzUMw4120VBFjVXBghGQYi9VNC1fYNPqZN8y/QVzFnkwAkPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760717661; c=relaxed/simple;
	bh=oxHS6u7FeboNBttWQlQCkoLj03pi1x2TmYSFQR57jhw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mQawAvO8hg/sZSvvnHybaYeb0yKINLydpBwcCg8Ywwdhcod+lzzXqjPKMLRVCqbRlTqXvnL0ej4FY6HCgJQG7qtVseFSD61iTbIBGckcApnY+TmHDYsRgtrAVOTmeCiIVmpuWPiKll3RCz0mts5XlDrL2kDeTobCmxqz+G30mX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N5H9fOme; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N5H9fOme"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b4c89df6145so364098966b.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 17 Oct 2025 09:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760717658; x=1761322458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o/0xrgYWwbL6uDm6bWRd8Dfjm9NXSGd8s9gIV76gFCo=;
        b=N5H9fOme9RthmD+DW85Wkzdr73XsdociiRB0zb1pLi1WJCZiLY6RaDEZOtl73EV6ct
         I/udWKLcPwq+WiLhuNYtCcqi1GcNEOxIPTeDo/3vStx09k0ob4SQ4W9cqVxDI8uQKfU5
         v+R4C0TIsguDQ2eiZOzwKmjdTnXNT6xZuyrhLOtStD2BYRKRQUzMJeDC/XPqb2Feajhp
         fpxmoX0bDs0zH2eMGL2dfvtfGLJwUC5RR1zmC2jviyfncvKL1TzOwOxv1Du16+vNL7JV
         x/lbUIJbIQOkZOoCfzpaDkibjS1KNkPUJcav2zb3jaBG+zzPSwmVhDoh+WkEW1C9Cnbq
         LNjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760717658; x=1761322458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o/0xrgYWwbL6uDm6bWRd8Dfjm9NXSGd8s9gIV76gFCo=;
        b=GGLjpcomapNW0U8AG33bmq/3oELN8csBtWJ8WwiSoiAUbyMdtAp5fGojr+Ig4EuVdY
         qcou4PdpMp/1Uil9ANJYSUcXXnitzT00x+/AV8U37k1B5uF1M4+/ur8McoML5OS9M3FR
         5stReMatTyx0VSa/axFnrr7GIhoVcVRQWxYmvvHvRSpwS49uvq91yM8YtLAKGaTxDk0K
         ljNo9wKVLW6/Ulc68Sk8cAn1RJvU02k9J+d9dH8jSY3VHVJhYkcxJAsrVUwfoEuvI3wT
         RE19Et4m/CYMV53BxCWOTzyFygySBYF3O4jtBbiW7dLGAziGRxUOlgoH9jcpu1BWOBdV
         vphg==
X-Forwarded-Encrypted: i=1; AJvYcCXF/Iwjcq8MYMjYxNgld5vZdl00dA4geQ/PK7UojrvDZBqs39QHUAmaNvLCWYtFVTA98Zjxxb9aeBbjFhOcSwJT7w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/Q/QxxuMOGcLeV3heBqapiUkp0jKAaALXjH1s7x4zyCKflGCy
	9dAVBbABkkGSb02RXFdLk133Gyew44jgRFv156JLRIhivilceUgYMQMB
X-Gm-Gg: ASbGncsDN2K+tNJMibmcUNyUY4S3dNZh3oaF9v2JUy1Tac+NTc/R2N+uxNBkZwPd4bK
	QaDN07q2DKrnT+gPXPUOMC1pZcPVKEUNQH1BR7YdpQw1TC4uQhA57DzPAqWfm5MEFyGkAQJPWDF
	yLJfV0EUKm8RQ56vW70qx0GFTXPIn6YsmPwBACsGbmsjvNdT8G9ejTmlL2XuEGVZhzmknPQzOD4
	XQgmvClHVja0rmrjkKYp+LjX2kD5ts8FI/DaahpV6VV38auClF4jes88J4WqAdZrOVeUNOa4HHS
	Gt4m6h7M9UTC09IwEk+GA/PPTt7X+RhpcbJ/NP17qE3aKR0QEnPYje+vqPf4aRToi+24Y/pa2NI
	wJVPebGVenkqytXJXavnKnkT35jG+23OCDP5VsaTmSGm/ftGsEw5n4MKFT7FfbIyR876UGQubnP
	ng38xLFZcnabeiQ8Ihwl0qcDGSB4X9DCdmjGxP3AaU
X-Google-Smtp-Source: AGHT+IEvX2NLEl2JEWd8maw6vu+Cz/hVCzCLPJGWsXutTdMkKS8cKelXvHyzoaBlWYedD/QgQ0uDEA==
X-Received: by 2002:a17:907:a46:b0:b46:6718:3f30 with SMTP id a640c23a62f3a-b6475128af5mr477286966b.51.1760717657887;
        Fri, 17 Oct 2025 09:14:17 -0700 (PDT)
Received: from ivaylo-T580.. (79-100-18-255.ip.btc-net.bg. [79.100.18.255])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb036706sm9606466b.41.2025.10.17.09.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 09:14:17 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] clk: samsung: clk-pll: Add support for pll_141xx
Date: Fri, 17 Oct 2025 19:13:30 +0300
Message-ID: <20251017161334.1295955-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251017161334.1295955-1-ivo.ivanov.ivanov1@gmail.com>
References: <20251017161334.1295955-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PLL is similar to pll_35xx, with the exception of a different
Locktime - 150 instead of 270, as with pll_142xx.

When defining a PLL, the "con" parameter should be set to CON0
register, like this:

PLL(pll_141xx, CLK_FOUT_SHARED0_PLL, "fout_shared0_pll", "oscclk",
    PLL_LOCKTIME_PLL_SHARED0, PLL_CON0_PLL_SHARED0,
    pll_shared0_rate_table),

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
Changes since V2:
- rebase on next and drop the unnecessary new line
---
 drivers/clk/samsung/clk-pll.c | 4 +++-
 drivers/clk/samsung/clk-pll.h | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index 7bea7be1d..4700eadad 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -278,7 +278,8 @@ static int samsung_pll35xx_set_rate(struct clk_hw *hw, unsigned long drate,
 	}
 
 	/* Set PLL lock time. */
-	if (pll->type == pll_142xx || pll->type == pll_1017x)
+	if (pll->type == pll_142xx || pll->type == pll_1017x ||
+	    pll->type == pll_141xx)
 		writel_relaxed(rate->pdiv * PLL142XX_LOCK_FACTOR,
 			pll->lock_reg);
 	else
@@ -1497,6 +1498,7 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 	case pll_1451x:
 	case pll_1452x:
 	case pll_142xx:
+	case pll_141xx:
 	case pll_1017x:
 		pll->enable_offs = PLL35XX_ENABLE_SHIFT;
 		pll->lock_offs = PLL35XX_LOCK_STAT_SHIFT;
diff --git a/drivers/clk/samsung/clk-pll.h b/drivers/clk/samsung/clk-pll.h
index 6c8bb7f26..3c7575cde 100644
--- a/drivers/clk/samsung/clk-pll.h
+++ b/drivers/clk/samsung/clk-pll.h
@@ -51,6 +51,7 @@ enum samsung_pll_type {
 	pll_4311,
 	pll_1017x,
 	pll_1031x,
+	pll_141xx,
 };
 
 #define PLL_RATE(_fin, _m, _p, _s, _k, _ks) \
-- 
2.43.0

