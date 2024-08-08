Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B03518E75C
	for <linux-samsung-soc@vger.kernel.org>; Thu,  8 Aug 2024 14:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723126292; cv=none; b=RTUozPTqk6MoZVkkpK4Gc3NvTl2Bqw2YdfR0zN3a1N/0HcuIgQegoG2GjRX3KJnqeP95cYJ5u71iz9wymcjFCgQFTXrp3nnYiMIP3aEHosdEDNVpa+usPAXTGdNj0/2KIRBF1xbHkgSNAftG9g6T8qxKgL7bGBXv+sK8lX8hEoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723126292; c=relaxed/simple;
	bh=n+1hhj763mEFqV1dem2n36RFOjE3WvEU7qjocs6Feh4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m7hju5YGPrjpqLMP+IIzXEWAPEhFwlvPShDg5BXggaj9KTd/wEZEUOePykvVXwKmOgngYUugCrJBIwcvJia+QB6W86wYGsJhq0ZymolX2RqlkFODrPgma/blLkNgfnDZLMOHs6VvrMMaeNu6LYM50q07qjg69x4k2dUJ7WUaqDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mHR/1avL; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mHR/1avL"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5af51684d52so1209163a12.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 Aug 2024 07:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723126286; x=1723731086; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lpweh87gijIIJF4cQA1mk27Giq5WUQNyR9nG1a9dx7o=;
        b=mHR/1avLG8RejJr/a6M854mctT0SMj3vwL2HbbkCK5+yqu08yqXROmkanqW1jsU37s
         5fcesP/Htgo1zGeIhnBCiGVtafS+tTIXTEOzEl8VCEc9OyZ7lqpYTgbzsSL+M/BpemOU
         TSXY/ioLbC11iQqBUbxGgZSxSZFVrd56UB3rtZ73K9M07miDo6DnQo9xC9TOAont3CO0
         a0k324CtRRz1dZmp7ngSaWdTpEh/BYy216sQhwp4HPa4CMRm9DRfGwUUBlbeVGtYr5Ex
         7L7j5fL+laM5NBgqusVe2KwYC40p7V0Ezo7hUvWWr0MYMoPpycIhla3TYVGJKax5VSic
         LOXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723126286; x=1723731086;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lpweh87gijIIJF4cQA1mk27Giq5WUQNyR9nG1a9dx7o=;
        b=EB8HyEb1Ho4KDzG3+NpSZBbKfcsJgoIugX4fLTHn92xRevmW8o/Ue89mK4q5cDyU8r
         hD4kc1xdR+vuey9kjA+3j9ezG+7LyjYH2OIdxdoantI385ULV5KK86x3rqHEmYi0H7ev
         BetW4WmEdiugINYJOofZQi5yexiw3nMqh86o1jxbozym3W65ZR0YXLh+NWTxb67i05bj
         3HUxGCoVUFayWoVRV4M9FV6AzxEBAU07uCp+CcqO+9OC4HiX1NuJCP7JZCyLTKNPWviZ
         K1pSIzYquELNStu9hvExzSwcGSHF8DiHaLl2FLAFFICY9biXb3g7avaCOeMro4E5u0c6
         Rpjg==
X-Forwarded-Encrypted: i=1; AJvYcCVzvcZzoSNBVSeDRtbmjRE30/vlaLXirZLFWsbsa2LhLzNvFnT0ANC71RJ37s6uddn79MuvGjqVYUX79+yQZXEUfhnDyYwj641d/O20kJAziO4=
X-Gm-Message-State: AOJu0YwQTdNnZBp2ANH+t49io4nEhku44f7f8kXvjtH6/7Id0WDcfHiM
	/4vuAgBvxxeeBhGKBs+HvyjxIdt+2d5nn3ODF/3FcaNKwNLJaDejBSrn0RF0lchzTbsArdw8Lyw
	JKdOt9g==
X-Google-Smtp-Source: AGHT+IFHP+WAJRQKtBDAPTtKu22SVp1AeXoLDnW177RheT0ogYkQLTg/lKBXGJw5OqPnaZBvaHWibA==
X-Received: by 2002:a05:6402:2755:b0:5b4:fa3c:d9ab with SMTP id 4fb4d7f45d1cf-5bbb2234971mr1842865a12.23.1723126285743;
        Thu, 08 Aug 2024 07:11:25 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bbb2c29f79sm671761a12.33.2024.08.08.07.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:11:25 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 15:11:33 +0100
Subject: [PATCH v5 19/20] clk: imx: imx93: drop call to
 imx_register_uart_clocks()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-gs101-non-essential-clocks-2-v5-19-11cffef0634e@linaro.org>
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
 drivers/clk/imx/clk-imx93.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx93.c b/drivers/clk/imx/clk-imx93.c
index c6a9bc8ecc1f..9b8006b15d0c 100644
--- a/drivers/clk/imx/clk-imx93.c
+++ b/drivers/clk/imx/clk-imx93.c
@@ -343,8 +343,6 @@ static int imx93_clocks_probe(struct platform_device *pdev)
 		goto unregister_hws;
 	}
 
-	imx_register_uart_clocks();
-
 	return 0;
 
 unregister_hws:

-- 
2.46.0.rc2.264.g509ed76dc8-goog

