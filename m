Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCEE2C21CF
	for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Oct 2025 14:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364902; cv=none; b=mwqV3OnIjQTOEG7ZlPV5Lz6eot6TAlzdUzYgPcQjo583FPa9yKSGkZEzPKlHb7ynnkUprhRRDSFGcrQrWMC2vZSSL2lRcfgiRFVkdsmPmjJi4tcGUoIXMnuMo2sX6NNQbCuAAwXp2klBex+1j2BM/s4pKhM9vDi/KNvsI6T3I/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364902; c=relaxed/simple;
	bh=/L6PKcFgTFzEsGq20C+fAHYn8KGkkVmm5YQquq5Z0Q4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lugyQJ/j5e+ZIY3PRT7hws3lIC3+hCMCRsDfLVBIVz3l5MWsnx+RLHY/NmlhH2UFP+XOeRLfNqnLnqipqg8legLEinRAcpstMCJBYa1vlPgP3QwrLQP96bb9JjPh9bEosa+q7SeYIYrFHYx0ilHs3eH5mTpoHR8WthAqs8Iebc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=R6yq3nz7; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="R6yq3nz7"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-59054fc6a45so1057052e87.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Oct 2025 07:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364893; x=1760969693; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9T8mO4GmxU6Sp5lObaHqxq0/smUXIq4FXIudPa6OeB0=;
        b=R6yq3nz7f9fqGCJ0qh+ZB9t2ZFlnNHoGPzkK7FNr2nXORsYaQGAukJ7sqahEtih0Vs
         Prnnhj2mQtrl+E+vZ/9zeg9kRMMSiwG2qGvjqXzin6SA49tVBrM0ck0kMGp4ZG2QqmAE
         jkIy2gR09FGBRe6Gy6vgN0S9rVw1D9vSxoImY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364893; x=1760969693;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9T8mO4GmxU6Sp5lObaHqxq0/smUXIq4FXIudPa6OeB0=;
        b=BmhNcY0ylExqM9fiblDtdh9T+zRaViOe52z8TrVq0WQHr3epAxX4KTw/qPk1gy1SZE
         mswd8fORRwiKOtDiQFgWAdm3fXqKJre1A89uftQZ11B57kDO7+9gqSxbUkRmCaF6IODS
         woWaokgnDoMxBBsreebNJUDK7nnLqEDl8ohHUtNuMg5StCCTbSs5a8ZcjWSh5J5TLW1f
         NEZv9yMdVZpFfX0/s8yt4NUuj4v0uLbk9ftJBdsAfvwff/naWtlYg7dpHhvfbkJPgQMN
         PrX/vX4bSRRyPK/kRtBlzDXFa151jJ5sy+qh5Unr/xKyNbfecDAyt+gg6Ij04PtwYfrm
         u8Tg==
X-Forwarded-Encrypted: i=1; AJvYcCU+2M4JMM6werz6OdL22A73fT5NxUP/4pHbCUug7Es4udFzBdVxY9t/yMUjxKJDl8XnlNJVoNZQZVoNDCZ9+WN1sQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTkuoecABmH7Gt1oUrJCh2dI+qTD6k/eTIrKTSJLJPPzZt5qaH
	19cft/eBT+6TKNoP052l5fEI6Ugf//EJfNdU8sEplJ2TWhyju45M2BUIEDScPMthYg==
X-Gm-Gg: ASbGncsbyMQFsazbRSInf335JIpTa3+cQuxclXIK1HgYl7aO1W9V8qu5fcivZSUevRR
	r8/BrxI4lOxQceKW38cF9JTpP2x8REsZMIOf9hWdC75Ej0cPqPfZNPOQQ/8R6cQN+onnDZHyeBt
	RY6/PkeElXnhDz6u/EaXIBfzm0NyWSbSb5BvEFWZ4s9co8nV1mLUQoigGEvp0d0Ve2PDmyTitHX
	z51iak3mR5aYhQPSWjoegf5PwFLhnWvn1ThlbMqsM0uirO5ngqhJHWTJvCRJySrqVxL72p/AQ15
	HgiWk7O2TwPcS+fokHJbsPoKLINfO3D8zWWaASB5VxJ154TG47g+myuWwepwk2580DrLQ29bOrh
	CFev6O1ukudVWP6yS4zx2nJHVeHFItcKq2bXBAMp/NXw5483xwyT9nLE93Jqe8ipq4C1UiJXIlX
	PB5wHDh5ebAcE9T7WpOn5Vi4CoU1OD
X-Google-Smtp-Source: AGHT+IF29XnVuKewIk2Zn4qpOdHSO/Y/bSkdxJ/SAd2VXfC5cMU7PSQseV2CsRuBBvo11GHLWuTn2Q==
X-Received: by 2002:a05:6512:3d14:b0:55f:4633:7b2 with SMTP id 2adb3069b0e04-5906dd73db3mr5724883e87.46.1760364893403;
        Mon, 13 Oct 2025 07:14:53 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:14:53 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:14:46 +0000
Subject: [PATCH 06/32] media: ccs: Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-6-2c5efbd82952@chromium.org>
References: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org>
In-Reply-To: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 =?utf-8?q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Leon Luo <leonl@leopardimaging.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Julien Massot <julien.massot@collabora.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, Daniel Scally <djrscally@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Yong Zhi <yong.zhi@intel.com>, Bingbu Cao <bingbu.cao@intel.com>, 
 Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Dafna Hirschfeld <dafna@fastmail.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, imx@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

The %pe format specifier is designed to print error pointers. It prints
a symbolic error name (eg. -EINVAL) and it makes the code simpler by
omitting PTR_ERR()

This patch fixes this cocci report:
./i2c/ccs/ccs-core.c:3241:3-10: WARNING: Consider using %pe to print PTR_ERR()
./i2c/ccs/ccs-core.c:3298:3-10: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/ccs/ccs-core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 1c889c878abd3aeb1b7a887cff29b5eb864ab057..f8523140784c7120eaf018ffa9e3b43ea12ef72f 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -3237,8 +3237,8 @@ static int ccs_probe(struct i2c_client *client)
 		dev_info(&client->dev, "no clock defined, continuing...\n");
 		sensor->ext_clk = NULL;
 	} else if (IS_ERR(sensor->ext_clk)) {
-		dev_err(&client->dev, "could not get clock (%ld)\n",
-			PTR_ERR(sensor->ext_clk));
+		dev_err(&client->dev, "could not get clock (%pe)\n",
+			sensor->ext_clk);
 		return -EPROBE_DEFER;
 	}
 
@@ -3294,8 +3294,8 @@ static int ccs_probe(struct i2c_client *client)
 
 	sensor->regmap = devm_cci_regmap_init_i2c(client, 16);
 	if (IS_ERR(sensor->regmap)) {
-		dev_err(&client->dev, "can't initialise CCI (%ld)\n",
-			PTR_ERR(sensor->regmap));
+		dev_err(&client->dev, "can't initialise CCI (%pe)\n",
+			sensor->regmap);
 		return PTR_ERR(sensor->regmap);
 	}
 

-- 
2.51.0.760.g7b8bcc2412-goog

