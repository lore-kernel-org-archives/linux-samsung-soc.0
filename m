Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6079118EFF3
	for <linux-samsung-soc@vger.kernel.org>; Thu,  8 Aug 2024 14:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723126286; cv=none; b=PrqyjVEYzCQ0vjsiQrizwsEjRFFHSPQ220Jfo4FklQdC8ZFLIISo2VrFltwuGh6DgAgmAP33gTTTuKeU8/fhNwx16IxJAOh6/xWPbSyTyuSNTZ6dV0htvKiio6P/jBLo7mE9CS3PQdGRCDVr1EwdPrI2F0Hvy4fjz6lDoKMPd10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723126286; c=relaxed/simple;
	bh=Aa36Al+8XL+o6jnCRaXGcn3QPeSfqDekEcFkrR4ZXoI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W4kDhg8oirmSc+VRtjGhP1YfYqNUcNmqxFEgi2TYPqIp1TNf4JMMTYQOxoTBgYCmGB9qmkZqz0z/wdFJskKnUd704mn3XgwqSqaV3RyauxPYJwpv/OjTbpdaBccZ6BpZU+F8UAemJZHSwA4nKxTmZpWn5/tZBieL4MEWyOWbHpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g878ehHe; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g878ehHe"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5b7b6a30454so1276639a12.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 Aug 2024 07:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723126282; x=1723731082; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xSaLptLfozVkUpjw1oRI9Gwlbl43zWvMUP09a2upKVw=;
        b=g878ehHeqPePtuknGc5aguvKTeTjva2DbOcSfXFHvjvAz+9E3/QIHoOklIhp8YIm70
         OCIJ+XIr/sPQbjGnnJW3FslUlm7fu/aEi6BUF33cjJhoAnKxtHhYOJHeapq8vnQI+Ix9
         3NVYyYAnloSaua83gY9lvcGOHU57zCwcJld6wlmZcYtmKXBlHzsQC9wVUPMVo7edfAT3
         ujH5VD99HKzuori4rESja4SnIVnFnOrvYBBFQslxOhZ2kX5RqS3JoG9hg3Zgt1J0Dtph
         1UpofE14cMTg4SsMf9xkDDsNHfrfqFtVQRkATRbYTRw3MwUVYeFCLiB2c3UAYb7cq19o
         sBew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723126282; x=1723731082;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xSaLptLfozVkUpjw1oRI9Gwlbl43zWvMUP09a2upKVw=;
        b=TyHlycs8B4jYBD6PmL/LCV2G4rrCZn1VvUPfhjRsMVsMCACCftOVNO8RwEnEmIaKai
         /E0lcJspq8RKY+Hhm7CRwxERqDFDjcWdsToFVf876mlXNevx+vnDzBIL5u974HIwS5d6
         Uk5WH7xijE7HEDOvrHnV7vGtMkiC8kD25VD/42/PJE5z55deIHNM82FVvGy/gZRZyZn1
         GtQAGexxTO0Zrs6OAXtviRou0BmxH1jgj1dOwiJG62/Yspl8S6eylgWInQDeglDFbfzc
         fCCXyaz4hTQFTjz9Brh1SNwFFBpUL8IHgsAxdOLTKAcUWsGGqRMEjFaixfbdCvetN9Qn
         KDQw==
X-Forwarded-Encrypted: i=1; AJvYcCXQJAA5iisSv4OW4LMTp1ve58D/HFOgEghRAS8oQknuS6fjNij+vBmtMytZ9UDmXkop5JezmiG/coQIYklJoRHrhvvuxSuf01yZU2YNZez6OIY=
X-Gm-Message-State: AOJu0Yxhc39H0t4B0eiS6ajrlMG2KY4QPsglTf6trC3O4XEg//uGMzyu
	qcFKJEqcOgwvnIRfQjwiAor4kOSHK0EPBHMMukRAN6lF5C1ijSWWAIhOUL+MYrc=
X-Google-Smtp-Source: AGHT+IEfS7LGmhzwOfvg0WuiGG6clp5qzEGX5Jeh5uDmvlBV96anV1MuY8BGYSssk+Dyt3tkyKIdwQ==
X-Received: by 2002:a05:6402:3484:b0:5a7:464a:ac0 with SMTP id 4fb4d7f45d1cf-5bbb21bdde4mr1617742a12.11.1723126281574;
        Thu, 08 Aug 2024 07:11:21 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bbb2c29f79sm671761a12.33.2024.08.08.07.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:11:21 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 15:11:24 +0100
Subject: [PATCH v5 10/20] clk: imx: imx6sx: drop call to
 imx_register_uart_clocks()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-gs101-non-essential-clocks-2-v5-10-11cffef0634e@linaro.org>
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
 drivers/clk/imx/clk-imx6sx.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx6sx.c b/drivers/clk/imx/clk-imx6sx.c
index 69f8f6f9ca49..4e42e30245b3 100644
--- a/drivers/clk/imx/clk-imx6sx.c
+++ b/drivers/clk/imx/clk-imx6sx.c
@@ -555,7 +555,5 @@ static void __init imx6sx_clocks_init(struct device_node *ccm_node)
 
 	clk_set_parent(hws[IMX6SX_CLK_QSPI1_SEL]->clk, hws[IMX6SX_CLK_PLL2_BUS]->clk);
 	clk_set_parent(hws[IMX6SX_CLK_QSPI2_SEL]->clk, hws[IMX6SX_CLK_PLL2_BUS]->clk);
-
-	imx_register_uart_clocks();
 }
 CLK_OF_DECLARE(imx6sx, "fsl,imx6sx-ccm", imx6sx_clocks_init);

-- 
2.46.0.rc2.264.g509ed76dc8-goog

