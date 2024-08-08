Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1D118F2E3
	for <linux-samsung-soc@vger.kernel.org>; Thu,  8 Aug 2024 14:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723128176; cv=none; b=sYM5vLglEEmgcqtzqL66q6nQ4rSl78RM6OZcjyagE+JMgbTMvgO+FdR+I3t02KBYfsuTrfw0XzoCKnoSBYTIz2zTu2zeBEfYBaa+9rIoDMIQ2YayufanVd5X/JXCMTliqh5tUie96dhi/iRuaaOLTMALLqWsKNKAZqnv0C5B0lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723128176; c=relaxed/simple;
	bh=gR0CyM9a7lgnJr3lEM9JUrDdLahkhfxbkDJhWgDwKZg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lii0nxnipzhuzAbxYo7+7ybNJsZmY1478c6XBUUY2/8K3csc8v+A7U41yXKntzql64V+UFxabuWmpdw620aAe2bN/W6TIvmqkXGpgbq4eo7HvC3uNE4gguN5b3n1qPbGiW2o9eYAYX2KA+y7WcOWVdioIqaSDZ2UslXoNUWmAak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v8qtk92g; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v8qtk92g"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a7d26c2297eso126287666b.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 Aug 2024 07:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723128171; x=1723732971; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l83L9SwgjM7cQs40Ix45OsltdwbTgmJEPf1zQuQtrko=;
        b=v8qtk92g4CZXJ6EEWUolcg3MMoNSBmFpHmziC+jmpSABJKnNHOpLYGkNVLKacifZRw
         xZT5Qa1sa411HWtUrM2dFaw0B6JUe/LvAe+Iytt4nF5HqsWuPwEPM4n6kxuTWCOTSTc8
         pmz3rdrAXCfZX61ZPI+gJsu7i4iuiT/O1XRCYabwdXE8/MdsGDJyUwwFDi8Zeph/afkm
         +tHKMCiNggpnWuhi1LP37nxLNrEzV9hEM2ramOdEvI3AJrqTs8vNDYmu/irOif/bu/wQ
         aJlP9kPC0blyclIpkaAO62hq16Ow18TlWBJnf58nHLep3DubJvXKzkYfCk3fBwCRxxcn
         H7nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723128171; x=1723732971;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l83L9SwgjM7cQs40Ix45OsltdwbTgmJEPf1zQuQtrko=;
        b=DAzeYeXAxum4T2kJfEtP+zdlsx8qNp7/L8GkZkOlFIQPMXOGFRYUwAdRu4Zk4qBD6w
         SZnYlwYT1C8Dx/gZot2MXhwSpbJCgv3pttsEh7a8vHxfl4AZVM2d2gylkJj+eN7MMBS0
         WJZjLFv4L1TElQuUrnyWLqqcr+9ABixjA34yGH271WwttKsNe5nMGZRRVVQ50Ooh/TnK
         msxQ4XRf6M3FcZKo3+V6tcqbykhPAnXWTZGWNtVE5Sg2HsYP/c6aleZpuQIHlLE6Y4cN
         Mh9JzD5AoRoFUXKmODnJfkwfMUR+OJ+Y/KTl+n5y912WAztAukBYiYrU5u5NFxWxSCf0
         Sspg==
X-Forwarded-Encrypted: i=1; AJvYcCV5D2yaKb8AIUtW/RSyFe4r0EjI61xhIgkVFCn6PagF7WOi8H3nCYwb33QggAtn/FINRY9C/FpFEi0oNLYdqIeTznUaOYWo+EH94o0IUwv+M1g=
X-Gm-Message-State: AOJu0Yz29eFrvp3snkZKx09W7QjWrHIX/bBMes+Va4LmR57yWaAAIxvz
	pRR7+WyBYpYKQJKzzFVAjias5KUq+TY38kKMO0HhHR529tVucvohVzQQKcJFCDU=
X-Google-Smtp-Source: AGHT+IFe5yBX51Jekzt7C2kWUzgmsjyVacpfri7mMLlLy1Lqvgq+tUY5fWelUbD2TlqgI0C0qNqzwA==
X-Received: by 2002:a17:907:2d26:b0:a7a:9171:88f4 with SMTP id a640c23a62f3a-a8090f0363dmr157822666b.68.1723128171552;
        Thu, 08 Aug 2024 07:42:51 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9e80e04sm759298966b.175.2024.08.08.07.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:42:51 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 15:42:49 +0100
Subject: [PATCH v6 08/20] clk: imx: imx6sl: drop call to
 imx_register_uart_clocks()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-gs101-non-essential-clocks-2-v6-8-e91c537acedc@linaro.org>
References: <20240808-gs101-non-essential-clocks-2-v6-0-e91c537acedc@linaro.org>
In-Reply-To: <20240808-gs101-non-essential-clocks-2-v6-0-e91c537acedc@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Abel Vesa <abelvesa@kernel.org>, 
 Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 imx@lists.linux.dev, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

The clk core now does something similar for us as part of
of_clk_add_provider() and of_clk_add_hw_provider() and this i.MX
specific call isn't necessary anymore.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/clk/imx/clk-imx6sl.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx6sl.c b/drivers/clk/imx/clk-imx6sl.c
index 47b8667cfa3f..bc3e414eeadd 100644
--- a/drivers/clk/imx/clk-imx6sl.c
+++ b/drivers/clk/imx/clk-imx6sl.c
@@ -439,7 +439,5 @@ static void __init imx6sl_clocks_init(struct device_node *ccm_node)
 
 	clk_set_parent(hws[IMX6SL_CLK_LCDIF_AXI_SEL]->clk,
 		       hws[IMX6SL_CLK_PLL2_PFD2]->clk);
-
-	imx_register_uart_clocks();
 }
 CLK_OF_DECLARE(imx6sl, "fsl,imx6sl-ccm", imx6sl_clocks_init);

-- 
2.46.0.rc2.264.g509ed76dc8-goog

