Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D6918FC6B
	for <linux-samsung-soc@vger.kernel.org>; Thu,  8 Aug 2024 14:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723126289; cv=none; b=dllYJUmMD3GwwTfFvY/3z2QSSH+j1+VAAyrfxkFzPctp6+ftAP1BMk4uRmzeL3YBxbb7Wzcgs9HTixksWvz0VxCPetDQOx3P9bIFcQBHogJ71gk99752JfGEbckjT6uEBW/B65TjR4IBkHDNs02sbQPNgyYfoiL5T8A/EHMGqfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723126289; c=relaxed/simple;
	bh=IWr4xOLwFlcBBVMqbh/CeNYKnBYkZvyljj8xB0z/c08=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jW9qyEOi3bu7ac3btBtOLlWM1AyCLBTWb6kq0R8e2DrfPKgXYtMPRubT32T9G26a8uiF61MJyOlyvKWBcNgJRPhhw0NcNGRKePZU5Dzo9fnXj06HiOH/WSC442+eGc2Cx74Ver1T2oz9jhUZBTXcJX9ioM0WpEXxEoS9yFcwHH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EpjuMond; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EpjuMond"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5a156557029so1232261a12.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 Aug 2024 07:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723126285; x=1723731085; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UhprNA5ngdnDDPt6+AGX+wASXbiO8LYK4hmScrmWYDY=;
        b=EpjuMondvdDslUR7by+KlIehRWWqlPsoLi3hrNFp6GAnRUy4rwO4aenfgrFhVqRcnY
         IvcIDIjJlxx+jvX6XK8FtVRYZ8gkDbJ6ikak8qU0bs0NBhkkrLiw/mhxQ+p8P+ZfKdBG
         sOyJ403D03347IwhSTdnavNI8s1UDPnXi9gF20QsTeSn/UzAcZq8E5Mc9RW/4OMHNSBB
         /VRl48RjkhPt5uIvuGAF79/NNhtayYHuY05ECttVyJN9b9wS603d/rXgtF2B18phm+HJ
         F/VFBnKZcgZwofetAjIa4hx6+f/03lpdXJkFqMVpd1tx7RYtCGUj8AYeh1kmlFKWBpb5
         nIIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723126285; x=1723731085;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UhprNA5ngdnDDPt6+AGX+wASXbiO8LYK4hmScrmWYDY=;
        b=wwrRsuNKEG+i9pGd5jh2iu01zBzpTePEGB2w7CZjReQs2vYlWzdOUc4BedvG48fgUh
         zY/MLUa4OBrwVBhjG2cHu+DMsoN2qFk/oAEXzv6oKgqSCKJRwyP1ExL0CrmygpUGEqOp
         kQeEUeqiIBclX9p44W7advxkKgD3azFe9PtE9J67XcPF1+xdwNNbeEA4nyEVmyE2mTZl
         GClwedhH68plUmXTzVbJJt1X0tG5TUGeqEp8SmXv7t/wsnPIiKjglkmazK3OWHyI7NEz
         PmoYJw0z8WcWP0kNQ69FjhBFz4E0fFlb2UNPQpAxFsFrOBgOyDwJUuEpjuW+WPun3hAP
         0Hxw==
X-Forwarded-Encrypted: i=1; AJvYcCV0ZMg5xBMO14h8T8cjc6SDqrm9/w3wQC+v3BqFoYHqiO3bd5jQBa1f0PHdqQdPh70E5/HIGvUuoyCPBkzyAolTkc3675U/2NEfSJPid4iEHGA=
X-Gm-Message-State: AOJu0YxN9HO2lMCr8W65d7SxcUzsOaYgmjd0A9CTt57kc30372IWEU+Q
	2yocgshqgEP3Mh09zY5G+b+KDu9yrUGY4A4SFYYSnMVZlo+rkode+Hr8ULXzVQc=
X-Google-Smtp-Source: AGHT+IGQe2l23uShoIpRGe0OtZ/F9zcL/2P+TyvQ982GKO9ePP01YLyep9DwZHa3XED5ok4WlLQprg==
X-Received: by 2002:a05:6402:42c4:b0:5a3:f5c6:7cd5 with SMTP id 4fb4d7f45d1cf-5bbb23f7c56mr1647715a12.26.1723126284803;
        Thu, 08 Aug 2024 07:11:24 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bbb2c29f79sm671761a12.33.2024.08.08.07.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:11:24 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 15:11:31 +0100
Subject: [PATCH v5 17/20] clk: imx: imx8mq: drop call to
 imx_register_uart_clocks()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-gs101-non-essential-clocks-2-v5-17-11cffef0634e@linaro.org>
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
 drivers/clk/imx/clk-imx8mq.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mq.c b/drivers/clk/imx/clk-imx8mq.c
index f70ed231b92d..db9aaec42800 100644
--- a/drivers/clk/imx/clk-imx8mq.c
+++ b/drivers/clk/imx/clk-imx8mq.c
@@ -604,8 +604,6 @@ static int imx8mq_clocks_probe(struct platform_device *pdev)
 		goto unregister_hws;
 	}
 
-	imx_register_uart_clocks();
-
 	return 0;
 
 unregister_hws:

-- 
2.46.0.rc2.264.g509ed76dc8-goog

