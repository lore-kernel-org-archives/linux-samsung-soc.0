Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1BD537CD2C
	for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jun 2026 15:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782486731; cv=pass; b=UkTKM/NXPTSJTfgL4qQqg3/zomBE9c5aHL31KFCRlkiGuIXmm2NZNWBPj17OWTnSPQxxG8AX64N+CsmU9OVXPb2sMkhl9CFWf2WTe6/OAq9C7AswzalxjzLzQFSq8ORUCQrjYCBkrjcS1Z9tKq1fvQPuHwTaY+VfqgSk2bms6dY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782486731; c=relaxed/simple;
	bh=Evlqo2mKiWd3GWD+tOTSIJ+Llo4YzdKnMs4LsgHm9FM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rId+XwbjhaGe2f3PTm6rHc1I19iDlyLxSuKy+60Hw+k0df1qGCZOPQAqTE7qHDW5TUoDWzs2Nk+kzaHMMSm1LECCDwmBBTqDOIKuACXhPSx8FwDxMnEyuGX3XgKkv6sNs04xoF6Bi/9u97At1SoypGi/G9FebB0P476uyPMIuZc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Zxa6WHpg; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=qUqywsK7; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Zxa6WHpg";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="qUqywsK7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782486722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gNWd65/LlS1S7z+e2JXdypKHFrBZo/8VRicT21AfZoc=;
	b=Zxa6WHpg2qVYR+ER3IffUoWhiJ1wed8JncQ1FUCZN0X9vL1f0Ce8fYeZyQJ2lwULIF3CGR
	qS52eySJEoyEmIVqE3We13iarBY9XuXBIz4mzC7ZNPD0Vgritev8bTfO5o0hR+DQhtwOY2
	ON+h/8eikMeVllqz19Vc4gDxXBuDbig=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-259-P-MHuvLpOheA2YTmFynDZA-1; Fri, 26 Jun 2026 11:11:54 -0400
X-MC-Unique: P-MHuvLpOheA2YTmFynDZA-1
X-Mimecast-MFC-AGG-ID: P-MHuvLpOheA2YTmFynDZA_1782486714
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7fe0184fa91so20191917b3.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jun 2026 08:11:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782486714; cv=none;
        d=google.com; s=arc-20260327;
        b=RQcFBZ5V2OF1Nmyoi4dX3nGL/gP0ReZ9itVg3E1V76eIdlzrgUHbbgH5PiG+TwBHI1
         KcVqc8FpRz6QC60oshcG74MfmB/hWfW4LvsFkq0Ubv+KuP4HyKYHdo3+u3sRTcf0bxNy
         eNplIi9oNr117R7JOvVyjH9SxSRncS9xA3AxvNgnKcYZbqlqAFLb9pnU2zysGGbGMvo3
         BMvz5b5zzsZ7Q0u/VHUw4zXQ+39OYaR8Lv7sVmljEkQ+oRTJAw42VPWsJyrtpZa6w3mN
         tVR3b4XEz6kdQTLorYHJh3yAODT+52UPnezaAeK/6cuVhEZ6hU2cH+bhAid67fWYhlAa
         fhvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gNWd65/LlS1S7z+e2JXdypKHFrBZo/8VRicT21AfZoc=;
        fh=mNcOh5DRoayTqHE0gmMdUxb7WCDd0LqqvqJo43YfFoc=;
        b=IuWe4yGYjMVPONfyqm/i5JVVTovOjNcAFkXpluv6lrWDmrDoZnrLxYlo8Ia430I4Ad
         BqpBRx2x/G7MMPWSfNv9o++FmdK+TKXgE7KB6fvA+g/PFyIMMlEVM96Es2Oksjfxa5hj
         YLh3BOxJZc+hNR3Qegyz2aVnzWZAZ8KPXptVATDz3kAaQrg3KW/kzh/r0v9plCAlxfob
         oNZjiFgr/t07xXdWL7bJZ+Ur3NHxrFExpOaTeUxPsZNWMULUrsMWYlH4r0EP6QSzjHud
         UL2DAr9fbKo/L3mV1clQ2+xCqOGAERAIwZRxmeRP6fZD1CaFvvGD4bt7Oz4hbLwVHmCr
         WuZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782486714; x=1783091514; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gNWd65/LlS1S7z+e2JXdypKHFrBZo/8VRicT21AfZoc=;
        b=qUqywsK75FJf1QrIm0fEU72pMXDjQUMdBuy5NaOdS+ylNmFxDSI/yKQU+tdCbNsOMr
         mIXjSZNn78h2dU6NFM2q0UdYYXLIz9/F0vxLaz/eQy//GfH2Ejs2LikJGXsz1xuHYktG
         P2uDJ7eCWLNsep0X+MOaPp7xgqsfyk9AiNpeILd6yuITy2z4t0vi0ByCuiZ9qRPMxivN
         jzaAHnLmXHKsxW9Q1U/0DjJRfUQWOKGkpAJyKxwLfyrNX5pVTRNOUImuQSn/TDTNmyZ0
         UHQtTKGIBNbvays1jYc9Tu0rbstVRSHnIs8V/upwCKGqGM2LIpWTDsYlEdrwn5YvE+bA
         /ToA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782486714; x=1783091514;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gNWd65/LlS1S7z+e2JXdypKHFrBZo/8VRicT21AfZoc=;
        b=M3lSkThJ1PgDNwsqQuvcvO6qYQHZZOuBV7Q+aa7YeTToKMrceKPLM6fWtnZzHcspVO
         ys2SfYZEUPPesd0SFrjEbDQy83YoiqhNV0BaWX9/Z2ZilFDqZ9HA/zWU9ZPvrXK8lIDP
         /hSMzRDM04LF4Nd5v317Ft9CL7diVeYezZ7lMb7kslaiU5J8zRq24/rkzm6RKHop01De
         emsJ6ysjYSZ0RBrZaM8QuY07G9kCNgnpXhOisOTjYSI/NlqxGRs4kXIja24eBtf49xla
         D16qeWFdACGsLQKMQhodZ4OX8vQ+P5vjm1UTbu1ZHedPtGIxvXalE/eEoW3E4Mg/ThaO
         bjzg==
X-Forwarded-Encrypted: i=1; AHgh+RqgtaK6t7d3DD3pTYdnRV6nC3JWPxYfESqBUWP5OFVpg+lj5BkQj/EoFfjF3u8KF6FC2nRjI3FEPIvyuN1i6EYTMA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb1rpQ7hf5YMrI6BnF1OvsGmEa3sHjnZqb4kxMxBFZk5u2mFEJ
	c/6Insrx6oWrqtWjkxwNpZQaTQCSqmeJSv0SzuQSMx9/5i8AjpLTvZipWqh6nHjsmBIOKmEKf92
	FYHdNJfGWKyAptYqWLPi94RqmpohCpvdPJcJcdJXR9+RdHYxUMD4w8sXcQoLBCPhZ8KnmP+qfq6
	VdXk4ayl5KSyCmBQnDNAjqw8vHgru7cZY+gBsbKc5nQSqZZO8=
X-Gm-Gg: AfdE7ckPcG1oSxzydCWni3z6Lkdd0q0gUfYac4DSCZnv3hCAIg8V9yYiqBvFzrUQtmR
	vLdC5KMsJLdYMa+h2fw9VJDBzLhx4YglWm1VJX4pkc5Nk5pdTzz9/8njuYwyKoXlmWKiAyS9KKF
	JI3scI8bf7OMZy5Lci7CLvux3yfYigZPGhs/OuiWA/fzxF9HGzCYs+DvnlfZWL8b4z
X-Received: by 2002:a05:690c:6804:b0:7fc:cbe1:746d with SMTP id 00721157ae682-80c73fe6f4bmr9719587b3.42.1782486714003;
        Fri, 26 Jun 2026 08:11:54 -0700 (PDT)
X-Received: by 2002:a05:690c:6804:b0:7fc:cbe1:746d with SMTP id
 00721157ae682-80c73fe6f4bmr9718797b3.42.1782486713496; Fri, 26 Jun 2026
 08:11:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260626-drm_refcount_wiring-v1-0-cca1a7b3bdef@redhat.com>
 <20260626-drm_refcount_wiring-v1-3-cca1a7b3bdef@redhat.com> <20260626-successful-badger-from-neptune-ae2bc6@houat>
In-Reply-To: <20260626-successful-badger-from-neptune-ae2bc6@houat>
From: Albert Esteve <aesteve@redhat.com>
Date: Fri, 26 Jun 2026 17:11:42 +0200
X-Gm-Features: AVVi8CdeJARTOKb4ohxfJd8a69EdpRugjimEtA7qtwxmMR2cbKOdWmwQblTZgKI
Message-ID: <CADSE00LO98u6aDwvjijO_hAaMBXSGXaWPuFWiveQi_RWQ0MTVA@mail.gmail.com>
Subject: Re: [PATCH 3/5] drm/panel: make *find_panel*() return a counted reference
To: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
	Lucas Stach <l.stach@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
	Linus Walleij <linusw@kernel.org>, Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Sandy Huang <hjc@rock-chips.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Yannick Fertre <yannick.fertre@foss.st.com>, 
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
	Philippe Cornu <philippe.cornu@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Jyri Sarha <jyri.sarha@iki.fi>, 
	Jingoo Han <jingoohan1@gmail.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Alison Wang <alison.wang@nxp.com>, Paul Kocialkowski <paulk@sys-base.io>, 
	Alain Volmat <alain.volmat@foss.st.com>, Raphael Gallais-Pou <rgallaispou@gmail.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
	linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2026 at 2:50=E2=80=AFPM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> On Fri, Jun 26, 2026 at 02:03:25PM +0200, Albert Esteve wrote:
> > Callers of of_drm_find_panel() receive a pointer with no reference
> > held, creating a window where the panel device can be unregistered
> > and freed between the lookup and first use (e.g., drm_panel_prepare()).
> >
> > find_panel_by_fwnode() is the fwnode counterpart of of_drm_find_panel()=
.
> > drm_panel_add_follower() worked around the missing panel kref by callin=
g
> > get_device() on the panel's underlying struct device. However, get_devi=
ce()
> > only prevents the device kobject from being freed. It does not prevent =
the
> > panel's kzalloc()'d container memory from being released when the kref
> > reaches zero.
> >
> > Fix both lookup functions by acquiring a reference with drm_panel_get()
> > before returning, under panel_lock. Callers are now responsible for cal=
ling
> > drm_panel_put() when they no longer need the pointer.
> >
> > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > ---
> >  drivers/gpu/drm/drm_panel.c | 22 +++++++++++++++++-----
> >  1 file changed, 17 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
> > index 545fe93dc28fe..a00ae98ed0956 100644
> > --- a/drivers/gpu/drm/drm_panel.c
> > +++ b/drivers/gpu/drm/drm_panel.c
> > @@ -458,14 +458,17 @@ EXPORT_SYMBOL(__devm_drm_panel_alloc);
> >
> >  #ifdef CONFIG_OF
> >  /**
> > - * of_drm_find_panel - look up a panel using a device tree node
> > + * of_drm_find_panel - look up and reference a panel by device tree no=
de
> >   * @np: device tree node of the panel
> >   *
> >   * Searches the set of registered panels for one that matches the give=
n device
> > - * tree node. If a matching panel is found, return a pointer to it.
> > + * tree node. If a matching panel is found, the panel's reference coun=
t is
> > + * incremented before returning a pointer to it. The caller must call
> > + * drm_panel_put() when it no longer needs the panel pointer.
> >   *
> > - * Return: A pointer to the panel registered for the specified device =
tree
> > - * node or an ERR_PTR() if no panel matching the device tree node can =
be found.
> > + * Return: A reference-counted pointer to the panel registered for the=
 specified
> > + * device tree node or an ERR_PTR() if no panel matching the device tr=
ee node
> > + * can be found.
> >   *
> >   * Possible error codes returned by this function:
> >   *
> > @@ -484,6 +487,7 @@ struct drm_panel *of_drm_find_panel(const struct de=
vice_node *np)
> >
> >       list_for_each_entry(panel, &panel_list, list) {
> >               if (panel->dev->of_node =3D=3D np) {
> > +                     drm_panel_get(panel);
> >                       mutex_unlock(&panel_lock);
> >                       return panel;
> >               }
> > @@ -538,7 +542,13 @@ int of_drm_get_panel_orientation(const struct devi=
ce_node *np,
> >  EXPORT_SYMBOL(of_drm_get_panel_orientation);
> >  #endif
> >
> > -/* Find panel by fwnode. This should be identical to of_drm_find_panel=
(). */
> > +/*
> > + * Find panel by fwnode, returning a counted reference.
> > + *
> > + * Behaves identically to of_drm_find_panel(). On success the returned
> > + * pointer has been passed through drm_panel_get(); the caller must ca=
ll
> > + * drm_panel_put() when done with it.
> > + */
> >  static struct drm_panel *find_panel_by_fwnode(const struct fwnode_hand=
le *fwnode)
> >  {
> >       struct drm_panel *panel;
> > @@ -550,6 +560,7 @@ static struct drm_panel *find_panel_by_fwnode(const=
 struct fwnode_handle *fwnode
> >
> >       list_for_each_entry(panel, &panel_list, list) {
> >               if (dev_fwnode(panel->dev) =3D=3D fwnode) {
> > +                     drm_panel_get(panel);
> >                       mutex_unlock(&panel_lock);
> >                       return panel;
> >               }
>
> This part should probably be in a separate patch

Yes. This is another place where I hesitated on organization, as it is
very similar to of_drm_find_panel() fix. But find_panel_by_fwnode() is
much more self-contained (it is declared static to begin with). So it
makes sense to split them. I will do so in the next version.

>
> > @@ -686,6 +697,7 @@ void drm_panel_remove_follower(struct drm_panel_fol=
lower *follower)
> >       mutex_unlock(&panel->follower_lock);
> >
> >       put_device(panel->dev);
> > +     drm_panel_put(panel);
> >  }
> >  EXPORT_SYMBOL(drm_panel_remove_follower);
>
> together with this one?
>
> Maxime

