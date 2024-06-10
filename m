Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99C57E0E8
	for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Jun 2024 11:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718020583; cv=none; b=CKxTKu6o2NuO0h6WHpW64PSEdQJoMbWfQZUMikLTPfy4t/8b5HtsBYMKyY4NdcdOeqgWrueQICbaH+YBN4n0uID/+FGKFMtHANFjfJA3My0hRulAs8+o65+kqTOad+rD1OPCyqnVm4Tpd45wGU8lgK1Jt0WflofIwzzivaLUW+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718020583; c=relaxed/simple;
	bh=kv8PfW7sT6WPzyG1imjSjaRyNaJ4MzIY6YMO4SL7ECk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mNnj++emeblavD8/6+58XWuYwwN20B3m98FQCpl768PPofpt+kuqtECVlJ8zWs0EDYiiujqPz2+ZXx+8RzsFSAmJYZLZXjaQZ6kOsJ9mXsR+H+AU+ohTTxnBSJGL7fUVr9kDdPfj2kiLaDR8DVV4k8LHb70Qsnn0LUNfRt5Y07o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sLZ1gIZ6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sLZ1gIZ6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4192AC2BBFC
	for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Jun 2024 11:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718020583;
	bh=kv8PfW7sT6WPzyG1imjSjaRyNaJ4MzIY6YMO4SL7ECk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sLZ1gIZ6w3o8PkaaKyaQKAUa1rJGewFp/6rjgJVkcGyclF84OxXFzupAX3fL4mdaq
	 h8UqS+JN4rFYuTKZN/lPnxIx3QhkKU+uNzqVMdyE/us3r/VqTj4yc2j5cBWLa9jEme
	 dI9g7NwpU3/2mQ+YbKWYu0lHXX1vWwQJt0QNKCU7Wv20OHb3VZ4R6k9w/yGoUds+Zc
	 gZ2uq4t4Knqp6rCLHXjEE5na/PQbqDCdhK7M5MoUm30VENOhiX5pMaQPmqclbLs+EC
	 mLmKkc7qOcI6R4PCvOwBhXpIzCjpS58eanqU8/awbqm1IAUzamqFTt/mEgZ3NPy8KU
	 vJhaGJhbyaxVg==
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-df78b040314so4247846276.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Jun 2024 04:56:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXL+T8dnSTF83h5+ewO+J28QY9VRgR5Vn+PmAJdA2v9gYqa0hv060tbefjMHuzV+vsdWmaKhMd7cp95Im5fYyD+yjF+RXh5VS6xpFclhtr1ft0=
X-Gm-Message-State: AOJu0Yw24rq5jgrstc7LkS4i/v68r8ZN/EIp9E7hJni6dgQTz/ca6OvS
	zJqmnm+fGUePZzO+cdZFMxj76kO5diz6W14kmx+jILlWrjKYMqLFGNLRkU8x0YWYnUoSsb+n0Lm
	0zLMoQ9fV+00l6A3bH/IFfbcKQV66E6AwwV81/A==
X-Google-Smtp-Source: AGHT+IGQisIzvOX5qdhL2+YdNLcxMsgMAZrupqh/ejWYIXF9j4p2gncloTwF653234Rp7SUaIvgTUTcW+9wXqCigJN4=
X-Received: by 2002:a25:ac01:0:b0:dfa:9484:686f with SMTP id
 3f1490d57ef6-dfaf65e6758mr7576966276.22.1718020582581; Mon, 10 Jun 2024
 04:56:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240503151129.3901815-1-l.stach@pengutronix.de> <20240503151129.3901815-14-l.stach@pengutronix.de>
In-Reply-To: <20240503151129.3901815-14-l.stach@pengutronix.de>
From: Robert Foss <rfoss@kernel.org>
Date: Mon, 10 Jun 2024 13:56:11 +0200
X-Gmail-Original-Message-ID: <CAN6tsi5Q3uYi6ZUptV_5jktk1JeuX_c0dM2gnyP+tM6Y1sj5Lw@mail.gmail.com>
Message-ID: <CAN6tsi5Q3uYi6ZUptV_5jktk1JeuX_c0dM2gnyP+tM6Y1sj5Lw@mail.gmail.com>
Subject: Re: [PATCH 13/14] drm/bridge: analogix_dp: only read AUX status when
 an error occured
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
> All AUX error responses raise the AUX_ERR interrupt, so there is no
> need to read the AUX status register in normal operation. Only read
> the status when an error occured and we can expect a different status
> than OK.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/=
gpu/drm/bridge/analogix/analogix_dp_reg.c
> index 143a78b1d156..0f016dca9f3d 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
> @@ -924,7 +924,6 @@ ssize_t analogix_dp_transfer(struct analogix_dp_devic=
e *dp,
>                              struct drm_dp_aux_msg *msg)
>  {
>         u32 reg;
> -       u32 status_reg;
>         u8 *buffer =3D msg->buffer;
>         unsigned int i;
>         int ret;
> @@ -1011,12 +1010,14 @@ ssize_t analogix_dp_transfer(struct analogix_dp_d=
evice *dp,
>
>         /* Clear interrupt source for AUX CH access error */
>         reg =3D readl(dp->reg_base + ANALOGIX_DP_INT_STA);
> -       status_reg =3D readl(dp->reg_base + ANALOGIX_DP_AUX_CH_STA);
> -       if ((reg & AUX_ERR) || (status_reg & AUX_STATUS_MASK)) {
> +       if ((reg & AUX_ERR)) {
> +               u32 aux_status =3D readl(dp->reg_base + ANALOGIX_DP_AUX_C=
H_STA) &
> +                                AUX_STATUS_MASK;
> +
>                 writel(AUX_ERR, dp->reg_base + ANALOGIX_DP_INT_STA);
>
>                 dev_warn(dp->dev, "AUX CH error happened: %#x (%d)\n",
> -                        status_reg & AUX_STATUS_MASK, !!(reg & AUX_ERR))=
;
> +                        aux_status, !!(reg & AUX_ERR));
>                 goto aux_error;
>         }
>
> --
> 2.39.2
>

Reviewed-by: Robert Foss <rfoss@kernel.org>
