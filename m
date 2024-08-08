Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAAE618F2E3
	for <linux-samsung-soc@vger.kernel.org>; Thu,  8 Aug 2024 14:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723128179; cv=none; b=m0HPBR9EElR+3+099EpiLvpKfnRwAnYutnYXfOG//AbJY2foE1Kc9LBYCMgGTBvQqZp1XJ4So345MVfZWc5ShulP7snrEh4ltxYblijbSyIWAuCjRvWWhRYmjrY3KUMuF48PXEoysBCGR8wLBU7XSjXlr4O4XOsyRX4/jC5aANA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723128179; c=relaxed/simple;
	bh=1ir13MZl0az/9cRAPNM2xtHw/7Fiznd6AQuTHA91Vq8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aYrRLcNjKLvk0NH0ZzjqwRArORmwjNWfk7klp+cgxpk9AuPe+K7AekjDfwcwJryTvAkYYAOi2R0XZelcjgId3yuRnnL4jxsgdKntDkJr3gaNhspizitNG4K2HvLaFv0UpARdzpHN42BSFEGLvSbXLuNbllbyzO/IVijgWuz0tqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MGyJfXU9; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MGyJfXU9"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5b8c2a611adso1401738a12.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 Aug 2024 07:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723128175; x=1723732975; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y1g12t0G6k+jblt/poXm1qsZh457ASaKEWb3Du9DwTI=;
        b=MGyJfXU9yClvXIacDKZqOCQ65/UWleygTiq5h6GcDklsIaAaD0ctuJzsejnLXF/mrx
         o8xvAjnIzMocXKvSUD4/3p7hpJrWzN7U6gfJTGmc64NW+00tY+z4GcAE+17td7vqqsh8
         /yp0tOPsI93XQZBQOl+sYmgRrVep0tIMDXzADLaPF7l2H0mo5OCMrfDfYCUulAI07ZWe
         bnEYuqG7acSahnGyiQpnbQliEMFMB8XldUW9mQwRWJSNpfWvLRoARbEppcSvi1we8Rav
         fDiGFzpdjrZu+zxjgJ4T+Df0DVEns4SkUpix2cOd/2FhYfwOkoCauwGRCTDVBg/aCCOb
         RJ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723128175; x=1723732975;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y1g12t0G6k+jblt/poXm1qsZh457ASaKEWb3Du9DwTI=;
        b=L6LBCIhUQG/FqTOhIwgzMzXFT64pCxomlcRa/zd4/n0btBPACmruLOAg0lXMAcJl5c
         6FRi+R7reIEvtxx9L4eI/aElkTz+ZSYhyMra66PVTy2EBmJOC0vs7BtEJ8KRbqNajMm0
         gOdvrhd6v+y4v/ENRv6OBSplGY56W9dn4sEZ3E024EW+A0scbl0mnWRnbLtw2Wcse4Vb
         QJ+12k7xZlwHPcsCfbSu7Fd7U/hyBguwmDFvDCoSvnoMjAaWbToGEC78z+7xQ08BWyt9
         b9LEPoi3J4f+DPBf65xNAZmChyNBvuGLkjHt/hxrP12H/80xEjdWp45JMqmkQ4bdglLZ
         UOwg==
X-Forwarded-Encrypted: i=1; AJvYcCU5zY37AZTssZdPwkw6dQrEZlzOOu2tou9DNxdtp1+IKcB55LsungJbcqDbTR1kJm3Y/m6bXyQhERvqBTFeV54Qf62wiusNHYsThh+sgfAqV4Q=
X-Gm-Message-State: AOJu0YxA9RERprX7g5xKGGt6Peiy/K518MmWiSYVFJLj6LXn6K0zjzOL
	uGhIejnPqtHmK9Z+GcsqeX+zsLZjZBCSOqGHjEGOXcirXBRCkm9G6DGNOoStHUo=
X-Google-Smtp-Source: AGHT+IGAVsFCrxEa0nQ5OTtx9phtXWv1jG1gQdi9l9rawdN91kA1XKHVuXOiSginDsSrGNiBP3l5gA==
X-Received: by 2002:a17:907:c8a0:b0:a7a:83f8:cfd2 with SMTP id a640c23a62f3a-a8090c68ad0mr142902266b.17.1723128175026;
        Thu, 08 Aug 2024 07:42:55 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9e80e04sm759298966b.175.2024.08.08.07.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:42:54 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 15:42:55 +0100
Subject: [PATCH v6 14/20] clk: imx: imx8mm: drop call to
 imx_register_uart_clocks()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-gs101-non-essential-clocks-2-v6-14-e91c537acedc@linaro.org>
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

