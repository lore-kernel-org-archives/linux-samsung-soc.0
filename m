Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31AAF257828
	for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Oct 2025 14:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364895; cv=none; b=ixoLBVvbPr6nn3yVynY1ib0pM+/wH1kFFeJt3KL7bctx1WI1PtPf0WLvmj9JQUyP2ZR+syacjNiRbBXvDNdqP3ETNFInjKC53I/8TgpG0YB31tKUWg1pnCahYafJfLYq+K17mNqrUXRpKKXO2txa6Zyj83Bfu4hYudg75sJT3Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364895; c=relaxed/simple;
	bh=xM6+M/SyFflYknH7dftgYleR+CqneUH3h+wd93U33vM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PiLM0C7pk0sfdo6aV1Dt1U3rJSXGIO8J91FGgFAP2s0lkt2pIrykj7bDfQ9QgBO2CDifte1FIz9cxvr9WszDLG7XU5omJUOAYwU+G2K4BdQYQWPd0/FtmR5OR+a8zay5fRuj2OH99BQ+TKOgrTxdRDJAXxbco9KNSKu8Ra5BGRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GyzHZvp1; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GyzHZvp1"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-57a604fecb4so5593463e87.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Oct 2025 07:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364890; x=1760969690; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4+LqH67jKM/F3LSKb9pvwKSduKssNZljIxm4L3nejxY=;
        b=GyzHZvp1DOcvm7vHNL+Td8CmhMsk7TGVNgQIoBjFfw4L6zQ+OeVeqG20NlrFcVTiOo
         4SQ1ZVy/dPholR5fEtit++d7J0+0xfUghp+joEVL3M0cVcWiLQ4/R+2J1Itjupw9xQF1
         Amug60kwa5bWueyMVrjWpjKqRNCPdFu5Wt7tc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364890; x=1760969690;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4+LqH67jKM/F3LSKb9pvwKSduKssNZljIxm4L3nejxY=;
        b=xBWOJQZsucNhek8Kcg+RJnqnmPcc3zhSfl7Id0w+9Jc7X0ujphJoIpW4ho/ur5bR+q
         GZHG3XqRsXyCNXrwU/0wJCcYcob8rbR14kkHp1gOOhGfawhU4iz7H6CCz2sTRBRekH/z
         pq0v9k7Rf35tvgmE4IhEogfwdXxbHt85DompTYtlyvW3URCbiPAfbILSqFSAZIigmOSe
         ulg87HhNNp4n/+LMaBTt1vnxiA6F5VmjHS1whRt4NCWR93oVYI9gSMrDwbzBxXQct+yy
         2U/uDdgfdszdSdvNc7UUsYmYAXF7GSIcr++swg8iBDwiXUIi8S0DZTTqOMcXFS8fG74i
         Oo5w==
X-Forwarded-Encrypted: i=1; AJvYcCXWaKeB9Ucv5MYc4LdLakiI7wmM3HxSBRB9jG7t0a6N8aC8TK+IG/2k1cqXTLnDBMMFJuF5LhQwkvn501+iFSGL7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNZPPhrRowd0uogO4AepAJ5M1rjaZ8ybPpXC3QkwXlD9uNG8vN
	jals9r3pEqPGBpBSg5lBIVOZDWmbLieWoBOVKipC55w4vZPxwhsrdBgryqcxLAwnUA==
X-Gm-Gg: ASbGncthItpk61u9qhvmd45eHRTpnVNr7CIkvVtoDlmubRLtPj2wLF+VmLLKgI9P0re
	S2dn0VsVw6gDpv/r6q3uPad9TghIHh5YHkXD2YQfwhcpcFBDTJPrwP/+Ymsmq/Cp0CmxVwJk5BN
	DYW8sDKpwPZwCs4toocozqJCKUpO4+1oIbaAq+SkIM1duN9waBJFOHfA1KP5WaiG+E1LgBuJEwp
	lCZgihygL+Oe0wSPJeHXFv8Gs9eFQ6J16/rznyKJm0oAH1Cx+qxAlMfhSvCX9bMrIhBOX3LUoid
	M+YMnfCe4KV0P7zOdd7M9v+H+0NJ87NCShEds3NP46p1bXb/j0Ms7XY8oyf66m7x0rN0lKwmFUG
	AVxeBi9Dm91iQTh7kI+gzDtFaNRAxYgulU72qEIvCgYkAXWJkuwz/cAVeQOfhE9lcyKur+7iwAj
	ORbi8VlAdyG/VvV2R0Xbv7QzPxaT2U
X-Google-Smtp-Source: AGHT+IG+iBDcqiuo6CtjHJApPQk8SPIEd1S5IwUf4U1/yNdgttxsX0zixn6oQdpzKAlIqjeJyJH+pw==
X-Received: by 2002:a05:6512:1110:b0:590:656c:d114 with SMTP id 2adb3069b0e04-5906dae5d1bmr5995198e87.46.1760364890201;
        Mon, 13 Oct 2025 07:14:50 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:14:49 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 00/32] media: Use %pe format specifier
Date: Mon, 13 Oct 2025 14:14:40 +0000
Message-Id: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFAJ7WgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDA0Nj3YKSovjUoiJdy0RzSzOLtOQUQ8s0JaDqgqLUtMwKsEnRsbW1AKj
 z2DxZAAAA
X-Change-ID: 20251013-ptr_err-9a7968fcd19f
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

The recently introduced test scripts/coccinelle/misc/ptr_err_to_pe.cocci
checks that we use %pe. Let's make it happy.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Ricardo Ribalda (32):
      Input: cyttsp5 - Use %pe format specifier
      media: dvbdev: Use %pe format specifier
      media: mn88443x: Use %pe format specifier
      media: adv7842: Use %pe format specifier
      media: ar0521: Use %pe format specifier
      media: ccs: Use %pe format specifier
      media: i2c: ds90ub913: Use %pe format specifier
      media: i2c: ds90ub953: Use %pe format specifier
      media: i2c: imx274: Use %pe format specifier
      media: i2c: imx335: Use %pe format specifier
      media: i2c: imx412: Use %pe format specifier
      media: i2c: max9286: Use %pe format specifier
      media: i2c: max96717: Use %pe format specifier
      media: i2c: mt9m111: Use %pe format specifier
      media: i2c: mt9v111: Use %pe format specifier
      media: i2c: ov5675: Use %pe format specifier
      media: i2c: ov5693: Use %pe format specifier
      media: i2c: ov9282: Use %pe format specifier
      media: rj54n1cb0c: Use %pe format specifier
      media: i2c: st-mipid02: Use %pe format specifier
      media: ipu-bridge: Use %pe format specifier
      media: ipu3-cio2: Use %pe format specifier
      media: ipu6: isys: Use %pe format specifier
      media: mediatek: vcodec: Use %pe format specifier
      media: imx8mq-mipi-csi2: Use %pe format specifier
      media: platform: rzg2l-cru: Use %pe format specifier
      media: renesas: vsp1: Use %pe format specifier
      media: rkisp1: Use %pe format specifier
      media: samsung: exynos4-is: Use %pe format specifier
      media: ti: cal Use %pe format specifier
      media: staging: ipu3-imgu: Use %pe format specifier
      media: staging/ipu7: Use %pe format specifier

 drivers/input/touchscreen/cyttsp5.c                          |  4 ++--
 drivers/media/dvb-core/dvbdev.c                              |  4 ++--
 drivers/media/dvb-frontends/mn88443x.c                       |  7 +++----
 drivers/media/i2c/adv7842.c                                  |  4 ++--
 drivers/media/i2c/ar0521.c                                   |  4 ++--
 drivers/media/i2c/ccs/ccs-core.c                             |  8 ++++----
 drivers/media/i2c/ds90ub913.c                                |  2 +-
 drivers/media/i2c/ds90ub953.c                                |  2 +-
 drivers/media/i2c/imx274.c                                   |  3 +--
 drivers/media/i2c/imx335.c                                   |  4 ++--
 drivers/media/i2c/imx412.c                                   |  4 ++--
 drivers/media/i2c/max9286.c                                  |  4 ++--
 drivers/media/i2c/max96717.c                                 |  2 +-
 drivers/media/i2c/mt9m111.c                                  |  4 ++--
 drivers/media/i2c/mt9v111.c                                  | 12 ++++++------
 drivers/media/i2c/ov5675.c                                   |  4 ++--
 drivers/media/i2c/ov5693.c                                   |  4 ++--
 drivers/media/i2c/ov9282.c                                   |  4 ++--
 drivers/media/i2c/rj54n1cb0c.c                               |  8 ++++----
 drivers/media/i2c/st-mipid02.c                               |  4 ++--
 drivers/media/pci/intel/ipu-bridge.c                         |  4 ++--
 drivers/media/pci/intel/ipu3/ipu3-cio2.c                     |  4 ++--
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c                |  4 ++--
 .../media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c |  4 ++--
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c                |  4 ++--
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c        |  8 ++++----
 drivers/media/platform/renesas/vsp1/vsp1_drv.c               |  3 +--
 drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c          |  4 ++--
 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c          |  4 ++--
 drivers/media/platform/samsung/exynos4-is/media-dev.c        |  4 ++--
 drivers/media/platform/ti/cal/cal.c                          |  3 +--
 drivers/staging/media/ipu3/ipu3.c                            |  3 +--
 drivers/staging/media/ipu7/ipu7-isys-csi-phy.c               |  4 ++--
 drivers/staging/media/ipu7/ipu7-isys-csi2.c                  |  4 ++--
 34 files changed, 72 insertions(+), 77 deletions(-)
---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251013-ptr_err-9a7968fcd19f

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

