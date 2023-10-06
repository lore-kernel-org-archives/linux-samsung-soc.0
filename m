Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4426DE92FDE
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  6 Oct 2023 03:40:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229815AbjJFDkp (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 5 Oct 2023 23:40:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229838AbjJFDko (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Oct 2023 23:40:44 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC569E7
        for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Oct 2023 20:40:38 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-99c3c8adb27so291455266b.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Oct 2023 20:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696563637; x=1697168437; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XpUyWVrE/iHQgC/ozZsC6NYywMSYpJaEzFJPxkfNEQE=;
        b=Rhve3uxTPgNiWVKN2PBRzB/dc+j8iLKYSAm5qAcTtmOjmVZO06ZjGkbYeF9d5tKjDH
         dujp0Kafa47+s8PJLP6OE7XuhMzAp4kevHIA/Gz+rgFjc8u12BOcHUWifwTVEdXFuZlU
         ciX4eaAxQtj1v/bKrUEFo0v9udJjDb6d6rOz1RHEURD668rmaa7dIlvk57Ylg9jwn90z
         JtV0ipcct+rC/Dnift0OUP6tdZff3h6j60cSWBo98XVjshiQ9eiFJzT5YbbRYb1qTmKx
         pr1B94lCeFr5GLTCXwM1MgthQSQ4LM/LmQqpg7maRrVz7uYMauPoPtWpuFoKb/zOnXaD
         2BEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696563637; x=1697168437;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XpUyWVrE/iHQgC/ozZsC6NYywMSYpJaEzFJPxkfNEQE=;
        b=W5EChwuLr1y6uunJzvixROoVsozEvyebRcfKNUxIEsT26GHddz7MmVnyHri+/kq1pj
         UHq++g7KBE+iKqASYLxll2zFjKBkbkzxM4KhyR3Qy3v5o8x9WJRXRIBHqlFiXdNuLO0e
         kXge3R4WaNDhwSqOivFrQ04clM0LlKZbxyu7TudL80rj5l2yScQQR35QqFH7JL7YIkfa
         HfJhouQsqV2RjRH4RP0r4cItnbxWpQj0RgkdcGLdblAh+8Cg1mJ+hTvj6MC37+CTJWyE
         MgSLF2ZGThi91tpAx1+7tCuHrTHz6pqAQmNDCBnjJCCtMXPAsbLN49+ro+8yb10s2dNe
         owbw==
X-Gm-Message-State: AOJu0YyHvTSCtf4+AAdqbCmzDlsarF6hAzd7eRHr3fQHLcWLTkD9Wt+b
        JJnuro1iTXo5OF9n+Kwkz7lJuS6yJ/bjYwSvfsA=
X-Google-Smtp-Source: AGHT+IEXSarpX4D9K7l62tqeOOFIuirkFViAjyDoJBqx2Dqb2516JHcFfgXOGpgW8/z7+m9+5EETDoyKYs0BcsQRPpY=
X-Received: by 2002:a17:907:7857:b0:9ad:ef31:6efc with SMTP id
 lb23-20020a170907785700b009adef316efcmr5953491ejc.21.1696563636811; Thu, 05
 Oct 2023 20:40:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230919103939.1367659-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230919103939.1367659-1-u.kleine-koenig@pengutronix.de>
From:   Inki Dae <daeinki@gmail.com>
Date:   Fri, 6 Oct 2023 12:39:59 +0900
Message-ID: <CAAQKjZMiM+UwFZ8aN2L8THaHt6O6OZfdT1JXiZLm-QPN=OOwug@mail.gmail.com>
Subject: Re: [PATCH] drm: exynos: dsi: Convert to platform remove callback
 returning void
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Jagan Teki <jagan@amarulasolutions.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-samsung-soc@vger.kernel.org, Robert Foss <rfoss@kernel.org>,
        kernel@pengutronix.de, Jonas Karlman <jonas@kwiboo.se>,
        dri-devel@lists.freedesktop.org,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

2023=EB=85=84 9=EC=9B=94 19=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 7:40, U=
we Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new() which already returns void. Eventually after all drivers
> are converted, .remove_new() is renamed to .remove().
>
> samsung_dsim_remove() returned 0 unconditionally. Make it return void
> instead to convert the two related platform drivers to use
> .remove_new().
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

It'd be better to go to drm-misc.

Reviewed-by: Inki Dae <inki.dae@samsung.com>
Acked-by: Inki Dae <inki.dae@samsung.com>

Thanks,
Inki Dae

> ---
>  drivers/gpu/drm/bridge/samsung-dsim.c   | 6 ++----
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c | 2 +-
>  include/drm/bridge/samsung-dsim.h       | 2 +-
>  3 files changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/brid=
ge/samsung-dsim.c
> index b1df91e37b1b..2b56a5bfe273 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1998,7 +1998,7 @@ int samsung_dsim_probe(struct platform_device *pdev=
)
>  }
>  EXPORT_SYMBOL_GPL(samsung_dsim_probe);
>
> -int samsung_dsim_remove(struct platform_device *pdev)
> +void samsung_dsim_remove(struct platform_device *pdev)
>  {
>         struct samsung_dsim *dsi =3D platform_get_drvdata(pdev);
>
> @@ -2006,8 +2006,6 @@ int samsung_dsim_remove(struct platform_device *pde=
v)
>
>         if (dsi->plat_data->host_ops && dsi->plat_data->host_ops->unregis=
ter_host)
>                 dsi->plat_data->host_ops->unregister_host(dsi);
> -
> -       return 0;
>  }
>  EXPORT_SYMBOL_GPL(samsung_dsim_remove);
>
> @@ -2107,7 +2105,7 @@ MODULE_DEVICE_TABLE(of, samsung_dsim_of_match);
>
>  static struct platform_driver samsung_dsim_driver =3D {
>         .probe =3D samsung_dsim_probe,
> -       .remove =3D samsung_dsim_remove,
> +       .remove_new =3D samsung_dsim_remove,
>         .driver =3D {
>                    .name =3D "samsung-dsim",
>                    .pm =3D &samsung_dsim_pm_ops,
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/ex=
ynos/exynos_drm_dsi.c
> index 69ea33cae651..2fe0e5f3f638 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -181,7 +181,7 @@ MODULE_DEVICE_TABLE(of, exynos_dsi_of_match);
>
>  struct platform_driver dsi_driver =3D {
>         .probe =3D samsung_dsim_probe,
> -       .remove =3D samsung_dsim_remove,
> +       .remove_new =3D samsung_dsim_remove,
>         .driver =3D {
>                    .name =3D "exynos-dsi",
>                    .owner =3D THIS_MODULE,
> diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsu=
ng-dsim.h
> index 6fc9bb2979e4..3f8050d523eb 100644
> --- a/include/drm/bridge/samsung-dsim.h
> +++ b/include/drm/bridge/samsung-dsim.h
> @@ -116,7 +116,7 @@ struct samsung_dsim {
>  };
>
>  extern int samsung_dsim_probe(struct platform_device *pdev);
> -extern int samsung_dsim_remove(struct platform_device *pdev);
> +extern void samsung_dsim_remove(struct platform_device *pdev);
>  extern const struct dev_pm_ops samsung_dsim_pm_ops;
>
>  #endif /* __SAMSUNG_DSIM__ */
>
> base-commit: 0663e1da5ba8e6459e3555ac12c62741668c0d30
> --
> 2.40.1
>
