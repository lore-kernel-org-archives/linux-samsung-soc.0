Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F1625DCE0
	for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Oct 2025 14:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364896; cv=none; b=ujrzgTzuhj+A2+3KvvIwJycGyDlt9XBCJctPQidqHTy5GTSBVh4RgssZYvY9jfEMt7wKrpgkWL6u5XQAcyqm+a7DZ1G2MQq36ki0oaZvmWh8epSgSkvzJ4h8OGhgoBdU6/B7QZbS5GnvmucQDbNdCsFdD3aU2jBPmOjV3lTaiSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364896; c=relaxed/simple;
	bh=zXe/wxZ6QqQI33wXbnF9l5/N0aHMRBU3Aplzl5QTEmE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qFC5O5FGFoGrfM8ZFQkXF9vSqbpYGyZ4XB3yoUhqse4efVtZ+E4iU7j3hJ20Vu378zIL+Fx+ZQtXbFOTn81ZVDxSQ8jCTIt0Fp6qcLu97A99TRnazFj0YFKShLPBKJcjBgCXjnHXbV9vP/1nHPCyRnh1j2yPlCzhGKwVmf0J0q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Rhr3+NVB; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Rhr3+NVB"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-59070c9111eso5223697e87.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Oct 2025 07:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364891; x=1760969691; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h+YhCU9BSkNGYIn59ygfcOhebsOBGxL8NqrMakgbz3w=;
        b=Rhr3+NVBtrMqtmOV7k0EuZgzP7FBtL4IHDB8rNFTe1MTtc6ml9ImPosLhWFvFd85PI
         xiwBZZBfiDQQSy18KFqn5ocaVQRKWax1tJDtnPSfZFk644HXmi2CE2VYBLncEibu8Das
         f1P1HYqg5REIDaz2M8j9anQW65FZ16yU4vLfs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364891; x=1760969691;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h+YhCU9BSkNGYIn59ygfcOhebsOBGxL8NqrMakgbz3w=;
        b=DLwTYDX+5hzs660JK8MnpcNMNITcmOSKygLU3wPqm6IPFDCJciKQOMDgK0GjU+xbx4
         IwhqROF4E8/DyMx+YjAb1cxwpKq5CFWVo1lfcABIsI0M7enmssU3DFoxo8hloIjx+q6B
         z3uytAo7txMGko0No5ll9xzKvoMGfPjS+B7Rrp58jd3+mqHG9y3+ckw4JP/IjS62n1fr
         T8xC58p9fVYPdOhr8SWxM90R6Nsa6JHVCX9cS/vFOnesOyrHAPLNiP0QN1iyCjYEKMR3
         q+VlOAJaGgArXrX/2vhmPKlAuJtA4S1F0p+5SaQCXoA3bc/I3mgfZxUCCJty3bZ+LlbI
         GbhA==
X-Forwarded-Encrypted: i=1; AJvYcCWshIUcYNj+pGLwRoWRg64TFt3gBlcKOolf35CzRngivsRoFp2LA5Ej8nhXwZJBxGdg2yDN8aoSYZi/7NspQO34Ug==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvSFipWk6XIfz69CfIs7sQjEGHTWIgj+nsWFD+6HivFHC24N4a
	sHxlIxFMy+KfFds9shHuEvruw8igNF+z1wrK1IU402S5RGFbMLcQPfPzz0KLRUS64w==
X-Gm-Gg: ASbGnct2FByXY5Bn/UIS7TtGK26HdEa0clAbWjSwNVBic0yNDISRFHOUVpTY8x32ZHB
	ufS/P7WtzTGNd2yE2dTsjMv205YgXHB9jZ6c6hk0dajFRHrjvZ3mPIj6hR2fLNHjVilGYrnURjy
	TQpuoEqU8yGsqGSU4gR+7sPxL44whw1xQNDUHhgMKZ93bNFtvF76GI+FfxGSNLUxYeU2qEXv4sR
	wNj2OrSCAt5X7GjW6XaDIGYjojAcxjlHUutG5NrEb4FFO62RS99Ymwl4PXKoqHaZEqom+gJWUwl
	Ke7CzsTsctsyuIm/rdWXFf1twYWJ+SVkrtHi0L0qlgqIazURAjLsamEqpr3EEop9gevlv4jLQrv
	0QOb/rTWJjYUJsTMiTSwnzx9V6p2vMWATtKp2PlhkBFG/kvfCfkBCkJR0yqM0mJbWaY1O3pkA3a
	Bd1sqi54DoUfOcuonSwWiKISRp/gjf
X-Google-Smtp-Source: AGHT+IG2QYB2+56krLBk85ko6pGpX0D4THrfkt1zz892JTpjDOUAww9G2kctwSbBGnVpsEQJrH5Ywg==
X-Received: by 2002:a05:6512:3f12:b0:58a:fa11:b7af with SMTP id 2adb3069b0e04-5906d782160mr6219748e87.14.1760364890722;
        Mon, 13 Oct 2025 07:14:50 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:14:50 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:14:41 +0000
Subject: [PATCH 01/32] Input: cyttsp5 - Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-1-2c5efbd82952@chromium.org>
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
./cyttsp5.c:927:3-10: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/input/touchscreen/cyttsp5.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/cyttsp5.c b/drivers/input/touchscreen/cyttsp5.c
index 071b7c9bf566eb0b58e302a941ec085be1eb5683..47f4271395a69b8350f9be7266b57fe11d442ee3 100644
--- a/drivers/input/touchscreen/cyttsp5.c
+++ b/drivers/input/touchscreen/cyttsp5.c
@@ -923,8 +923,8 @@ static int cyttsp5_i2c_probe(struct i2c_client *client)
 
 	regmap = devm_regmap_init_i2c(client, &config);
 	if (IS_ERR(regmap)) {
-		dev_err(&client->dev, "regmap allocation failed: %ld\n",
-			PTR_ERR(regmap));
+		dev_err(&client->dev, "regmap allocation failed: %pe\n",
+			regmap);
 		return PTR_ERR(regmap);
 	}
 

-- 
2.51.0.760.g7b8bcc2412-goog

