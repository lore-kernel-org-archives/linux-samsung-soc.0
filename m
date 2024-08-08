Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB35E18EFEB
	for <linux-samsung-soc@vger.kernel.org>; Thu,  8 Aug 2024 14:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723128175; cv=none; b=lb53rCHkWzESA94pxAA9baCKF4xOFjrnZXLcd200jZ/kYzwBZ8nym8nxt5Qel1ZWDRIANFa3aMV5MPngJ33eHLgBgPd8JJplJzNv1IHbN3Rgxb59M+wqgq/TMDojzh2jRXslTQA2zp5X5JuaPaJ/mYHzE9XJwXiRQm0bG5qXINM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723128175; c=relaxed/simple;
	bh=F85JnWhsga2fKjX8ofqy8VS4HE5CVI70avGh7w8r0jU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SdATtWG2W+YhSYb6DY4zsUHdwIQkNNmXyFmB4oygJlcUniBrSQdaMru1clTOUu0PAWSdTftXuDKlbEULaX0UqvYdGNdc9PiXtLaj7p2bbpyhY2c0NtxGcuWc/5R1Pag1nPgSG12hLYtvX1GAoslhKtNcpm/7bOAoRqH3AnQDTFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IhZQqbUH; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IhZQqbUH"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2f16d2f2b68so14542081fa.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 Aug 2024 07:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723128170; x=1723732970; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CR2/Ipvc98fbygDSdyGUwyP4a+VA03w16ijfH8oQ9sU=;
        b=IhZQqbUHqcGR57MmU5iKSugIZTAH+uUYtj8UIV713PKpX9rcIHYsCPdS9PxoatapaS
         F3b2ZpND5ehaCV7OR8qZLve7Y/Iqd3NvV4BPE8HNTTEcsuk3VDcp+CpbvO/rlphZRJ1I
         KWUVZqJ3N3VCBmO6J+LmgZOVKyylf/ZtWCpXs3iyvwpoj9pGF+Gb5WUwBT+eERZkQr8t
         UKGIDRMZTVn9t7EURDazqBrLI5FhNrrR9Z+sb0SI0ncRKi6xfMnShzFZOFgkMgBwqXbg
         2/xEWJjOD0lMCy6uTatUYWU9eINBVapona7pmvNXpIB+MveKRV5x/M050kr0h5n/E7TA
         FtdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723128170; x=1723732970;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CR2/Ipvc98fbygDSdyGUwyP4a+VA03w16ijfH8oQ9sU=;
        b=W1AoymrDIiH8EwGxLHkNEvTp/LH6V1/HHS0lbyMVsNFpPIBfJht3HnSst9dmrnb/iK
         i0cflQRtosGKZ6emuTtjDu4Hm2/jvwFI9UeOyywZiqs1AkSfAFTtNFXlSf8RfRjlf+7P
         isxaG+tR5nBhspDcTFdrLFNssfxGuXNmaCqBa9ec9uWtKZPA/w4byZVaVP2W6TJ1sDRB
         PtRBNvcfA5rkABkvl+UnSGspfYeXocEXiL0ksfeVtN35P6KqlBdQ+Qe0V1MnUvRIktD6
         uYsx/wysOYi86jNBufIkh3aJzNcCI9zQEXPE4qCswzqDz+GkbIr7Ni3OPRybdF3yKbds
         SGhg==
X-Forwarded-Encrypted: i=1; AJvYcCUJ+0nr7AETTCoX48DA0gcw3eCcSEShIjhQJ9AAY5sAjvzhIkaELYgJUGzFzG6irwIldzJApFaK8CT+9SKeN2qQDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLVwZFQ7sATvGu3iulkJI/vG6PxDWy4Kljiz0n43yZ6lP3PaNP
	eiKwd48uATDZM+loXshVP9ZlfMugeW883pvvg9IsJYLTVpQSkGilGZjeAPjA8ho=
X-Google-Smtp-Source: AGHT+IEa8lUG5PUwt8CAXfqOk3wGRaLOx10UCEmHtPBg+F4Hg/YBNadhRZneaPV+k6P/U8cOdJlD3A==
X-Received: by 2002:a2e:4602:0:b0:2ef:2905:f36d with SMTP id 38308e7fff4ca-2f19de2c724mr15068821fa.16.1723128169710;
        Thu, 08 Aug 2024 07:42:49 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9e80e04sm759298966b.175.2024.08.08.07.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:42:49 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 15:42:45 +0100
Subject: [PATCH v6 04/20] clk: imx: imx27: drop call to
 imx_register_uart_clocks()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-gs101-non-essential-clocks-2-v6-4-e91c537acedc@linaro.org>
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
 drivers/clk/imx/clk-imx27.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx27.c b/drivers/clk/imx/clk-imx27.c
index 99618ded0939..53018e80ca51 100644
--- a/drivers/clk/imx/clk-imx27.c
+++ b/drivers/clk/imx/clk-imx27.c
@@ -164,8 +164,6 @@ static void __init _mx27_clocks_init(unsigned long fref)
 
 	clk_prepare_enable(clk[IMX27_CLK_EMI_AHB_GATE]);
 
-	imx_register_uart_clocks();
-
 	imx_print_silicon_rev("i.MX27", mx27_revision());
 }
 

-- 
2.46.0.rc2.264.g509ed76dc8-goog

