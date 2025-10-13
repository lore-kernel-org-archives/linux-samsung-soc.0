Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E2E3081D7
	for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Oct 2025 14:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364909; cv=none; b=AwxX1pUqY2MtE7bNlh7vKUHGrtUfNFOs3CbW2CHACs4bAZ4Ux/upyHc8gLHjUM7ZxXGHnUhGFk3V0tuqJUgqz+G+9yBVHAnq3euEp0Q9No0lJdl0xN5tu4wcyf/quyKn+McFUCBEl950I5b7mi2wnL8TW5dV97ybCcL8cXukkEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364909; c=relaxed/simple;
	bh=+oAwKYsKZnmMRNeirjVFyUXif+/X/1l4gmdnVjVso4M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fxUf69e31ODnIntk7wgx59L7NR7uVojYKIsRCkDW7663l8FqqUY6RsJgPXw3vDZBuc6BpzPIKIDPNhVA6GTx26pO01qXiMgNO5/Ov/4/PKG81kXNOiOu2uMhwYTiaytTlAZ/xDMgI0WFMZSnJ4WRLsQ2qchE9AeNJVun+imO7mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=izTUNuay; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="izTUNuay"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-586883eb9fbso5711550e87.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Oct 2025 07:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364897; x=1760969697; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=weMrn1P2Dmx5cKyBfIFsmXsJRg2imt8oYjxSbIy2C0c=;
        b=izTUNuayAQ45sJgBQXb0nIli8DPefQgSO+xRgra5o4yjJ6Nz+NS35kd39st74oQW82
         oogcytQoWlc4+jWm0/3pG77HeR8v+K0uEPIVlBqnxkUvwmvT54rZDM2A/75TGymXZ9Mt
         E6Nv6WCwdpnhxJKw8IC6L4hwQ4VpKY3qQwTz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364897; x=1760969697;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=weMrn1P2Dmx5cKyBfIFsmXsJRg2imt8oYjxSbIy2C0c=;
        b=XYQJlKRj4Ru/3m0IfBBDYEikHZ8gNZoi0Hzv50/v3o+XjswtPrcKtmDk8ZRNpI/bhR
         VNXbZ6MoPyM3sdkkGLBtZ3qqWCPkTkGvk4MSnQ2OJkz7dOE5MvNhySdhQccNT1pCx15F
         j8IJsbh+2cFHhcZVi4bvUpM9rwc5wecTICJI8hHYLCLnigXSsqTP44YKZaLh+C4KtkE5
         lvaXvtHm6ECz6tz9ovZXQsZW7d+yME4yyivT+0ahCv+UIlt2X+Mc9UKNKTY0xpz5WwUs
         UbivsupjpT1eIkg+yAU5T7LvMShDOfFcX+F40dKUhdeTn/hpNyy6ZZoi7S57RBxRvwLn
         MsbA==
X-Forwarded-Encrypted: i=1; AJvYcCVwKx+1xVHaqmoT/SSXJlIP6LbS54coxVBpBLsdtqIlDOypQA0atFOaRye6rJIAtz1cGjtoUGynMDju6jbW9qy7ug==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMYE0eqAaujRsGDtB1UygbOEV8SSk7HdxVBT4AH9M4g97z2R5F
	U5Pr6L29kbzutdr/q0CIT5QAGdj6DCZsjqSn+on3CHEfTZGoqNzT/kwY3QbL16sHgg==
X-Gm-Gg: ASbGnct1uIWwOSlvN3jLIju1mC8YISvtOTaHdGK74MLyd3ludasBrKWkk6r9XQKCFOf
	360dxqYHlSim4duYiuY3qV9DYfbWub/m7zbcoBwT9/TeoniH0PJpecZ3tvBk0d7ZUhbqLhntmzQ
	NdoR5daMazWiXjt71VFIbS4kWbqOEgOZXyvxbenlGItHmRWajHxtwEyjHUW1tQQ4yOSZTv6sZAb
	nGyu93WMYyvP5yZC7fobg7zeQP3mSG9NOOqw6SZyukRa0M5ikdhHTRMF+6huTejh2r2hSlp6Hhy
	XXn4lMZzFETye7kvyWR+Cyvxa1Tqp1f6q9B09bxpca0BYv1EvwkZ+5b+YPKlELl1Nia+OWvWC+8
	s4kUGpIr09p0Qyvq9ZlEv/ZZguLYtuLEiOXIJf3m/QY5ZMrcDBBwpnPAR4Zd6M2RxUVTUzIuHhX
	5dgNOoXmvV4osNyKqlqQ==
X-Google-Smtp-Source: AGHT+IHVv3VTrmCgUzT/cTkypfMtCAEj51jzL57PRvYw0rG8gIadeWnRbBvldcFvBGl05DoGVFZcMA==
X-Received: by 2002:ac2:4e0a:0:b0:55f:503c:d328 with SMTP id 2adb3069b0e04-5906d8edab9mr6287769e87.36.1760364897004;
        Mon, 13 Oct 2025 07:14:57 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:14:56 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:14:52 +0000
Subject: [PATCH 12/32] media: i2c: max9286: Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-12-2c5efbd82952@chromium.org>
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
./i2c/max9286.c:755:7-14: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/max9286.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 7c0961688d6173843f3ae846253d4a8669ae762b..e6e214f8294b83105be02f29966e1d3ed72f8dbe 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -751,8 +751,8 @@ static int max9286_v4l2_notifier_register(struct max9286_priv *priv)
 		mas = v4l2_async_nf_add_fwnode(&priv->notifier, source->fwnode,
 					       struct max9286_asd);
 		if (IS_ERR(mas)) {
-			dev_err(dev, "Failed to add subdev for source %u: %ld",
-				i, PTR_ERR(mas));
+			dev_err(dev, "Failed to add subdev for source %u: %pe",
+				i, mas);
 			v4l2_async_nf_cleanup(&priv->notifier);
 			return PTR_ERR(mas);
 		}

-- 
2.51.0.760.g7b8bcc2412-goog

