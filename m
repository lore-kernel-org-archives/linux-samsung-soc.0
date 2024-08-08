Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657CC18EFF8
	for <linux-samsung-soc@vger.kernel.org>; Thu,  8 Aug 2024 14:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723128176; cv=none; b=thG4ZUxTU4SYDCigFkd0YP2bZfOIMizO8SxN1FEuFGkrcWD6qH9RHYo8aASNek7hNHA1EHMyF9L3u41TM5+kHWMEkZHKandVuC4st4y1u4fbj5IRkwvLjTllgXnBGz0Xtb0g4SU23TENr+pZ4Pa/bVvbDtUGxyWZqttP1lnmgzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723128176; c=relaxed/simple;
	bh=BM5NOBExieRXZnAEQvVUw0Kowl8OGVo6wjlq8o0hJrA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sp9bpuOoNEg+ukIyPcGUgvdld9XwaOLlnJEThHXazdSkGW/4r6Pbx2LMlAzqUaJ9sX8qKTrKeioaalfs4myNqqW9U2WtYv8YGB/y8fTTHCDE7+2TFbRtg75DUYtHw7saP3YcYl1tNxq6VA8k7EAFfMpOhfl7kVXQ9t6HbK881XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WHxOeBfq; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WHxOeBfq"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5b7b6a30454so1324359a12.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 Aug 2024 07:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723128171; x=1723732971; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b0KZBbN+nQ1FI8ntFiIPj9qlGXoBaHjCw819hVXcAjw=;
        b=WHxOeBfqZmge0Tl4Yxhvx/jGsE1skSe9UqCo9H4KqGg9WInZidCCRPLSYvgrPvIoIF
         DzlCaJt3aumEuNh0ulTwxflGqEGnQPpJaEtAIpJmZn1WYAOHMBW3sw6GLm834cXV05FE
         rVn0DPYyOKT2OpKCFAmjbVXVnCUMCw0wD3VSXxl8XQ50/LML+yTQJ1/Po1sj4/LUd2AZ
         1FF548tmiRxYm2cc6jAXWoVg7LGdSJHVI1CKAG36UlHD3Mb2DbfraelX0Tvcdp0xYHAP
         pl6r1A1YMRY5SPa0x23gAgApVL87yarBqPhLm1DAg10JoUQBXH393Xlb1ELATW226UU5
         NdVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723128171; x=1723732971;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b0KZBbN+nQ1FI8ntFiIPj9qlGXoBaHjCw819hVXcAjw=;
        b=hpk1Qxqj/d8f2LpqiypAIkhWDhdhIyv1DjrxP5xMM4ZVnMa1lyTuTE/cWAssAyemx8
         r+1T8g8fdwRi+wL10zPj0KJ6V+bth78IPYo5Oi1Z68Z+VHQdgMfB28ANeSsazkbWEhWL
         6LZSSbBPPqCFs3lVNv9XOKTzaVE4OFjN6JTxkzP3SLTdAzmxPrcHsJbdIo+0djIhdi4J
         oPDEmwIWp0RQluY1y8eQ5J0kuMRJxk0ERkJEZZ7M0EYvo5eMlY6CwHoUs3iMFircoGMu
         PuNS4q/VKzfZSYfxIjO085Aw8v+90zY7wmLBuN9tpaTMtZH/qmYoLo/sPoKFoeWE0ds5
         pcGA==
X-Forwarded-Encrypted: i=1; AJvYcCUtpGSF5VLJ1DDKCaa67RC9nbc5a30eaX4PgiJWitx9mJr6V5uUpfxRRYFUapbtTMlxC7qSdxBgoRKJPi4iAMzeQcYN7eNFwoFnfVjiBtW/xtI=
X-Gm-Message-State: AOJu0YyPIQwpLHLmUYMyBn5XzKtTlgH3b+cJxD3soqqsuEQ6Dh6R4vnH
	PFTSV7jqmK8WHcZG64bdUMa4AI1H14rhJsAcmjxq7X5rZF3vGdXVvGIsbOeyoDg=
X-Google-Smtp-Source: AGHT+IF92aQdvuypDx1fq+tYFY5OivN5JbCVt20C0ukwfaeiDnLswwfjXsSThMmHvMSzFV280ksHCw==
X-Received: by 2002:a17:907:f1da:b0:a77:f2c5:84b3 with SMTP id a640c23a62f3a-a8090c828b5mr152030366b.22.1723128170682;
        Thu, 08 Aug 2024 07:42:50 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9e80e04sm759298966b.175.2024.08.08.07.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:42:50 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 15:42:47 +0100
Subject: [PATCH v6 06/20] clk: imx: imx5: drop call to
 imx_register_uart_clocks()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-gs101-non-essential-clocks-2-v6-6-e91c537acedc@linaro.org>
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
 drivers/clk/imx/clk-imx5.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/clk/imx/clk-imx5.c b/drivers/clk/imx/clk-imx5.c
index b82044911603..163bed084a57 100644
--- a/drivers/clk/imx/clk-imx5.c
+++ b/drivers/clk/imx/clk-imx5.c
@@ -357,8 +357,6 @@ static void __init mx50_clocks_init(struct device_node *np)
 
 	r = clk_round_rate(clk[IMX5_CLK_USBOH3_PER_GATE], 54000000);
 	clk_set_rate(clk[IMX5_CLK_USBOH3_PER_GATE], r);
-
-	imx_register_uart_clocks();
 }
 CLK_OF_DECLARE(imx50_ccm, "fsl,imx50-ccm", mx50_clocks_init);
 
@@ -463,8 +461,6 @@ static void __init mx51_clocks_init(struct device_node *np)
 	val = readl(MXC_CCM_CLPCR);
 	val |= 1 << 23;
 	writel(val, MXC_CCM_CLPCR);
-
-	imx_register_uart_clocks();
 }
 CLK_OF_DECLARE(imx51_ccm, "fsl,imx51-ccm", mx51_clocks_init);
 
@@ -608,7 +604,5 @@ static void __init mx53_clocks_init(struct device_node *np)
 
 	r = clk_round_rate(clk[IMX5_CLK_USBOH3_PER_GATE], 54000000);
 	clk_set_rate(clk[IMX5_CLK_USBOH3_PER_GATE], r);
-
-	imx_register_uart_clocks();
 }
 CLK_OF_DECLARE(imx53_ccm, "fsl,imx53-ccm", mx53_clocks_init);

-- 
2.46.0.rc2.264.g509ed76dc8-goog

