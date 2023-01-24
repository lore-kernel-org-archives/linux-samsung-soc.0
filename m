Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6292C61D97
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 24 Jan 2023 21:23:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233694AbjAXVXA (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 24 Jan 2023 16:23:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234895AbjAXVW7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 24 Jan 2023 16:22:59 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D79024114
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Jan 2023 13:22:57 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id f34so25569418lfv.10
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Jan 2023 13:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TexIlt5z9afy14bQ4ecRlOK+1si7hb2N9UliprInxEc=;
        b=P1BrQUJwOYpsCvnFXftJxHfl8uOfjxcwEPAp0EQdS9Zr3FBihJvz1nGfag6OU2yU5H
         VGcFADSgIAPad5fDMMSkJHVeg01WQxNhew7x+WpQ1gGqO45vca/llEf3/q+9u22q7uXh
         gRLuRBmCIamdIBd66sZ50IttH8rRhUJaXnlfk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TexIlt5z9afy14bQ4ecRlOK+1si7hb2N9UliprInxEc=;
        b=7DZvBk2UcrkeNShLTbYd5iRP5PT0ibZ/5/5zpxdvWoSrSVHVsrVT1mjD/a5uachGae
         PJkO34kNdGyIvZpAfbjUEYQ4ITca2tLd4yE5FD5o7oonrAReUlotut82pCtGYYiQt5p2
         eW1LEMhg7JIthvExdpGjhFZ75eoCzI5WwBmpHP8w04H2ziubSPE/45LXHIiwESZWSZla
         7hQqHs1IOi0hYfybD4DpKJ98zf7M0kuuPYKCwIwPnq0VD9EFMdV+7ijtQ1ERG2Wl0QGc
         uIc6aI0twnGNwMrSVslv8/NWe/Pi85UcsSp76irGh7Mo4ug8zTczXd73dCt/u+a4GU/D
         JAEg==
X-Gm-Message-State: AFqh2kphrV6C5B/Wg4TX5xStIvfIAySoKH58XihIU+KGXve3JXoxwQtb
        b/98Zm/AmQxyLJcy+gNVNV/BsR2PrA6XxG7+ij7ERA==
X-Google-Smtp-Source: AMrXdXuPhNoZL41GWgDPUFOadChoXNIB7gRKjcVJFCn0bAe2NoE0fnhgHeDqf+n89zd/68LC9a7pjLr4EyXnW7vhLis=
X-Received: by 2002:a05:6512:308b:b0:4b5:6c00:429e with SMTP id
 z11-20020a056512308b00b004b56c00429emr3465445lfd.379.1674595375549; Tue, 24
 Jan 2023 13:22:55 -0800 (PST)
MIME-Version: 1.0
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
 <20230123151212.269082-12-jagan@amarulasolutions.com> <75b01e4c-5994-5931-7030-ab86705d67b3@denx.de>
 <CAMty3ZBdiXnxcak5aKi9cR7OxNPXCQOh2PB0DZ1aEYtySOs--A@mail.gmail.com> <fb888dda-fd7e-adb4-c701-6db4edc316e6@denx.de>
In-Reply-To: <fb888dda-fd7e-adb4-c701-6db4edc316e6@denx.de>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Wed, 25 Jan 2023 02:52:42 +0530
Message-ID: <CAMty3ZAXMBuQ8gpFfFLQcyAmFF0=pTT-_fEpPoHZD2Yq9pWCig@mail.gmail.com>
Subject: Re: [RESEND PATCH v11 11/18] drm: exynos: dsi: Add atomic_get_input_bus_fmts
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

On Wed, Jan 25, 2023 at 2:49 AM Marek Vasut <marex@denx.de> wrote:
>
> On 1/24/23 22:16, Jagan Teki wrote:
> > On Wed, Jan 25, 2023 at 2:15 AM Marek Vasut <marex@denx.de> wrote:
> >>
> >> On 1/23/23 16:12, Jagan Teki wrote:
> >>
> >> [...]
> >>
> >>> +static bool exynos_dsi_pixel_output_fmt_supported(u32 fmt)
> >>> +{
> >>> +     int i;
> >>
> >> if (fmt == MEDIA_BUS_FMT_FIXED)
> >>    return false;
> >>
> >>> +     for (i = 0; i < ARRAY_SIZE(exynos_dsi_pixel_output_fmts); i++) {
> >>> +             if (exynos_dsi_pixel_output_fmts[i] == fmt)
> >>> +                     return true;
> >>> +     }
> >>> +
> >>> +     return false;
> >>> +}
> >>> +
> >>> +static u32 *
> >>> +exynos_dsi_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> >>> +                                  struct drm_bridge_state *bridge_state,
> >>> +                                  struct drm_crtc_state *crtc_state,
> >>> +                                  struct drm_connector_state *conn_state,
> >>> +                                  u32 output_fmt,
> >>> +                                  unsigned int *num_input_fmts)
> >>> +{
> >>> +     u32 *input_fmts;
> >>> +
> >>> +     if (!exynos_dsi_pixel_output_fmt_supported(output_fmt))
> >>> +             /*
> >>> +              * Some bridge/display drivers are still not able to pass the
> >>> +              * correct format, so handle those pipelines by falling back
> >>> +              * to the default format till the supported formats finalized.
> >>> +              */
> >>> +             output_fmt = MEDIA_BUS_FMT_RGB888_1X24;
> >>
> >> You can move this ^ past the kmalloc() call, so in unlikely case the
> >> kmalloc() fails, it would fail first.
> >
> > I didn't get this point, what do we need to do if
> > exynos_dsi_pixel_output_fmt_supported returns false?
>
> {
>         u32 *input_fmts;
>
>         input_fmts = kmalloc(sizeof(*input_fmts), GFP_KERNEL);
>         if (!input_fmts)
>                 return NULL;
>
>         if (!exynos_dsi_pixel_output_fmt_supported(output_fmt))
>                 /* ... the comment ... */
>                 output_fmt = MEDIA_BUS_FMT_RGB888_1X24;
>
>         input_fmts[0] = output_fmt;
>         *num_input_fmts = 1;
>
>         return input_fmts;
> }

Got it, thanks!
