Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C3F1C8FA2;
	Tue,  6 Aug 2024 12:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722946302; cv=none; b=IRgYBxTLhv7tgqhtEwekDxqzwgEOGgcgfe95fALE/Dx/hKOo8lznXMh2o7M6czAskCMFXyZO8q29askyt9vXekcR1U2P2BcN+sQzIBl0u8AxJIXmzIMqZOn8xPz6EaE9gzd64c6PHg+ldGSQyZrSC8vY6xXe6EvqVdENSibC8xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722946302; c=relaxed/simple;
	bh=a95p3S76YVtmYSCOzH9vh95f+kAzImk/8n+LYiGjPCI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AS8CAcVmkfARXWRtRSwSBv1O5oe8aHKZ/3KMIYuCGVekC11vBMy0JZxUmvK8s/5N6Rgan8K9KM7G0vjDGeGAg5DpAH1M07DpZ3xNdO7/Cn0qIxXGsOo3iBEjhBLlEXE9rIM1KOjXMvS7vFcygW7CB8Xh/1dtiSV3sFKQ29fzlNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Faj61QOI; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Faj61QOI"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5b391c8abd7so593868a12.2;
        Tue, 06 Aug 2024 05:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722946299; x=1723551099; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Kr9OUWJu3zpHtEvcQkSwe6meHxvcJJnyUk+tmEInzk=;
        b=Faj61QOIbCuHg5pSPVK50/UP2M6iSanY9Tc9BsAVUgkCgQA7jsbYIgnleKy3P/Nsle
         eRMBkym7GXHdtXyqfMdWpmujHAPq3S030GILFxohx5SqFJ5uL0KbDEvNVpK6PZmZe/JA
         itgdwaKDPbC3yopu+5kCAFBleEZUJx1JTCT5hU1PEoXmfd2c0BvkUb1304bcFiqYQZ/q
         fyX9FxjfxIVGQU2vN3Zmb1xkUpS9KakcEAh32TbMLPz9IKPQDYZXC5EPX1bES6YVqjMq
         JT806o1j7tqyETTWF+ZDmBCL0mvDnplr7JFhAie7jcYldgv4OVgSTEH/B0oJHVTfqxJV
         NIoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722946299; x=1723551099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Kr9OUWJu3zpHtEvcQkSwe6meHxvcJJnyUk+tmEInzk=;
        b=hS7hRNNOK4VnNoPNiThtjJAB3tVq75TsHTrZEnOPklbGpcit/APt7xjwnlvF240NsW
         uAB3Rzobg9EWnNFFNJc5x05P9c4j5C/wSTAmIqSTH45aqrM0EKpiNr6kYe71Kjj+PL9i
         z+Eygqpo9KYRBsjRHTM+WddGNcK9Rv0xd/4pXJPHSNS9C1XSbBsqFY9MNm8im27aMETw
         HiIFu7VH3vF3yFVqlDJiPqvuX7dHJLrDChpfL+QgrsgjUSFhwIfMKHxcnFnrHT6EQPUm
         PIVSUiMMC3iTrWsKntzqRY1rZIztiLai+i3CytuYCQpy+zu5NRR5AMtdsjezPNPBSfSX
         FaQw==
X-Forwarded-Encrypted: i=1; AJvYcCXc494FTheGft9Tkf6Zm7tU/o+OviFx7RYg6bifwaMBivGIlPmshB7SR6iM3/qnRn8/+31iRgU8K9QkWa0psmxJo32kImaH7Ht4miitShargnC7eCnHXyqrsbtcc4ZDXjzqeuR4IFzHUgc71gN+nBd8oti1onnosV/ORuOFZSZI6wluTA==
X-Gm-Message-State: AOJu0Yyu/EAuMzn977EZkmmXtge3qgbwqBASnU2BgjoPhcNWuT9SA9T6
	k6zNzHmvpfATmXmAwE/nKdZ8fY2zaEqP4mRI4AbGF6y30226hTsC
X-Google-Smtp-Source: AGHT+IGA2ucJtDCPuKp3eCGFeHqBMSbY7zae2XhclUVfrwb6RcTfkCOleZ56MBKoDhIw0mDUOgcL/Q==
X-Received: by 2002:a17:906:4789:b0:a7a:9447:3e91 with SMTP id a640c23a62f3a-a7dc4e9b1c4mr1065307866b.39.1722946298451;
        Tue, 06 Aug 2024 05:11:38 -0700 (PDT)
Received: from localhost.localdomain ([2a02:ab88:3711:c80:e7a7:e025:f1a5:ef78])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a7dc9ecb546sm542080366b.224.2024.08.06.05.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 05:11:38 -0700 (PDT)
From: David Virag <virag.david003@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Virag <virag.david003@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 6/7] clk: samsung: clk-pll: Add support for pll_1418x
Date: Tue,  6 Aug 2024 14:11:49 +0200
Message-ID: <20240806121157.479212-7-virag.david003@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240806121157.479212-1-virag.david003@gmail.com>
References: <20240806121157.479212-1-virag.david003@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pll1418x is used in Exynos7885 SoC for USB PHY clock.
Operation-wise it is very similar to pll0822x, except that MDIV is only
9 bits wide instead of 10, and we use the CON1 register in the PLL
macro's "con" parameter instead of CON3 like this:

	PLL(pll_1418x, CLK_FOUT_USB_PLL, "fout_usb_pll", "oscclk",
	    PLL_LOCKTIME_PLL_USB, PLL_CON0_PLL_USB,
	    pll_usb_rate_table),

Technically the PLL should work fine with pll0822x code if the PLL
tables are correct, but it's more "correct" to actually update the mask.

Signed-off-by: David Virag <virag.david003@gmail.com>
---
 drivers/clk/samsung/clk-pll.c | 20 ++++++++++++++++----
 drivers/clk/samsung/clk-pll.h |  1 +
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index 4be879ab917e..c61a2810737c 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -430,6 +430,9 @@ static const struct clk_ops samsung_pll36xx_clk_min_ops = {
 #define PLL0822X_LOCK_STAT_SHIFT	(29)
 #define PLL0822X_ENABLE_SHIFT		(31)
 
+/* PLL1418x is similar to PLL0822x, except that MDIV is one bit smaller */
+#define PLL1418X_MDIV_MASK		(0x1FF)
+
 static unsigned long samsung_pll0822x_recalc_rate(struct clk_hw *hw,
 						  unsigned long parent_rate)
 {
@@ -438,7 +441,10 @@ static unsigned long samsung_pll0822x_recalc_rate(struct clk_hw *hw,
 	u64 fvco = parent_rate;
 
 	pll_con3 = readl_relaxed(pll->con_reg);
-	mdiv = (pll_con3 >> PLL0822X_MDIV_SHIFT) & PLL0822X_MDIV_MASK;
+	if (pll->type != pll_1418x)
+		mdiv = (pll_con3 >> PLL0822X_MDIV_SHIFT) & PLL0822X_MDIV_MASK;
+	else
+		mdiv = (pll_con3 >> PLL0822X_MDIV_SHIFT) & PLL1418X_MDIV_MASK;
 	pdiv = (pll_con3 >> PLL0822X_PDIV_SHIFT) & PLL0822X_PDIV_MASK;
 	sdiv = (pll_con3 >> PLL0822X_SDIV_SHIFT) & PLL0822X_SDIV_MASK;
 
@@ -468,9 +474,14 @@ static int samsung_pll0822x_set_rate(struct clk_hw *hw, unsigned long drate,
 
 	/* Change PLL PMS values */
 	pll_con3 = readl_relaxed(pll->con_reg);
-	pll_con3 &= ~((PLL0822X_MDIV_MASK << PLL0822X_MDIV_SHIFT) |
-			(PLL0822X_PDIV_MASK << PLL0822X_PDIV_SHIFT) |
-			(PLL0822X_SDIV_MASK << PLL0822X_SDIV_SHIFT));
+	if (pll->type != pll_1418x)
+		pll_con3 &= ~((PLL0822X_MDIV_MASK << PLL0822X_MDIV_SHIFT) |
+				(PLL0822X_PDIV_MASK << PLL0822X_PDIV_SHIFT) |
+				(PLL0822X_SDIV_MASK << PLL0822X_SDIV_SHIFT));
+	else
+		pll_con3 &= ~((PLL1418X_MDIV_MASK << PLL0822X_MDIV_SHIFT) |
+				(PLL0822X_PDIV_MASK << PLL0822X_PDIV_SHIFT) |
+				(PLL0822X_SDIV_MASK << PLL0822X_SDIV_SHIFT));
 	pll_con3 |= (rate->mdiv << PLL0822X_MDIV_SHIFT) |
 			(rate->pdiv << PLL0822X_PDIV_SHIFT) |
 			(rate->sdiv << PLL0822X_SDIV_SHIFT);
@@ -1317,6 +1328,7 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 			init.ops = &samsung_pll35xx_clk_ops;
 		break;
 	case pll_1417x:
+	case pll_1418x:
 	case pll_0818x:
 	case pll_0822x:
 	case pll_0516x:
diff --git a/drivers/clk/samsung/clk-pll.h b/drivers/clk/samsung/clk-pll.h
index ffd3d52c0dec..1efbe4c446d0 100644
--- a/drivers/clk/samsung/clk-pll.h
+++ b/drivers/clk/samsung/clk-pll.h
@@ -30,6 +30,7 @@ enum samsung_pll_type {
 	pll_2650x,
 	pll_2650xx,
 	pll_1417x,
+	pll_1418x,
 	pll_1450x,
 	pll_1451x,
 	pll_1452x,
-- 
2.46.0

