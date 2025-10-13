Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E81E308F14
	for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Oct 2025 14:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364912; cv=none; b=M/vWPq0/lXKL5g2Z3H68LhfosjbbcmpFud9k5GOe4oRyoFashrwWrRaWQSRDAD0jnmPqZ35S8s4DojXABZAgXtj6p+H3Gosd2QKTv4DVzYG6frSCdkpQnQ1fS+QrKJEb9jDPGEiAzdQSIvrYA6763wcIVZ/IqONzrYLlILhUtHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364912; c=relaxed/simple;
	bh=I7TGAr67/gQzv/N2orW4jc5CGXZ/k6/Zdc8d4ItKKFs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o8knKVD6UlOLHm+CDcN++lxDKDYNmtxZevYzPsZT8kG802VrJqn+J7rfuqUpaDwD6EhzX38xxmVA2E+N9n5yud7ku6tqD6/G1te1F4pNJtTS7OWyy27NksaVktqRW9Xbs+l/YsMZnrL7kxf2d9OiVMU+q5Duj/MFNA3bc5qkmPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ChKhhebA; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ChKhhebA"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-57a292a3a4bso5390286e87.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Oct 2025 07:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364899; x=1760969699; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kj07cX9dfdog7qE3ITvyCUHudwQ7Qr1GriLN3ezW2JQ=;
        b=ChKhhebAhE2aPYsXHcKJV616z2lSP5D31R/nxFn427jZQ84CP9KcBHPxktdYOqYVyM
         F/f3WKuxsRx6YGuwKjW3Kx1GhU+sEBDv/BzmbRz2I+ek+TuHDcv29w9PFykPEZ1054ZC
         OeAOotwOPMFQmhJo0RO5BXSzBY9bfFjgEIVMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364899; x=1760969699;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kj07cX9dfdog7qE3ITvyCUHudwQ7Qr1GriLN3ezW2JQ=;
        b=NjxGy/7GHBKyVNlcUXtUeOXdoipalhHLOXdJo30FUYnkpZor3s+TcwNGsTDZhfdltV
         JIa4DlFuKMsWU4diCwrkl0eBPnKuan7DgFfhV9o0ImMQw5GfwarTGMc5Nfq4YHdYuX1M
         YC33s99zUVorlkKc8ZAxd4Kw/Vac8LIvh+sKONZroeQLjMPXqA/C8spQ08k4MdNS6IlX
         HGiwM3T/Qcg1Yx3MK+kX6mv9hV4gglnezZDPTUkVmCBbzXd6qfwUp/0uxMefZ3D1R5PR
         sLQv4pQ7pVB/iz0JbnnblyGKQaO6Ck5tzvQYAw68AdmSD31D2BC92l4sQhMGEhN2ks7C
         cUhA==
X-Forwarded-Encrypted: i=1; AJvYcCUdPmRnM9GqPRfU8iFYz9Re7K7Kk9AATuLfL5VOvqO9z0/AXp5YEijUWoArNGNr0whYfqLwL+VzYhIz84WrFLRYZg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8UjDzeRanaqDbxK6uFvneA7QXKmcIVHGNN2Nqgi3S7g1rMzbK
	gZJxMeh57AN25yDPvJIia6Qk8/NJYUXxn8lPgSuThZJIe65aA82wStbqYP01nJ+IDw==
X-Gm-Gg: ASbGnctvWvPlhhBAhVLm5uL483VXScUYlLc7Q1DdMIzCpD0kdnwVDq+edzY3um3otjW
	GGS21n4umMPWuCKYd5EuhCETEEAuSwObdsXUVviYvfqYc4vfn9r5+DeeR1s9KZ0IIJ6C5B0vQyx
	wur8ZuXpgWXcMk+jkoQYc7Z1/fyNDDW6rpcGKXIzwr1DHP9yusJyGGE7cn2Mol/QRhtDaZrReaI
	5jjasZejM4MJ9pnQvuE2yD9oT1KkZtEqY2vdJMdYWkDdS/xYHoMR9m3OmR48coz1tl0rNi2Q6px
	s42OMhr7YO/Dqj0QYbFK2bMU2u+gw0gltf5ftxkfeSRnZEz6BpN/lFCAXyJ6ovsNsBv4rZBxLZ6
	QaW1lWG+Hh9J8KSBftcWEH4jXoPLU5TCsYbLrr+8IPR9RD3ollv445uKQDSkywnjPXd3ds8mTQ5
	Mt6fICvARKB1hTjuDvvA==
X-Google-Smtp-Source: AGHT+IE2HB4PNnNNZPoJgrmm/zoBzzLugjubCTHQBbs/Uafloy4/vUsHxeeEoDk1I+UDuJlRtAHv9Q==
X-Received: by 2002:a05:6512:3dac:b0:586:7f:a141 with SMTP id 2adb3069b0e04-5906d88e732mr5437316e87.18.1760364899093;
        Mon, 13 Oct 2025 07:14:59 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:14:58 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:14:56 +0000
Subject: [PATCH 16/32] media: i2c: ov5675: Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-16-2c5efbd82952@chromium.org>
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
./i2c/ov5675.c:1188:9-16: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/ov5675.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
index 30e27d39ee445c2603b8fecf7a1107969eb97df3..ea26df328189eef449ce121c0f62a4ef02631830 100644
--- a/drivers/media/i2c/ov5675.c
+++ b/drivers/media/i2c/ov5675.c
@@ -1184,8 +1184,8 @@ static int ov5675_get_hwcfg(struct ov5675 *ov5675)
 	ov5675->xvclk = devm_v4l2_sensor_clk_get(dev, NULL);
 	if (IS_ERR(ov5675->xvclk))
 		return dev_err_probe(dev, PTR_ERR(ov5675->xvclk),
-				     "failed to get xvclk: %ld\n",
-				     PTR_ERR(ov5675->xvclk));
+				     "failed to get xvclk: %pe\n",
+				     ov5675->xvclk);
 
 	xvclk_rate = clk_get_rate(ov5675->xvclk);
 	if (xvclk_rate != OV5675_XVCLK_19_2) {

-- 
2.51.0.760.g7b8bcc2412-goog

