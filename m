Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE00615B150
	for <linux-samsung-soc@vger.kernel.org>; Tue,  7 May 2024 13:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715086912; cv=none; b=B3K+UA3+xHidfcX3oEhwnElAz7mEDIO2df81gK498ORWDZ6w3NV+MY26M/xO9ZJFa4VZFK+4hyRIlPYPZVapywf7edkV4RxNIGxmlSqVUSLLC1efwlWi763bh7Hlg38rLSfSOpXtBlTyw6vt0Ynqe1223gT5/3FBgJo1vftUdV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715086912; c=relaxed/simple;
	bh=tHVK/OSHp5sKNPT7Tv7H1XD40NSCZFHElj9hZQKPyUQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=no7XWp4UdWooX4RX1fA4HVEpUuAG5w6y11E6r9eho8LP2hvm7QqIfxTJgJozV/zmvUpFa9lEJjDf6yYSERT8h8JpXw9cYiRe+/PDbvvjJWPebNAsck4MPOHaBw2A8Jxsq74kOgG6em50fPyV6Q3K6KZtKd+SqID9R3E1X3BNGDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eguwRJcX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eguwRJcX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 710EEC4DDE2
	for <linux-samsung-soc@vger.kernel.org>; Tue,  7 May 2024 13:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715086912;
	bh=tHVK/OSHp5sKNPT7Tv7H1XD40NSCZFHElj9hZQKPyUQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eguwRJcX/4VYB/PyMWWUR+tcTOv0G34if3IV/gmp2rcL/vg9UEacIkhg3UKuc2d5y
	 fkGl76hSFjlXtsHHFHr0eU5dNwOOPri9dgihx6eoTlKLsTXPba4psC4n8cADjrXa+u
	 cwxIdtpgXppy0VNNKeqwj5vKzKtRuqrygKWxXAneZiPb9LMn7WTKBySEo3ovwv15I9
	 8Is2D39HItGl6+SmDPsKBpnGrW24d9N8YSO7ykji6wX/ef9yvvf+ZBUWyr1CJjgqak
	 rBNg9PzDa2Qayt9FQYp21Skk9pfxCRcHKiRbLRwe39DtfE00M0vHysvUhMvBNNp39+
	 rsL9gg1Cl3yAA==
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dc236729a2bso3148000276.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 May 2024 06:01:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVQNe/oOxJiCUslWR47keGmGG+W4loEYdfM/aQgDqeBqZKgGLTbI8hShUgJzdZXQkH7wZ6vQDmGf48tzXI6nudOVOH9eR+Sc6FWmrJUXI1Krxo=
X-Gm-Message-State: AOJu0YwLrr81qokcsCDCO3o0KMXZGDdABYwXLdf46gIDRq9IhBjO3k7v
	ntTMjp33LLXZkS2t/9lj8noaqDuWLUHVBas1vCrJS48TMlD3yEFZUgOPM75tQOFCrvavRiUO2Fi
	O38ncPrTfYr0BZekhxMymOxra/Zqm5WL669VA+A==
X-Google-Smtp-Source: AGHT+IGVoBB2KRC+J+e7019EfznjBMxIVrKNmwrzqOiYbxqXgUaaap+Cuf7kSvAKD4Hz1/UNtTrSTy6fS0xXp+atLOo=
X-Received: by 2002:a05:6902:4cf:b0:de6:b80:f7a3 with SMTP id
 v15-20020a05690204cf00b00de60b80f7a3mr12780894ybs.62.1715086911730; Tue, 07
 May 2024 06:01:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240503151129.3901815-1-l.stach@pengutronix.de> <20240503151129.3901815-8-l.stach@pengutronix.de>
In-Reply-To: <20240503151129.3901815-8-l.stach@pengutronix.de>
From: Robert Foss <rfoss@kernel.org>
Date: Tue, 7 May 2024 15:01:41 +0200
X-Gmail-Original-Message-ID: <CAN6tsi6z_aN88ApoF-5EiemrTHsVN2yYoL_muz0Euru2uO6gTg@mail.gmail.com>
Message-ID: <CAN6tsi6z_aN88ApoF-5EiemrTHsVN2yYoL_muz0Euru2uO6gTg@mail.gmail.com>
Subject: Re: [PATCH 07/14] drm/bridge: analogix_dp: move platform and PHY
 power handling into runtime PM
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
> Platform and PHY power isn't only required when the actual display data
> stream is active, but may be required earlier to support AUX channel
> transactions. Move them into the runtime PM calls, so they are properly
> managed whenever various other parts of the driver need them to be active=
.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  .../drm/bridge/analogix/analogix_dp_core.c    | 23 ++++++++-----------
>  1 file changed, 10 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers=
/gpu/drm/bridge/analogix/analogix_dp_core.c
> index 311e1e67486d..3281c00a39cd 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -1258,11 +1258,6 @@ static int analogix_dp_set_bridge(struct analogix_=
dp_device *dp)
>
>         pm_runtime_get_sync(dp->dev);
>
> -       if (dp->plat_data->power_on)
> -               dp->plat_data->power_on(dp->plat_data);
> -
> -       phy_power_on(dp->phy);
> -
>         ret =3D analogix_dp_init_dp(dp);
>         if (ret)
>                 goto out_dp_init;
> @@ -1288,10 +1283,6 @@ static int analogix_dp_set_bridge(struct analogix_=
dp_device *dp)
>         return 0;
>
>  out_dp_init:
> -       phy_power_off(dp->phy);
> -       if (dp->plat_data->power_off)
> -               dp->plat_data->power_off(dp->plat_data);
> -
>         pm_runtime_put_sync(dp->dev);
>
>         return ret;
> @@ -1354,11 +1345,7 @@ static void analogix_dp_bridge_disable(struct drm_=
bridge *bridge)
>
>         disable_irq(dp->irq);
>
> -       if (dp->plat_data->power_off)
> -               dp->plat_data->power_off(dp->plat_data);
> -
>         analogix_dp_set_analog_power_down(dp, POWER_ALL, 1);
> -       phy_power_off(dp->phy);
>
>         pm_runtime_put_sync(dp->dev);
>
> @@ -1713,6 +1700,11 @@ EXPORT_SYMBOL_GPL(analogix_dp_probe);
>
>  int analogix_dp_suspend(struct analogix_dp_device *dp)
>  {
> +       phy_power_off(dp->phy);
> +
> +       if (dp->plat_data->power_off)
> +               dp->plat_data->power_off(dp->plat_data);
> +
>         clk_disable_unprepare(dp->clock);
>
>         return 0;
> @@ -1729,6 +1721,11 @@ int analogix_dp_resume(struct analogix_dp_device *=
dp)
>                 return ret;
>         }
>
> +       if (dp->plat_data->power_on)
> +               dp->plat_data->power_on(dp->plat_data);
> +
> +       phy_power_on(dp->phy);
> +
>         return 0;
>  }
>  EXPORT_SYMBOL_GPL(analogix_dp_resume);
> --
> 2.39.2
>

Reviewed-by: Robert Foss <rfoss@kernel.org>
