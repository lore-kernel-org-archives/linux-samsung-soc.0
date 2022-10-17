Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83075C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 17 Oct 2022 03:54:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232877AbiJQDyk (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 16 Oct 2022 23:54:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232873AbiJQDyh (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 16 Oct 2022 23:54:37 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54E7E175A3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 16 Oct 2022 20:54:35 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id r8-20020a056830120800b00661a0a236efso5122834otp.4
        for <linux-samsung-soc@vger.kernel.org>; Sun, 16 Oct 2022 20:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kZFrBRjQqvKtI84d5ZY1Z+V+XGqvQ59HX9Pow5PlMCU=;
        b=RbV/uRqxG+zVsm9n1HjJ9973dtSLR6lor7ESRXg6D2NalpIkQUBr3chRaU5LY8h006
         SsqK7DmamzhMLY147g+5pRHYjicPIKzVZE1RlbeQQB7zNRgjsAcOY474YpZ5+bfkreqz
         GlVJxO/4H+FLqn5vRZ7sL6bHYD01YsT278yvQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kZFrBRjQqvKtI84d5ZY1Z+V+XGqvQ59HX9Pow5PlMCU=;
        b=G4hyCMAdxJnL5zPa++KS0UfZmvf3DBA+ifav15ijWaz7JoMpICokfTTlbBeAA9E6p+
         nNxr2zsLNHm7pM0IQmIgPZ+LOL4LhXaHb64jemOOrI5C6EXJUECPvZNpRrZtXZUTN79O
         kLraRvr1WxooO/3UslGOSZfdiePkvxAFW1SxvjEZXtClYzmpkt/eN1D99k4ZdCl746xw
         NHo61X8ACHTZBRest3DNl5xJkV2wIAvVzg7ixfeJGQEk0a33QRM7ejXRQ+8vbLKATzL2
         SUOgUyXFpjk9mv4TDT7pR/QcIeSGPrAAGW/DKM1B8ujkaq5eu6wSumygJ2ZdkfTEWyPE
         lyMQ==
X-Gm-Message-State: ACrzQf0J8U9hDNVTkHcrbmhbF/sI49e7xbOAsVhnXfXKlX/44LUxYP29
        5vbxR2JyWGOYaaSN3+pyjDEzHQkdMnoeFecAB/5DYA==
X-Google-Smtp-Source: AMsMyM7xr0aPJjWI2MC+pmlsfmTuOjoE5/TV7EBoUd55WrwB/d84/wWBTtajGh+kp9TEdbo1u2Evt/voiA8BWE3DASk=
X-Received: by 2002:a9d:7002:0:b0:661:caa8:5fab with SMTP id
 k2-20020a9d7002000000b00661caa85fabmr4228372otj.274.1665978874656; Sun, 16
 Oct 2022 20:54:34 -0700 (PDT)
MIME-Version: 1.0
References: <20221005151309.7278-1-jagan@amarulasolutions.com>
 <20221005151309.7278-6-jagan@amarulasolutions.com> <acc210c6-f3ae-a836-e2fc-5b1872b5bbd7@denx.de>
In-Reply-To: <acc210c6-f3ae-a836-e2fc-5b1872b5bbd7@denx.de>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Mon, 17 Oct 2022 09:24:23 +0530
Message-ID: <CAMty3ZAtuOKWJH6Qo-LiyCWEZW6g1JqRkRxctWiJcUpXaGMbLg@mail.gmail.com>
Subject: Re: [PATCH v7 05/10] drm: bridge: samsung-dsim: Add atomic_check
To:     Marek Vasut <marex@denx.de>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Fancy Fang <chen.fang@nxp.com>,
        Tim Harvey <tharvey@gateworks.com>,
        Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
        Adam Ford <aford173@gmail.com>,
        Neil Armstrong <narmstrong@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
        Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sun, Oct 16, 2022 at 2:53 AM Marek Vasut <marex@denx.de> wrote:
>
> On 10/5/22 17:13, Jagan Teki wrote:
> > Look like an explicit fixing up of mode_flags is required for DSIM IP
> > present in i.MX8M Mini/Nano SoCs.
> >
> > At least the LCDIF + DSIM needs active low sync polarities in order
> > to correlate the correct sync flags of the surrounding components in
> > the chain to make sure the whole pipeline can work properly.
> >
> > On the other hand the i.MX 8M Mini Applications Processor Reference Manual,
> > Rev. 3, 11/2020 says.
> > "13.6.3.5.2 RGB interface
> >   Vsync, Hsync, and VDEN are active high signals."
> >
> > No clear evidence about whether it can be documentation issues or
> > something, so added a comment FIXME for this and updated the active low
> > sync polarities using SAMSUNG_DSIM_TYPE_IMX8MM hw_type.
>
> [...]
>
> > +static int samsung_dsim_atomic_check(struct drm_bridge *bridge,
> > +                                  struct drm_bridge_state *bridge_state,
> > +                                  struct drm_crtc_state *crtc_state,
> > +                                  struct drm_connector_state *conn_state)
> > +{
> > +     struct samsung_dsim *dsi = bridge_to_dsi(bridge);
> > +     struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
> > +
> > +     if (dsi->plat_data->hw_type == SAMSUNG_DSIM_TYPE_IMX8MM) {
> > +             /**
> > +              * FIXME:
> > +              * At least LCDIF + DSIM needs active low sync,
> > +              * but i.MX 8M Mini Applications Processor Reference Manual,
> > +              * Rev. 3, 11/2020 says
> > +              *
> > +              * 13.6.3.5.2 RGB interface
> > +              * Vsync, Hsync, and VDEN are active high signals.
> > +              */
> > +             adjusted_mode->flags |= (DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
> > +             adjusted_mode->flags &= ~(DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
> > +     }
>
> It would be good to explain what exactly is going on here in the
> comment, the comment says "Vsync, Hsync, and VDEN are active high
> signals." and the code below does exact opposite and sets NxSYNC flags.
>
> Yes, the MX8MM/MN does need HS/VS/DE active LOW, it is a quirk of that
> MXSFB-DSIM glue logic. The MX8MP needs the exact opposite on all three,
> active HIGH.

This is what exactly is mentioned in the comments.

2nd line mentioned the active low of signals.
> > +              * At least LCDIF + DSIM needs active low sync,

from 3rd line onwards it mentioned what reference manual is referring

Not quite understand what is misleading here.

>
> It would also be good to mention both MX8MM and MX8MN are affected, not
> only MX8MM.

I think I can do this once I refer to the MX8MN manual.

Jagan.
