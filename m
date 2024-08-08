Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E66719005D
	for <linux-samsung-soc@vger.kernel.org>; Thu,  8 Aug 2024 14:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723128182; cv=none; b=JxzdoHEj3qOERLIBBHXrHc9yJ3Pc7FLnYj1My1Tt3bohWQT4wfF/8Hq77DsHtU14SZ+E1/dTfVy5e/C4BA5Os9jjgj/sjhQKAjRitsAtObKyZPSUm8HhxNmBudlfWUetj6rkw2GJ8U3YyGfLbENrv/3tTfsSOIsMridrHvbWQ54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723128182; c=relaxed/simple;
	bh=3MuovDtIRZorURIU9tYKQJVq47VGHfGnfR9ISQ9xJW8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MrmQFvX/7Iezwu4FWytBae+IL0fX1HWigoXjusl/p+lAP1xrUkLbOGMByUjmSHuy00H5vcjd9Ch6B+4AmhNH63yO5yfHf2VNHmGJWjswPaNDeCU1u37M7ef9OmuKjN1+76UvOM3dNPrbrIITqsEpht/JPCqhchTIDgvllJ4sonw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mxnuzTGD; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mxnuzTGD"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a7ab76558a9so158711566b.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 Aug 2024 07:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723128177; x=1723732977; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EZspTtdY5QAEUSn7UgNMVbYIWDm0rZtsqchGrqjMzsE=;
        b=mxnuzTGDiigYZua/xLBvyxa1x7N4KSbrsGQb7mN1+Kxbbq4CMNB7qtuG4SfmmIHjHJ
         gl4Yqf2EgggyiY7KkXqMQWG4TQ1Zh8sVZzGb+LTZ3qbXH6/twvAgsR0KbItU0fPwH0AG
         janONPeA7hgsnHFx4Kb/8UNqGf7WY7rBL41ovduP5984hkCLt2g9BPgxGi3O/tdwP3RM
         jGPt8X2SSis7B2rYthAEsu6JGG1YzD3bios50STX2W3Pj+Uwa8kMUXrQp7kw+Muaxkz3
         FlTbyXE+6tdi/rS7s9XBrG2wzB9ZiCuVQPUbRwRLD6QsT87TRbE/wq2/XYMEDHxzNdIe
         wvBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723128177; x=1723732977;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EZspTtdY5QAEUSn7UgNMVbYIWDm0rZtsqchGrqjMzsE=;
        b=i05EpN1Q4zAUGE5ShjP/c1kPR2nJWsweFkPgbyl/3MInr+CianBqo4SB4KyBXwSe8Z
         bVnjbfrG24tJmETgNUP43og2cE36M3jjGB9WH5iNxGoa1xMWAb2YNGtGf06BssLRojew
         AEWZDk6ISmPmYib+JiuLa8UZSaG68Hog72ilg7aqe4NUVB+5pmHfopQwSU0RfoF+4AOR
         VyzqF1rOeWE94vp6cIYbyimlXI7QGBprQDQKoGriW2x1DxjITm/1NjnBLquM7agbl6bz
         99c/cTSes99Adf3hTv+byjuiIA9O/qc0Dh9u8iw6Fk0E8uxV7NZSgv6QmrfvuL4IwNID
         2Hsw==
X-Forwarded-Encrypted: i=1; AJvYcCVkWlxT2qJxunfJQv8octpfW1fWOW2e8UtxyBKUV9xtbqO58MtsuJKuid7crP4mMCFy74YJ/iFNg+SeRa388BMdkT2PPISExvtLBm7+QtD0HMQ=
X-Gm-Message-State: AOJu0Yx00uU+6G7/lvYOJ4jSE3dTRfsVMEDbbVpXM2aJuoixh59mRqGg
	aBRltNcfSVhgz4r8VHFhgK6A6e2MPpOEkxkeqnBFTSvRCy+813D/vZ6xJzwmoL7Gcr4TPdWTzTv
	/WorWcA==
X-Google-Smtp-Source: AGHT+IE7R8B3T4fgiuoLqDk3xF7+I+3kP37bpToSGsITYor/oRfOoUboQm8qOJh9YQr2roRMF9fkPA==
X-Received: by 2002:a17:907:8692:b0:a7c:d284:4f1d with SMTP id a640c23a62f3a-a8091fd825emr175510066b.28.1723128176714;
        Thu, 08 Aug 2024 07:42:56 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9e80e04sm759298966b.175.2024.08.08.07.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:42:56 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 15:42:59 +0100
Subject: [PATCH v6 18/20] clk: imx: imx8ulp: drop call to
 imx_register_uart_clocks()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-gs101-non-essential-clocks-2-v6-18-e91c537acedc@linaro.org>
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

