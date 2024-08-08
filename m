Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592BA18EFD8
	for <linux-samsung-soc@vger.kernel.org>; Thu,  8 Aug 2024 14:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723126288; cv=none; b=s+Y8rvSY9xtp3cjjeRpM9tKhrxirJWUYvAkYj3vjjDOH+lam2xzKCqDip5f2EqRf4VRrdATCIDC7gs9lkWz5O8s25ONFvBBsddyGH+QW6O9Fmv+oFDM6O0DmfD67DO6pPNsKV2QSlKbQS0/5aXH8AAsw7zfctk/8yPjgOnUrtbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723126288; c=relaxed/simple;
	bh=gR0CyM9a7lgnJr3lEM9JUrDdLahkhfxbkDJhWgDwKZg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=myVpdWk+bsarg1evSL19ungWRFUvItCVjiSl3T5fJrJpagdGWLsJk/8UbVUteF6IAHCsuqa8prRyj6wvW9XXdNi26PqCRHigdtLG0l8Sa5c0crYEiwFLTgcrRoJegwCFfNjeX+dG1ilbYOjboMGIilLRQmlgnOKtdAH3VHCypd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=en27hXIR; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="en27hXIR"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5af51684d52so1209054a12.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 Aug 2024 07:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723126280; x=1723731080; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l83L9SwgjM7cQs40Ix45OsltdwbTgmJEPf1zQuQtrko=;
        b=en27hXIRhMA5daFt2gmE4HTs0Wo+icyc7KaojLz4wzRFwCItEm2ysP528zn+FIKcPl
         +HtiOzbnVEvtJUeiHcty6uLgtM3dCXvChjsQyfmVNnUikHjw9W3SYfyRq61D3UbDR07P
         EYjwMmALmFE/w4HWsbLP+ILYyFC5RilJtOWMrQCJY9e+36TcAIUt8yMjSXkw6vROBEpe
         M204yZCS9v9fNVa/pQAFKz3d8C7jzsWNS1rkJWmIfX5BL5Qxfj3lj6V+J8C4v0TwbRgY
         dYWTtvC3x8SjSAtoB5oZwMDSt2dd3Q8FuPCwpsPaMSYvBDSGWfvEKU0PyYTYc0lFf5zT
         iZYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723126280; x=1723731080;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l83L9SwgjM7cQs40Ix45OsltdwbTgmJEPf1zQuQtrko=;
        b=MFxJ7XUkk52H8ZZc4yBI5ED9AEgkd06vafMt7kx9yyvJ6YxBp9nCUSDmGlyZbkdKLF
         x0sIJC2c5dygkq7+3osHabI9C6e99XXI4i0L8lXpJJF3qVVhy2YGaKGAZ8CJ15ZS3WcE
         BrneQdKKHLDzcnlrOxrltcyiLsxPgWYHz7hY6JL/eF4nnsqhVHH9q8tbodXUfavl82+f
         hr2ElWPIcKpURkRWRw3H+lfcOwdVZ1xxMXh1oo9QkRMM7ODjEvZj/rVcYY+J6X/vFfia
         PyxzL+dNqr4toHrHLZPr1bL9L05s6NZ8NZRLBcpeGBfjQgmOb9/O7c7pUui7kmMt6Iii
         9Nug==
X-Forwarded-Encrypted: i=1; AJvYcCV8DfrkKkvgO+23a4edatRYRPwarWqmieiSRakdJrBV9hHxIP3NiONa0lvYbvyqWaFQqW9eOmz0nz31z9HptvdNa1cTGh9w/tCwCimQOi9Nb4I=
X-Gm-Message-State: AOJu0Yx8WF2eHJtwzjGSZAR0xdjm7HDdDJYrl/m0SAa4UdXMNiynzELq
	cA9SriQrq6XG6KbdeJVRJhnSFSVd7hZK/H+zESN0nxONFFWJQgFeutj1YTWXDVs=
X-Google-Smtp-Source: AGHT+IHHbEYfKvz99NCzEnYTqfn7cB+94G7FgbH5KFNqsiOTBHtM9BvVoArHK526vLwSDjCHbxrRMA==
X-Received: by 2002:a05:6402:27d3:b0:5a7:48de:deb7 with SMTP id 4fb4d7f45d1cf-5bbb21a4daemr1489870a12.14.1723126280575;
        Thu, 08 Aug 2024 07:11:20 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bbb2c29f79sm671761a12.33.2024.08.08.07.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:11:20 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 15:11:22 +0100
Subject: [PATCH v5 08/20] clk: imx: imx6sl: drop call to
 imx_register_uart_clocks()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-gs101-non-essential-clocks-2-v5-8-11cffef0634e@linaro.org>
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

