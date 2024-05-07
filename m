Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09ED115E1FD
	for <linux-samsung-soc@vger.kernel.org>; Tue,  7 May 2024 13:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715086825; cv=none; b=H6f5ZGqNH23Ar9aKA6JkA9WIWN2Y19CpBO+rlDAR8KScrvSA+6EyI4mYalpBmLHs/vW4uEeiI0dTQbiBFwCclAmfampT5vOOYRdzz742AH9ifCf5DzxnnS6Kgd92lyLjDIjvi2LT5tqsGFDjF/qI1nIZYf8n6R3tNG4zjWUlNM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715086825; c=relaxed/simple;
	bh=9UOLJi3U937d7+bwvcyTk9A7wBaszZvOfBbZWMQXdpA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=poXAi8cvOFsYZlEX3ardLV/0SyiKKeVC+mXAbU2wLKagc409Yhm3FfsmPSmRAzyab8czUT9gjAcOOxggImWsuifQfqRsT9xoeTxGnCm52WN/ZTbRhtb6DLLm4v5PgDJJaft0MEz8m3plnE8r2eGSXT2lSzkVERBIFlo9uaj121Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GhPD3Zjk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GhPD3Zjk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EE3DC4DDE2
	for <linux-samsung-soc@vger.kernel.org>; Tue,  7 May 2024 13:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715086824;
	bh=9UOLJi3U937d7+bwvcyTk9A7wBaszZvOfBbZWMQXdpA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GhPD3ZjkJryMgBe0H/r/mfF9Ve0KuZbgzT2uKEURj/ahDGVWPoJUsO1ceXQ7QCw0O
	 xLuO5hFIwPuOgFVL3ZhFtE4aVNAtpbf4ifmJTSe+7ZD63cFtziqsa9O0A4R5TO9bqN
	 XOo9gtEvFJJ+dHGTvOQ2HyYjUR8UlWefeo0liZcDEiEPEKvk3N+hcQgoaEox3bq73F
	 xj+4CixRxjOCdfrgC9lIn5TJcsS0qBTsqjKeHK9eEFbWt+5sCdNZA1UvKIspTNaUAO
	 IGGgkWbmyMIEXQ9Q5V4xygv4hB/i2WNiA8PqYcdVysE9WM8QBhZPXDkwd3sZIN6axw
	 pPpVCaBMF1ehQ==
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-de59daab3f3so3256206276.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 May 2024 06:00:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVfQTc5xfu/UwwgV62VIk7NE+HPR/M+IFX3Lyzsv89BXbS9SxFhoF39zksnkA0VbraiAP51Vwxr8YuFJBXW5xuQqoU3DrCUKq7Tu2EWFvXB2bU=
X-Gm-Message-State: AOJu0YxWBCXUoXJXPrJwzuvNRMiiq+JKfc8q5P8ry80+65mJHYRkY4OB
	KAs9q47uQa2srdKVv4BWIaaBG67zpJwE4KIsbZ/nOXqGJ34Bqrtw1fh3/u/xU8kmwy0AIfr9rTX
	W2L+iOB+fxCUCXNFkP/tcDyhO6Y7R//D+gtErow==
X-Google-Smtp-Source: AGHT+IFSXIrlEHQMjbadrALM1vetWbdYRhg+rYYyEOkc+cmtMDuzDsVoHeE8HoT2ozVpMFsvd3ft+Xu4gMNWYZI20nc=
X-Received: by 2002:a25:df48:0:b0:dc2:3f75:1f79 with SMTP id
 w69-20020a25df48000000b00dc23f751f79mr13418770ybg.23.1715086823845; Tue, 07
 May 2024 06:00:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240503151129.3901815-1-l.stach@pengutronix.de> <20240503151129.3901815-7-l.stach@pengutronix.de>
In-Reply-To: <20240503151129.3901815-7-l.stach@pengutronix.de>
From: Robert Foss <rfoss@kernel.org>
Date: Tue, 7 May 2024 15:00:12 +0200
X-Gmail-Original-Message-ID: <CAN6tsi6T+CO8U8B6VetzwT+zQz5X6www4t0SfRnwjg=AY+y5Rg@mail.gmail.com>
Message-ID: <CAN6tsi6T+CO8U8B6VetzwT+zQz5X6www4t0SfRnwjg=AY+y5Rg@mail.gmail.com>
Subject: Re: [PATCH 06/14] drm/bridge: analogix_dp: remove clk handling from analogix_dp_set_bridge
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
> The clock is already managed by runtime PM, which is properly invoked
> from the analogix_dp_set_bridge function, so there is no need for an
> additional reference.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 11 +----------
>  1 file changed, 1 insertion(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers=
/gpu/drm/bridge/analogix/analogix_dp_core.c
> index 9f1dfa6f2175..311e1e67486d 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -1258,12 +1258,6 @@ static int analogix_dp_set_bridge(struct analogix_=
dp_device *dp)
>
>         pm_runtime_get_sync(dp->dev);
>
> -       ret =3D clk_prepare_enable(dp->clock);
> -       if (ret < 0) {
> -               DRM_ERROR("Failed to prepare_enable the clock clk [%d]\n"=
, ret);
> -               goto out_dp_clk_pre;
> -       }
> -
>         if (dp->plat_data->power_on)
>                 dp->plat_data->power_on(dp->plat_data);
>
> @@ -1297,8 +1291,7 @@ static int analogix_dp_set_bridge(struct analogix_d=
p_device *dp)
>         phy_power_off(dp->phy);
>         if (dp->plat_data->power_off)
>                 dp->plat_data->power_off(dp->plat_data);
> -       clk_disable_unprepare(dp->clock);
> -out_dp_clk_pre:
> +
>         pm_runtime_put_sync(dp->dev);
>
>         return ret;
> @@ -1367,8 +1360,6 @@ static void analogix_dp_bridge_disable(struct drm_b=
ridge *bridge)
>         analogix_dp_set_analog_power_down(dp, POWER_ALL, 1);
>         phy_power_off(dp->phy);
>
> -       clk_disable_unprepare(dp->clock);
> -
>         pm_runtime_put_sync(dp->dev);
>
>         ret =3D analogix_dp_prepare_panel(dp, false, true);
> --
> 2.39.2
>

Reviewed-by: Robert Foss <rfoss@kernel.org>
