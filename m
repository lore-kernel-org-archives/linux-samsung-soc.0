Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707DD7E1
	for <linux-samsung-soc@vger.kernel.org>; Tue,  7 May 2024 12:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715086184; cv=none; b=N0/qw2H3uT6bQdd7N0XkulYa87rvPFYa4/ZZqvaHbHm7n8EVTXGoElEwfz8Xf9US99yzu8YMcAuzq1MFXfLzrByxLgyvxY0+wQI6R2+wbNlnQkfdg0CAdQFcLJf7Ilk3BgrthwVNLXMSGMzPrNZgcVvo7ZsfchD+R/mPao70pZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715086184; c=relaxed/simple;
	bh=oD6rvzEgDMgWG2vtFEnISqggPQoEaDhmk8mNgqIWbIo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qUMkhNwnHhclLGYxj/aDrwiSJDYafMGP0ruuWPLgwU+M1Cxe+68uvcpE/L2R8wQV3gvbijd/0lYdNvnoPlYms+d1FWdkiSSbcshv6wGf9+whsGxFg0QErNPbzvHZLBjcQ2XH2r1jk9iQr9CKW+SwpDCQaKGQX9uoK0Y5V1nOiNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jr4Ct1da; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jr4Ct1da"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 175C4C4DDE1
	for <linux-samsung-soc@vger.kernel.org>; Tue,  7 May 2024 12:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715086184;
	bh=oD6rvzEgDMgWG2vtFEnISqggPQoEaDhmk8mNgqIWbIo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jr4Ct1dajrwz0/osty57N8zE0XbOc54dKP5IEoui8UBU8+7uye1eFsj5lkb9S3LUs
	 zHSD+P9EaA9/0l6cyX/zMpSPeYPZ0poxMJaOqCk0f0lkTYRy+OHWU3o4lJiOYViYiZ
	 sC0+mZa6Vfl7wSQ92ExfSi13hVVsmMoIP5VzHNvchtmkYEj1oopUOFFRU5t9jWycPM
	 8SUanUsh1noDoy2/ZVcn9d7zwf1LH9fe3Dxku2haf+Gy2lA4Rc5U8p5iMulN/OowXy
	 ppsOjVEs+5oiQOWmTU0AKdLmXC8FlYdsRk8EMi2Tb3pWB1yZyVOvskq521H5EGNr6I
	 Utyhq1ujFhSLA==
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-db4364ecd6aso3043920276.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 May 2024 05:49:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUwPUkutHDkqtopJyNNoLmaCBvlNY6iXtwkR2GEl/m/PhFHedJlNKjcLa1VTJbqeYbwZrciCVUcMyTWFqLYZIgUl++QXTyKlFiBcN0WJWMDAW4=
X-Gm-Message-State: AOJu0YyZexNONQzpHT14VWhuUqY9ekwUknnaKD8jXxVnVeg9Whr+dI3A
	u3nY9FS7v9q0ArdrMkxaEbewrd6sI1rIcsacorh3YStKNLlxNn5iQ0NaMc/rHV2j43HjdKTnnFD
	oEKJEXPtrTuXRa0GAdupBIwVq/kCWkr/skU+ICQ==
X-Google-Smtp-Source: AGHT+IHTUvOiQuZXH5tWOLURVMUkaKIGLnwcoEtMxsrNy0hFgSoz1lGl+EUVn28GEgtHJMUNMRmgv3SGgEfOvaqU8mQ=
X-Received: by 2002:a05:6902:4d2:b0:dcd:aa73:e349 with SMTP id
 v18-20020a05690204d200b00dcdaa73e349mr11497694ybs.12.1715086182345; Tue, 07
 May 2024 05:49:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240503151129.3901815-1-l.stach@pengutronix.de> <20240503151129.3901815-4-l.stach@pengutronix.de>
In-Reply-To: <20240503151129.3901815-4-l.stach@pengutronix.de>
From: Robert Foss <rfoss@kernel.org>
Date: Tue, 7 May 2024 14:49:30 +0200
X-Gmail-Original-Message-ID: <CAN6tsi7hM+BLkaTnS=6-eHqERp7hCi3NM93=OMfHkwKohtBHEw@mail.gmail.com>
Message-ID: <CAN6tsi7hM+BLkaTnS=6-eHqERp7hCi3NM93=OMfHkwKohtBHEw@mail.gmail.com>
Subject: Re: [PATCH 03/14] drm/bridge: analogix_dp: register AUX bus after
 enabling runtime PM
To: Lucas Stach <l.stach@pengutronix.de>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Sandy Huang <hjc@rock-chips.com>, 
	Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, kernel@pengutronix.de, 
	patchwork-lst@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 3, 2024 at 5:12=E2=80=AFPM Lucas Stach <l.stach@pengutronix.de>=
 wrote:
>
> AUX transactions require the controller to be in working state and
> take a runtime PM reference. To avoid potential races beween the
> first transactions on the bus and runtime PM being set up, move the
> AUX registration behind the runtime PM setup.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  .../drm/bridge/analogix/analogix_dp_core.c    | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers=
/gpu/drm/bridge/analogix/analogix_dp_core.c
> index b39721588980..0af2a70ae5bf 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -1728,31 +1728,34 @@ int analogix_dp_bind(struct analogix_dp_device *d=
p, struct drm_device *drm_dev)
>         dp->drm_dev =3D drm_dev;
>         dp->encoder =3D dp->plat_data->encoder;
>
> +       pm_runtime_use_autosuspend(dp->dev);
> +       pm_runtime_set_autosuspend_delay(dp->dev, 100);
> +       pm_runtime_enable(dp->dev);
> +
>         dp->aux.name =3D "DP-AUX";
>         dp->aux.transfer =3D analogix_dpaux_transfer;
>         dp->aux.dev =3D dp->dev;
>         dp->aux.drm_dev =3D drm_dev;
>
>         ret =3D drm_dp_aux_register(&dp->aux);
> -       if (ret)
> -               return ret;
> -
> -       pm_runtime_use_autosuspend(dp->dev);
> -       pm_runtime_set_autosuspend_delay(dp->dev, 100);
> -       pm_runtime_enable(dp->dev);
> +       if (ret) {
> +               DRM_ERROR("failed to register AUX (%d)\n", ret);
> +               goto err_disable_pm_runtime;
> +       }
>
>         ret =3D analogix_dp_create_bridge(drm_dev, dp);
>         if (ret) {
>                 DRM_ERROR("failed to create bridge (%d)\n", ret);
> -               goto err_disable_pm_runtime;
> +               goto err_unregister_aux;
>         }
>
>         return 0;
>
> +err_unregister_aux:
> +       drm_dp_aux_unregister(&dp->aux);
>  err_disable_pm_runtime:
>         pm_runtime_dont_use_autosuspend(dp->dev);
>         pm_runtime_disable(dp->dev);
> -       drm_dp_aux_unregister(&dp->aux);
>
>         return ret;
>  }
> --
> 2.39.2
>

Reviewed-by: Robert Foss <rfoss@kernel.org>
