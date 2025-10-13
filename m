Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45182E2DC4
	for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Oct 2025 14:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364912; cv=none; b=bd8cZZEDqzE3fdf4zMtKE/1l/WmR6VwW8dSmlquzdrZobCqBpVuPeDI4YW9RjWZ+wpGrLkeweeN3LPovygtw3/QOd1xVpsfwDd/ESNK7oNJHTlQ0McMp4g4q+8JMPID9yuu9FdZOHTZOU5tls9e8T127UEnY44qmJrXI8z93LAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364912; c=relaxed/simple;
	bh=skVdsDy23N9awwt8a/RTEZ0Qc6vg10QpvApVK58YUJ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LTDJiYhTzri2SoDQvtSDjyXj/QxcF0TboCD6BFfgvlxGA1Nkm3ZOxhf7bMkCbywXSDV6QyNfrVvUvSTOrnWefrpjjHQvfB+IEmuLlTqQpiSYdVn7fsb4IxFO06y0LEYY2mKpi5J99gPUqJqE2aEnb6a9IqpbWvmLN3iDm9a3eqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Pe/XMwe+; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Pe/XMwe+"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-57bb7ee3142so4896214e87.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Oct 2025 07:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364905; x=1760969705; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eZ1y71tufxgFEEk7Jm6x6zTef8El2vgKtA+3jSIjqY0=;
        b=Pe/XMwe+0Bh+ffbcNId0go0Mr1o5TxXm4tOgqWxQItHWDgtLXdBogZkl7S/qHqliqT
         gRAiGIqC68nZaPlzobe0RHjVjTOxxSHFMR/azRj/WOdePWzN8pGCXxK46adRVzzop+8e
         Wgc2Nov+Xwmp0YPjZeNGHYKedPFbmRihJdFZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364905; x=1760969705;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eZ1y71tufxgFEEk7Jm6x6zTef8El2vgKtA+3jSIjqY0=;
        b=LlPPWqr8VSv3PQuhrdT2cAJDtZ+vRJ3ViXzdme9zBt0EL07B/vkM4ePh2aYkyyoSRA
         ft/SYwTIz+AaIdvdnY1I4AeLrah86+UBF+Fle84MXYq7stdFcTsWOXk3eDx9M0ODPx16
         C4EAvUqspGv1b3KIJ3n4lS9igM/8CiHs26FF95wOXvoZBRTfzwjUINYqczCIf/94snor
         IXTwe0Z4cDPM6OEZt6RE+FTINh3Mi5hVV/vE8p3W0NINUwgnxbO3uWdP2FzNSnISMpvK
         VvzAILRzkC1cqbKQpAHlRoR2BaeHQymuYVqPVIrHUDtaLPrUr9qz/46RpsWDUVHTGMqi
         OuNg==
X-Forwarded-Encrypted: i=1; AJvYcCVlSh/WS1rL576h4jvTRcnnXuYS4jH1wmDIcyELPdkemmDiPJVBu8TT+Q17vFpNj4C/gMLmkaq4aQwGgqXKHoXveg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyN8PUf+MR7bWdHu+Fqyd4JaEWnuL/ojE6/KXbZaJWnX2BjaU+P
	HISkaB3WxqXHo/P256HEEPAhp072948n7z+P8h5m2OvOTmWNgD0FsHId6KoCEUGD/g==
X-Gm-Gg: ASbGncts4nTYi3B7c3Ej0OrH0qzBqO1i9OZpaH3EYBDJ4Me13XaCZfMX6d8aomhrCN/
	V4VfDfZ1oHkd37iUC8JKRQqOxOelDIQQkwDRTnoe5rrJOhA8u5H8hHLCP16IhZlihE9gyy90N5h
	E7Lwp9U3yB0tvcsJMLWuinzzpSXlgd2cuiMXXmrqIJCmIy4e3e0Wa4uLT+HIgD0d2Srpz//RMvb
	3N3rXcQuuKIPetuj8kHm7Ips11neMOXodHMkD1at6OAu5uWuo3m0rdaHEndFqI6JEWc4aBMxkA6
	6hrXZhSnOeA3kn8Sjgb11M0HNz//4B7t8j2wX6LbmeGol4wPTRSi5P61Lh76spKs95xA64WW1yf
	7iNQqSc2v5mwxZLyZrfIQVc+wJnIamaPKwiCNsWmAhoUUD2XgjXwrZQteDyGS3pu+jptqYZ96oq
	bCNvDn9IeDbR8TAilqcQ==
X-Google-Smtp-Source: AGHT+IFBH7uOHCgk463dX9utRYXWTvTjqks9NRSCe1XoUpKorvtzVnjNPhpyhsxKq9EgJCfyUEV3JQ==
X-Received: by 2002:a05:6512:ad0:b0:57b:1ca2:ab60 with SMTP id 2adb3069b0e04-5906de89076mr6151331e87.52.1760364905455;
        Mon, 13 Oct 2025 07:15:05 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:15:05 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:15:07 +0000
Subject: [PATCH 27/32] media: renesas: vsp1: Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-27-2c5efbd82952@chromium.org>
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
./platform/renesas/vsp1/vsp1_drv.c:958:4-11: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/renesas/vsp1/vsp1_drv.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
index 6c64657fc4f3366f27bb63dea56f535519af20fd..2de515c497eb8557602ec946de527823f07ab11f 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
@@ -954,8 +954,7 @@ static int vsp1_probe(struct platform_device *pdev)
 		vsp1->fcp = rcar_fcp_get(fcp_node);
 		of_node_put(fcp_node);
 		if (IS_ERR(vsp1->fcp)) {
-			dev_dbg(&pdev->dev, "FCP not found (%ld)\n",
-				PTR_ERR(vsp1->fcp));
+			dev_dbg(&pdev->dev, "FCP not found (%pe)\n", vsp1->fcp);
 			return PTR_ERR(vsp1->fcp);
 		}
 

-- 
2.51.0.760.g7b8bcc2412-goog

