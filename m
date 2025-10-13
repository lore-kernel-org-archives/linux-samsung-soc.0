Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C8031328A
	for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Oct 2025 15:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760371047; cv=none; b=QKIP4NWpMFr+YqWxWf/8av19vt43a3DQTtSXa7BLZkON4LXsh+nyVi5trhxuX2hqLGwvEZiuWJXjT3xG3nqiGVsQ97n0oRDddMBf/9DLqCG5gmx9++20qtdOnsIwNmLuCCkayrzTLdEf+ciGCH/mF9VvnOw/2My7/nq6CV+BwQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760371047; c=relaxed/simple;
	bh=cAB0kIpqj20tM7yHpaFoe3xcfA2AB5cxFaYcvZmpAuc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ifswo6ARf7aG/jSDiCV0Dw9PwSSvZz4b5FCOrrqWtwutpfdocePSAw41XLES9bq7gJ/rfVOquXbmxiqTCH/uH+J2OZgOFuL5+04tRiGqyVfqozF6nNlYy5+RwwPTAHGlfeCWSGgfokAoiQRbhXXBWZRiM6pRd05bpcfGIDuHTMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=V0EYd3I2; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="V0EYd3I2"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b4aed12cea3so697226066b.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Oct 2025 08:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760371044; x=1760975844; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LK0kBaNkf30iNo8Y7sNwo/F78yA794Ns47GaxpHfRwE=;
        b=V0EYd3I2X8O+/AvdkrnJAn+OgDtXBx6WZdtLuvGfIt8DEb6whyQzz0mTzh729qwmKF
         FxFil4aZflSdLdp24Ymj7ZZzqgUSr5nlg2Jc+7psyVSt0JSJmEy5L1wo5LZYFdg9qxiq
         YoEWDf6G0Nxxjil19OP2Rt5K7EZYnq4pnPqQY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760371044; x=1760975844;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LK0kBaNkf30iNo8Y7sNwo/F78yA794Ns47GaxpHfRwE=;
        b=Dk5nwUfCReq+tv4ZshJwDIvgMqIj8iL2pEaAwK2UFsIDAvQfLFESbv4mQIzt82uhBs
         macX5E4NZlDB2HJerhtJrQNbJyoKSNCVL2n5iQBrbelN2DXXsZpUKH5Ja1lBxTsa8c6E
         kNUfpZb4ZpvkaK0J4wH4W5bF96AVCVSYBI1tCRzvUGfkAymHzBvbJwh5rS7EBpX/zRVf
         W/k6GQIy6aNTSEWlz+MAQXqPR9Ou+FZ8le095zHtJz7IrWZZZxmFiM3NF3hYURLohQMe
         6pWQBYWRdiGy0wIaGDAPM0pMNjiMhI1+NssHrfGeAwL7zzzCe6fOdpSiQ1tvgyVoO7rz
         5aAw==
X-Forwarded-Encrypted: i=1; AJvYcCUxRD1nJ0q9I5dHHTr3Wg63MHWjuNmfAyf81DR88ilNbrI6q9pz3tVNgCVjDxDs5f/Yc5ZJpdtJytYNtgiZenEVOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzPugqQqEpC0lmqh6SShH1s8+yCMh6hAk11UKzoho3OBGGeGtu
	iYwWtbdNo2Rqk5StKTHO2+QV1gleA+5FLpCYnuu0bJLl7W/H3dIsEeCbEXv9lT5lqAn59bbqWfk
	5C33bFEXs
X-Gm-Gg: ASbGncs7bNvKDIr1aRfHgNrF8nKl6mu3T96GkFsbo5LJfDtTKjAZG1lCSh+v6yMS5Ka
	f1xUiCOB/UkgAfUd/n5F4Z4DVe69LuRa2sxEvh0nPwNYF9s6P9R/bEhrtyw6Ah5rvfRJADf5aS8
	SqggK37OZhqw/mFexO26+eYZjE5Bhx4BdCQGaV9vDFTV8Li2qhq68qPCEgCMoAwTdnLe1gKynTl
	lI98gvV80Jl5xsxV9ISLgPIhq1c9U6fZLaNmW+yMCg4mkX4f2kVn8DHTChS+fr1b1eaZjJUfLz+
	ik62RkAttpcz1idtjFNubHws566PFSh43aug4wpet756svRBXjU0XHgYvGkHPxozKgmqvo/bMrn
	tRpu/p4X1Uk7uNn29fm84N9hVvxEsrwcEGkBlZ9CHfwE2QWjv1jrPSKsJNpHb4vkEc7i7L3j75a
	O2tgY=
X-Google-Smtp-Source: AGHT+IFsQXpqoGDAcF2MGoxcI8shO7YPDo5bFc1PP7FEDrFkLl1lr43oMyGY4qtaZFkaY1GJtNqddQ==
X-Received: by 2002:a17:906:eec7:b0:b46:8bad:6960 with SMTP id a640c23a62f3a-b50abfd69e0mr2415925866b.31.1760371044025;
        Mon, 13 Oct 2025 08:57:24 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d67c9b68sm950019666b.32.2025.10.13.08.57.23
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 08:57:23 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-637dbabdb32so8609782a12.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Oct 2025 08:57:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU5k2SWUz3Zvsql2Vl00RM8t8Tc4xqlFgpODpLq5voqPKBvysbhlKV2l8sTJgjWwg8jdDOkXwNtdb1MRIiBWVxsgQ==@vger.kernel.org
X-Received: by 2002:a05:6512:1095:b0:58b:75:8fbc with SMTP id
 2adb3069b0e04-5906dd8ef00mr6030162e87.50.1760370658194; Mon, 13 Oct 2025
 08:50:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org>
 <20251013-ptr_err-v1-1-2c5efbd82952@chromium.org> <aO0cXYeGLwwDABP6@lizhi-Precision-Tower-5810>
In-Reply-To: <aO0cXYeGLwwDABP6@lizhi-Precision-Tower-5810>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 17:50:44 +0200
X-Gmail-Original-Message-ID: <CANiDSCtxnR-ydCquhH1=g-XwZ9DN=eeJNxRBOGiqufS_DMYzUg@mail.gmail.com>
X-Gm-Features: AS18NWAjEedfD0tRDHHy9p2HIYCpNxcTQpn_Xf2f0oNW4TLvTJ881tcLSkxWDmQ
Message-ID: <CANiDSCtxnR-ydCquhH1=g-XwZ9DN=eeJNxRBOGiqufS_DMYzUg@mail.gmail.com>
Subject: Re: [PATCH 01/32] Input: cyttsp5 - Use %pe format specifier
To: Frank Li <Frank.li@nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, =?UTF-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Leon Luo <leonl@leopardimaging.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Julien Massot <julien.massot@collabora.com>, Jacopo Mondi <jacopo@jmondi.org>, 
	Daniel Scally <djrscally@gmail.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Yong Zhi <yong.zhi@intel.com>, 
	Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
	Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
	Yunfei Dong <yunfei.dong@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Rui Miguel Silva <rmfrfs@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Dafna Hirschfeld <dafna@fastmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Frank

On Mon, 13 Oct 2025 at 17:36, Frank Li <Frank.li@nxp.com> wrote:
>
> On Mon, Oct 13, 2025 at 02:14:41PM +0000, Ricardo Ribalda wrote:
> > The %pe format specifier is designed to print error pointers. It prints
> > a symbolic error name (eg. -EINVAL) and it makes the code simpler by
> > omitting PTR_ERR()
> >
> > This patch fixes this cocci report:
> > ./cyttsp5.c:927:3-10: WARNING: Consider using %pe to print PTR_ERR()
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/input/touchscreen/cyttsp5.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
>
> Suppose it will go though input subsystem intead of media.
> Need post seperated at difference thread?

Indeed, it belongs to input. if there is a v2 I will move it to a
different thread.

Thanks!

>
> Frank
>
> >
> > diff --git a/drivers/input/touchscreen/cyttsp5.c b/drivers/input/touchscreen/cyttsp5.c
> > index 071b7c9bf566eb0b58e302a941ec085be1eb5683..47f4271395a69b8350f9be7266b57fe11d442ee3 100644
> > --- a/drivers/input/touchscreen/cyttsp5.c
> > +++ b/drivers/input/touchscreen/cyttsp5.c
> > @@ -923,8 +923,8 @@ static int cyttsp5_i2c_probe(struct i2c_client *client)
> >
> >       regmap = devm_regmap_init_i2c(client, &config);
> >       if (IS_ERR(regmap)) {
> > -             dev_err(&client->dev, "regmap allocation failed: %ld\n",
> > -                     PTR_ERR(regmap));
> > +             dev_err(&client->dev, "regmap allocation failed: %pe\n",
> > +                     regmap);
> >               return PTR_ERR(regmap);
> >       }
> >
> >
> > --
> > 2.51.0.760.g7b8bcc2412-goog
> >



-- 
Ricardo Ribalda
