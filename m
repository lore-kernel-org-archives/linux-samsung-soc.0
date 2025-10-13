Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0602BEC43
	for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Oct 2025 14:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364924; cv=none; b=TNQKXOo4km5iSIDo2y9oLqgw+ABX7Z5pbFkY/DaEBQWW0RtL0LGD5UyOIthnMvMBSymyMpmcnlm46A93MaB2Pcox/VJGtiDTxJPHXHn5lbkaQEl+O8Nu8+jkcA6dWN9NGYn6fumHuivF1D7zJaSKn+MLpdyRPUPI7BVN6NqK8G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364924; c=relaxed/simple;
	bh=8Y3wF3Ogu1PTCQAe9QDSmk3/csBKQwAsoOPfpiyO1ec=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=icDzOWEJPYVAn6fXJVGc3oOyO9GmnZFQGqn6GemWnB/tLa/JDLEh7q2qygk+9Io0W3JoKf2fGD5dGYwab5mC9n0RlDueP9KcENlQUA+g2XNRG8F6Gg3UMYeSIUpNN45mJkvOwVhRd2j9G3SsQNhYxUyaHSY1LDFFirx1PHhCVH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Bl/3tNe+; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Bl/3tNe+"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5818de29d15so5335689e87.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Oct 2025 07:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364904; x=1760969704; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gUxX/9XhZ4PnNBB1T7MELmfGG4IHXE3ZwCx+Au9dRPU=;
        b=Bl/3tNe+OMMoqxBGlH6akwvTnEU8G6RsNcggPSiD9hGBCwDdEQs71Bgxo8Za378RgX
         /MB97qA3nXh1x/5buObh6r6jao7WvrEEF30YmUNo322omVolR98+vhmahoGG6ahTCHuL
         9lxi1eoWGySnesHvejd0Vnj5kVDtbAMnSNHdE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364904; x=1760969704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gUxX/9XhZ4PnNBB1T7MELmfGG4IHXE3ZwCx+Au9dRPU=;
        b=oT8RyHdjD91ZlWv7RlWdgjuTt2PlSmNZW4Z+svP0g5miTYNXuOf+0W3eJiO4w3wNcO
         zDifWp+9tdawjRkNfMgGtfnJ6l+jgtkqhwfvRp8WYBmoVQFFBeNSeMFOr3tlIH35wgdL
         iO4dlzjpAGpqTyvQqtdTHtRDNByMy4qAiJGyyzjAgQUIMH5B0MreSDWGsiru047xKKuP
         5c4NnayX9hCzZ/dpEL2AwNBd+c66LE0RFLn4YrPs102q8XwZ8sX1MUv7SMc7NjIz9Uuk
         aWcRq8/+PtTzFIlHPWERc6Sh9NIoY5r7EBYlyPk0Esjd8mcDsbB6WH+3kg4ulYMbJbh1
         OkdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlHBxX9d25NdEitmJzyPm3Ojvj+igfOcckMecwRc80z2TI/ZETGyoCGRj/2rjagajJ4CKYa/CGJzbQfpeI3DxY4A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGlL0Dp+x+jSVNU8GGrrSVtNJRcMW4SvteGFxHoKnI5b7MJ8+f
	RZxKr3EbcMj0F75TDgx7k0Oskj970cwf1oZp5zMF88FR+2KR3O+V2SVuraCS5Q71/g==
X-Gm-Gg: ASbGncv+Z11U86Lj7C5Ozq0QFt8KzEbdb5UGs2l+DV6FG9xSW6cROEirirumn3BFYSR
	ZJIpbwmoFr4QrtkOZNBiYllIUX+enHeF3Kxc5iI/CvtQxHdVLkFeIylcG6XF95UjbBZq3tbELjS
	MKRTVXkbrEbkhmBbYicmtLIKAE2Ih1K/gb373fLZZQq0ytvnvcKRnxWyzxUk9DnnfiZa6zGXupP
	YERPDJvcuyRiJ3M+YYEG2Uwo0PXh4hzcnZAZMH1ZOtT76iA/t7Ybt+HJCsS9UTtp7Dhe4ZMP4zW
	A+CxnRCVNVSwE8WwZHJgQLxvLbXF5H5fgIh6mPlMsHwvWdVr9nsMNpw6kqnGqgVRIWM7OSyJE3P
	7cr9wYeJvUu4Bufbsvm2RO1FhvL3WyUd9drq61TwVDeSt4PFirVDwlvNDBu+Y1T/oLKfGw70+08
	JsKt4fO8H6TnFHggEeNg==
X-Google-Smtp-Source: AGHT+IFTTHLDJWS3Dn9Gd32yhET2ji8RYegzhadBkm4NFBADg/24WPxUjewhK5Qa14H7toVcPkN+hQ==
X-Received: by 2002:a05:6512:3f28:b0:590:656c:d11f with SMTP id 2adb3069b0e04-5906de88e60mr5677489e87.44.1760364904333;
        Mon, 13 Oct 2025 07:15:04 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:15:03 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:15:05 +0000
Subject: [PATCH 25/32] media: imx8mq-mipi-csi2: Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-25-2c5efbd82952@chromium.org>
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
./platform/nxp/imx8mq-mipi-csi2.c:422:23-30: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index 3a4645f59a44028fdca82a4d8393e1a0a6ba88f0..d333ff43539f061b8b9cf88af2cda8c44b3ec2a9 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -418,8 +418,8 @@ static int imx8mq_mipi_csi_calc_hs_settle(struct csi_state *state,
 
 	src_pad = media_entity_remote_source_pad_unique(&sd_state->sd->entity);
 	if (IS_ERR(src_pad)) {
-		dev_err(state->dev, "can't get source pad of %s (%ld)\n",
-			sd_state->sd->name, PTR_ERR(src_pad));
+		dev_err(state->dev, "can't get source pad of %s (%pe)\n",
+			sd_state->sd->name, src_pad);
 		return PTR_ERR(src_pad);
 	}
 

-- 
2.51.0.760.g7b8bcc2412-goog

