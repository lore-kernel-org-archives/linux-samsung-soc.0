Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843702B2D7
	for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Jan 2026 22:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768256529; cv=none; b=OQjKIZNSyTzi6IMtvDV54A9YwKjleRgYlTADZG0Qj3cD56Ty6o7M1Wr/dTyuj2HRXiaYqdQLosxPs2uHbZqpaaEHZnV553MWhO4axZY2NuVxfGWedsE21TW6defEMoY5cyWbhUJ0KgK1mAy+I1yy+I0ecLAH3TeJjeWeIsZaUiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768256529; c=relaxed/simple;
	bh=PpVle6805UxjTJzUzVBlFwx6MAaoWGvgWT0ChdYxX5s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I1xinpKUaNRNQxQcxracY1vDCicce3B8w9APqmdzFQMsW2s1MbG9droUFgn4Wzb+3z5JwahWkcoJc809wELYE1kK1bfBrKueQI4uyYzrw+83hN6J4eFaWyCN2ZFuN/aJ9BxHkUCeEN9JB0dkjqL15FYQPFJ156RtPyTTmb24Vac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=F0MEmqUH; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="F0MEmqUH"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2a110548cdeso47286465ad.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Jan 2026 14:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1768256528; x=1768861328; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4w19gL9Si5xuUOM+xx0Gkc/M1vHSFtlbSnI9ldzTAww=;
        b=F0MEmqUHc3EZA8tY2aVOLln/LK9m8xtaNwR5J7Se+7So/dXVydjQeTYG5kP6EygojM
         c844usz2fPEFMbjsk+UXVX53cEChUCMylUE2gMhkPsuvw7jVl9h8yHvQPhM+7Y8e8APE
         31A8vtwSOAR64KMZVccBf8BDKYEG1Pyy9gi44RF5lum0WaDS2v7DuPliUBURaICx13Ai
         HAfOV3QuIsVGbyH0LNUc4dTSkAvfp76fBQyPe5waN88Ci5Foixiartzdsw4dLND2+emf
         2A0LkK6bdo99ATxmNJ6D4SiXnXyJsw3Nv/WWAoHMzbyIl++EBvS4SM8bdpt0jWcmzyDq
         eNjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768256528; x=1768861328;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4w19gL9Si5xuUOM+xx0Gkc/M1vHSFtlbSnI9ldzTAww=;
        b=q8pQeiQzjDaPSNZ6Fux2/yJOQM2DI6F/obGF+9vln0xSFvWz2WX13bHGHy8Gi8orqX
         +rADMbjXQio8UPxTb0Zs0wEEAdzfMmcEdWMklSg4XEDFHjElJbuRVXMJbNlT/Yg5zUa4
         j7+28kGwPqUH5Vrxr0x+Bx0jF3P1hhCIdOozHDdRj32J/7CuqJSHFXv1mwo9iS1dZsui
         wQz5RBqr4WLSLWIkIk8h1GYjdpox1DYak9rWsa53jxnFTSPJdA6HWC2smNYu+gWLSI6a
         jZzp+Cpn6hIBq9Na4yAUeAvSz5cC+ajZk/lk+AKvUBEgznhgXNOaoCTcr4rqc1Wk7azB
         UTqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCDUVDldbNf2Rm3BDkwbQH31I3CBsKJ0dxJWliNcShoLzpcg6iNv9OIVopxG1YpxZbuch9IC3xonhiaHNEp1PrMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlzrxbIwwSAVbHByQZVZDFexy41k3rZzHUGSQZIao2JtRaTU2S
	6oxFctI/WTfsECHBMi6jZfuWXxNG5zRmFaSJQN4DDYp4s6c+NabNHga0/QjeP7M7CeBSlWERSNh
	BXB9z4Pp8LjbOga6mGyM9WF/zKO5IVO8=
X-Gm-Gg: AY/fxX4OY8hU5TGZraLXNivf4LsFt/fvXAdgmZ7nhibwdSernt5PTyQW8mpGx5PlWSk
	yw6q4xJFe6j+3cqd0wxyAcXPmlSSxWx3Zx5cagKSNARVeXB6epAGltCRuXlbDQ9pO/CrOz3WQ4U
	MGYdVhNRiSfFIc4Ge4jUbUDiD9nZosLtkG7yfIAwJZsJf/tq/W+yVyJ6FXLb0+Ic0YAYF3eGGh1
	xoPGWtv2pLxyrvP5lzWWYpQrHedSxoV5QOvzR9Vt8caIEMcuzPBnVFbWOT6qwBtiTAQ9Ty390x3
	q8p7tQGMUdaDyVJzX7wavocQY3w1
X-Google-Smtp-Source: AGHT+IF7+Y5y+W1I/oKu3PaWNvUb9K8PSy+WoJh05TRnlBlC82+qzM+GksYGzWHyPWmgmkdzBXyTwo91e0gYk9qAGBM=
X-Received: by 2002:a17:903:40ca:b0:295:592e:7633 with SMTP id
 d9443c01a7336-2a3ee4c0fb5mr187274885ad.29.1768256527834; Mon, 12 Jan 2026
 14:22:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-0-8d7a3dbacdf4@bootlin.com>
 <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-2-8d7a3dbacdf4@bootlin.com>
In-Reply-To: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-2-8d7a3dbacdf4@bootlin.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 12 Jan 2026 23:21:56 +0100
X-Gm-Features: AZwV_Qj9tssGMaPejz2Zl0XwPzPqVqwiSQM5-St_AAUm7gwon2Sgi9P4XfkbVUU
Message-ID: <CAFBinCBWUXNwEDCJNEmdCtOcGO9eVFfZFC9p9fpdRTesZ7xBSQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] drm/meson/dw-hdmi: convert to of_drm_find_and_get_bridge()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Luca,

On Fri, Jan 9, 2026 at 11:03=E2=80=AFAM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:
>
> of_drm_find_bridge() is deprecated. Move to its replacement
> of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
> is put when done.
>
> dw_hdmi->bridge is used only in dw_hdmi_top_thread_irq(), so in order to
> avoid potential use-after-free ensure the irq is freed before putting the
> dw_hdmi->bridge reference.
>
> Acked-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

[...]
> @@ -789,8 +789,12 @@ static void meson_dw_hdmi_unbind(struct device *dev,=
 struct device *master,
>                                    void *data)
>  {
>         struct meson_dw_hdmi *meson_dw_hdmi =3D dev_get_drvdata(dev);
> +       struct platform_device *pdev =3D to_platform_device(dev);
> +       int irq =3D platform_get_irq(pdev, 0);
>
> +       devm_free_irq(dev, irq, meson_dw_hdmi);
I have one question (so I can understand things better):
is there a particular reason why you went with free'ing the IRQ
instead of "just" masking it (so the hardware won't fire anymore of
those IRQs)?


Best regards,
Martin
