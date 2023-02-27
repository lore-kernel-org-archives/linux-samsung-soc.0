Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 905A8C64ED6
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 27 Feb 2023 13:40:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229486AbjB0NkD (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 27 Feb 2023 08:40:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbjB0NkD (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 27 Feb 2023 08:40:03 -0500
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A42E7212AE
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Feb 2023 05:39:33 -0800 (PST)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-536af432ee5so177874947b3.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Feb 2023 05:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GmDvuWeWwR1NfTB5MwjhYnmbSux+pOX0H7za+hpaPLg=;
        b=NYLFE9QpI+0UnHrnmum3H+Z7MQOatraF7RCS4fwhXBrS6vpY43tQsG2CNLmYnJv7JN
         ve3bYddDFBod3aRtKXLyVr0TJtKrOqqhLcF7LrHqWG0DxYVIq6WDVS3f3z2zxESU0A08
         vYhTQk46TdqUV9UVl1a+6XwF0XIIIL9OaBziU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GmDvuWeWwR1NfTB5MwjhYnmbSux+pOX0H7za+hpaPLg=;
        b=0OCqpelJeYvCR2spHkDOAIuMvzTo3Z8alQWOc89i/O0wFB4iiiw7Px2SDiozfKS6S3
         bVOo591bokibjxyapFSuIEt6jJvhzk8/MRGM7tQtsf7mpmToXted3SFO9vTdn+pTKODJ
         wlBPAnMfuXvbJDhwwxqht65BF8abB7hVXE3/W+LsyJONupdvIdPEptLZarwQKHdHrHG6
         gpQdk+y1P0+0VOHOpeVNaagDgfRkDGD9Gdvk6WCM8xdJEYCnzANdXPLeRQNFNXz0lqoN
         vNrcOA7Vu3iRZA+ShJDSzy7o5SWAs0tFiHW6ekVWxct3motzb6DkoSMYk1qDCzVt6Sg2
         f0tg==
X-Gm-Message-State: AO0yUKUlLo5kbSx6hdvNEXAjp/L27ht6u07GgwQ+j3Rz4gWtIdMfU1im
        6kR57KShb4kSWTcId0FSDGgbT5CsckuuWQ4H+NPOSw==
X-Google-Smtp-Source: AK7set8kFQgyTHGcP27mh+pe13xESHXkPJJaZW2zuDBhNZwK1lNafr9AeRkeW2rudQd4w7lKwVWCT8HMCW4XhjocZsQ=
X-Received: by 2002:a81:ac5c:0:b0:533:9b80:a30e with SMTP id
 z28-20020a81ac5c000000b005339b80a30emr10095336ywj.10.1677505158600; Mon, 27
 Feb 2023 05:39:18 -0800 (PST)
MIME-Version: 1.0
References: <20230227113925.875425-1-jagan@amarulasolutions.com>
 <20230227113925.875425-3-jagan@amarulasolutions.com> <20230227121149.c3ibajgog3i2s2ek@houat>
In-Reply-To: <20230227121149.c3ibajgog3i2s2ek@houat>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Mon, 27 Feb 2023 19:09:07 +0530
Message-ID: <CAMty3ZAnJHabRrdV+ndzYhLaMPXBTYvhC=XP5=Gv2KvwTxxQNQ@mail.gmail.com>
Subject: Re: [PATCH v13 02/18] drm: bridge: panel: Support nodrm case for drmm_panel_bridge_add
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Tim Harvey <tharvey@gateworks.com>,
        Adam Ford <aford173@gmail.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Marek Vasut <marex@denx.de>,
        Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Feb 27, 2023 at 5:41 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Mon, Feb 27, 2023 at 05:09:09PM +0530, Jagan Teki wrote:
> > drmm_panel_bridge_add DRM-managed action helper is useful for the bridge
> > which automatically removes the bridge when drm pointer is cleaned.
> >
> > Supporting the same on non-component bridges like host DSI bridge requires
> > a drm pointer which is indeed available only when a panel-bridge is found.
> >
> > For these use cases, the caller would call the drmm_panel_bridge_add by
> > passing NULL to drm pointer.
> >
> > So, assign the bridge->dev to drm pointer for those cases.
> >
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> > Changes for v13:
> > - new patch
> >
> > Note: use case on
> > "[PATCH v13 04/18] drm: exynos: dsi: Switch to DSI panel or bridge find helper"
> >
> >  drivers/gpu/drm/bridge/panel.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
> > index d4b112911a99..45a0c6671000 100644
> > --- a/drivers/gpu/drm/bridge/panel.c
> > +++ b/drivers/gpu/drm/bridge/panel.c
> > @@ -402,6 +402,13 @@ struct drm_bridge *drmm_panel_bridge_add(struct drm_device *drm,
> >       if (IS_ERR(bridge))
> >               return bridge;
> >
> > +     /*
> > +      * For non-component bridges, like host DSI bridge the DRM pointer
> > +      * can be available only when a panel-bridge is found.
> > +      */
> > +     if (!drm)
> > +             drm = bridge->dev;
> > +
>
> Why can't the caller use bridge->dev?
>
> Also, where did the devm_drm_of_dsi_get_bridge go? I thought you were
> going to convert it to a drm-managed version?

I found another solution that supports DRM-managed action common
across dsi and normal bridges, can I send those patches alone by
excluding them from this series?

Please let me know.

Jagan.
