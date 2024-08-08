Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3335518E778
	for <linux-samsung-soc@vger.kernel.org>; Thu,  8 Aug 2024 14:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723126283; cv=none; b=jfK3rF9uJ4rCZC0s5bchyww0bpl1FhMx3z+YXDlos7EVcjAyEtXh4AS53pvNB+JNrRX7tBSmu0dZGhuJOKOM/a9ciIXkfSO/hHIK58Ga1Pm1/2vlJbhh/xyXdQ1P0w3LVtAvYjRem93P5QmRlMoL9gfLCwP7xWkQU4lUa8Poo/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723126283; c=relaxed/simple;
	bh=HMlBx4X05JcRgo1zDJUFrZT9TkayrN7B5twwxpWIidA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=daeZRrFkARYXdFUhsWuwc0FJfCDo22OdW9CNEGYqJH2Gc6Z9ZOOxTFy9JX/nl3KZ8CzekRvSyd9yIQWF8oHtIqPQAZGDIbZNi/XGZhgp+XWa/Q6tjAXXp1VVCtWovzV7PccDT1RUBKx14ZK9fdEsel0/gLWuzdyKbPfX6Pn3cHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uW1qNov4; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uW1qNov4"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2f032cb782dso10595531fa.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 Aug 2024 07:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723126279; x=1723731079; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y9to+L9bTdGJqYL9Sfh+XmsCrqySZTcdIgL2IwvTZdM=;
        b=uW1qNov4kVM0YttB+lNOY7nFWL4CHKNC35/ruUwX6Cfpq0k+PRnu6WEbcjWl+t8DHg
         cEM6I9nrDuKkZPbn4H/lJhJVjXfJg2l0s6gWXauMTiEkLjS3Ptt4GWrc6v1iBCN8hMyU
         r8IHwWJoqspYROfcFHg80ATkjZIHLPY9Tx0/RDGTOlyRr9HmKce0QghWL0RebHOYCXYo
         ka0tbrAc5aeHAgwWQDqFlkGnfI9gmLX5wMjkb12dPtDKuzeFxekfnSUws1r+IP7p2CpQ
         BjeeCICetfmBUa46EAF2w92nGtETp1nJ5kpFgkDZzB7++zSXvqFh5KjV7XWSqLPT8x4g
         kKVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723126279; x=1723731079;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y9to+L9bTdGJqYL9Sfh+XmsCrqySZTcdIgL2IwvTZdM=;
        b=Lzzr9GSBqweAbr3lJoIze3bgjDyYYVaMg3l2QDWPaFKAZHTosR3gCNeqDb5Au727c3
         y62P53zPz1LiQX3njn3ev4oYOGMJId0jzuQX9bUpQ2a1ifpBtabiTnY5XJHrbuHddw65
         Wsw042gpACkU1SVmw99uLo+lZ8WQaSGw13MFNpUczKt/yUWXL1S0nx3vJnK0IEek0Hbw
         6GbCZ7ePjFIIZZ0GYt3GeKeQ/y+PrMouA2fgfTJ8OjLIlHClQqQjMwz7IsCznfbDGX6b
         sZgkkcd8UmT4RnuFldpGeeGSH4uLCDKYeutnauL/pWE1TPWKEorym26deplE4B+YsRtX
         tiKQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6cM5ZHkGp+FepOFldx8rRaBvxhSJ8oW5LRrdYmCyT8+HVhTdmbGqj85qEvDPxU//E4rpG+durn1DzYI3o/HE5GCHIEpFp0rog74lGwTrRiGQ=
X-Gm-Message-State: AOJu0YzytNtDoOCHW5UeBSt2jGRaXTIUCsyZ7Qmx7ZL5hPIeJEt71edO
	6/m0Gn+KfYat9al3ikkTeqQYgkZGt8aU9yddVdHaWokA0Rnnuh1s87JxVvMCpO4=
X-Google-Smtp-Source: AGHT+IGWH0S/ei/y1WthSRTTdpDm06f1SlUXQDUywXr6T6gJBaiJZrXYiF4RkJwrM9dehhv/LYiJsw==
X-Received: by 2002:a2e:7009:0:b0:2f1:597b:9aa4 with SMTP id 38308e7fff4ca-2f19de63496mr13785151fa.35.1723126279118;
        Thu, 08 Aug 2024 07:11:19 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bbb2c29f79sm671761a12.33.2024.08.08.07.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:11:18 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 15:11:19 +0100
Subject: [PATCH v5 05/20] clk: imx: imx35: drop call to
 imx_register_uart_clocks()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-gs101-non-essential-clocks-2-v5-5-11cffef0634e@linaro.org>
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
 drivers/clk/imx/clk-imx35.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx35.c b/drivers/clk/imx/clk-imx35.c
index 3b6fdb4e0be7..00355a187340 100644
--- a/drivers/clk/imx/clk-imx35.c
+++ b/drivers/clk/imx/clk-imx35.c
@@ -234,8 +234,6 @@ static void __init _mx35_clocks_init(void)
 	 */
 	clk_prepare_enable(clk[scc_gate]);
 
-	imx_register_uart_clocks();
-
 	imx_print_silicon_rev("i.MX35", mx35_revision());
 }
 

-- 
2.46.0.rc2.264.g509ed76dc8-goog

