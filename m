Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D6E15B992
	for <linux-samsung-soc@vger.kernel.org>; Tue,  7 May 2024 13:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715087156; cv=none; b=ppia7SCCJ8fRdI9GSSUizsqS2psiLdQ69lSnMwuA7xBlDpzMFfO4/Ll4Xp17+Jpzt+SrB3poh8C6/H1osa4cBDQnwZa7GtuQorx4ypPZ5Z58Fv9uFaHLzAZoFNjj22fOR2I77FJxZhpQR7lxqW8EWSKuAxzL2EfwwRLqkMDNhzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715087156; c=relaxed/simple;
	bh=5PYH91EQi+idBxIKjdhl3K12UjexK5qvIICBveFfKMI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AcvY+nadzrS2HksDmKVCRnEM5WZ6k3FhJucm8V50xqBE3Qk81/OSH5mprpQboq8OlRqQ5RHzK1YwWjrERJX0NrwxTkGta8rtHEvQn6nYCviduVZ2faL5XsZo68Hvnk0AiRv6ojDyOWdH/IkjgT8KdeyEPD1u+Ury6SK5DUa6pHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=etWzkfvB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="etWzkfvB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82CFDC4DDE1
	for <linux-samsung-soc@vger.kernel.org>; Tue,  7 May 2024 13:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715087155;
	bh=5PYH91EQi+idBxIKjdhl3K12UjexK5qvIICBveFfKMI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=etWzkfvBRTSYmbIdNGWLnvHkNtxI7DMFj4Sop9h3xY5P1/0sNi8TvnPhY0mCsJi1T
	 AHvjrXmYsvmMIV6h3clvKGsR89VJq+jIYYkwDAgMBeb+dmkLS0KHqC4fbyx5Ld9eDN
	 ip95v9wvdwMYvA7297jb/v1SR1R+Hvx6yx6HqCFQ3pdDh1oOklj9iYkEbwQPo3Et4p
	 ArVqDSlORjEEx1piTzmd0KLdhOV1UYxsImRjbR6k+qg4+oJz8hDyS+fnp/94cmTXBi
	 zIURFEitgJ5i1kKaGfGelDDqyBKuTJqJ/PPfwORfOPKRi3OhhLji1kFW78YxaHEjSa
	 2pgBjLUte+E/w==
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-de45dba157cso2507326276.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 May 2024 06:05:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUtiGGivgjVxkADbw898mkLn7VSyrSgD8HvhhFpE7pOF8u0IoXFP0NpvH2JSmXzZTIn1hnbuheWoMTdZC5RwxyccyjUMOINAd3g0R10twtycqQ=
X-Gm-Message-State: AOJu0Yw2w9/boNHH7iaMCq6QisSV9AgrrSvejKGOLMvfDACBoUu67dyv
	R2jSAGiq/A4PIGdK/WSokd7X4xrr0F8RkotHfNZANjNP3e+RsTHDuxY2quM1QuvWOLGJ7hLi7PI
	BFzB9zZuAuq2m1Cf0HWSxFqHbOnJgAI3HZ80Chg==
X-Google-Smtp-Source: AGHT+IFn91kp+WhuqDQyRw92qtuMTa/GVclyApZ/cSHOyt/QXsb7bezaUvDdlymM+sqt732FQULKq1yg6rUERmbNifg=
X-Received: by 2002:a5b:942:0:b0:de4:8b7:7bbd with SMTP id x2-20020a5b0942000000b00de408b77bbdmr12304102ybq.15.1715087154728;
 Tue, 07 May 2024 06:05:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240503151129.3901815-1-l.stach@pengutronix.de> <20240503151129.3901815-9-l.stach@pengutronix.de>
In-Reply-To: <20240503151129.3901815-9-l.stach@pengutronix.de>
From: Robert Foss <rfoss@kernel.org>
Date: Tue, 7 May 2024 15:05:44 +0200
X-Gmail-Original-Message-ID: <CAN6tsi4SSpfsQRWgzn5VFdVO+v6YePfXWuK=7C3NzWzLyTh-Jg@mail.gmail.com>
Message-ID: <CAN6tsi4SSpfsQRWgzn5VFdVO+v6YePfXWuK=7C3NzWzLyTh-Jg@mail.gmail.com>
Subject: Re: [PATCH 08/14] drm/bridge: analogix_dp: move basic controller init
 into runtime PM
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
> Make sure the controller is in a basic working state after runtime
> resume. Keep the analog function enable in the mode set path as this
> enables parts of the PHY that are only required to be powered when
> there is a data stream being sent out.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 14 +++++---------
>  1 file changed, 5 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers=
/gpu/drm/bridge/analogix/analogix_dp_core.c
> index 3281c00a39cd..fdb2c2a2b69a 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -41,10 +41,8 @@ struct bridge_init {
>         struct device_node *node;
>  };
>
> -static int analogix_dp_init_dp(struct analogix_dp_device *dp)
> +static void analogix_dp_init_dp(struct analogix_dp_device *dp)
>  {
> -       int ret;
> -
>         analogix_dp_reset(dp);
>
>         analogix_dp_swreset(dp);
> @@ -56,13 +54,9 @@ static int analogix_dp_init_dp(struct analogix_dp_devi=
ce *dp)
>         analogix_dp_enable_sw_function(dp);
>
>         analogix_dp_config_interrupt(dp);
> -       ret =3D analogix_dp_init_analog_func(dp);
> -       if (ret)
> -               return ret;
>
>         analogix_dp_init_hpd(dp);
>         analogix_dp_init_aux(dp);
> -       return 0;
>  }
>
>  static int analogix_dp_detect_hpd(struct analogix_dp_device *dp)
> @@ -1258,9 +1252,9 @@ static int analogix_dp_set_bridge(struct analogix_d=
p_device *dp)
>
>         pm_runtime_get_sync(dp->dev);
>
> -       ret =3D analogix_dp_init_dp(dp);
> +       ret =3D analogix_dp_init_analog_func(dp);
>         if (ret)
> -               goto out_dp_init;
> +               return ret;
>
>         /*
>          * According to DP spec v1.3 chap 3.5.1.2 Link Training,
> @@ -1726,6 +1720,8 @@ int analogix_dp_resume(struct analogix_dp_device *d=
p)
>
>         phy_power_on(dp->phy);
>
> +       analogix_dp_init_dp(dp);
> +
>         return 0;
>  }
>  EXPORT_SYMBOL_GPL(analogix_dp_resume);
> --
> 2.39.2
>

Reviewed-by: Robert Foss <rfoss@kernel.org>
