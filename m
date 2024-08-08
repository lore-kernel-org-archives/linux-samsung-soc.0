Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07ABC18EFF0
	for <linux-samsung-soc@vger.kernel.org>; Thu,  8 Aug 2024 14:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723128174; cv=none; b=JOg95q6zrm7MR7c1FY2FYLFhgUSwy17MQdNj/NyOYX2+hY2ToSdv/ngcqx5cA8ExQ2cDl9+JDX63p25aHdI2CmPmJjhyJmNVcwwRb3Ip9WOpTNTHfSVJFfatWJGIhzPUzua2ehDfA7xQlJhH18kMMJUk8V/i5yxxUyK5bN7/t5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723128174; c=relaxed/simple;
	bh=HMlBx4X05JcRgo1zDJUFrZT9TkayrN7B5twwxpWIidA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jXY72Rf0iKmr78kcmp2HImTGYSMeEf60DU1pp/stLwnjlJzzXoSMXtH2U5l67L7xVma9yVMxfCdFWp5pwSOKoaS4CfrQSdmgGjeML352p0nnudx62E7OtkFxRfCLJU/QGBDX2pjjrCAGXLtPuxOLyqJibK2Dh8SgPvIAC5mE0JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sJVPwVV8; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sJVPwVV8"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a7ac469e4c4so168193066b.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 Aug 2024 07:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723128170; x=1723732970; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y9to+L9bTdGJqYL9Sfh+XmsCrqySZTcdIgL2IwvTZdM=;
        b=sJVPwVV872GyZZUe2l6NjK1Y8+KYgUyml6Mg9NvTYnHbCCjKXcyPmieK0krvL56gSR
         375adYAxoR2q4B+bp/1IITc1NQCedyJJ3WbRLulffY/x2ragkG6FLiSbGMxxQFtAl+fY
         47w2FdJrsbsMkpuob90m2gb35zTsDBhfAXnM5lM5BfangVQ5GK89D5gCjbGtVStRfHvd
         goAwfVUEgRvk4fkochqUF6EjTbdfVcPt9dsPK+Jch/DXJQpMoqCdOZUVKThvIOwnH71O
         hEAzF4AUIlHEAATxppqwmYTEGlifCTVPvWDwrikxK0QpJhsJCAsoVC6GiAief+e6PSU4
         oLYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723128170; x=1723732970;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y9to+L9bTdGJqYL9Sfh+XmsCrqySZTcdIgL2IwvTZdM=;
        b=Dk3NKv7ZlJmlidskpsDC7cLh62I+xQoBT3l0joszGgFCcyotQJZScjRXPfkqgXRYID
         5sK2p+/cszEP5VCDdXCYS1arU5y2O4+mr8dBNsCFdq2wk9Rm+UaAkXG4s3VHJlRLSMfv
         7v+NvgcmyKOSm4LJqi81sq9lAYBUQZtK45DvCymIJR86y9ja1wi7hl+k3mUROl+UiBIJ
         Bf8g5cLqdjJia8TUKS7hcHFD5mIXkEZLg9CJ5ujMarGPejiY7Bbk/W0Cu9HuBR95wWei
         DAk+u3jMO9pXgV2I5mPN3409tZt4rCupY0RR+IYwbt5Cg+AHUeA63QiyTFb1zHv4jz0N
         UlbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQkNfPADR3YwrVfqRHRqQ08SGKOVfMciv/ddkyPMVs6Zvm12XN2LFvzC2qkTIbeooGetQF+zM+nGvA9luUoVfnbUym2JEvkTkxdvbPBh2axj0=
X-Gm-Message-State: AOJu0Yws6Q8SYComXi1s0eXZotbdXAI7prI6jpntgeHcX3c4ul5zmfdz
	sqt4xBhuV98YMZWKIJIXZRf16UCcx90Cy60325DfbZInnFu0ZWp05cDz+1bS4fc=
X-Google-Smtp-Source: AGHT+IG8GywzWr1gIp9i12RLWgA0KqKkT63htyiYzlG61i5bfa1BVS8WIMeH/VTqcF0FTAZqtfonTw==
X-Received: by 2002:a17:906:6189:b0:a72:5f3f:27a2 with SMTP id a640c23a62f3a-a8091f95f90mr126698566b.26.1723128170220;
        Thu, 08 Aug 2024 07:42:50 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9e80e04sm759298966b.175.2024.08.08.07.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:42:49 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 15:42:46 +0100
Subject: [PATCH v6 05/20] clk: imx: imx35: drop call to
 imx_register_uart_clocks()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-gs101-non-essential-clocks-2-v6-5-e91c537acedc@linaro.org>
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

