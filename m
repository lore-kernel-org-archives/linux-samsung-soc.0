Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52F57C4332B
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  3 Mar 2021 21:22:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 34C5B64ECF
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  3 Mar 2021 21:22:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238105AbhCCUzW (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 3 Mar 2021 15:55:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240972AbhCCKcI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 3 Mar 2021 05:32:08 -0500
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com [IPv6:2607:f8b0:4864:20::e2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F100C061788
        for <linux-samsung-soc@vger.kernel.org>; Wed,  3 Mar 2021 02:31:16 -0800 (PST)
Received: by mail-vs1-xe2e.google.com with SMTP id p24so3234574vsj.13
        for <linux-samsung-soc@vger.kernel.org>; Wed, 03 Mar 2021 02:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ud8XCo4zETwyBcC5uBZYedvwqDLvaKNv5XeUnTbkcFs=;
        b=MUXW0BLcopSj2WEivWF6kbF45NTv7iE6q4bdW0n64jAOThRVEwx0mwL70/W8QAcW22
         kbp43yMWDe8/wr6M408sE0OwjffCirBG9ZLdfmUcFX2sgeaA6c0HU/locnDgty4g8tBY
         P1x3TV2Q9JYZyg4RAnN+KCw0Zda/CC2Tbyeok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ud8XCo4zETwyBcC5uBZYedvwqDLvaKNv5XeUnTbkcFs=;
        b=pI7l85TCYRhrBcO/jslT5wRqzctGlQYlHp+Pq2jhTevRHQYUR7TsRp+owpY5C5lILR
         5zJp63qtIlleWPjoPAKRUkwOKqD01mOrrHehKQErMSq05fMgyoQ2Ck70ViXO1shLgvPd
         p4PhSzyNk7BiDYdUDtAbruhJGkjlrzq1Zvim+RTt5sCSjeQY40AEd6AFz3u9rINEE+vk
         9437vzvqRwJ+HzjDDqgaSJRyoTadr544TMu5lG2sncbRhW50TlvRA64Tt2CZavJ5mV45
         CejKBOAhAAPcIwadlARdvGMkzij+UVVpgKu7S6eaO+AirXvdM0zgoJJPUaVd8HvGeSTh
         5yzQ==
X-Gm-Message-State: AOAM5336UV6obQ7I6owzVcMukfMOduOWKJ5f8DhcaxCnd7gLd6oHEf1S
        WTiDYnTDydSN/WWBgqtwftA0roPcrsVzYaUODU2pag==
X-Google-Smtp-Source: ABdhPJzM84ST5K0eaxhWuR85D0QFzIegAthMVmk/sn+EGXAtrfigTFMmmkIb7ZyoUsPiJw5uyoHo0rSSZNkvG9/REng=
X-Received: by 2002:a67:1046:: with SMTP id 67mr5250935vsq.21.1614767475658;
 Wed, 03 Mar 2021 02:31:15 -0800 (PST)
MIME-Version: 1.0
References: <20210211113309.1.I629b2366a6591410359c7fcf6d385b474b705ca2@changeid>
 <CACRpkdbQa3BZwgtp3=061cu+y+4qkMqtXQhXH_VuHB3KcLyDCA@mail.gmail.com>
In-Reply-To: <CACRpkdbQa3BZwgtp3=061cu+y+4qkMqtXQhXH_VuHB3KcLyDCA@mail.gmail.com>
From:   Nicolas Boichat <drinkcat@chromium.org>
Date:   Wed, 3 Mar 2021 18:31:04 +0800
Message-ID: <CANMq1KAsvXZAjmYCMQsAUwpkzuA9-PRnNWkpsLuNbOkP6DixGA@mail.gmail.com>
Subject: Re: [PATCH] drm/dsi: Add _NO_ to MIPI_DSI_* flags disabling features
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Robert Foss <robert.foss@linaro.org>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Emil Velikov <emil.velikov@collabora.com>,
        Inki Dae <inki.dae@samsung.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>, Sean Paul <sean@poorly.run>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Xin Ji <xji@analogixsemi.com>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Mar 1, 2021 at 4:59 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Thu, Feb 11, 2021 at 4:34 AM Nicolas Boichat <drinkcat@chromium.org> wrote:
>
> > Many of the DSI flags have names opposite to their actual effects,
> > e.g. MIPI_DSI_MODE_EOT_PACKET means that EoT packets will actually
> > be disabled. Fix this by including _NO_ in the flag names, e.g.
> > MIPI_DSI_MODE_NO_EOT_PACKET.
>
> Unless someone like me interpreted it literally...
>
> Like in these:
>
> >  drivers/gpu/drm/mcde/mcde_dsi.c                      | 2 +-
> >  drivers/gpu/drm/panel/panel-novatek-nt35510.c        | 2 +-
> >  drivers/gpu/drm/panel/panel-samsung-s6d16d0.c        | 2 +-
> >  drivers/gpu/drm/panel/panel-sony-acx424akp.c         | 2 +-
>
> > diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/mcde_dsi.c
> > index 2314c8122992..f4cdc3cfd7d0 100644
> > --- a/drivers/gpu/drm/mcde/mcde_dsi.c
> > +++ b/drivers/gpu/drm/mcde/mcde_dsi.c
> > @@ -760,7 +760,7 @@ static void mcde_dsi_start(struct mcde_dsi *d)
> >                 DSI_MCTL_MAIN_DATA_CTL_BTA_EN |
> >                 DSI_MCTL_MAIN_DATA_CTL_READ_EN |
> >                 DSI_MCTL_MAIN_DATA_CTL_REG_TE_EN;
> > -       if (d->mdsi->mode_flags & MIPI_DSI_MODE_EOT_PACKET)
> > +       if (d->mdsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET)
> >                 val |= DSI_MCTL_MAIN_DATA_CTL_HOST_EOT_GEN;
>
> If you read the code you can see that this is interpreted as inserting
> an EOT packet, so here you need to change the logic such:
>
> if (!d->mdsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET)
>     val |= DSI_MCTL_MAIN_DATA_CTL_HOST_EOT_GEN;
>
> This will make sure the host generates the EOT packet in HS mode
> *unless* the flag is set.
>
> (I checked the data sheet.)
>
> > diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35510.c b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
> > index b9a0e56f33e2..9d9334656803 100644
> > --- a/drivers/gpu/drm/panel/panel-novatek-nt35510.c
> > +++ b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
> > @@ -899,7 +899,7 @@ static int nt35510_probe(struct mipi_dsi_device *dsi)
> >         dsi->hs_rate = 349440000;
> >         dsi->lp_rate = 9600000;
> >         dsi->mode_flags = MIPI_DSI_CLOCK_NON_CONTINUOUS |
> > -               MIPI_DSI_MODE_EOT_PACKET;
> > +               MIPI_DSI_MODE_NO_EOT_PACKET;
>
> Here you should just delete the MIPI_DSI_MODE_EOT_PACKET
> flag because this was used with the MCDE driver which interpret the
> flag literally.
>
> > diff --git a/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c b/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c
> > index 4aac0d1573dd..b04b9975e9b2 100644
> > --- a/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c
> > +++ b/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c
> > @@ -186,7 +186,7 @@ static int s6d16d0_probe(struct mipi_dsi_device *dsi)
> >          */
> >         dsi->mode_flags =
> >                 MIPI_DSI_CLOCK_NON_CONTINUOUS |
> > -               MIPI_DSI_MODE_EOT_PACKET;
> > +               MIPI_DSI_MODE_NO_EOT_PACKET;
>
> Same, just delete the flag.
>
> > --- a/drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c
> > +++ b/drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c
> > @@ -97,7 +97,7 @@ static int s6e63m0_dsi_probe(struct mipi_dsi_device *dsi)
> >         dsi->hs_rate = 349440000;
> >         dsi->lp_rate = 9600000;
> >         dsi->mode_flags = MIPI_DSI_MODE_VIDEO |
> > -               MIPI_DSI_MODE_EOT_PACKET |
> > +               MIPI_DSI_MODE_NO_EOT_PACKET |
> >                 MIPI_DSI_MODE_VIDEO_BURST;
>
> Same, just delete the flag.
>
> > diff --git a/drivers/gpu/drm/panel/panel-sony-acx424akp.c b/drivers/gpu/drm/panel/panel-sony-acx424akp.c
> > index 065efae213f5..6b706cbf2f9c 100644
> > --- a/drivers/gpu/drm/panel/panel-sony-acx424akp.c
> > +++ b/drivers/gpu/drm/panel/panel-sony-acx424akp.c
> > @@ -450,7 +450,7 @@ static int acx424akp_probe(struct mipi_dsi_device *dsi)
> >         else
> >                 dsi->mode_flags =
> >                         MIPI_DSI_CLOCK_NON_CONTINUOUS |
> > -                       MIPI_DSI_MODE_EOT_PACKET;
> > +                       MIPI_DSI_MODE_NO_EOT_PACKET;
>
> Same, just delete the flag.
>
> These are all just semantic bugs due to the ambiguity of the flags, it is
> possible to provide a Fixes: flag for each file using this flag the wrong way
> but I dunno if it's worth it.

Wow nice catch.

I think we should fix all of those _before_ my patch is applied, with
proper Fixes tags so that this can be backported to stable branches,
even if it's a no-op. I can look into it but that may take a bit of
time.

Thanks,

>
> Yours,
> Linus Walleij
