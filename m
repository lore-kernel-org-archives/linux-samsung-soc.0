Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19EB18FC8D
	for <linux-samsung-soc@vger.kernel.org>; Thu,  8 Aug 2024 14:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723128178; cv=none; b=aqge7Gfap9436UNRS7qpX5kV0WL8z25PrSOLIk81HpPpFA3yMbvhSPXhLmsgjGg40PDUac1omDp8rzoEuxh49SfxtZW0GFqA8d1rqjBdM/Lh2D3JxZTRuOsJcux2pMhZGdZpCle4oLP+jk526ZG3vzEjUTt4L04SN+fgAUKkLtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723128178; c=relaxed/simple;
	bh=k4Mp7OQtKEMyYQQBprE0etTznHJ6XNdrfUzHCPYj4Ho=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lrhp9iuz+BBOGAErGveX50NACK97+uqXLIbUr1y9US0Eqk7BPxvqAZRShDg+qamBqcLMn1dtNTbj2dduNT6Gj4COGK9PUFEQJ1hnupa/SC3aVwolNQXkrwSHPHtAWCExmHyuHbVQtiCigtGe0fUtFP1CmfqDiBxtfGTTM6EO3Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VWlfAhV+; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VWlfAhV+"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5bb477e3a6dso1028506a12.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 Aug 2024 07:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723128174; x=1723732974; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0sTSIJgqJzgG9ZOeXhaBq4KjYwR+dgEfjYLq292FpHw=;
        b=VWlfAhV+RDk/ZrM89B0B5IHxDZIbikNC6X98SOUIqP23DC4unTpU9Ldyxumdu+mGqc
         6OzL4c+T/PaawJMX8NZdQ5C8MI7lI5nxEWXHkt2cfWxJl1UN2qjestL5Is8karaXSD4m
         r77x7GORSophzg6sR6FPmJFoVFGnehVSERqr7iN5ZL5Du8qFQpfknr6J5FD171KRFD2J
         9ctcP6pU7zAjyJtBiZMPiam7AJg+tkJ32CjZNs5BhhaTFQq4q+qLTR4mU7l1DXrxSVRv
         wZTAQZQjiV5Tfj3rni54A3OGRJDGJyOcCm/EljmuQfhV/AAZvFeaFCPgG/2WZgaUuree
         TSFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723128174; x=1723732974;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0sTSIJgqJzgG9ZOeXhaBq4KjYwR+dgEfjYLq292FpHw=;
        b=QAiaY6r5/B91T1jrkJNaRY7hR01QII2ge/9HG1TKD7tFuPuofcsd+9RFpCxstilLMg
         w/4SvXgAWP81DbK7cWuB+Fy2r7XHeYxy8F+SWPei978cUcCflCsKJlt3qrIOaMVwrGSG
         CrPzkgNX+ivw+w4qAn5dtxX/sr0ynklcxW/V+nBwsPN323sykVMZk5u++rYVNJoqxEuW
         1LBCKi7gVdAeQCKLrhhFySnPjbr1qIhREM+KWexQMeaskvIT7Q59a7EE7WqJno1neTSS
         QMr3kzHXzHglvyfsCdEcV2pYrGpWkBWVP3NQuo8+FDYbNByY77my3OcPFEFw2T2oP6IX
         xvJg==
X-Forwarded-Encrypted: i=1; AJvYcCV9RaAuAq+ZHnDLN8JnBn4ng+bG0Zoms5rhJ/1cQkho+nqY/iGkKXp8R3/Hz05mYG9rODcctj2n0ts74xSyWK1j9EwcDKmnp3ZVJL9ZvqKQeco=
X-Gm-Message-State: AOJu0YwaZYtMLLgXeYU+6FD85nLj4uM/Bqwcl5LnCvllz9mPWoe8r0en
	iNJUmHfoU58o9qjzcHGbP+bJugeUIkpee/qccrweHiKFB1b6jHna7S1GVx7ngLk=
X-Google-Smtp-Source: AGHT+IHR8FpJNdzuqaSJlCS0dga7rPYT+WlNUnJeQS1SMhIWL9rsDOEKxbf+CirVT6VIRhxUGlibjg==
X-Received: by 2002:a17:907:2d13:b0:a7a:952b:95b1 with SMTP id a640c23a62f3a-a8090c82bdemr182009266b.24.1723128174054;
        Thu, 08 Aug 2024 07:42:54 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9e80e04sm759298966b.175.2024.08.08.07.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:42:53 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 15:42:53 +0100
Subject: [PATCH v6 12/20] clk: imx: imx7d: drop call to
 imx_register_uart_clocks()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-gs101-non-essential-clocks-2-v6-12-e91c537acedc@linaro.org>
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
 drivers/clk/imx/clk-imx7d.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx7d.c b/drivers/clk/imx/clk-imx7d.c
index 99adc55e3f5d..789cc3afd062 100644
--- a/drivers/clk/imx/clk-imx7d.c
+++ b/drivers/clk/imx/clk-imx7d.c
@@ -882,7 +882,5 @@ static void __init imx7d_clocks_init(struct device_node *ccm_node)
 	hws[IMX7D_USB1_MAIN_480M_CLK] = imx_clk_hw_fixed_factor("pll_usb1_main_clk", "osc", 20, 1);
 	hws[IMX7D_USB_MAIN_480M_CLK] = imx_clk_hw_fixed_factor("pll_usb_main_clk", "osc", 20, 1);
 
-	imx_register_uart_clocks();
-
 }
 CLK_OF_DECLARE(imx7d, "fsl,imx7d-ccm", imx7d_clocks_init);

-- 
2.46.0.rc2.264.g509ed76dc8-goog

