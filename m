Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B51F309F0F
	for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Oct 2025 14:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364926; cv=none; b=ZVNmmBWj1y0WpLDWFcktmhFrAYh3ORsKcepF6lCjusRH3CsxFYZyj4pkTr+gLaSduhIE6ZE1FUWmLOY2bURXcmFBawYDp5rBtLPZPj87O2EqdB0JBsC1EqJCb5hK9Uq8Ej/okNow/5KmkYQe6JfTj8IN2BHyPp3Qbb7gLgKoW/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364926; c=relaxed/simple;
	bh=c9Kb2b0T3BLAmckMzo48k+Ue6UmlyuOLb1cyxCq4tlI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J1gUI71hMsAjo3UP7V3HFSYO+yHHO0MMGVxb+BVyAmZXFfMy5uMbwxLn4k80xPAkfvPd5QR3Mg+YuzCOylwQo6jSbD7jQRVbtRnB3rBflUO5/wpDIca6zdY4Egt+fo8qmw+jCMBgDDISdvrNcOyFNwGa65gDvqlhxrf9sBac7/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Obg8UI+A; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Obg8UI+A"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-57a292a3a4bso5390519e87.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Oct 2025 07:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364907; x=1760969707; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Smwvmk+cDkyGjYaS177QmxkSssvQt/cgmiOzwIecscI=;
        b=Obg8UI+AAndLMjNpmQNSR4pFxdQvBmATLrW0tjlJBW3Ga82UvE5E7Bd355kVGoaHO4
         ttMWfRew/peUsFe5SIcszYqZy+eR2HHN2crwjPNUufybpRdiTHm0Bwnbfh/KyzTHuQqV
         O8YBh5SXSt+L03mH/Ayyllpx3mbN6eJlqmJrc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364907; x=1760969707;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Smwvmk+cDkyGjYaS177QmxkSssvQt/cgmiOzwIecscI=;
        b=ai2Rl4PXek5NC9WPgbLnlf8mkFjhC7i6OfY9t0S+T96JUoHZf4aSzCqnr+0ZnH+xza
         yid07FQLeheY9bdgJd1LytzHZNtmpEsqYfroYXr8cYvwU5qAcJ2U3PAb4VlybJxNJho9
         irOjDbBfBZ26m+B3pia5CuSynvqY/j4bQAhvOnreSQxfeO5csqGKORqgCJnntHiSJigP
         zGpsSCyBsW/JBn5OXLK3A/6kGS4KIBs592YuoynNru7YiLTgabZd5/fkG5LwHM4WGqn9
         InSsCYjiAsppdx0FA2DsctlCR1FOFPaXJvUWw/1kcxHc0lg+hJJNHJVnMGBi2TLlpgAz
         AS+w==
X-Forwarded-Encrypted: i=1; AJvYcCWonfIy2KqwgGPPS0a+db1TLQvKT1ixvD3xjdIq1Ibg5MDJRG6yuFaP3IcQCPWnCeQ8K4LMLbnISCgRNClWnChPqg==@vger.kernel.org
X-Gm-Message-State: AOJu0YynKSuukDSF/gTEOBxCjsliEJvaVHUrJnIncQigDnONJdPhcM0v
	B8BL56yawzrQ0SyCbA2HEEeTi2Oh0h2eXOZqJcTuPHU4xz0NRMKit3XTPiJqcjUJGA==
X-Gm-Gg: ASbGncv90/wcX2Gti0z8C6GEMbDbR97M/GXKRUmU7oBIoU+8hS+nxTFdr8Wqjs1n3lg
	CCHARRsXfhBVU23Y/KFsDfp+d9vmcpEQ4jqfn+BfcLndZPmyTDrEdR1eXH7T95orQSfpGxURZXI
	qdcYwvzpfMcRai6gnf4AzkLbzX5bY46IUmKkyyDMB18eDuP2e3+/Ip/9C0pVThy0ism57C0KsRm
	4sx+UmUNDjfEnVnThScuHjXV40K2cmAvlggrYujguystS91b7irQwhXyyEQNiW+CmGbA2Zx5GhE
	ttwLevvEof9JjSuEOo+G0r8MT4Kb4PnNeiO2sPgmuXpnB1lVXcCB2qZkb2GOAQn5DY14QzyQuYK
	r/iQvKV+mGPm0cWlit5fMTfpvVwHLAn+hXVAYVlvk6z20aa3iwHIgVkWa9YgypQKcxmliatcNMN
	mND5Gc9DiRO4vJDehtmg==
X-Google-Smtp-Source: AGHT+IG0XyykaxSpAJZEJBiMkxB//rHuKsliNYYIqdi4qrxeJQYdIviCb9iwNXvzzJnUAUziWI3Chw==
X-Received: by 2002:a05:6512:ea9:b0:585:bc5e:237c with SMTP id 2adb3069b0e04-5906dafca4dmr5906081e87.49.1760364906745;
        Mon, 13 Oct 2025 07:15:06 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:15:06 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:15:09 +0000
Subject: [PATCH 29/32] media: samsung: exynos4-is: Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-29-2c5efbd82952@chromium.org>
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
./platform/samsung/exynos4-is/media-dev.c:1337:16-23: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/samsung/exynos4-is/media-dev.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/media-dev.c b/drivers/media/platform/samsung/exynos4-is/media-dev.c
index c781853586fd21996105c050e587bf8079cfc095..d6f7601de597e3d3517ef9195d728deb578e74f1 100644
--- a/drivers/media/platform/samsung/exynos4-is/media-dev.c
+++ b/drivers/media/platform/samsung/exynos4-is/media-dev.c
@@ -1333,8 +1333,8 @@ static int fimc_md_register_clk_provider(struct fimc_md *fmd)
 
 		cp->clks[i] = clk_register(NULL, &camclk->hw);
 		if (IS_ERR(cp->clks[i])) {
-			dev_err(dev, "failed to register clock: %s (%ld)\n",
-					init.name, PTR_ERR(cp->clks[i]));
+			dev_err(dev, "failed to register clock: %s (%pe)\n",
+				init.name, cp->clks[i]);
 			ret = PTR_ERR(cp->clks[i]);
 			goto err;
 		}

-- 
2.51.0.760.g7b8bcc2412-goog

