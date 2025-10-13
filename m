Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188193090C4
	for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Oct 2025 14:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364918; cv=none; b=ZYixOYqCP+xmLDRoMRF/Nk7WBakDi7o//wrFLXh1UGq9thWQ46ek9Ni65SUlK2vvaZwjjYMDhcgmqRGVEOXUIxPOcFd5rBTOqTuP5/0AF/Lmwr/4xpnQHyF1ggGo1gVlUUuTh+qPPA9/SulN22OnD2NRNWrcGq+Yj/Upbrlq+nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364918; c=relaxed/simple;
	bh=Pzzu7GhYxyifz0hH0hqoTi5DPNxH7bOKzjeCFjKc3co=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kZVKQ7oXj6fldf4kR+ASVL9HspF+7sxHlfnp0D8tezU+AYeBwLwAln8UA0QkcfNYqZjRD4Kt48d9IlrgxyuEab6Qrv5RNXQ2WIll0IDVA+drM4QL9AU0yQjm0pLlnwpES0v+wCT9a+rn810XQLXv+KWkHoFBIOoVPZvaAeafwwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=C7jMGw5a; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="C7jMGw5a"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-57a59124323so4619787e87.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Oct 2025 07:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364901; x=1760969701; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uQZvCnP1P0SuqiqaQUtwVRm3JfcVlv6UnYBLGV8/TWE=;
        b=C7jMGw5ap0b3UkHYi5TYPhtTGUfLpuyWVjuXwsJrSLgqJxJDxv8Jrs+je2ZCgNLctd
         IPAHDOh3zhmKkw1CCI7aS2w3211raMFFlAQpiKVI+vR9tZpuhjrFx+t0h9uNW3k+nvfq
         MIg4WjxOOEXDLl6YAqKyAG9au+eMxO3EnQrx0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364901; x=1760969701;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uQZvCnP1P0SuqiqaQUtwVRm3JfcVlv6UnYBLGV8/TWE=;
        b=I1OC+BNfjTATwGu7hZu5iNKKh5iQEzZ0rfcq1n8Y1iLaQXRUutSf/z1eAa2lvH76wW
         gJBdIryRviEQM9JO2f8delB+SrxPe5CSCcWFCGJCcIzcItstNko+Mbvu+8GQ4hVOofgA
         0n5h2KWWTO5Ehx7gdDa3meqp8wSionhobEwhXuoTFNwglVZJfp0efewdsQneYzkqWh9G
         XFmlF/ov7MYbQNmD94fXdC55/ftiF0/ydXxltU8VRJkdK1s2YrFuEAWZZYon74x8k+ZW
         kSzEbjeekHhFt4n551oyDzoKZ5bs64F0Ss2BaCoRSURAa+mymRwfjMtR/39mxk95N6jK
         Urow==
X-Forwarded-Encrypted: i=1; AJvYcCW4rVbqaXFNsdBu4OTW0RMUr4CpVv6cxBNN2oNKl/gBbQwrAIHKobbXe0oGLzcQZ6c2hbxQmTK7WW25diI362l6DA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmxTcidvSy6Y8va/bYsAl9qhUrlsu89ShvxjeN5eu8JtniMU2f
	J2tdw71UH0nfLZxs4LNu976t2JoCc34UUupGeEA7GxGsVi1YddomLURWp6wOu4ISnw==
X-Gm-Gg: ASbGncvnO+yXn4t9WHgYMVhz53HCJPT6cv9p2VCL9VKHdBsTrhYNUxP/6QZAyKZ4UFW
	teC8oilBOTlgtQimJXKlnvhEN5aFoABxPM+LCRuqWIUAzGcsqGo1hqyZKZf7zWKIAO4AiIU2Nxk
	Xzm8RfB0HXfaCnvquAYbdHmsbgVu9UcPtgs2NhrlqcusmD4PUDIKdrFvwHFFMwgtwgfyGBqFA6B
	f/rwsaGOLgrLgznmZxpU6UldfW/zz9frdqHcSJtd4FELG5pyTfV4+p4AK1/GrdIzWwaqegReg4G
	Nn3ikESh9zvxo6SvmTXOsUNZcyuL5zneGCkBeuC8tfFKMrHzGSyI2Wgp0aDMSzCOxznhaZ3P1+2
	2cD/XQHS045i6iNTWrYDUx/9HObtvD8szeyYhpUk1CumkrxJo/6PMPRL4iVkzgdcmrSuV1nLeVT
	rVJQMhU3F7SZx5qQz2a4JwA2AiO4TI
X-Google-Smtp-Source: AGHT+IHp8qUEbZiZFjcq8gL768jxh7/txPc1OJzdAQ1KXrMavPh6zmcAuzYCqI5NGEMHZ2sFOcmEXw==
X-Received: by 2002:a05:6512:a90:b0:55f:6759:a792 with SMTP id 2adb3069b0e04-5906d8ed836mr5438343e87.34.1760364900643;
        Mon, 13 Oct 2025 07:15:00 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:15:00 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:14:59 +0000
Subject: [PATCH 19/32] media: rj54n1cb0c: Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-19-2c5efbd82952@chromium.org>
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
omitting PTR_ERR().

This patch fixes this cocci report:
./i2c/rj54n1cb0c.c:1361:4-11: WARNING: Consider using %pe to print PTR_ERR()
./i2c/rj54n1cb0c.c:1370:4-11: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/rj54n1cb0c.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/rj54n1cb0c.c b/drivers/media/i2c/rj54n1cb0c.c
index 6dfc912168510fb1bd308f834911f9de705844b7..e95342d706c39a853e8c18de1ce447a5fa508565 100644
--- a/drivers/media/i2c/rj54n1cb0c.c
+++ b/drivers/media/i2c/rj54n1cb0c.c
@@ -1357,8 +1357,8 @@ static int rj54n1_probe(struct i2c_client *client)
 	rj54n1->pwup_gpio = gpiod_get_optional(&client->dev, "powerup",
 					       GPIOD_OUT_LOW);
 	if (IS_ERR(rj54n1->pwup_gpio)) {
-		dev_info(&client->dev, "Unable to get GPIO \"powerup\": %ld\n",
-			 PTR_ERR(rj54n1->pwup_gpio));
+		dev_info(&client->dev, "Unable to get GPIO \"powerup\": %pe\n",
+			 rj54n1->pwup_gpio);
 		ret = PTR_ERR(rj54n1->pwup_gpio);
 		goto err_clk_put;
 	}
@@ -1366,8 +1366,8 @@ static int rj54n1_probe(struct i2c_client *client)
 	rj54n1->enable_gpio = gpiod_get_optional(&client->dev, "enable",
 						 GPIOD_OUT_LOW);
 	if (IS_ERR(rj54n1->enable_gpio)) {
-		dev_info(&client->dev, "Unable to get GPIO \"enable\": %ld\n",
-			 PTR_ERR(rj54n1->enable_gpio));
+		dev_info(&client->dev, "Unable to get GPIO \"enable\": %pe\n",
+			 rj54n1->enable_gpio);
 		ret = PTR_ERR(rj54n1->enable_gpio);
 		goto err_gpio_put;
 	}

-- 
2.51.0.760.g7b8bcc2412-goog

