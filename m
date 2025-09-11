Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FD53203AC
	for <linux-samsung-soc@vger.kernel.org>; Thu, 11 Sep 2025 12:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757593432; cv=none; b=MAPUdAD37pEOxUZpIbCOZDeKo9983IkgcQIekzHROntjseVygV7STFumY31RW2TPwLnqyqWw7SbWPxJvuHmFtCRZbpalBNdGdnIQTGiuHJUE0xYV0ArtioQcRiMijkDUPtmUt7tCNnB/AgkHDFbRQmi+v53qtSSQbiKSZoGcLpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757593432; c=relaxed/simple;
	bh=8BL93gxLuds6Tpj/iTAxO5O6nAfE8Xv9W01/Y+xLdro=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K0L4z43mlIllSQm4XxwaNJfSNqEvqJq9IaW7zqw7ICaAXeMK5rnH4lV1CDfrCVxbLbyAB28gwkFOG7g1q7PNEm/nNq0PI8o68TN7HWkGJAZMn5mYOVezihdDVaQZZhmR1gsFv8i6xKC9IsUodO0tBP4QqhGBQkx52KtJAQZsAZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y+s8NMoe; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y+s8NMoe"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-61ea79c1e91so307692eaf.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 11 Sep 2025 05:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757593430; x=1758198230; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZOhHNVyVLP7kW4W4c9CpTeNpoSEZbVmnYepZzBb3fl0=;
        b=y+s8NMoe9auTqdmtssiI8Hf9X17J8H4aoTMmwnCKUCksx8xNfo9JIqQiRUykMqf5CO
         yybATPBox/q19U+LeUECHtb4g3FFrOWbfbDqFfMEk7NOqvTfP7oVp0gCtRmeykRIRtVu
         ny5DHo3Jy77gwjBG4qbz4MwxeP2YoUa7mOLcXaQgJN7Fw24I/ZE9v04wWCEYjmCEvUa1
         NuF29DnQEJuU05cV7T4yoL+yNLcBXmzIVa9U0BLRkXiPvS8RFFrXluO7aemJxYe9J2/A
         TaipvVzenj1v+1ftidPoiZOeuMYhg+kh5e50TnF0sPLaRQprwCZkC55SzMSSw+jyKkyC
         l29w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757593430; x=1758198230;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZOhHNVyVLP7kW4W4c9CpTeNpoSEZbVmnYepZzBb3fl0=;
        b=hKD1Z3UDX+o0OIWy/RnZeBCzw4nEVo9h1uSuN/M1RaXoodvTwbYgUFEkt6Bw8tw+hE
         A7zeEvLPAp9q67NBhyVF67mpyRbDgIH+mImAxIza2V8l8LejwBXgIUVPq0xtuvkYNouy
         JlDBuaN/nbnVh2e3MKeMmJXVttkXPEX4cYLb1T/NGN/9RJEJXgbwTtRJ837udXZMHdr2
         APVnWo/AFkvmBaisBUebxIyWG2HuKd1nAn/NLpLZw0ZDKHlr/d1kgRmuBAOB/EdKTlCP
         zXtgVfKH2xkmMblNE4ZXAqII00p1ATVOe/UBIBbJ3e2ZFGaL5Omk+7c+huFmtuozNQs/
         HuIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlkdGvmZen860Lk34DKYIYUWF0DK4gB3/XxFpdOhaw5b64FCOhuW2wmcC5uotMHNU4XZmVJ2nrsB/fZvMC0URxjw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2Eww03oLG27B311IF3CLbsfSAMzPtOZgRXJYhE6DfiyHsZqKF
	O8Gq1SgrXr098RF/5m3ZPq9jXvo+42WRVLOfhViwr2B6sXk+ycEObTb1xfrbY0rurU2264UJRTf
	ggjv9dUmewq7drqXL+lsQYzOOqZaOddgjoF+NjnxSAg==
X-Gm-Gg: ASbGncs3JuQsNKKM/U57nEak41o59mdztRw6Flah0IcAfN/70U9VBsjw/TTkpydHMEm
	fH34UDxFI9uWlzKmnNnjeZEYPm7Awnu7MtXCXdjoFB2iU3mn9CL9VXV3GgmMaBfj/I4P66MAM4e
	wW/v6UxFQYyur4rvvqK4D2P1zNgnsF8QB9I8DyAiIURUbY4X6dc96ngr3P511ygZIx1/mau8GqG
	KpUcAynm2Qurns0MQ==
X-Google-Smtp-Source: AGHT+IFlJGRFVdFunbhE1qMFhFzsQ7ox2qrr0kPK3cR6JnkVwwd4KR9aUMOAVadxtU1iOr8rX8btiw416Km4fjx3eEM=
X-Received: by 2002:a05:6871:2942:b0:322:3811:e4a1 with SMTP id
 586e51a60fabf-32264a23b40mr11016481fac.26.1757593429792; Thu, 11 Sep 2025
 05:23:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250813-phy-notify-pmstate-v3-0-3bda59055dd3@linaro.org>
 <20250813-phy-notify-pmstate-v3-1-3bda59055dd3@linaro.org> <aKX5C9Xlx2CSJraY@vaman>
In-Reply-To: <aKX5C9Xlx2CSJraY@vaman>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 11 Sep 2025 13:23:37 +0100
X-Gm-Features: Ac12FXxrk_rVgmFgSaHooe5Gb5FZ-V_t_qQg9tRVc0kilQnohu6e2x4WgTN9EhE
Message-ID: <CADrjBPpaJdzDSe3kjk=zrODusH3LnwhaBn9-NDCJwEy3ymwvew@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] phy: add new phy_notify_state() api
To: Vinod Koul <vkoul@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, kernel-team@android.com, 
	William Mcvicker <willmcvicker@google.com>, Manivannan Sadhasivam <mani@kernel.org>, neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"

Hi Vinod,

Thanks for your review feedback.

On Wed, 20 Aug 2025 at 17:34, Vinod Koul <vkoul@kernel.org> wrote:
>
> On 13-08-25, 16:00, Peter Griffin wrote:
> > Add a new phy_notify_state() api that notifies and configures a phy for a
> > given state transition.
> >
> > This is intended to be by phy drivers which need to do some runtime
>                     ^^^^^^^^^^
> Missing 'used' possibly?

Yes your right, good spot, will fix.

>
> > configuration of parameters that can't be handled by phy_calibrate() or
> > phy_power_{on|off}().
> >
> > The first usage of this API is in the Samsung UFS phy that needs to issue
> > some register writes when entering and exiting the hibernate link state.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  drivers/phy/phy-core.c  | 25 +++++++++++++++++++++++++
> >  include/linux/phy/phy.h | 19 +++++++++++++++++++
> >  2 files changed, 44 insertions(+)
> >
> > diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> > index 04a5a34e7a950ae94fae915673c25d476fc071c1..60be8af984bf06649ef00e695d0ed4ced597cdb9 100644
> > --- a/drivers/phy/phy-core.c
> > +++ b/drivers/phy/phy-core.c
> > @@ -520,6 +520,31 @@ int phy_notify_disconnect(struct phy *phy, int port)
> >  }
> >  EXPORT_SYMBOL_GPL(phy_notify_disconnect);
> >
> > +/**
> > + * phy_notify_state() - phy state notification
> > + * @phy: the PHY returned by phy_get()
> > + * @state: the PHY state
> > + *
> > + * Notify the PHY of a state transition. Used to notify and
> > + * configure the PHY accordingly.
> > + *
> > + * Returns: %0 if successful, a negative error code otherwise
> > + */
> > +int phy_notify_state(struct phy *phy, union phy_notify state)
> > +{
> > +     int ret;
> > +
> > +     if (!phy || !phy->ops->notify_phystate)
> > +             return 0;
> > +
> > +     mutex_lock(&phy->mutex);
> > +     ret = phy->ops->notify_phystate(phy, state);
> > +     mutex_unlock(&phy->mutex);
> > +
> > +     return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(phy_notify_state);
> > +
> >  /**
> >   * phy_configure() - Changes the phy parameters
> >   * @phy: the phy returned by phy_get()
> > diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
> > index 13add0c2c40721fe9ca3f0350d13c035cd25af45..664d0864c3a5042949cb121e982368fe0a97827f 100644
> > --- a/include/linux/phy/phy.h
> > +++ b/include/linux/phy/phy.h
> > @@ -53,6 +53,15 @@ enum phy_media {
> >       PHY_MEDIA_DAC,
> >  };
> >
> > +enum phy_ufs_state {
> > +     PHY_UFS_HIBERN8_ENTER,
> > +     PHY_UFS_HIBERN8_EXIT,
> > +};
> > +
> > +union phy_notify {
> > +     enum phy_ufs_state ufs_state;
> > +};
> > +
> >  /**
> >   * union phy_configure_opts - Opaque generic phy configuration
> >   *
> > @@ -83,6 +92,7 @@ union phy_configure_opts {
> >   * @set_speed: set the speed of the phy (optional)
> >   * @reset: resetting the phy
> >   * @calibrate: calibrate the phy
> > + * @notify_phystate: notify and configure the phy for a particular state
> >   * @release: ops to be performed while the consumer relinquishes the PHY
> >   * @owner: the module owner containing the ops
> >   */
> > @@ -132,6 +142,7 @@ struct phy_ops {
> >       int     (*connect)(struct phy *phy, int port);
> >       int     (*disconnect)(struct phy *phy, int port);
> >
> > +     int     (*notify_phystate)(struct phy *phy, union phy_notify state);
> >       void    (*release)(struct phy *phy);
> >       struct module *owner;
> >  };
> > @@ -255,6 +266,7 @@ int phy_reset(struct phy *phy);
> >  int phy_calibrate(struct phy *phy);
> >  int phy_notify_connect(struct phy *phy, int port);
> >  int phy_notify_disconnect(struct phy *phy, int port);
> > +int phy_notify_state(struct phy *phy, union phy_notify state);
> >  static inline int phy_get_bus_width(struct phy *phy)
> >  {
> >       return phy->attrs.bus_width;
> > @@ -412,6 +424,13 @@ static inline int phy_notify_disconnect(struct phy *phy, int index)
> >       return -ENOSYS;
> >  }
> >
> > +static inline int phy_notify_phystate(struct phy *phy, union phy_notify state)
> > +{
> > +     if (!phy)
> > +             return 0;
> > +     return -ENOSYS;
>
> Should be -ENOSYS either way, right?

I initially thought the same, but I followed the pattern that is used
by many of the other phy API calls like phy_init/exit,
phy_power_on/off phy_calibrate, phy_notify_connect in
include/linux/phy/phy.h. I can update it if you like, but I was trying
to keep it consistent.

The only API I can see (that isn't a *phy_get* or *phy_create*) which
returns -ENOSYS unconditionally is phy_get_bus_width()

Thanks,

Peter
