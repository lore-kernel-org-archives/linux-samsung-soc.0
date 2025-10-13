Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FE43093AE
	for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Oct 2025 14:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364921; cv=none; b=mCRjkfqIGlmuOV43JRNPmpoFAIf6VUsjC6TZm9+KvS59WqNWGDK5Emp/JaYna+Lk8bXiLxbDOo8zKbRbhIJHO3ETyjkw1c9/fPZWl2qxp2l07V2H4KmiMFNjfoy2aE/kWWnW6lrGMVCKsnKZ9nzgduTSWpB3Hqdj0S5MwVehy4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364921; c=relaxed/simple;
	bh=1KGLnwkNkXZu6CtEdNPModZR1Vc28L95VShr6d6uVXE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OJGX3y9Mc8JHpNvZjDpzl+3RuxZ/9CRbvpY90YrFcoqPImCSpNhkGNXcmvRgKJ8vBWoKfKrPRooEC+qUJl3uwjqmUAjLLdP0EV4WJUR+WXH8DKZ8XS4pAeSyDcImtW10k33bZLusBHW87GG4CmBcG/yXq7M02+Aar9kpwYW3kZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KBkCTGve; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KBkCTGve"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-57da66e0dc9so4294622e87.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Oct 2025 07:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364902; x=1760969702; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XTfgrP773mTzuIwpFbkRpkdwa1sJQvDkaUU5vsQzRTQ=;
        b=KBkCTGveZFTbNnm9yL8Hva2hAVSadFJTVH/gHAix+vxv5DRP/QYgtuQhpzVdIOJXfX
         ASvboVONdg9jucIO1VpkVrKI2Q/4V6STrYUGqayCJSC3eHHhqufyJ5kHA94a+zNwwTk1
         nIZp3GiISQDgZHP8/+k9u/49ZquBxlesRB8bo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364902; x=1760969702;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XTfgrP773mTzuIwpFbkRpkdwa1sJQvDkaUU5vsQzRTQ=;
        b=mEbSsguwsemmF7EnsEVQwFZe7I2/jrtYkwmgayRQ1WD3+0DwvsrAszVhNhLWav+Crx
         jvPNL0F4ruDZIsgp+tB0QlE1y87fXCtWLBy1sPPiHTWMQ2eVVQSr6UOxRy3gzlJ76st9
         nCYiNjtmEbjSUO8A+1k50do8AwA0Z7b3K17YCSkv+LKuCvhlYwsy9U7vR6axzwWp9Tmt
         IsncnYFriHNotamDT+1psdDoWzOI8EIaHv6ltg/KC8lt6XA2PAG558GQHRVNvBTwGr/1
         xSA7mNfaboGbuYNuGR5gxkEJSVcZbpIw9R9sOef4Hk2lhNIfnyHmsFMnvZ+IsbHOT+qD
         F6HA==
X-Forwarded-Encrypted: i=1; AJvYcCVYAxLHPFy2OLkYVAdCoFIIPzfvg9S4W+xr5cFlDBKUKLcG64PObKbBfWrIHbeKFI1MWICYfZUlq0uZoveEeWaKVA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvUGEo++54VQe0+i2bCAIAIk5muyT6wg70m2gONZq8AlW3ApvG
	eVong9NKfBP6OCvUsWZuVY6YEHcgyZm7zl3+27jTNSkDNF7g9t/yvI4VY6SiUTHNPA==
X-Gm-Gg: ASbGncvZ7HOjU7Nblzv5mC/lcTc5kJ3MH2Z6r6QrJoGMWv0V6NQPsLcGuKYEgRUf6qT
	MLL3whtqUp35SJWtAU3ENuz5XzcsTK50PEmrIWaepPTD/XCFRPr0urZHjcGiD6lIMYybLE5T9wz
	3LXlrAPbZ2x9bqxafPSFKAhOnUWGQFuwt8Pm1NTuWa0J1hkXxoUu5ExFSYGJIOmHCKYdPxYs7yq
	mBoxnQpfn5zh9z71M6kmSYjfl/qbKrfSO3QhDg9PGZNp0/5OagxX6nELH+UyMZlJ4MjNYlVAqiH
	teqlO5WJW5UFZWHpbaISJOIuYrbfIm9/03QKCP9sb5SmWLs/m6NBsI0c2lyX3toHq09ydp2qW/i
	ZGLBfW/KmB9V9PkrpyrJ4p0qxp5E5j0RzkhGtkD8F951ZepPK9cKKEuOhnxneKk42OImIMAeA6h
	tJlQ8aYz/9gJ4RUTf9PRxESw0rPFls
X-Google-Smtp-Source: AGHT+IEmYSyu4nHTtG8vRgmb2LccUUeX39k0JKnrkMfDo77UUQwM9CrYH1frfefAQcn5JPDuzUf+OA==
X-Received: by 2002:a05:6512:104b:b0:58b:394:fd4c with SMTP id 2adb3069b0e04-5906dd6fb89mr6060927e87.33.1760364902483;
        Mon, 13 Oct 2025 07:15:02 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:15:02 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:15:02 +0000
Subject: [PATCH 22/32] media: ipu3-cio2: Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-22-2c5efbd82952@chromium.org>
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
./pci/intel/ipu3/ipu3-cio2.c:318:19-26: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/intel/ipu3/ipu3-cio2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
index a87f105beb5e267fd450b8a36ef9b0e0ecafc598..986b9afd7cb5b6a07c796b4333f93d427a8c4fbe 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
@@ -314,8 +314,8 @@ static int cio2_csi2_calc_timing(struct cio2_device *cio2, struct cio2_queue *q,
 
 	src_pad = media_entity_remote_source_pad_unique(&q->subdev.entity);
 	if (IS_ERR(src_pad)) {
-		dev_err(dev, "can't get source pad of %s (%ld)\n",
-			q->subdev.name, PTR_ERR(src_pad));
+		dev_err(dev, "can't get source pad of %s (%pe)\n",
+			q->subdev.name, src_pad);
 		return PTR_ERR(src_pad);
 	}
 

-- 
2.51.0.760.g7b8bcc2412-goog

