Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A0A18F2F1
	for <linux-samsung-soc@vger.kernel.org>; Thu,  8 Aug 2024 14:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723126288; cv=none; b=B43BaIWkpSB6Z5X4pqPQrUGYV4epMh/SRoeachHdJuk9qawDA/TcUx46VZS4Ud16SZpMXD6FX00SItsQIyo9uNO28y1mgQMRLZvCE/GcRPonr1SQ7J4gi6Y5Rhwfekl+RgJUnWZQjMiOTgkKfuPd9litDClgHjTtBX+qfbMtz2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723126288; c=relaxed/simple;
	bh=1ir13MZl0az/9cRAPNM2xtHw/7Fiznd6AQuTHA91Vq8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=age46yRUSrjr7rEQuAtuhZZlxx8vM8NxykgRDUnBf3lRs6+BZLg33xIrVhHpMdMbGUOqHFR/LYE1RX1eud4dYGAEU+8MB9gPjnIm6zI5J8jNMXFvxQp4dzJaWactY7E6l0/JW6vnpuVXvGiWA3F/wS/vXYsY5bE0iI7pgkAjUjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eVtG/y29; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eVtG/y29"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2ef2fccca2cso10505591fa.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 Aug 2024 07:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723126283; x=1723731083; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y1g12t0G6k+jblt/poXm1qsZh457ASaKEWb3Du9DwTI=;
        b=eVtG/y29mfGWQXa6nxoe9gw7FZaNG2hhV7eKKvQnSgZ/u+4yb1FQ0eFhMRjbY0lUwz
         QCoSAGLz5LYKPU/TOaMBDMasrHL6BckxqhM8S1l62Gf4qTFWLD3xu3dgb2Vi4n44oNCF
         +5TBGPnj3a4Jjf6IhT032Uay/AtuInExw1ojSCW9B8Ax86Zm9V1i/Au0VLc3gLI4OPAr
         5I/uJXIfMuDMyo6LoaaPFgtDHokc6k0QqA+lYksKTl/YGJD2lDEiY53g/POGDab3F69X
         YiJQy3nkRtCseIPNtyh+sNLIIZ07RonN8MkvloWlSucFu3Ysc5QfoZxUxmaN5mUMg00d
         G5Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723126283; x=1723731083;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y1g12t0G6k+jblt/poXm1qsZh457ASaKEWb3Du9DwTI=;
        b=EOpjgMxaWrwUecSXSBHEdLvIMhaHPEZ1QF96VX+uxL2I1aNGPfwauJHIul8VOoorB1
         68NnGPx599NkUzBt9AbClauSR7LKa0G/UvhGG2HNC19WVKRkxY4+s9m1jvRmTEeD4xuo
         qaJS2mm6yUve5TZ3JPogLSaXD45kPKfgTwIvnT9qfRSY7ySuFMhRh1ICBW8VxxaVC225
         OgORVW3RhloF5IxjlOlc+ixDAT71Xs0wfvjxjRXaXG82S7McBV9lMCPxqvEDM0e3gmtV
         iH/hPgEarkGKTO46x3tT5f4RUJ147qmVbsJHaOgbM5N5bRHvMAT5KIT6cKgprN5a4Qgl
         +CTA==
X-Forwarded-Encrypted: i=1; AJvYcCVjBtsvEXsOuF6esmM1Zoyrjj1XdjmiAFcblh2vH4hOCqHNnrwZR1Ni89v/YwhKSlkGSM+8PHU8SR31y5XhCVZtm+dGKkr3yRUSTTjx0qkqIdU=
X-Gm-Message-State: AOJu0YzbIjcdyXJouKipSS/swIswPwDK9JhjU3GfoBsl4roxuDQ0SPt5
	XxjeAFBoYzDn2PxCnQlHGeou6EaqWVsD4Dn6axPjYMchtBmjzA0dyQ7LVWwZERY=
X-Google-Smtp-Source: AGHT+IGDyMQHKv0RwbvPX/6d6Xk0Zr0aJrMD0f2Ipsmoyq60Ge259oDU095mhvj+uwb4LCGW4iMZ3g==
X-Received: by 2002:a2e:9cc7:0:b0:2ef:2638:48cd with SMTP id 38308e7fff4ca-2f19de73ee0mr14044491fa.30.1723126283448;
        Thu, 08 Aug 2024 07:11:23 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bbb2c29f79sm671761a12.33.2024.08.08.07.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:11:23 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 15:11:28 +0100
Subject: [PATCH v5 14/20] clk: imx: imx8mm: drop call to
 imx_register_uart_clocks()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-gs101-non-essential-clocks-2-v5-14-11cffef0634e@linaro.org>
References: <20240808-gs101-non-essential-clocks-2-v5-0-11cffef0634e@linaro.org>
In-Reply-To: <20240808-gs101-non-essential-clocks-2-v5-0-11cffef0634e@linaro.org>
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
 drivers/clk/imx/clk-imx8mm.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mm.c b/drivers/clk/imx/clk-imx8mm.c
index 342049b847b9..3f649da0230d 100644
--- a/drivers/clk/imx/clk-imx8mm.c
+++ b/drivers/clk/imx/clk-imx8mm.c
@@ -609,8 +609,6 @@ static int imx8mm_clocks_probe(struct platform_device *pdev)
 		goto unregister_hws;
 	}
 
-	imx_register_uart_clocks();
-
 	return 0;
 
 unregister_hws:

-- 
2.46.0.rc2.264.g509ed76dc8-goog

