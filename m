Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F7415ECED
	for <linux-samsung-soc@vger.kernel.org>; Tue,  7 May 2024 12:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715086734; cv=none; b=HYlu1q8qJ2NBlwOIZOYS1XOAr6fvGoZDPqqKp1ndqoDaw9nB+R0dP55pQPPRZn3XOSgTnJpjtCDbiq2iwRaDsCuXGQCBtPAvHZeRZAvduKSWslsF9Rg1RoEftoGfWuM0tLYjyinH7PqMVcGzVGpxY+0h9l72MvLYwVL7cBKHXwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715086734; c=relaxed/simple;
	bh=+hGg4qJDHV0B5+Y62ZMujf1YD6LV4XIoRUVLjY5kbsc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RzNzIBMiVYrBGgh9hCD012bcERQKIKf98zFhIQOcOxpCeXsS1u7VONFy6iGTuGGRVJRc310jBV+TiOM0dqNBCj5OqZwpzi4+7vivVyWN4tcAkETwrOZW9+4mI2PH1Vl/tZFdg9A8ThmjC46QyVvwRC2X5rHgz2SfMJ3D2qJqREE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EIfa3BFz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EIfa3BFz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C126CC4DDE4
	for <linux-samsung-soc@vger.kernel.org>; Tue,  7 May 2024 12:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715086733;
	bh=+hGg4qJDHV0B5+Y62ZMujf1YD6LV4XIoRUVLjY5kbsc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EIfa3BFzDTxGczLQ4qb1a96ang/r1jtgT5FplzImnP0KsP1TRT/nm1b8/ZLAwwQZo
	 0UOM78jL/zRasAzjUzsmktrhJp2eiNnJHtIg67xSqA/HUW8IaZnmK5cNyOM7eXgBNc
	 xFRen+/2D4Zl9wEes2MiaFQ/kKNac9L9+tPLwVn6UXCT+XRa6QY8VrB1RCSTzxg7fR
	 NHUl3ynjz4BP1rkexDt1CFBLA11tImG4iaID7dAUAqg2EWiJpanol/WpjyP5j7HjFu
	 ix4GwfyMHW8BTnNMQIlXZSFM63lbOMLcEuLg2l+Qxg8Awd9oYj0fGaDEe4/psXk6e3
	 nahqA2rZjq5Dw==
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-de5acdb3838so3265488276.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 May 2024 05:58:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXkMzKQKCJVByZbQklquGSJt0HS4GNLUCPfKJOBavgPuzcIKAsc67Z3dPssTixECB6bcQLTY930slGoKgmJyUZ2jQV0dRsO8B/oNmFXI67TlxQ=
X-Gm-Message-State: AOJu0YwNcNYJ2wqh+A9ULRxGxuOjP79DPCC28bA8sFHNe3xfeyFrJmyk
	3+HRYkZP7ccVyN9gwnXq7r6YwN4OKkBW6kLkan7WtPgFMNOkIEcWuhr7u6sNPotKLZVsm7FjMM0
	51zyPtwLOy1VscOQnVxZF8RtOJGbMXI26oYQ8iQ==
X-Google-Smtp-Source: AGHT+IGQ2BfLofpB2AbRmieIGAXSi684XtRW+H0VYOvLNhCMBmRejOoJpoRwFu6oTub3kA5Aplxvy0YO49unxPveVlc=
X-Received: by 2002:a25:dc8e:0:b0:dda:a550:4e92 with SMTP id
 y136-20020a25dc8e000000b00ddaa5504e92mr13570401ybe.46.1715086733004; Tue, 07
 May 2024 05:58:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240503151129.3901815-1-l.stach@pengutronix.de> <20240503151129.3901815-6-l.stach@pengutronix.de>
In-Reply-To: <20240503151129.3901815-6-l.stach@pengutronix.de>
From: Robert Foss <rfoss@kernel.org>
Date: Tue, 7 May 2024 14:58:42 +0200
X-Gmail-Original-Message-ID: <CAN6tsi7uwn_TsVU5be6S=hnLyRCCBCaGPtLYYSkkfjV7v9GFYw@mail.gmail.com>
Message-ID: <CAN6tsi7uwn_TsVU5be6S=hnLyRCCBCaGPtLYYSkkfjV7v9GFYw@mail.gmail.com>
Subject: Re: [PATCH 05/14] drm/bridge: analogix_dp: remove unused analogix_dp_remove
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

On Fri, May 3, 2024 at 5:13=E2=80=AFPM Lucas Stach <l.stach@pengutronix.de>=
 wrote:
>
> Now that the clock is handled dynamically through
> analogix_dp_resume/suspend and it isn't statically enabled in the
> driver probe routine, there is no need for the remove function anymore.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 5 -----
>  drivers/gpu/drm/exynos/exynos_dp.c                 | 3 ---
>  drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    | 9 +--------
>  include/drm/bridge/analogix_dp.h                   | 1 -
>  4 files changed, 1 insertion(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers=
/gpu/drm/bridge/analogix/analogix_dp_core.c
> index 9e3308257586..9f1dfa6f2175 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -1813,11 +1813,6 @@ void analogix_dp_unbind(struct analogix_dp_device =
*dp)
>  }
>  EXPORT_SYMBOL_GPL(analogix_dp_unbind);
>
> -void analogix_dp_remove(struct analogix_dp_device *dp)
> -{
> -}
> -EXPORT_SYMBOL_GPL(analogix_dp_remove);
> -
>  int analogix_dp_start_crc(struct drm_connector *connector)
>  {
>         struct analogix_dp_device *dp =3D to_dp(connector);
> diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/=
exynos_dp.c
> index 30c8750187ad..097f8c4617de 100644
> --- a/drivers/gpu/drm/exynos/exynos_dp.c
> +++ b/drivers/gpu/drm/exynos/exynos_dp.c
> @@ -251,10 +251,7 @@ static int exynos_dp_probe(struct platform_device *p=
dev)
>
>  static void exynos_dp_remove(struct platform_device *pdev)
>  {
> -       struct exynos_dp_device *dp =3D platform_get_drvdata(pdev);
> -
>         component_del(&pdev->dev, &exynos_dp_ops);
> -       analogix_dp_remove(dp->adp);
>  }
>
>  static int exynos_dp_suspend(struct device *dev)
> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gp=
u/drm/rockchip/analogix_dp-rockchip.c
> index 8214265f1497..362c7951ca4a 100644
> --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> @@ -414,21 +414,14 @@ static int rockchip_dp_probe(struct platform_device=
 *pdev)
>
>         ret =3D component_add(dev, &rockchip_dp_component_ops);
>         if (ret)
> -               goto err_dp_remove;
> +               return ret;
>
>         return 0;
> -
> -err_dp_remove:
> -       analogix_dp_remove(dp->adp);
> -       return ret;
>  }
>
>  static void rockchip_dp_remove(struct platform_device *pdev)
>  {
> -       struct rockchip_dp_device *dp =3D platform_get_drvdata(pdev);
> -
>         component_del(&pdev->dev, &rockchip_dp_component_ops);
> -       analogix_dp_remove(dp->adp);
>  }
>
>  static int rockchip_dp_suspend(struct device *dev)
> diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analog=
ix_dp.h
> index 8709b6a74c0f..6002c5666031 100644
> --- a/include/drm/bridge/analogix_dp.h
> +++ b/include/drm/bridge/analogix_dp.h
> @@ -44,7 +44,6 @@ struct analogix_dp_device *
>  analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat=
_data);
>  int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *d=
rm_dev);
>  void analogix_dp_unbind(struct analogix_dp_device *dp);
> -void analogix_dp_remove(struct analogix_dp_device *dp);
>
>  int analogix_dp_start_crc(struct drm_connector *connector);
>  int analogix_dp_stop_crc(struct drm_connector *connector);
> --
> 2.39.2
>

Reviewed-by: Robert Foss <rfoss@kernel.org>
