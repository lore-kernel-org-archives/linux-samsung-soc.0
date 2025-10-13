Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A0A309DC5
	for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Oct 2025 16:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760371280; cv=none; b=G81xL7N0lNEuAPLk2bfYsVmGusDqrA3bqZ2D+tgpI42SVfMsKPwD7gdcXOyYnvIKStDp9ZAXA2t9Hi189KOomUB3kC0QY0sa4mJsGUvPWAOeBtGxuk1Bo9IWxov26fAk6huIX0E9EN7mulBgcyyKstcCNwcT0+X6dv3nm/Dd4OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760371280; c=relaxed/simple;
	bh=7pmScWeJxb/SA9LfgnIE+RSHfO7kt+ZDsVcv07zsRtU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mj5oWdAb6sKJdO5WY//KbJ6hImYIKk4XfPthRjuHsoQgmwYqBMTkmq5CB3x1Vebp+NxlrNg5uD8gYo3amDbHSiyikXx4Sl3B35lU8zdOxKTb79wDRCbiATr6q06pHsBEVxMT+G9j7sqhQLzqKwgwIsLa90WciJRsJwUUrVvcK0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Nn9cYUF2; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Nn9cYUF2"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b3e7cc84b82so815866866b.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Oct 2025 09:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760371277; x=1760976077; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=85zW8eAa0UUuhYK13qFSD0pz0Cqd0sUrz3cG+0d4BSc=;
        b=Nn9cYUF2Wv4fgP7rHLLf3Kscl2bOoqdT5PsvWQQ1jCyVP7yshHZEiPwBRxFGPl2F4L
         K5Vfh2J+dxN4ZgUAmFcDq+7Q5m7+evfreC5zBkQ8BNb4mGZhJJTyT+196vMnpN3XWMZa
         jnQ0S1FwGlfmNeGa0SAFEpHxhj4P5m7KAplQc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760371277; x=1760976077;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=85zW8eAa0UUuhYK13qFSD0pz0Cqd0sUrz3cG+0d4BSc=;
        b=Bd3Q7qGgLLa0/vgkaLddfwq4Bm+F8wRdELuEHXH9BGSAGMuyl+9ZRFZ7Tw1NYHRbBJ
         JrQYoGzt8o10ZGv7fc80ovhiCotPLKI3wq59XXGB3FIW6kKjhAb96tzeKPtZeE+YpK5r
         6Q59PmkkvDy6dcyHm8Fn2vRzU+Cc433ByfK3q0amSUP6YfhqNDPqAI2saAtx2290yDdz
         sXOslqwHuZ9Qsq2DartiB6IyPU34nFQqO2uCYkLfV61CWa1kc9TXbnAzBe+/h2CEED1l
         9LpqaoXvXRT0087B62Z48YEa1R8vEMJ7qsruE0IrlVlz4DSQeLk6toWD63aMoTh5LlqF
         wQUw==
X-Forwarded-Encrypted: i=1; AJvYcCWNsynJ4odikXrGRlqJr36+jkr7lqPkB+2AvIFwO4dT5dsznwz3/PF3EzaUsaEYb4oLi02R+EHW0Y5ez5H3b+hZnA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7HfrSn3AOyoYFNUwGjNwkrgrEP8oGLx8bpZye4SjiGbn99r4y
	LuI7oZekuMFyX8pBT8s9Qs3FgPqXCQ+U84sTu05Voh/5VaayX91XMWJu9hDhMYLpFiDFe8iSiYo
	HyoNlq4kk
X-Gm-Gg: ASbGncuTNlpMNZRRxlJjroqYVYPjRfb8766rJPh2LubOw/S+tORmEU6X2MCN7EvFcHq
	L5m+hYpAtQLjVXSuFvEvlxqTNhzoJ/bP9epv3QIgF2W+AlckbOvXZ3SZ0dVlRq2aVIc6/eprE3B
	QXddbJXdE/cpnGeLguyeL5Xoi8uGkATuR6c/uiM2eV0F85wFI9BJlem5oBphUn3QnTePl7sJzM3
	/wK86A0/efCfOeshW/GaBCOG3xaoQC3EEDr1ooEOUR6g05TlzIwpWAEerPHgdBd74SpIVIh7Q90
	WwT+/xnfWvRFF+TGc/WVbl24+cDxFZ11Nt89Ex4j+XnQiS6vDqehZv619pCt1BmhF6SWhQeb5qK
	xRlP/aii+ZDfBpAaUD58njBvSBYgM1CWDycueJj3W8JOvHD/FUZ73eYDtjbkPDURmJ9qoaDKNCl
	85FbXbY1tMkwp2XQ==
X-Google-Smtp-Source: AGHT+IHtk9pP0afrwrbx30zJC1zexy19Sn+W77kXN3HqmY/BSXe4ExJ2FsVwZc8KzxH37evcPqmXDA==
X-Received: by 2002:a17:907:2d93:b0:b3f:1028:a86a with SMTP id a640c23a62f3a-b50aa387394mr2415446566b.3.1760371277140;
        Mon, 13 Oct 2025 09:01:17 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d65d002esm952333966b.26.2025.10.13.09.01.16
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 09:01:16 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b40f11a1027so785219266b.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Oct 2025 09:01:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXg8EPS2ASg9MJnn5kQQWV2cTYLm5Q7m+GBkrWq0jXlnJ5dliAtCRHQuvE/yv6FoRWPYcWMtz/CeNWHbcJMd6tDEg==@vger.kernel.org
X-Received: by 2002:ac2:4c50:0:b0:55f:4ac2:a58c with SMTP id
 2adb3069b0e04-5906dc0ff30mr6173104e87.22.1760370964286; Mon, 13 Oct 2025
 08:56:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org>
 <20251013-ptr_err-v1-10-2c5efbd82952@chromium.org> <176036780330.559803.287308146210017676@ping.linuxembedded.co.uk>
In-Reply-To: <176036780330.559803.287308146210017676@ping.linuxembedded.co.uk>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 17:55:51 +0200
X-Gmail-Original-Message-ID: <CANiDSCsuPkdz0=U2b_mNh4TWTNztAd9qEwJaiMRdGy1sf3UEbA@mail.gmail.com>
X-Gm-Features: AS18NWCmgLaH0rMvCIhheSPVtWPGKkpbEBd_aB_kzUyM4RaB_yHSiy8sRs-muw0
Message-ID: <CANiDSCsuPkdz0=U2b_mNh4TWTNztAd9qEwJaiMRdGy1sf3UEbA@mail.gmail.com>
Subject: Re: [PATCH 10/32] media: i2c: imx335: Use %pe format specifier
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Bingbu Cao <bingbu.cao@intel.com>, 
	Dafna Hirschfeld <dafna@fastmail.com>, Daniel Scally <djrscally@gmail.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans Verkuil <hverkuil@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Jacopo Mondi <jacopo+renesas@jmondi.org>, 
	Jacopo Mondi <jacopo@jmondi.org>, Julien Massot <julien.massot@collabora.com>, 
	=?UTF-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>, 
	Krzysztof Kozlowski <krzk@kernel.org>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Leon Luo <leonl@leopardimaging.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Purism Kernel Team <kernel@puri.sm>, 
	Rui Miguel Silva <rmfrfs@gmail.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Tianshu Qiu <tian.shu.qiu@intel.com>, Tiffany Lin <tiffany.lin@mediatek.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, Yong Zhi <yong.zhi@intel.com>, 
	Yunfei Dong <yunfei.dong@mediatek.com>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Kieran

On Mon, 13 Oct 2025 at 17:03, Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
>
> Quoting Ricardo Ribalda (2025-10-13 15:14:50)
> > The %pe format specifier is designed to print error pointers. It prints
> > a symbolic error name (eg. -EINVAL) and it makes the code simpler by
> > omitting PTR_ERR().
> >
> > This patch fixes this cocci report:
> > ./i2c/imx335.c:1013:3-10: WARNING: Consider using %pe to print PTR_ERR()
>
> Ohhh nice. Is this new ? First I've come across it.

It is actually from 2019:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=57f5677e535ba24b8926a7125be2ef8d7f09323c

I just learned about it because there is a new check in coccinelle :).

It is pretty cool, but you need to be careful to check IS_ERR(ptr)
before doing the printk, otherwise %pe will print the pointer value.

Regards!

>
>
>
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/i2c/imx335.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
> > index c043df2f15fb25b3a56422092f99a1fd9a508fa9..71ed9a0d84a252ee362621c4d38001508fb86d28 100644
> > --- a/drivers/media/i2c/imx335.c
> > +++ b/drivers/media/i2c/imx335.c
> > @@ -1009,8 +1009,8 @@ static int imx335_parse_hw_config(struct imx335 *imx335)
> >         imx335->reset_gpio = devm_gpiod_get_optional(imx335->dev, "reset",
> >                                                      GPIOD_OUT_HIGH);
> >         if (IS_ERR(imx335->reset_gpio)) {
> > -               dev_err(imx335->dev, "failed to get reset gpio %ld\n",
> > -                       PTR_ERR(imx335->reset_gpio));
> > +               dev_err(imx335->dev, "failed to get reset gpio %pe\n",
> > +                       imx335->reset_gpio);
>
> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
>
> >                 return PTR_ERR(imx335->reset_gpio);
> >         }
> >
> >
> > --
> > 2.51.0.760.g7b8bcc2412-goog
> >



-- 
Ricardo Ribalda
