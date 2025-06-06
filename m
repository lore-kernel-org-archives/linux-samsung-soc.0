Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD180289350
	for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Jun 2025 15:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749222208; cv=none; b=NrZy9loI6RRHDERS/XJJ/iMR479wtERh8KeYB+SdtT86LrUiaYQZ5/kzhwTd1iOyG7HsNr9L0YMYn+TUZLeiQuxYQxEJd96qeZvIeMAiMEjAWNGM4ut27BEyFx1+vClwsfLr45IZzp37CApROfYwpTb+zffRFP+tPPItv4s2n+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749222208; c=relaxed/simple;
	bh=qolkrs3g9m1XRitO5lnJhgwGXH80xlE9UKZOEGY5QLA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bfbJE4xkR7zwqt1id/QMgOklvHc2mJzOOyUf9FBoLAK49++rHFOtj3jN9xy+UGVg7Gf7xMC80UN8XmRiHjZoNBShPnscQ7oesC8HkUJ8P66OMtjCz73FrL8M3rumEKtqmv6xYECppMD1mD/PJCk5W3MsvLhFs2YZCderYGGRt4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C53/AjF8; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C53/AjF8"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ade326e366dso60793266b.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Jun 2025 08:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749222203; x=1749827003; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=23HNY0T10kbJEBdypFT8EdO6lJ8vGZTGFp43/u8D8EQ=;
        b=C53/AjF826WB5HRT+muLZF6Kljdh7MIkySoy4kKeqKvUZCnx1f0BKpDfm4UYFQZitB
         9OZl0B8l+YA97xSWlSVEeL8JVsK/8/wUhAbvgCCx02zL3ZBdlBlxGdU1JMMI0WIhJ5OV
         YFvyodgN1mDPLgNwBvZGCLyuifRV5bMSeQxaFCcs3sxuyq5fvpKLlwNIuoMPdotee1gN
         SzYFOL41CXtBJ/Y3+D9xDK4VOWPiUOa3kihLWLuQeLurfNN1M0sFOEIep1rzVqoJoXP5
         1pppoNcwqgeAvRBeBPnyuOJHx1/piw+y1M4cKSUNfsxrG5LtFQqhZu1RLNLJHXLQYlu0
         O2bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749222203; x=1749827003;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=23HNY0T10kbJEBdypFT8EdO6lJ8vGZTGFp43/u8D8EQ=;
        b=vQkDzo2XW6LxOjySR2lfRWA7r2H10UNILmkXfjFRXMQhW/4s/Qpcnq2vKYT85woEYC
         8pPmNMajMD4xc5crOTMJrhL4FHMNnbPJuWufzJepyneYijIQWIaW0uFi5rjdMDn+tOvp
         5L+fIgruh/LAr7KB5XyVJXpOhLbtKleP7CmLBxn1Ak7AVHyFWc7Uq0Y1G9lG3VXTaaU0
         6SGJam0c3XDUZg2HV4iyofXCxuSoiepjDrKOtEKKIQgY42JDNL2d7523FEvulXNvzgPq
         YsygqoO1T25eH2JFq74XF6qdrsq0nc4NQJa73A1CrD6MN1q92F2lq7Lu75G0TMdO29cv
         z+Zw==
X-Forwarded-Encrypted: i=1; AJvYcCWaEHpoVz80bHdnD0eQzlOi8BRcriiyMcUM/kEs0L7qLvLw9Otx1oLSkht1y+2LXVsjpfgPw/JRwkaek+S6WbE31g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3lu0Y1aUZbDBFoRUwbkC1J1qT3L8xHoSj++YQdlWOSoBSR0ey
	pI7TOTOX5/taoLD31JCSIWofxi/cPpy1SevmbVjmCstQv9I0xvGx7yLXH8UKrQxH0v0=
X-Gm-Gg: ASbGncs+0B1MqFwOCySFqpl3YDFH28AiPblCPDRNQUR/NalBeFFgi9bTMRf+TRYVf/5
	K+5zZrZ93BD5bAt98f8f/h3co1o88paZ3vuHHU0yCOYTvNM607k2nMcitnoSoNQ8w45uBBA3bge
	hl8SOPPGeVO4P56Tj75i9ptsPtWrVGpJhesNI57JFn0z0fc010MbF0DIADkQ7JlQ+GGBc/2UYYq
	IC8/qTgZeSAr751O4IFHlvOkRs8tXZa6gw/9aUXR7WUKtArGaVazAwU36qBCYcq0tY3tDgoZLa7
	WKdBmXL5foO/siXWkt/2MdOjPEpYtMIerHomsgGtxhrUKufS19EsaWyRmD++iEYFt+t2fQkcQxE
	wTUrN6mLWL1i0P1DrM3tKUNwaOG4Y9g62rCA=
X-Google-Smtp-Source: AGHT+IEyyt1ZlOm5xokwecrQZlojNukMbOCRBHPGSyCxVc6nJs9ihRs3pxSxkqbDaVo1utFTbV4JCg==
X-Received: by 2002:a17:906:c109:b0:adb:2db9:b0b0 with SMTP id a640c23a62f3a-ade1a978ddamr329710166b.35.1749222201191;
        Fri, 06 Jun 2025 08:03:21 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc38cf2sm127735066b.121.2025.06.06.08.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 08:03:20 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 06 Jun 2025 16:03:13 +0100
Subject: [PATCH v2 17/17] regulator: s2mps11: more descriptive gpio
 consumer name
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250606-s2mpg1x-regulators-v2-17-b03feffd2621@linaro.org>
References: <20250606-s2mpg1x-regulators-v2-0-b03feffd2621@linaro.org>
In-Reply-To: <20250606-s2mpg1x-regulators-v2-0-b03feffd2621@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Currently, GPIOs claimed by this driver for external rail control
all show up with "s2mps11-regulator" as consumer, which is not
very informative.

Switch to using the regulator name via desc->name instead, using the
device name as fallback.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/regulator/s2mps11.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index d46b743d4c6f5e745e101d054581a74e992fbaea..dcb813461e6d68505c21aa7deabfd03b450e1d3c 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -357,7 +357,8 @@ static int s2mps11_of_parse_gpiod(struct device_node *np,
 					   "samsung,ext-control", 0,
 					   GPIOD_OUT_HIGH |
 					   GPIOD_FLAGS_BIT_NONEXCLUSIVE,
-					   "s2mps11-regulator");
+					   desc->name
+					   ? : dev_name(config->dev));
 	if (IS_ERR(ena_gpiod)) {
 		ret = PTR_ERR(ena_gpiod);
 

-- 
2.50.0.rc0.604.gd4ff7b7c86-goog

