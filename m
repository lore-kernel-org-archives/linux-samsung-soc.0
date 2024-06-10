Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBD27581D
	for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Jun 2024 11:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718020105; cv=none; b=M+VF/fXCuFoedNgLljUo/9zmknxoFimyjEP2TFRsIEGvqUMjMLqhY0NSmOBELm9IPXlx0/8/gl9nnxlex3HY4kctfM6OoP2oWw5jVJ2C0JxUhdabhmex1czmam/CiqksM+U3BlQ6VkMld7d14ISm8mfCuLiF3HOv/qyI6v2Us2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718020105; c=relaxed/simple;
	bh=EnvLMHWlQfTpDHyBkrIDp4WoWKYs33FSYEF6HxK5HXQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VgQqUKFTXxZGiYs0ta8KAxk9TaypRojKAG1yrv5qFHK6g/PxOR5vh+WULecqoVp3IBMYVU7bn5HjlEsDzwexFB5y7E+Jm1zeNC8PG77uCgvWAsTI+ul3Ku+6bhUl0MjeVQpyVxoHOz/iD10FOT9GKLJgwIbjOHMPOngFRGaGn2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fMeRg7oc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fMeRg7oc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE0DAC4AF51
	for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Jun 2024 11:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718020104;
	bh=EnvLMHWlQfTpDHyBkrIDp4WoWKYs33FSYEF6HxK5HXQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fMeRg7oc+uRBQ5R4Q4pbBqGxSe3N7OyiofvQlNXsGjh4JGfxQ/uYwWNBNCQssDs9a
	 nNsqfs8k/o3o/Bf4wa4Khv2UC6XGjiyEm61Wd+Upn9dTl5FQyO8RSCpqwc0tySJ6ck
	 Lr+hEC8SLp+sskpFECKkRWe7Ght+Fq92kmTUSXALoRUHRlnNxHTCAgCbTOdkkEfySL
	 GT61h2HYrHVU4z0k6MHtg2P/KXGmV7danOmb+QQkEoAbb3SumL0PTgSpoKCyUutxva
	 sLFY94VAoS3aTwvD7DH0nQ1MH1GJjZsCGqV8x5roacVBRxfwvchIUl/AMAUX9WN8fu
	 8N2MChk6DUrzA==
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-627e3368394so46334497b3.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Jun 2024 04:48:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVP6aYzYakF4LuE/2ZhjyhuoSVcncUs3ibL7nn4D/zybD4Vt1Tk08/DFdrBqBVLVMrsle3sJNHpa/2HCPS8/IOETQqQO/FxVXDktFnNAFqosnU=
X-Gm-Message-State: AOJu0YwZDFpZ8GPrmcVDXl4/sdXDm+pIVS3JLc/cPJjhAp0SDdVuJLAL
	EE4uhqD8kb0XHL84thPOsgNr244ixfH/+NHBj0jVip/06wiwizqRWXNFw5NYpSjBFXlXbiHGbIr
	ZADX71HK1Jl/s/ETSwXDnm3Yi46uIVK5y6Ov2Zg==
X-Google-Smtp-Source: AGHT+IGEKCo6gyyeWBzcK4b58/vCeVtAp7ZUoLZg7ARJvO2tHiONaUv9G9RmAjiSJYn4x9eDt1uJKoCxs9bAlp3RHLw=
X-Received: by 2002:a25:b319:0:b0:dfb:be1:b1d1 with SMTP id
 3f1490d57ef6-dfb0be1b892mr5743703276.35.1718020104093; Mon, 10 Jun 2024
 04:48:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240503151129.3901815-1-l.stach@pengutronix.de> <20240503151129.3901815-12-l.stach@pengutronix.de>
In-Reply-To: <20240503151129.3901815-12-l.stach@pengutronix.de>
From: Robert Foss <rfoss@kernel.org>
Date: Mon, 10 Jun 2024 13:48:13 +0200
X-Gmail-Original-Message-ID: <CAN6tsi55PdW0Z7H_-7S6tPjkhAewacKNjxmfe7qcaXXZ=6-GYg@mail.gmail.com>
Message-ID: <CAN6tsi55PdW0Z7H_-7S6tPjkhAewacKNjxmfe7qcaXXZ=6-GYg@mail.gmail.com>
Subject: Re: [PATCH 11/14] drm/bridge: analogix_dp: don't wait for PLL lock
 too early
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
> The PLL will be reconfigured later, which may cause it to go out of lock
> anyways, so there is no point in waiting for the PLL to lock here. Instea=
d
> we can continue execution of the link setup, which will properly set the
> PLL parameters and will wait for the PLL to lock at the appropriate times=
.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c | 14 +-------------
>  1 file changed, 1 insertion(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/=
gpu/drm/bridge/analogix/analogix_dp_reg.c
> index d267cf05cbca..e9c643a8b6fc 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
> @@ -356,7 +356,6 @@ void analogix_dp_set_analog_power_down(struct analogi=
x_dp_device *dp,
>  int analogix_dp_init_analog_func(struct analogix_dp_device *dp)
>  {
>         u32 reg;
> -       int timeout_loop =3D 0;
>
>         analogix_dp_set_analog_power_down(dp, POWER_ALL, 0);
>
> @@ -368,18 +367,7 @@ int analogix_dp_init_analog_func(struct analogix_dp_=
device *dp)
>         writel(reg, dp->reg_base + ANALOGIX_DP_DEBUG_CTL);
>
>         /* Power up PLL */
> -       if (analogix_dp_get_pll_lock_status(dp) =3D=3D PLL_UNLOCKED) {
> -               analogix_dp_set_pll_power_down(dp, 0);
> -
> -               while (analogix_dp_get_pll_lock_status(dp) =3D=3D PLL_UNL=
OCKED) {
> -                       timeout_loop++;
> -                       if (DP_TIMEOUT_LOOP_COUNT < timeout_loop) {
> -                               dev_err(dp->dev, "failed to get pll lock =
status\n");
> -                               return -ETIMEDOUT;
> -                       }
> -                       usleep_range(10, 20);
> -               }
> -       }
> +       analogix_dp_set_pll_power_down(dp, 0);
>
>         /* Enable Serdes FIFO function and Link symbol clock domain modul=
e */
>         reg =3D readl(dp->reg_base + ANALOGIX_DP_FUNC_EN_2);
> --
> 2.39.2
>


Reviewed-by: Robert Foss <rfoss@kernel.org>
