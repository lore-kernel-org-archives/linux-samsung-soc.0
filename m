Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A567015D5C8
	for <linux-samsung-soc@vger.kernel.org>; Tue,  7 May 2024 13:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715087225; cv=none; b=Q2FHmcuXeHYgT7LvRYkG3sSP/6vApyHicZAqpc9e+MftN6Yi5hE2iB4X4GUY6fJZsXyB2Hp3NEJetbncSIXk3nrWRPC1aLBr0e6s+xQQaZJWLq4NlA3/pQf/ZZMfTZ7Jpnvhg//COPtI8ZO++2J1UJj3j+2WXpfSm9ZE24U8Wwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715087225; c=relaxed/simple;
	bh=j+wghIRtU8XRBH9LfF5TF5xcsTvdGeZIbDN38hCooeQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BrGqi+WMoSsCT/Hg5G/lVORb6lSgZbJuITKLPY0G3x5L/qf9LmM623ojQ84XQ2nKiT1c74nxvyMaBlTOd+tBs80pXewtm0N9thns7dcBTCLNHScDUaOIRU6apvDrs/xtX+5Qge2bh/QPla/lSjZ7Z9yYhAt4YjWzrob/0/kUTNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Eypp4xRI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Eypp4xRI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30678C4AF68
	for <linux-samsung-soc@vger.kernel.org>; Tue,  7 May 2024 13:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715087225;
	bh=j+wghIRtU8XRBH9LfF5TF5xcsTvdGeZIbDN38hCooeQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Eypp4xRINrHZA63eREhh7B6svDPcuXYUGCAIfefcr/dYVbpy1jpmCPc4Y/fapRZfX
	 fnWUjdhhsvbNDOz1jh6xO8IxTJJK/pG9EMEGEWvOF1LusthULEUKCu7hJiQ/G5AKkY
	 f9LRFsApDbqAxCNP/wdjUjgwb6CtqWihlWFGOCZlDGYyYKoxYhlUFy1dUqP9e+SRfI
	 i3KC3i5bLMPY2yG35jboDohUcjbZvGuE6MQJVN9ffr3IUKmGpD72ritmlGp+vccDVQ
	 NpdoTlTDo7J8nb4+58sRz27gBnEaziRhm0WoPJSGX9cNLNH/oKakILgN3LB1WesRRc
	 3mFT6F4CBLKoA==
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-de60d05adafso3178421276.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 May 2024 06:07:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXToIIy/HrTlxAB4rOEtoiUl2J07Q/EG19yRsb0WhuXg5S8J+nJqoZtTQ0VaO5NtmrpyUrx9msFOa4b+7JT7xpP+cflekUV51n4VMC4+Rb4Wr0=
X-Gm-Message-State: AOJu0Yzk0kigQJm1i6t10UIwXv0JsvkgD+E38OhLvQbKMMJFPvx9636d
	BntiJOYKc0f1hzOtokbefT0m0H+dXYub0xZspwDNHxXUNDbSsaD1lLR5Z0VGrSlZfg0b7MY4rYa
	ixT/h2cv6aqOv1zV5NzGiwmshp27IJOkioy0P5Q==
X-Google-Smtp-Source: AGHT+IHdyD26pVJBgrb9c4Ow6dW/EnHwHak0Zk5si1N+G/I8HPhJ47kGZx/tFd/LtFMXYIPi3VN1ol1LI2O6iJHNVs4=
X-Received: by 2002:a5b:c42:0:b0:dcd:13ba:cdd6 with SMTP id
 d2-20020a5b0c42000000b00dcd13bacdd6mr11816255ybr.47.1715087224457; Tue, 07
 May 2024 06:07:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240503151129.3901815-1-l.stach@pengutronix.de> <20240503151129.3901815-10-l.stach@pengutronix.de>
In-Reply-To: <20240503151129.3901815-10-l.stach@pengutronix.de>
From: Robert Foss <rfoss@kernel.org>
Date: Tue, 7 May 2024 15:06:53 +0200
X-Gmail-Original-Message-ID: <CAN6tsi6HJDg3dWF=FGJNoONths7GWQrUmDtbW=Z4fVzi2CegOQ@mail.gmail.com>
Message-ID: <CAN6tsi6HJDg3dWF=FGJNoONths7GWQrUmDtbW=Z4fVzi2CegOQ@mail.gmail.com>
Subject: Re: [PATCH 09/14] drm/bridge: analogix_dp: remove PLL lock check from analogix_dp_config_video
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
> This check is way too late in the DP enable flow. The PLL must be locked
> much earlier, before any link training can happen. If the PLL is unlocked
> at that point in time there is something seriously wrong in the enable fl=
ow.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers=
/gpu/drm/bridge/analogix/analogix_dp_core.c
> index fdb2c2a2b69a..b4a47311cfe8 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -720,11 +720,6 @@ static int analogix_dp_config_video(struct analogix_=
dp_device *dp)
>
>         analogix_dp_set_video_color_format(dp);
>
> -       if (analogix_dp_get_pll_lock_status(dp) =3D=3D PLL_UNLOCKED) {
> -               dev_err(dp->dev, "PLL is not locked yet.\n");
> -               return -EINVAL;
> -       }
> -
>         for (;;) {
>                 timeout_loop++;
>                 if (analogix_dp_is_slave_video_stream_clock_on(dp) =3D=3D=
 0)
> --
> 2.39.2
>

Reviewed-by: Robet Foss <rfoss@kernel.org>
