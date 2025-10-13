Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7D130AAAE
	for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Oct 2025 14:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364929; cv=none; b=IFgRnMn+K8tOZ/mUAsVgAcTtcA9oLuTw1k6HUccuNCMc43XmPtQHdfb/u6EJFxuXUFOMoIgdLr8kzPUA1paF/FOD8WROgECd6cO6Yr/dS/CXi7uMlN6ClwdWhAtE26ajDA4PGpxvAlWg3C2qAnXvTCju/7Z0gWdhXYwyGJTWHBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364929; c=relaxed/simple;
	bh=5KNyjJbgRQNGFLo6ZpLtI2lNcxP1iC+T2TtMMI7Vg6Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XTFaaaJhkGfQ3aodp3VqrrPwEE3nvnPBka6N5+OdkYBJDg+chnpDCZ7CoeQvXoaxBHTqQYebVJ5N4Vvk4s+kMaEn0pL8RXVYd5NBOIqR+uudZzGtMlzUzDsa2lXqdhhi74FBXM7iZaLMmhGzUglJGd6EvTl/w4Os6TJkrW2+QbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VUGcie5S; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VUGcie5S"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-57a59124323so4619940e87.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Oct 2025 07:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364908; x=1760969708; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LGG/+lvAfLoFYTFsHBbdKee0g975J4ynYIjn3miRvz8=;
        b=VUGcie5S1susvs9eOKhoLdi24WXIQZAs74cSlLLObj/4B0VDJ7J255jCsK/xzGZS78
         7y5FTc+nM1JS6L31w1D+yU4Uoa7NbxZyV+5ypjCnFK/CL5GdhWO+2O5RmFAep9xFciTn
         O8yUSJ0NtB2k6PrjDzwY1S5fXvWXqNrB8weac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364908; x=1760969708;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LGG/+lvAfLoFYTFsHBbdKee0g975J4ynYIjn3miRvz8=;
        b=uA4E0UjP1AR+QoqMhMaMEyTE2U0hmYZ7AbeP8kOakKOtLkPrwREMi3ZdHHB6Y5VRX0
         S3FkGWw3rDeR7RMHBk6g6lJL04FD14Fx4XHQxxglxGq96RB1mg8znaq0z0bcUknkwnq+
         eC0gVy3i/EXjzsS4XYUwFCUlqf1yTzLwn+aKJcEjtDr4PdbqifoxGtvMqDPt2sZGZ6vc
         9BNt6mfAl9T/C+KEWsWShOaZXBzUYLNtjoDhQt+Oo2Un0sIAEZLXdwpUWGx0X9EhrcDD
         SC/d9+ydQj8RdhFHOAm7HUjgJFmpnezjP+6kt12XbNDlSsWbZXcmxNPJ2OlZ0RNcoalk
         McYw==
X-Forwarded-Encrypted: i=1; AJvYcCXWjujek0dmdhbOYB5XBTFJV9NNSNxVg6+lXFQQlVVrYJfRTQ8d8j1KJqYLOgr2e9qBVBI2hUoFqa4cB7Kqcz9/fQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq6QEUjlsksXxdfoZxrL2QLq89ji4AsjX+V1MBEFobaH1TiOr4
	4/v7FqnKXwYFs/Uz7BnJYiPXCtKMtLwblCQWvqrz6VTyCTYFgXJh2O5sC3L8nG7vKw==
X-Gm-Gg: ASbGncsFfb2vPQSx2RQpS2XFBUE1iPuA3faWQo0rVzJRWj9bHpDrCGDuRBoUVznGfQE
	1x5nrqL9b6eouiYp1xhdLhwhcZpuRseTU7NX18ep+VlMewvuvXwpH+xXPmnFoB9fWx+nhWhoxll
	4tg6s0VgwlpzelyNn6r0VSWu9nRTOXBJJFzukkh5CudQHFgwGxblVCoVpumAi6lOOIRJQFZWjOQ
	ODq5GeLf65KarCnSXnwl24Svn118m7Cf1y/B8U///WbA3ONQkuPvrZ2hqf36yj+8I4izwfHC+8D
	h9vy5kz9DdXi1mWKJcKsqqEdWa6xAUI88wbyh95vaXlwi1cSOZHIGurqWCh/05mWmID4iNPmECU
	VA8bTvPReq5MbFXmXFfKgstm/koAr94lh7cDKJqz5j5cnX9n7utzNBy9QjZ4Uf9EvJYK12g5X1j
	YOmH1luMBNiZaF4lGGaBFxqmBdAVT60kHQY1Yg920=
X-Google-Smtp-Source: AGHT+IHonGCa8by4IRlUhFwqne0G+xChLaB77A4Elu7KHX/ytkwCKxhNDSfo6zsqaOoV+Q8fGGx9SA==
X-Received: by 2002:a05:6512:1093:b0:587:a4fa:1e50 with SMTP id 2adb3069b0e04-5906dae5b56mr5886844e87.41.1760364908274;
        Mon, 13 Oct 2025 07:15:08 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:15:07 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:15:12 +0000
Subject: [PATCH 32/32] media: staging/ipu7: Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-32-2c5efbd82952@chromium.org>
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
./ipu7/ipu7-isys-csi-phy.c:311:23-30: WARNING: Consider using %pe to print PTR_ERR()
./ipu7/ipu7-isys-csi2.c:59:22-29: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/staging/media/ipu7/ipu7-isys-csi-phy.c | 4 ++--
 drivers/staging/media/ipu7/ipu7-isys-csi2.c    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/ipu7/ipu7-isys-csi-phy.c b/drivers/staging/media/ipu7/ipu7-isys-csi-phy.c
index b8c5db7ae3009e16264d7aaca6d4d237c1402ab7..2d57178835188a44b002b38712437cbd551751a5 100644
--- a/drivers/staging/media/ipu7/ipu7-isys-csi-phy.c
+++ b/drivers/staging/media/ipu7/ipu7-isys-csi-phy.c
@@ -307,8 +307,8 @@ static int ipu7_isys_csi_ctrl_dids_config(struct ipu7_isys_csi2 *csi2, u32 id)
 
 	pad = media_entity_remote_source_pad_unique(&csi2->asd.sd.entity);
 	if (IS_ERR(pad)) {
-		dev_warn(dev, "can't get remote source pad of %s (%ld)\n",
-			 csi2->asd.sd.name, PTR_ERR(pad));
+		dev_warn(dev, "can't get remote source pad of %s (%pe)\n",
+			 csi2->asd.sd.name, pad);
 		return PTR_ERR(pad);
 	}
 
diff --git a/drivers/staging/media/ipu7/ipu7-isys-csi2.c b/drivers/staging/media/ipu7/ipu7-isys-csi2.c
index 4023db4a6466dd57f0ac007847bdd74bcdf394f7..f34eabfe8a985f29fa48b4a8896a058fde2f2b2f 100644
--- a/drivers/staging/media/ipu7/ipu7-isys-csi2.c
+++ b/drivers/staging/media/ipu7/ipu7-isys-csi2.c
@@ -55,8 +55,8 @@ s64 ipu7_isys_csi2_get_link_freq(struct ipu7_isys_csi2 *csi2)
 	src_pad = media_entity_remote_source_pad_unique(&csi2->asd.sd.entity);
 	if (IS_ERR(src_pad)) {
 		dev_err(&csi2->isys->adev->auxdev.dev,
-			"can't get source pad of %s (%ld)\n",
-			csi2->asd.sd.name, PTR_ERR(src_pad));
+			"can't get source pad of %s (%pe)\n",
+			csi2->asd.sd.name, src_pad);
 		return PTR_ERR(src_pad);
 	}
 

-- 
2.51.0.760.g7b8bcc2412-goog

