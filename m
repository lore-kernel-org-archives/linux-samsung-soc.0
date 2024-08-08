Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A7C18EFDF
	for <linux-samsung-soc@vger.kernel.org>; Thu,  8 Aug 2024 14:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723128173; cv=none; b=QaHJPnyohkTIJ/5OiJIwt9rLv5nlyxOHXW89NCvpCAZe0U4IF5UtAaDBt/06Ed8vyzEAjwu/WfmJnNwMKyJ0vB0jePHxk/4cbEjVpQeVgyd46EdIBj+f6u0DowHyVFRlM5xq5Y7+8JL8ReP5p/rLqChQhI+SFzTUmeMrDeQq7lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723128173; c=relaxed/simple;
	bh=0YLrrUzUpbGAZRD9K0JKJsJf0lqzpBPah1/3yREgZxU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kmUtN0bROcCd3R+QT7dSeyT9Cf90Z6/QYS53U00uSvapv9aDaB5sStT9oTCsijbqVmFy+XeNZdL94CW9MjcHMmIajSXEiFuJOeYTGF5ljT33/XwDwc2Xhd8W1VxbffVkjBwo2UDcpRiSrpGV9uWXN6ptBMFF0J6C2GIKzcT6QQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Hwbb9Dan; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hwbb9Dan"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52f00ad303aso1323458e87.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 Aug 2024 07:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723128169; x=1723732969; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TUt9AGf6xrjDYDkMTJVYo9C6PTxCMU+FJu9o1lmsxnc=;
        b=Hwbb9Dan75BoSa9jknes5rxenip63c4HitAZpz6fNojoTt3fy3xCjr2LHYjWDNopL0
         BvCdJUxV904KGIhBfjvmrxcF1fFrU9vWxxqFCmBV6tp9OukICuJHOhfWTzrlL8e38wm+
         s+LwnR5ssS0pycQCkP/0eCJEb1pvYOjZklbtMYeF4LbUQ3B64FbQDfdNkPolTr2BCc1O
         0h6il8qA0sVuc0vsOAeht66aAIIe2BzOqVWpKuDPKSICuPMJ4Ym3/LdXTHIbzqOvM5wU
         +XWEV6ZBFtYeypsK4QS6TimXQef9ZicVh2IWSZiyu+OFKykh5+PIDAvEWLhCsuFrKBiY
         IyXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723128169; x=1723732969;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TUt9AGf6xrjDYDkMTJVYo9C6PTxCMU+FJu9o1lmsxnc=;
        b=HRmucJunEcynYe8658U1Ga2RBqR73l1Ub2PVXE8zPag9xZMXemvgw/HbnKJ7dpcCWY
         hnBBaEDb+vO/dZTDatLfpJMqWux6Jso5ijjHZvzarIpVRFBt9d3XpdxtSxlR+LBMh6Yq
         GuefT5cfwQFBHt4eQ0Gw4PzK02wg4X7t6TjO6dAEUKXq8hNG6k9hHhugGwV7+NM561Td
         C/wj/8SZqrj5R2RWcJtXhvQIJtiYFuBs4iVWZOinjd7PGYAAzbT4FfFiuZP52xeHz8qx
         Y3AIgUInx2EC3tDwtAP3F6KwHb7k++40YgyIiupACbwysnM4FWzvvQNts5y77DKVF1v0
         SZOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSF3RugYThnE8t5g2CWwpWUK8lwtOtUMZPQnddYu+dhZCIXnRH7vGamaWnz9ByBMyyK4ZA8BmAUjJrHOItedi4WqaqCwFzx+Yolz3w83Id4PU=
X-Gm-Message-State: AOJu0YwW0ZaejmtVtnZanZKi7Gj5LIPU+vTnGX1atrv89ZkQ51ZptxZJ
	fTOjCuCzZB3D879BK14PVQmImfSV9FbDIfDCieCp/p8eqkw2/9WXllzB5Hoc7Ms=
X-Google-Smtp-Source: AGHT+IFY8t3FAEwa8bV86t3VKFqYi3dhhpoYWLQbdgyWVvZM0O1V5zSZUI8DcqEFM5UreIQyHwReEw==
X-Received: by 2002:a05:6512:3d29:b0:52c:dc6f:75a3 with SMTP id 2adb3069b0e04-530e588cd22mr1710500e87.40.1723128169168;
        Thu, 08 Aug 2024 07:42:49 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9e80e04sm759298966b.175.2024.08.08.07.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:42:48 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 15:42:44 +0100
Subject: [PATCH v6 03/20] clk: imx: imx25: drop call to
 imx_register_uart_clocks()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-gs101-non-essential-clocks-2-v6-3-e91c537acedc@linaro.org>
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
 drivers/clk/imx/clk-imx25.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx25.c b/drivers/clk/imx/clk-imx25.c
index c566be848c2d..0474778f988f 100644
--- a/drivers/clk/imx/clk-imx25.c
+++ b/drivers/clk/imx/clk-imx25.c
@@ -219,8 +219,6 @@ static void __init __mx25_clocks_init(void __iomem *ccm_base)
 	 */
 	clk_set_parent(clk[cko_sel], clk[ipg]);
 
-	imx_register_uart_clocks();
-
 	imx_print_silicon_rev("i.MX25", mx25_revision());
 }
 

-- 
2.46.0.rc2.264.g509ed76dc8-goog

