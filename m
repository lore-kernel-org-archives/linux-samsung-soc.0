Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8CA318FC7D
	for <linux-samsung-soc@vger.kernel.org>; Thu,  8 Aug 2024 14:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723126290; cv=none; b=KKdB0YZVAMdD8FhNJC9fdWSdFiIY/ZEy+rK5bRXaOIlJ4qR0m3MDkFbUefA9JBDobqTfkK4OMugrYqjByzTw5bZ6Z38H2+ZIZ63lOOBD2KeXKieeJQ8d20GJWqW4BnXpgrLdG5C65vEp6QAZd71z9MDWQJ+ng56VJq8LyfF81fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723126290; c=relaxed/simple;
	bh=3MuovDtIRZorURIU9tYKQJVq47VGHfGnfR9ISQ9xJW8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CaqdUh2UX33f5QXxaukYLMRJMAvjJkN9PzNn8sMLGVIb5Uk/wRutshN4Ecji0Ao11zjd6XFNtGLrLA05OPJkt8+z5QV1OCuP/T5LiDOaXspwZQzeHVFNEfk8W/OY9mqKWFdY8wdowOwYNVt7gqrLxCtWT2EEC2bPydgufNggHH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i4UbOf7X; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i4UbOf7X"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5a1337cfbb5so1283607a12.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 Aug 2024 07:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723126285; x=1723731085; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EZspTtdY5QAEUSn7UgNMVbYIWDm0rZtsqchGrqjMzsE=;
        b=i4UbOf7XFrads6UM1zUFEbfG/SGLvSy9Xq2zomKpC15uYENR302QQh7u20VEeMYv92
         OrDZMlWA8iVQkAW23EYVKGDIdwpmbPAGQctM4SYbWlSBXtxUkoKC2BLIwaY7hIE178tY
         W1E7pubEFsV//D+XNBJJu+dU19hq9MPQAbVrJ9W6s5X68eRE05te9abrECkz9b0dJDPL
         7tyZodblcFlO3zyllrXGbO8M2xMuX4mcEY5hZk9vL7MIx/6G/rsId6p8shKbKwmUIb+C
         s1cuJQI/JrBEgCn6JAwAA36NbmdMepDeQRG3PoXegcaEszWpWwWOY6wSuYzs5FQ4rp8z
         LrRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723126285; x=1723731085;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EZspTtdY5QAEUSn7UgNMVbYIWDm0rZtsqchGrqjMzsE=;
        b=Xta+4v2L5FByBC7U5QRxc+q/dENSdbXKKDb8S9gvAXtzDgUa0osiEcUQd0lEYTgMFR
         roPhgxh2Y79+13P+rDMg1BFQ5UhXajFa/rloKpGmjWDJZt5Dn5Lt5wHQ3eI9bMGyghRM
         JeaVgkQTCwnqJG0M9JdhBw6zPcdVxlh2vYFqpQ18G+FqeEwcwn0iHdAdt3zYN9rasMbB
         j0KCDrXQuD7TaCwK/UthUfScx1uFGBNEYrV7zgJpb4uKFFviEswSaoi75/d+wmWicSM1
         hPVINzJ9D2TsFI5p3Qryl4T9Jq43xnJE5ZYpu1wic/9xk10FJv+8PNayzqMAYnshRtGC
         Ymig==
X-Forwarded-Encrypted: i=1; AJvYcCUFPEGCWFRuCQv7IQkEP1AZcuLOidu0OdS8cvMz5pz6clSNYoLEsugTSM1VwaVf8IKSo8tiFyaATSTob8NE0O5qs6suNHZvH7BPgNQhXuKrlWk=
X-Gm-Message-State: AOJu0Yw8Rji6vF469vV1NwgdmHt2+a9B5xU2Fd3XjsPK3HGRYhGy+1Lo
	ar2QR1AXJcf5VBiIMV5BbyHKMaXGbHkQ0itWqhKzvq9nshVeW1Z0yW8BsovKKVQ=
X-Google-Smtp-Source: AGHT+IHNM0523YZN7FUzZaznT4lLi+UUQ6lIisgSbrEP+7eTyr4/ucborIocaVgNqxpxXRdnhPG6mQ==
X-Received: by 2002:a05:6402:51d0:b0:5a2:3453:aaf2 with SMTP id 4fb4d7f45d1cf-5bbb21a433dmr1559817a12.10.1723126285323;
        Thu, 08 Aug 2024 07:11:25 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bbb2c29f79sm671761a12.33.2024.08.08.07.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:11:25 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 15:11:32 +0100
Subject: [PATCH v5 18/20] clk: imx: imx8ulp: drop call to
 imx_register_uart_clocks()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-gs101-non-essential-clocks-2-v5-18-11cffef0634e@linaro.org>
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
 drivers/clk/imx/clk-imx8ulp.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8ulp.c b/drivers/clk/imx/clk-imx8ulp.c
index 535b6364ca7e..5531e51a1e80 100644
--- a/drivers/clk/imx/clk-imx8ulp.c
+++ b/drivers/clk/imx/clk-imx8ulp.c
@@ -385,8 +385,6 @@ static int imx8ulp_clk_pcc3_init(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	imx_register_uart_clocks();
-
 	/* register the pcc3 reset controller */
 	return imx8ulp_pcc_reset_init(pdev, base, pcc3_resets, ARRAY_SIZE(pcc3_resets));
 }

-- 
2.46.0.rc2.264.g509ed76dc8-goog

