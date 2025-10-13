Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9E6309F1D
	for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Oct 2025 14:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364930; cv=none; b=OY/k2DNDnfyKeRV72VtSNhvDolEDyIkiBmnuV+sOBdPuoqgPCcfkXsMM4tzX3okljNF617H1ATnq5ODnkF59bnFKJd6vq3vKEWnNlBAcHl32amlNQd6wqGpEunrui2s+1KXy9I+9IP/1xuKA39thjyZMowGsxXeU3wzoZ752MVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364930; c=relaxed/simple;
	bh=13OLz3ayUSOskJ/koG5Yo/gq8bsy35PH0jrjBKE+QnI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u9KJPQHikXpGNeE/7pMchBuFmIJo9EATcjrMgijYkjpEMPs1Z/sRU3aeCN/oYt0/mgKmn8q4LN9HuQG1qmU0l0eRwj38ArA4F7y5gLjWFO/FWomFJlQoGl/WgstKxzDvHAr0QOjPFF1+Sv4mkit6BOqeLjdbyMkRLF3XDY9ED/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CWFXNHcu; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CWFXNHcu"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-586883eb9fbso5711857e87.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Oct 2025 07:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364907; x=1760969707; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5P2qDb2fF8LDzF+Q7SobVA0m4pVGtYbfI8YlHA3qkzo=;
        b=CWFXNHcueXVWOwcAoVQJ8klxj+nMfw1192cgAlKmEj1N2WvAGAM0ofXrCDOLJv8fKU
         7dEm4tqJk5clyD9k3btKHvw2aKJ8ZDJ3UJAOmMQNTKmtokguSPbxcMO4p04YaaEC11hk
         KQgRH3AZrgSFg8NKTN87vBD8y4VNvhJ/vd0IM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364907; x=1760969707;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5P2qDb2fF8LDzF+Q7SobVA0m4pVGtYbfI8YlHA3qkzo=;
        b=WTppBON5q9OK5aZtU+jcEc1JJXd9sX4cVLAT6iotJHYMhWxnsD50XKu7y/Lmzkgug/
         JJnpPKxMlY1/2w/zDEdXKKUK5OkdC23BzSt9FAgQLtjh4luQl6Bt+orCrDiwCo6R7mVu
         vc6ObzxXSGUFeICHSHC/JKsb+VL7ttFakzLb+sw1huokwNfCSqpnfFIZqCVhxuSEAKHd
         Jg10h6n2EfL96JYGCsyiVlodQckM/I8IWXl5aax84kgVpMhT0/T+ntARcpzWexC3H4Nl
         WVn8+C0Ni/0FwvQ/tGRNEigRrQJ0FYWY0fK+WgnIBLMEAiYTLdoDPAfcA4zbuXUMwm3W
         LxPg==
X-Forwarded-Encrypted: i=1; AJvYcCUNdf/CNygse4uGQoAeiis+LUep2Dr9/vzH/5TLvptF10E0qkWQwlltUpEMSMlrMnElVUoLnQnBVVgLbXMeURA/NA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHlbNzsM+sHdHykdYxZghG+UsaAsy6tG54nuQ1SUoR4c+T2I4W
	ku1hXDQmeeSf97JPBX8N7vldsSnB+CVgjykDbnfPFsx+2jjcwhBUx6ClZ6nz++Z/ZA==
X-Gm-Gg: ASbGncvCFH/MMnQEnA3Ad9KVvengRlwr6dq6IUzl/agZqDsJGiyXghVRr9pZLIbKvYk
	Ex85AQVbiXBpblsoCmbmEOTsin3ou8QWMJ6hcZliabSZ3d7qaVuhWhvkavI8t+5ALZYXixoTL01
	cnIpFqdef7pT5NkqGik70R3bRU6UsQT+QFsQvzQxRmwp8rU7LjULtmxkAvpwbyq/0rKrOUX+TMi
	FN2g3ATwDTjaTknyrKaHsKjch+xw9q/d7XDmQgQ4zKLkPBoke2I2m3+Z/Gbr8L5B0lCqu1N9mjw
	+L+gKN2TXpsn7iRbsZiSo/z2zyrfYhP4PuLpxRDMQTjvCxi2dYTB0KEVo7oL9I2oTXeicdaXg4t
	fetVfql4fra67u4vaRxpNFw3bN1cR7X0LFcxi4TfGz4u21kyP5jeiLqsyWgzY/peZHXem0lkb52
	6T7r1N1rg6fSUfxQtETA==
X-Google-Smtp-Source: AGHT+IEQsTtyBvH7wA40gxhWBW3oPtbImGl+YQPk0oKm5qusk9oOE9kCkc6erWew+lMrb0jYwU0vow==
X-Received: by 2002:a05:6512:b19:b0:579:8bbb:d61b with SMTP id 2adb3069b0e04-5906dae8e6amr5727710e87.46.1760364907237;
        Mon, 13 Oct 2025 07:15:07 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:15:06 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:15:10 +0000
Subject: [PATCH 30/32] media: ti: cal Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-30-2c5efbd82952@chromium.org>
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
./platform/ti/cal/cal.c:1111:3-10: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/ti/cal/cal.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/ti/cal/cal.c b/drivers/media/platform/ti/cal/cal.c
index b644ed890412104887ce3ec32b5024a02a9676c8..3e25ce0c3c3bdce3434d19c416481bd8d8b838f5 100644
--- a/drivers/media/platform/ti/cal/cal.c
+++ b/drivers/media/platform/ti/cal/cal.c
@@ -1107,8 +1107,7 @@ static int cal_init_camerarx_regmap(struct cal_dev *cal)
 		return 0;
 	}
 
-	dev_warn(cal->dev, "failed to get ti,camerrx-control: %ld\n",
-		 PTR_ERR(syscon));
+	dev_warn(cal->dev, "failed to get ti,camerrx-control: %pe\n", syscon);
 
 	/*
 	 * Backward DTS compatibility. If syscon entry is not present then

-- 
2.51.0.760.g7b8bcc2412-goog

