Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA8C1448DC;
	Sun,  4 Aug 2024 21:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722808547; cv=none; b=d4q9ecTwuJNY+KqhqUdKeoCJwbuMYLsoek96O5ScHaSyNaZfImMEWGmG5kzDPeC52F/o7HLSJggi3y7//KL4bsKhmR/CwB+fIju3DCkA1RnJVjuzBaSq7b4WWBs1QmaKLV0RwRHhpoggoIIbYE3cNlevPKuZt6LowTtu1hnrc/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722808547; c=relaxed/simple;
	bh=a95p3S76YVtmYSCOzH9vh95f+kAzImk/8n+LYiGjPCI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NYKsFc3uS+C51TJRn6d74zQO1M1HTk4gi+cW2hWVObFfR8tJTP6ndolGpdiLrin/G/zAzUohrZi3Qx2ETJ94TYnkgWOgjkqA+eelM+5XjsyqZGg+BjCDuMfKBHDCiarpxyv6T/9yzczu/3o7iRXz0rfcfcQ1PtgWpGhTlCxN9zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nmRHFarH; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nmRHFarH"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5b01af9b0c9so8939843a12.3;
        Sun, 04 Aug 2024 14:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722808544; x=1723413344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Kr9OUWJu3zpHtEvcQkSwe6meHxvcJJnyUk+tmEInzk=;
        b=nmRHFarHWSsB/ACdNLkI2EJgTFF52aPucKTc8XnCzwCFW5UlZmZvprCyUe0obVewNL
         gmkKq2GOY3EfP0tcGgN3PSscsEc9HhMgCrHAXyo52drz0DvMnMw/F6L4KthxMwoSsnWC
         yHVAfW7CC7nVQQUqNlDzdkP03B8PCrwlPm+XDKb03YUfmUaHXdnfmWw8tmNC27tNVjty
         yAolqMJe9x62uZf4ZMmxf98/myW8hvJ5Bw9Y4YvVGdUd5GdCBZuDTmwjCqi/CfjXXH/J
         JQrXNKTyHnttAVjyImBz6ewXMpfANeDbTKfhqpefkyfFmkweQKpE1QYeGF0Erp6porvI
         uXlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722808544; x=1723413344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Kr9OUWJu3zpHtEvcQkSwe6meHxvcJJnyUk+tmEInzk=;
        b=oP7O/o13HFG2gwZjrDVZuURyhtYrzZhxE0Hn/bkLJDLGIVzmEar3M6Ln/5xho7zYc2
         sRral1Kc1yEgRdvtV2TwcdM0n6FQX5icoPcW0tedWqsPqyK0s+bvskBr4VMS94jbl+Tg
         FzjkPFIgnDAH9A9Olhso7mnahFoTLz4jGBg5xpp1Yo2GbQouGKtaSwdf+tXsyn9OyOdI
         BRyp8kRrDHwUwXTfoZpq3+QWF2+x+M/stiKyzUpuMVUH/K8DEXDh1R3G/aOh9TEn2dDP
         ZpLNxwu3x8y2BMfH31ddbwTJ9KwnyV6DkAfef2E4Gv8V2BeDllyYMEKs0IEe7Jj9MiNS
         vKng==
X-Forwarded-Encrypted: i=1; AJvYcCXWN242Jkp2grSF5VbL1+1kALq8yfCGwuKKWcb3w0wxlAUi8NnRNQcBonYuGGMQMPb4ccoKmwptr0No3F6v9ia+z/nNh0UEU01n/RtG6mQvDE+0HR2ZcHR4zsglEGpi29TnOnJEhu/Em6jmopRIq6H+JJz+UVKl5zijqBhC4nSGR5kijiCLHv6YQkBsZ+pIkZR5ntSRwSIhf9QufOgYENsGx0S8Nsh2a2denFFhMjiifIbwNvF49k8yBlmndAS+xAxg
X-Gm-Message-State: AOJu0YzymXyavR0N6ve+eUtYASxulxA+o2fgdjKyghvJ6kqijvHVMcIO
	s17ahDnDj1j3GN+otVHjKwQyplDShhkXiuUN6EtA55JlDaxit5qM
X-Google-Smtp-Source: AGHT+IGa5nC1Rod9C1LgjK7SeiNLsR+u3R/s3yoxrcJTPD4mCFyFTsvxjXR/YMhGhKGnpQz0KnmiGQ==
X-Received: by 2002:a17:906:fe0c:b0:a77:cf9d:f495 with SMTP id a640c23a62f3a-a7dc508d3e0mr701470466b.40.1722808543592;
        Sun, 04 Aug 2024 14:55:43 -0700 (PDT)
Received: from localhost.localdomain ([2a02:ab88:3711:c80:e7a7:e025:f1a5:ef78])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a7dc9d45452sm370485066b.111.2024.08.04.14.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 14:55:43 -0700 (PDT)
From: David Virag <virag.david003@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	David Virag <virag.david003@gmail.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 08/13] clk: samsung: clk-pll: Add support for pll_1418x
Date: Sun,  4 Aug 2024 23:53:53 +0200
Message-ID: <20240804215458.404085-9-virag.david003@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240804215458.404085-1-virag.david003@gmail.com>
References: <20240804215458.404085-1-virag.david003@gmail.com>
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

