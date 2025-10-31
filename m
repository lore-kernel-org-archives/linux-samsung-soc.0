Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9413115AF
	for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Oct 2025 08:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761900769; cv=none; b=TC3/PQ41I8Oqq/oXEFyaCVDVFszcSs1VBHHixtvytdoz+BmQddApp4uOBag8WdPpM2BoAAiRK2BXoTXcKepnQyr1lL1rvpNPk/zXuZq5l+w2nG16OiygPe6lBMQD8D+76KpP7KJWQwATgrHERn6/ydJoFqQB4GPosXdOH2uJTRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761900769; c=relaxed/simple;
	bh=SQA2+UjBZNeC3KmXm0e1JQ2dKcF/4XDLDW7+5Xqb54o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YReIBgCRORjZl05xDoMlB4b8WHuZJ8YCKLDjIqInLEIWppw9j1HgaXnPmgE5Q6LpA1VvOz1j7Qu9y+Gr5OM+Q2ryfHwmwA2zGrMfB21HKscvEKUkuDaugzao5g5WymLq3+XEoTvumjxgLhBPMMax0tr7W3t1gmhbyBEaM6T1DKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=otPh9ipj; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="otPh9ipj"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7c5308f6aedso1415275a34.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Oct 2025 01:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761900767; x=1762505567; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UVOOle+AJIIuteMGQoWj0kXyHB826iCzl9rVosT29bw=;
        b=otPh9ipjLVDvOw5vdWynJ/q5T7Spq2Ir3ASYwTESKFugL3hYe/vczRRP9AR0EqXE6i
         UZ2HkTuZIu7wCUhJl8Oh4DOIm0O8ic4wBg15sqFoqBmNbEaTC1FOm33UUw4yaPmbpje9
         P35TN5dJQSwifc+l49IfL+VWIt5GYp1+NNSpH1bKtduodPu4I4WiVZrURD5vgXyw/5jf
         ShLE2rbFGumGzGyC4AUmWAt7FurBeDOnrR2ZxwkE7QOg+bZ1l7WJNds1HPTLRTnCNGap
         mg+wsme8hbdeJHD/k8dHIqeM5D8sRdD4jK2mGbYAU1GeRDwbM+5+0+t06cc/2GqKQF3j
         NCdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761900767; x=1762505567;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UVOOle+AJIIuteMGQoWj0kXyHB826iCzl9rVosT29bw=;
        b=bwygYar1i8GjhQzAy5pnDqRryxrZfwj/r39ggASRNRK51uuncLCpFqW1ue/hl26prF
         k5S+6+VMGZc3lk92F9QeSNOizWlnslDYc3faB8r6OMvanaaCr5kgSxLw9Xato9Sm0ill
         sR7rqER6nW/idz8gh45zA7D0rtAHNoQeDUlYxhsHWiVHqyV+xnFzukkloHbXpEBkAqdM
         +TSeTl9feC6FkhAtk/EbzzPxoP9VDtmvCZhgp1ogO2/aWWF76pmdtiVdmm+v747ZgmEZ
         ts0qLNatJB05VffpdG/kp75KO5nzomVZQISKI+QHzwQNTuXOEnpFrD6T0kX7ntFoWIBg
         Q4Wg==
X-Forwarded-Encrypted: i=1; AJvYcCWsEVx3LjJhlFDKQWkbr5MtkxbQJCEVSJld7IJFKYOnU0UKy4rVNRF2Ka/10rtPNfSA9oJu726d0yUpQme2k+QfSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzbsOhrlQlceOIboDxZ9qhUC2G3SzkGbx+n6MuP9w4KT0ru+lx7
	N5lXWIhpQJvaPP8vgZG7lSPCpzWUZcMnH8vAuyNM0t6/umCHBwfKuDxo+wngZOpm5lEprdTrbSu
	B+bXCPxLyTPF7rxtirmZxEtdygcbBBFOZ4G+nLKjXvQ==
X-Gm-Gg: ASbGncvgJOt7RB8wsOdcKSjucpaBx/M4NvDDxUC0tcaexAPiOHmCLdJ4gdpunl9jEwe
	rRflPbwjI7JFCHLw2b7f98joyXrl5K5JpB9l76WBWWeSlRg+UnAgR86yZttbyGPZnBHv0bxvY5j
	q+mu6nUB4eMAj7oV1263oH0kiYy8pCV+cPUKjoyghhvHunXm0baP0J1lnMFNyWEpQ5hNo+tng6/
	VgyFU4aLW4CeRl6Tl2xmVftlP1VWwyqVzyR5j+aIVlTbrMy0tUHZTnAv8NlXIp/YiJFgXCXq/3q
	d2L7Ng==
X-Google-Smtp-Source: AGHT+IE2vnBdZNasAB1Xy72r9A2Sn2OoZw85wjD6Cd+JaiFG5aHRQrN3+j4NMQ38eKKIVVsK7pOkSngxrziJiWDeO4U=
X-Received: by 2002:a05:6808:2198:b0:437:dade:463f with SMTP id
 5614622812f47-44f95fd5661mr1151443b6e.34.1761900766670; Fri, 31 Oct 2025
 01:52:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250813-phy-notify-pmstate-v3-0-3bda59055dd3@linaro.org>
 <20250813-phy-notify-pmstate-v3-1-3bda59055dd3@linaro.org>
 <aKX5C9Xlx2CSJraY@vaman> <CADrjBPpaJdzDSe3kjk=zrODusH3LnwhaBn9-NDCJwEy3ymwvew@mail.gmail.com>
In-Reply-To: <CADrjBPpaJdzDSe3kjk=zrODusH3LnwhaBn9-NDCJwEy3ymwvew@mail.gmail.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 31 Oct 2025 08:52:35 +0000
X-Gm-Features: AWmQ_bmf3sDwcFE73Zf2SHIWustpcGeUpWRxOdPU5lAg-c6tgm7mH2rWSEsBY1E
Message-ID: <CADrjBPqc47TBXA78gO7VENLqYdsodKAGckB528OXv2==EM9MpA@mail.gmail.com>
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

On Thu, 11 Sept 2025 at 13:23, Peter Griffin <peter.griffin@linaro.org> wrote:
>
> Hi Vinod,
>
> Thanks for your review feedback.
>
> On Wed, 20 Aug 2025 at 17:34, Vinod Koul <vkoul@kernel.org> wrote:
> >
> > On 13-08-25, 16:00, Peter Griffin wrote:
> > > Add a new phy_notify_state() api that notifies and configures a phy for a
> > > given state transition.
> > >
> > > This is intended to be by phy drivers which need to do some runtime
> >                     ^^^^^^^^^^
> > Missing 'used' possibly?
>
> Yes your right, good spot, will fix.
>
> >
> > > configuration of parameters that can't be handled by phy_calibrate() or
> > > phy_power_{on|off}().
> > >
> > > The first usage of this API is in the Samsung UFS phy that needs to issue
> > > some register writes when entering and exiting the hibernate link state.
> > >
> > > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > > ---
> > >  drivers/phy/phy-core.c  | 25 +++++++++++++++++++++++++
> > >  include/linux/phy/phy.h | 19 +++++++++++++++++++
> > >  2 files changed, 44 insertions(+)
> > >
> > > diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> > > index 04a5a34e7a950ae94fae915673c25d476fc071c1..60be8af984bf06649ef00e695d0ed4ced597cdb9 100644
> > > --- a/drivers/phy/phy-core.c
> > > +++ b/drivers/phy/phy-core.c
> > > @@ -520,6 +520,31 @@ int phy_notify_disconnect(struct phy *phy, int port)
> > >  }
> > >  EXPORT_SYMBOL_GPL(phy_notify_disconnect);
> > >
> > > +/**
> > > + * phy_notify_state() - phy state notification
> > > + * @phy: the PHY returned by phy_get()
> > > + * @state: the PHY state
> > > + *
> > > + * Notify the PHY of a state transition. Used to notify and
> > > + * configure the PHY accordingly.
> > > + *
> > > + * Returns: %0 if successful, a negative error code otherwise
> > > + */
> > > +int phy_notify_state(struct phy *phy, union phy_notify state)
> > > +{
> > > +     int ret;
> > > +
> > > +     if (!phy || !phy->ops->notify_phystate)
> > > +             return 0;
> > > +
> > > +     mutex_lock(&phy->mutex);
> > > +     ret = phy->ops->notify_phystate(phy, state);
> > > +     mutex_unlock(&phy->mutex);
> > > +
> > > +     return ret;
> > > +}
> > > +EXPORT_SYMBOL_GPL(phy_notify_state);
> > > +
> > >  /**
> > >   * phy_configure() - Changes the phy parameters
> > >   * @phy: the phy returned by phy_get()
> > > diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
> > > index 13add0c2c40721fe9ca3f0350d13c035cd25af45..664d0864c3a5042949cb121e982368fe0a97827f 100644
> > > --- a/include/linux/phy/phy.h
> > > +++ b/include/linux/phy/phy.h
> > > @@ -53,6 +53,15 @@ enum phy_media {
> > >       PHY_MEDIA_DAC,
> > >  };
> > >
> > > +enum phy_ufs_state {
> > > +     PHY_UFS_HIBERN8_ENTER,
> > > +     PHY_UFS_HIBERN8_EXIT,
> > > +};
> > > +
> > > +union phy_notify {
> > > +     enum phy_ufs_state ufs_state;
> > > +};
> > > +
> > >  /**
> > >   * union phy_configure_opts - Opaque generic phy configuration
> > >   *
> > > @@ -83,6 +92,7 @@ union phy_configure_opts {
> > >   * @set_speed: set the speed of the phy (optional)
> > >   * @reset: resetting the phy
> > >   * @calibrate: calibrate the phy
> > > + * @notify_phystate: notify and configure the phy for a particular state
> > >   * @release: ops to be performed while the consumer relinquishes the PHY
> > >   * @owner: the module owner containing the ops
> > >   */
> > > @@ -132,6 +142,7 @@ struct phy_ops {
> > >       int     (*connect)(struct phy *phy, int port);
> > >       int     (*disconnect)(struct phy *phy, int port);
> > >
> > > +     int     (*notify_phystate)(struct phy *phy, union phy_notify state);
> > >       void    (*release)(struct phy *phy);
> > >       struct module *owner;
> > >  };
> > > @@ -255,6 +266,7 @@ int phy_reset(struct phy *phy);
> > >  int phy_calibrate(struct phy *phy);
> > >  int phy_notify_connect(struct phy *phy, int port);
> > >  int phy_notify_disconnect(struct phy *phy, int port);
> > > +int phy_notify_state(struct phy *phy, union phy_notify state);
> > >  static inline int phy_get_bus_width(struct phy *phy)
> > >  {
> > >       return phy->attrs.bus_width;
> > > @@ -412,6 +424,13 @@ static inline int phy_notify_disconnect(struct phy *phy, int index)
> > >       return -ENOSYS;
> > >  }
> > >
> > > +static inline int phy_notify_phystate(struct phy *phy, union phy_notify state)
> > > +{
> > > +     if (!phy)
> > > +             return 0;
> > > +     return -ENOSYS;
> >
> > Should be -ENOSYS either way, right?
>
> I initially thought the same, but I followed the pattern that is used
> by many of the other phy API calls like phy_init/exit,
> phy_power_on/off phy_calibrate, phy_notify_connect in
> include/linux/phy/phy.h. I can update it if you like, but I was trying
> to keep it consistent.
>
> The only API I can see (that isn't a *phy_get* or *phy_create*) which
> returns -ENOSYS unconditionally is phy_get_bus_width()

Friendly ping about the above ^^^

Peter.
