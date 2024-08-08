Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4540E18E75A
	for <linux-samsung-soc@vger.kernel.org>; Thu,  8 Aug 2024 14:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723126285; cv=none; b=MV/SjwE0w1zOj/mDchJLo/tRj5FSN5dZLh9n6HOu1I//JhBuba3bCmvgdff6pY/XqEBA7Imbfje/o9xrWCRQJ3j4T0Ka1XUw5iwACcKF1bb/BzYRRbQl+bqUTgKGuwpFaZv2yxKc60+ENID0GOXyARs/0eyQYzKBwkls/iH0XGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723126285; c=relaxed/simple;
	bh=F8XBaUKciL76OFnGIv5KAgXWQ49BMItLdMHThv/YF90=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R0WFHHFRHSR+BeJanvPaArdfwCwf2AdNGrftXffyQpsM01kOkLF2KynLuDZH+088HxgTPhfn3p+DdFTnM+4IJKk6Kwm9pXA1nsQbYVnJSAoT1VXzgGh/Dq0kfa5pms9WdkiMoS0Ze9ZJoqzILFGD29GPNYP1qdX3eilkOlhFulw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o5Cx9jnO; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o5Cx9jnO"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ef2fccca2cso10504941fa.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 Aug 2024 07:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723126281; x=1723731081; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EG/ZG6dnK/7FkbT8sGSrbUNfGaArXZW8+ft27slBbKg=;
        b=o5Cx9jnOenVDPajoFBtH6K9AYA37/I6CVdzl9yq411JVX8QBqfu4ozy1vUZD/Fj0Au
         dnfXsVrEwUFYojNhouzxBwaFTRfrGzxJEKndNw0OX7uGD/rW0NFs5ppYCkNckjg40fr+
         nDRtcw6FYs2q5gRHwqwL0JS7Kgu7tgo4WvgD1OCyVZjmdlqdSiDEcn+j84gY7LIFNJ2m
         Uv4YaSgFIMna5r2/P4tcgDOiItG2VXFxPI6abTRaWejf4GJ4uGQDeeR2Z5VtkwfXPRce
         sbAX/KtNKt1DXAdnJqL/wycYUm46Lv+FT9VD73Z9fNFc6f7L6LTFT6Gh6UAP8dOcAlLT
         vEfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723126281; x=1723731081;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EG/ZG6dnK/7FkbT8sGSrbUNfGaArXZW8+ft27slBbKg=;
        b=ClNLwS5hWH2iRPEN4u3BuKJHeQG7Vy89jVpMS9M6Pq4D0AuQEkqzfn8rMJLuR6gTcF
         pQyfkIZTG6Lk52g213MdasEvv8RolZMKLkKoygE/vgS0a1GGvqDwNh9xMjQkDdXTLzy1
         Mhx/H+qF9HGpITTEEOn7JsCvQyxRhaDsVEJMl+tsdjRZbitnIcMmeyWACs/6qCbWNRQ5
         5YlVOZ1cow4pTifBqlmZE3KOQQWLZjGiR7J9kS8BTBdMx/gkfsZhXDLq9ZzCoVN2KW6+
         6TTbaquAfQqxFW09AyFGYQiNqgC1EGq1sWBsBcrDgGmSdvP/rGoiQToF5eio1luUkl4w
         sn5w==
X-Forwarded-Encrypted: i=1; AJvYcCXizL2EFE1hdGH7TvRdFtDMwi1GYS7kIuimbge3cUAC6dE8GqX+kXYjckpWMiFmyYa+jfGqSSwDR1vRS6DUQg1YPxMqaT7OiO2uLr7y3EQspRw=
X-Gm-Message-State: AOJu0YwKXKf1tRRdUOGugdwiVeranieCqXlH3P3pMxqhWorCu9sqfFJb
	db7C7Qk5ljiY/J+KKt98cxmK9vscdUlHyrGHbOZUYJf7nfhSXSewNZ9ovuBLVJA=
X-Google-Smtp-Source: AGHT+IE+EuzjKtlzVGUkIG93q6FhwJZo7ntOcGAcERKFIalXABnZj7xmQM8pOykTOJhv2cPudFbycw==
X-Received: by 2002:a2e:f01:0:b0:2ef:2dac:9078 with SMTP id 38308e7fff4ca-2f19de2a28emr14087411fa.16.1723126281066;
        Thu, 08 Aug 2024 07:11:21 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bbb2c29f79sm671761a12.33.2024.08.08.07.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:11:20 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 15:11:23 +0100
Subject: [PATCH v5 09/20] clk: imx: imx6sll: drop call to
 imx_register_uart_clocks()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-gs101-non-essential-clocks-2-v5-9-11cffef0634e@linaro.org>
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
 drivers/clk/imx/clk-imx6sll.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx6sll.c b/drivers/clk/imx/clk-imx6sll.c
index 2fa70bf35e45..4310adc5d54f 100644
--- a/drivers/clk/imx/clk-imx6sll.c
+++ b/drivers/clk/imx/clk-imx6sll.c
@@ -340,8 +340,6 @@ static void __init imx6sll_clocks_init(struct device_node *ccm_node)
 
 	of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_hw_data);
 
-	imx_register_uart_clocks();
-
 	/* Lower the AHB clock rate before changing the clock source. */
 	clk_set_rate(hws[IMX6SLL_CLK_AHB]->clk, 99000000);
 

-- 
2.46.0.rc2.264.g509ed76dc8-goog

