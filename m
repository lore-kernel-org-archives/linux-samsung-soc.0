Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52C615B3
	for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Jun 2024 11:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718019958; cv=none; b=qlCfKjV0EL7UVd3ub37L2hr1XULU+yVrijdoiT9Y8F8/NmiIW1djSgShVwItVpOF/KAlnaY1VYzHkn/kKNvrmLKHUwjGq0uRtqT8O+or2jVFz3DpAPaseWlQa3+lWSSrgfHtoW2SdpytlOh9Uh57Tzgs//78++YOGj1UgPfpHS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718019958; c=relaxed/simple;
	bh=LkJbrehovjI8boe5mKT25LVBJmIDKTobkxAiPn5ANrs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AveKcF3IbJ0ze1v0O0edLngCyRWP1ZHP64nf8kOqwt3eZhIFgtTsIs4XU9OoMIomUQw/hi9IVFVpZFjUH3Y2yHjcasGQnPNFwScsDYqzqQJa7MGlWGGVpoFxBB7rLgYXfGXpYmc4xFlRp8wBYBsFJSQTSCq1a/fm8oBmYxWyY8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YcdNmjL/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YcdNmjL/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B7B7C4AF64
	for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Jun 2024 11:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718019958;
	bh=LkJbrehovjI8boe5mKT25LVBJmIDKTobkxAiPn5ANrs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YcdNmjL/Kg19JlWdyGtIGam2DhFIoyzaA+RZ/TSZaBRZBL55Ly52V70toHdLAQK2b
	 k4oRPtSFOd8BC3xTzLxGVb43zwow/i9ZCxS+eLTOxZC4SWjzuhyo+wVLVdYvybjoR2
	 1WGYSOJpPQR5GVIAQZzNXup1O3mXsEp5ZczJPDNxGhDL0u3QZ9YlYNjyDFOtNmBdZK
	 8RPgUP2nj5owfPP8y1zhZl/f0ivnEdS25/nztvMzv8op0xW/6pvuxv/sa3NM05xUMQ
	 L8kPv09i1Vh65awZ5i33977VdFBD2yLXYl2JgwTZMVCzjoW/FPc8gujk3jJZojqMCA
	 fXOtA1fXoTjUg==
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-627f3265898so44136597b3.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Jun 2024 04:45:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXwBC5907oSfV7supzUKL0herpIP9o+jo1ofcmSxv088NepGZEIV9BnCuuMoYJ9TCxZrT+gqcrnDFjv1t9xSr35tgSv3DUuXE6cRFRN/lekFas=
X-Gm-Message-State: AOJu0Yx5vWXVb0aXd4+L1yxh2EoM3ssC0r/0dTvhh01gwRbNhA8ufssu
	IrOviquqpEPjgNTmpd1sqZNyksbEnsMcSEfzLPT+qDXgnjNNMVdoEv39adyQc1jlZHL3J5zLhhV
	/AnKZ9PKuh3aQR10W7/GfjEE8X2QE9iCGo5UDDw==
X-Google-Smtp-Source: AGHT+IE9MeVBsZF94aj/YHt5dCD74gzjhxYbl6SkNcdi+ZXk0stj9lwbNuDA0bYmmw/1OtQpee+r5SKCScZprWB34uw=
X-Received: by 2002:a25:901:0:b0:dee:998b:1459 with SMTP id
 3f1490d57ef6-dfaf653d004mr8969753276.39.1718019957648; Mon, 10 Jun 2024
 04:45:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240503151129.3901815-1-l.stach@pengutronix.de>
 <20240503151129.3901815-11-l.stach@pengutronix.de> <CAN6tsi4js9jb3Q2tTKLo=3ueCPsQaezZ-FDyzHjJ14D0-Z7ttg@mail.gmail.com>
In-Reply-To: <CAN6tsi4js9jb3Q2tTKLo=3ueCPsQaezZ-FDyzHjJ14D0-Z7ttg@mail.gmail.com>
From: Robert Foss <rfoss@kernel.org>
Date: Mon, 10 Jun 2024 13:45:46 +0200
X-Gmail-Original-Message-ID: <CAN6tsi5R1TiLnwAz0tDbc=jYODwwpTx=3Am-Jqh1wAqYb_8xgA@mail.gmail.com>
Message-ID: <CAN6tsi5R1TiLnwAz0tDbc=jYODwwpTx=3Am-Jqh1wAqYb_8xgA@mail.gmail.com>
Subject: Re: [PATCH 10/14] drm/bridge: analogix_dp: move macro reset after
 link bandwidth setting
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

On Tue, May 7, 2024 at 3:07=E2=80=AFPM Robert Foss <rfoss@kernel.org> wrote=
:
>
> On Fri, May 3, 2024 at 5:13=E2=80=AFPM Lucas Stach <l.stach@pengutronix.d=
e> wrote:
> >
> > Setting the link bandwidth may change the PLL parameters, which will ca=
use
> > the PLL to go out of lock, so make sure to apply the MACRO_RST, which
> > according to the comment is required to be pulsed after the PLL is lock=
ed.
> >
> > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> > ---
> >  .../gpu/drm/bridge/analogix/analogix_dp_core.c | 18 ++++++++++--------
> >  1 file changed, 10 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drive=
rs/gpu/drm/bridge/analogix/analogix_dp_core.c
> > index b4a47311cfe8..736b2ed745e1 100644
> > --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> > +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> > @@ -243,6 +243,11 @@ static int analogix_dp_link_start(struct analogix_=
dp_device *dp)
> >
> >         /* Set link rate and count as you want to establish*/
> >         analogix_dp_set_link_bandwidth(dp, dp->link_train.link_rate);
> > +       /*
> > +        * MACRO_RST must be applied after the PLL_LOCK to avoid
> > +        * the DP inter pair skew issue for at least 10 us
> > +        */
> > +       analogix_dp_reset_macro(dp);
> >         analogix_dp_set_lane_count(dp, dp->link_train.lane_count);
> >
> >         /* Setup RX configuration */
> > @@ -565,12 +570,6 @@ static int analogix_dp_full_link_train(struct anal=
ogix_dp_device *dp,
> >         int retval =3D 0;
> >         bool training_finished =3D false;
> >
> > -       /*
> > -        * MACRO_RST must be applied after the PLL_LOCK to avoid
> > -        * the DP inter pair skew issue for at least 10 us
> > -        */
> > -       analogix_dp_reset_macro(dp);
> > -
> >         /* Initialize by reading RX's DPCD */
> >         analogix_dp_get_max_rx_bandwidth(dp, &dp->link_train.link_rate)=
;
> >         analogix_dp_get_max_rx_lane_count(dp, &dp->link_train.lane_coun=
t);
> > @@ -637,9 +636,12 @@ static int analogix_dp_fast_link_train(struct anal=
ogix_dp_device *dp)
> >         u8 link_align, link_status[2];
> >         enum pll_status status;
> >
> > -       analogix_dp_reset_macro(dp);
> > -
> >         analogix_dp_set_link_bandwidth(dp, dp->link_train.link_rate);
> > +       /*
> > +        * MACRO_RST must be applied after the PLL_LOCK to avoid
> > +        * the DP inter pair skew issue for at least 10 us
> > +        */
> > +       analogix_dp_reset_macro(dp);
> >         analogix_dp_set_lane_count(dp, dp->link_train.lane_count);
> >         analogix_dp_set_lane_link_training(dp);
> >
> > --
> > 2.39.2
> >
>
> This patch does not apply on drm-misc/drm-misc-next as far as I can tell.

Reviewed-by: Robert Foss <rfoss@kernel.org>
