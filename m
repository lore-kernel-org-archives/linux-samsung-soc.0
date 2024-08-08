Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8045018FDB2
	for <linux-samsung-soc@vger.kernel.org>; Thu,  8 Aug 2024 14:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723128179; cv=none; b=HbEJRr/yq4FXXid3Pdbk4ok8hSYfMR6c/9G2kABFGKGeUzeRCVVeQ3hrNZWe8dE3waQixcGRgcqQ0W0REOKCRMseewBgPmv4nbyML3d1vg1b2klZByStMerYs5uj5UBX5aOXZo3qaMPcq34kCivgI87nnXz2zWnb7JLzMIHVTXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723128179; c=relaxed/simple;
	bh=dtBXWxh6pEv7DtMPsjNa6bKadgnceb0rxD2xntEHe8Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i1L9u7uz+961iLmp8aq1CERPT7G/x60Oos9NTq7kylXyZ9zNYAK88ELCJAO+3zLL9l/tDyfoWBjDJvzKYS7owqpMHMO1KbOuxe7Y0ffG6DMxenTyaFEojPVEfzn767J/DKZ27rBjm+jeOMyz79ak9dFBl8udMy91/X99B/aIVyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xS/BSQ4x; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xS/BSQ4x"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a7a8a4f21aeso128840566b.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 Aug 2024 07:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723128175; x=1723732975; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=645sqhYxiGhlKPfMQkDqwsuRcG9BMBI/0rO4pG2w9xI=;
        b=xS/BSQ4xTvxPagThXnGdCwTw8sdDHRM6SPm7Y8ZvflVVAuLwl9Iecqi4mWQLuuUdhM
         kOlW70W5bLXwvupxF+spl9gfAIJrWKwa1061rp10XAMje+DfcbgNpehsUcGs+AaG7Am9
         JFumh7oXDytZSMz5pleNYrIebthfOiYd5nWvWIS92HeTISJKVAbhMYX3zAPalpOLKlQK
         +ZWsLf7xPqGl1frgHnb366j7lHC/Mhn60C62O1NlM8HOr1SeXkHrSFSQBmiEvjZwg9NV
         MIBmhVcaQwwQJGtVVtvAvqOyDo+vE1DhosEwb+cd1hQqSdAXBeCbDA/2sOrALHHnVI4Q
         cyHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723128175; x=1723732975;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=645sqhYxiGhlKPfMQkDqwsuRcG9BMBI/0rO4pG2w9xI=;
        b=ruLDrwJvOhfZziuUSi9qhp0+zqzpGzljQyBoiYkqE2rMIucF/1q4fAvgAFGgyu8Z0+
         vQWZ7vUSUUuYHv1GCLdutJwxV4Hga5oILQvbAb3CvDJThPFJhNgmQro8DspZaIlCiNMd
         BMYRveazVs3Je72RuLZsGqUKOx0q3yRnVgkS74Gue1KOTWzX4y0ZH7hKbJ9XpCJhc9gJ
         NegvxbZs4O3/wZagfY96uKwM4N61Foo+hkm1A3TAtRtFf5iydUvAEYYKLzgZFZaKe6Nb
         kRYu+ZXSfmbuUuxRKJNOh0UVAVs/XeSF8bu+Lwjou4rOzm6ZFHAG46CliyjEzy69aqjm
         QP5w==
X-Forwarded-Encrypted: i=1; AJvYcCWnV7vasvt+n1BCcgLWj/LZhT3BUTGdLKr0N1rfBUUfd5pfku7p+MdZHoj4oxnxr/+y5mlEOpVoCSQ+OEsCQ7zyFbmhsoAOM+uWDKOAK23/Fps=
X-Gm-Message-State: AOJu0YxI8t3xHD2/QPqVUZ1aM4AVz+DN12VZdoM21wqb9B53YhL5RFNO
	5t62LXm/Srej1o2tLKLcZTQJfExUaFWbBOtqg8VVKg0l3WXjN7TUd1D69Rl1kIM=
X-Google-Smtp-Source: AGHT+IHmAxlBw4O2VUn/A8heI+wfeEh/p3nxcqvtlZJmde0nHyNMStnoDpAJEr+6mWLx5is/WLQ66A==
X-Received: by 2002:a17:907:e6e7:b0:a7d:3de1:4ab2 with SMTP id a640c23a62f3a-a8090c829ecmr157391766b.27.1723128174551;
        Thu, 08 Aug 2024 07:42:54 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9e80e04sm759298966b.175.2024.08.08.07.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:42:54 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 15:42:54 +0100
Subject: [PATCH v6 13/20] clk: imx: imx7ulp: drop calls to
 imx_register_uart_clocks()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-gs101-non-essential-clocks-2-v6-13-e91c537acedc@linaro.org>
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

This should also plug a memory and clock reference leak due to multiple
calls to imx_register_uart_clocks(), one for each clock unit.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/clk/imx/clk-imx7ulp.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/clk/imx/clk-imx7ulp.c b/drivers/clk/imx/clk-imx7ulp.c
index f4a48a42637f..517fb388ce85 100644
--- a/drivers/clk/imx/clk-imx7ulp.c
+++ b/drivers/clk/imx/clk-imx7ulp.c
@@ -175,8 +175,6 @@ static void __init imx7ulp_clk_pcc2_init(struct device_node *np)
 	imx_check_clk_hws(hws, clk_data->num);
 
 	of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_data);
-
-	imx_register_uart_clocks();
 }
 CLK_OF_DECLARE(imx7ulp_clk_pcc2, "fsl,imx7ulp-pcc2", imx7ulp_clk_pcc2_init);
 
@@ -222,8 +220,6 @@ static void __init imx7ulp_clk_pcc3_init(struct device_node *np)
 	imx_check_clk_hws(hws, clk_data->num);
 
 	of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_data);
-
-	imx_register_uart_clocks();
 }
 CLK_OF_DECLARE(imx7ulp_clk_pcc3, "fsl,imx7ulp-pcc3", imx7ulp_clk_pcc3_init);
 

-- 
2.46.0.rc2.264.g509ed76dc8-goog

