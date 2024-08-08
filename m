Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB4A18FC86
	for <linux-samsung-soc@vger.kernel.org>; Thu,  8 Aug 2024 14:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723128178; cv=none; b=RLV/FcY8A+xd7AnEIUrp4/TqUK4tr3d9LR3vL0StWuXEJQ/LOVshshwERAoGZVrM036u+ESirOhfipZTDEhc+xpC5a1Ygb6wL9JLT4nQLyD7ZEkA6CBG1JTqBMtFr1zasoBGQGgNdNIbkEhAOx9uafCDotZ1Z5mQQPeQHJFFG4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723128178; c=relaxed/simple;
	bh=RCzb4T7ygPujxOgSIHXjGoBW3H5sHyUhE9zlzlMY0qY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cYiQh5vK43gylcj4F/eSppFGYXz/b0rv2FDkh4/Xd9N8y18K7kxqgxwtLCoJHOmEbfaFR2ft8evhLXdUnW06uFTYGTyxUUZBGMPYGOG5PnU2ylW09+qsEzYHbLZS0oZfItedbORIv0TvydHXL+UyAO6pM1id33DBjBtDfWVKW3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kHnoyFNO; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kHnoyFNO"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5b8c2a611adso1401707a12.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 Aug 2024 07:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723128174; x=1723732974; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fELKcjyo4D+4io09ckq4Quxisz8/UoBpXMhoRi06ZaU=;
        b=kHnoyFNODF7gfI7Pdqy0W+LSMM6Vqz1TV569hl/m9I0uONtdqH/F9Tl9zniajqj4Oo
         nDaOBZYVeB+mBvqDD1z87V30l/W7wN6LXpTj4SbBTUDCArodXSSDjmRRmX+OweAy5dx5
         zbWj+Dv/PNoIeeO+Rom53w8IH2Ojt+wiOZUPy1jrnjarZ9GlKUCuTbQTauqBqqgfaxho
         XJyjGUdH0984R9tr+92dnQoDScLEo5Z6qRAtuJy6Rkblc7LLdP9mZ9O28DCVnMhR51D+
         ZL57p5hEUmpc88L231H0y6MI8OmGT9c4Mn3brphvGcHM6BQdtuH6xgyBDSpE3YPkupEL
         /o2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723128174; x=1723732974;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fELKcjyo4D+4io09ckq4Quxisz8/UoBpXMhoRi06ZaU=;
        b=QX5sdOKxS9K0QI+VgJjf94fVf6CcGio0oJ/NKhK9mPyfQazwjXMjtsI3RkXUG7qZtA
         mlPQ2InlGfYc7AQUIkFTWRyd3//pgd498WbIDlQ0TAKYv7wlsBShmuY33qYp+/kvvVGm
         NJQbtzVCfwXbfExpEw2UOxjJe+Gc1eif01P5jQGvfDqnO3WbNEZBmMGC6DDpS/46AoIy
         bcNUnM8+MCrwVDBhcj/02pThTgjZ8iZYWoiSoxAikdspo47UIxt4X28RV0fsY6rmmdW1
         K7LsA6wsRfyeD2jbQiAYKIKeO6Wiv1lG04V13Gf0d3wDcOcTtoXDU2INitxt5AKI8Cof
         0y0A==
X-Forwarded-Encrypted: i=1; AJvYcCViU/HFdQwhQKy/UKocgyTkCLe1gakCgK8yXX6KyvmZM0UqhmP9TdcpWD827b4U1W6LU4oUiLz28qkg5U10KrmJWTI/3wFxOFHBLBATR8qBwuc=
X-Gm-Message-State: AOJu0Yz4523NBXMPnReP9kbXjCKkShm1vEmw0Jmce92BOgVocqjZcb+Z
	o7Vof9SjtnDFkB0IJY7iW/VXmv4+PXFjPhIulezlKmW60evJVO33LvcrgA3PWYQ=
X-Google-Smtp-Source: AGHT+IEdiR2uqxL40ypq1eVBsdbq009S5HpqMJsLtiHNMyRcup08bUljMUs/bT8PIRSRi7Q4xYViWw==
X-Received: by 2002:a17:907:97cc:b0:a7a:b9dd:775f with SMTP id a640c23a62f3a-a8090e3cf84mr182258966b.55.1723128173566;
        Thu, 08 Aug 2024 07:42:53 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9e80e04sm759298966b.175.2024.08.08.07.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:42:52 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 15:42:52 +0100
Subject: [PATCH v6 11/20] clk: imx: imx6ul: drop call to
 imx_register_uart_clocks()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-gs101-non-essential-clocks-2-v6-11-e91c537acedc@linaro.org>
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
 drivers/clk/imx/clk-imx6ul.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx6ul.c b/drivers/clk/imx/clk-imx6ul.c
index 05c7a82b751f..b828cecd3690 100644
--- a/drivers/clk/imx/clk-imx6ul.c
+++ b/drivers/clk/imx/clk-imx6ul.c
@@ -544,8 +544,6 @@ static void __init imx6ul_clocks_init(struct device_node *ccm_node)
 
 	clk_set_parent(hws[IMX6UL_CLK_ENET1_REF_SEL]->clk, hws[IMX6UL_CLK_ENET1_REF_125M]->clk);
 	clk_set_parent(hws[IMX6UL_CLK_ENET2_REF_SEL]->clk, hws[IMX6UL_CLK_ENET2_REF_125M]->clk);
-
-	imx_register_uart_clocks();
 }
 
 CLK_OF_DECLARE(imx6ul, "fsl,imx6ul-ccm", imx6ul_clocks_init);

-- 
2.46.0.rc2.264.g509ed76dc8-goog

